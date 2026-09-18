# Voice Flow

Personal macOS dictation app: a floating mic widget with a global hotkey,
speech-to-text, an AI polish pass, and auto-paste into whatever app is
focused. Also runs as a plain web app for local dev, but the desktop build
is the real product. Success = dictation that lands correctly formatted in
the focused app without the user touching the keyboard.

## Stack

React ^19.2.8, React Router ^8.3.0, Vite ^8.2.1, Tailwind CSS ^4.3.3.
Electron ^43.4.0 + electron-builder ^26.15.7 for the desktop shell/packaging.
Radix UI primitives, Motion, Lucide icons. Vitest ^4.1.10 + Testing Library + jsdom ^30.
TypeScript ^7.0.2. Node 22.23.2 on this machine (no version manager — see below).
All package updates are current as of 2026-08-16; `npm audit` is clean.

## Architecture map

- `electron/` — main process. `main.js` (windows: main + always-on-top
  widget), `preload.cjs` (contextBridge → `window.api`), `accountStore.js`
  (local account), `dataStore.js` (file-backed JSON), `clipboard.js`
  (auto-paste), `focusTarget.js` (frontmost-app tracking), `hotkey.js`
  (global hotkey), `localLlm.js`/`localWhisper.js` (offline mode — servers
  this app spawns and owns), `ollama.js` (offline polish via an Ollama
  service the user runs; no spawn, models picked by name not file path).
- `src/app/routes.tsx` — route table. Desktop build redirects `/` → `/app`
  (no marketing page inside the app).
- `src/app/pages/` — one file per route. **`settings/` has 13 tabs, grouped by
  Compose mode** since 21 Aug 2026: General · System · Models & Keys ungrouped, then
  **Dictate** (Shortcuts, Dictionary, Snippets, Styles, Agents, App Contexts, Vibe
  Coding), **Chat** (Threads, Attachments) and **Vault** (Vault). The grouping is a
  `group` field on the existing `tabs` array — display order is still array order and
  the rail derives its headings from it, so a fourth group is one field rather than a
  second list to keep in step. Models & Keys is deliberately *not* split: keys are
  global and the Ollama roles span all three modes. The keyboard shortcut lives in
  Shortcuts (not General) and "Show app in Dock" in System (not General) — both
  moved.
- `src/app/pages/Compose.tsx` + `pages/compose/` — the main screen, at `/app`.
  Beside the three modes: `SaveToVault.tsx` (the only control that puts something into
  `raw/`, and it asks which project before doing anything), `ThreadBar.tsx` (saved
  conversations, filtered by mode) and `VaultOffline.tsx` (what Vault renders instead
  of a composer when Ollama is missing — four states, no text box in any of them).
  **This was `Recorder.tsx`; that file no longer exists.** One surface, three
  modes: Dictate (`ComposeDictate.tsx`), Local and Vault (both
  `ComposeChat.tsx`, which differ only in who answers). The shell owns
  `useDictationPipeline` rather than each mode, so switching modes cannot tear
  down a running recording. Docs written before the rename say "Recorder" — they
  mean this page.
- **`src/app/lib/historyStats.ts` derives Insights, and its streak is calendar days,
  not milliseconds** (fixed 2 Sep 2026). `startOfDay` works in local time, so two
  consecutive midnights are 23 hours apart on a spring forward and 25 on the return — an
  exact `=== DAY_MS` comparison read both as a gap and restarted the run. Do not
  "simplify" the `Math.round(... / DAY_MS)` back. It cannot reproduce here (India has no
  DST), which is why `historyStats.test.ts` sets `process.env.TZ` per test.
- `src/app/lib/usageStats.ts` — lifetime counters behind the Insights screen
  (`usage.json`), deliberately separate from history: history is capped at 5000
  entries and pruned by the retention setting, so a streak or a lifetime word
  count derived from it silently resets. Counts only, never transcript text.
- `src/app/lib/appContext.ts` — per-app adaptation. `focusTarget.js` captures the
  frontmost app's bundle ID at record time; a matching profile injects an
  instruction into the polish prompt and decides whether stage 4 runs. Ships one
  profile (code editors) on purpose: an unmatched app must behave exactly as it
  did before contexts existed, and there is a test pinning that.
- **The vault modules in `electron/`** (Phase 2, Aug 2026). Eleven files, and the
  split is deliberate: the ones with no filesystem access hold the decisions worth
  being certain about, so they are settled by reading tests rather than by pointing
  a compiler at a real vault. `vaultStore.js` reads (containment, the wikilink
  resolver) · `vaultPaths.js` turns three slugs into a path and is the *only* place
  that decides one · `vaultPage.js` parses a page (frontmatter, links, H1) ·
  `vaultEdit.js` makes surgical edits · `vaultTemplate.js` owns the section names
  and order · `vaultTree.js` reads the declared hierarchy, which is the compiler's
  allowlist · `vaultPlan.js` (pure) is what would be written · `vaultApply.js` is
  the only thing that writes · `vaultCompile.js` is the cascade · `vaultDecide.js`
  is the model seam · `vaultLint.js` is the health check · `vaultRaw.js` (added
  21 Aug 2026) is the *other* write path — create-only, into `raw/` and nowhere else.
- **Tests 25–29 in `docs/manual-testing.md` have never been run.** 25–28 cover the
  21 Aug 2026 vault work — attachments, Save to vault, saved conversations, and Vault
  without Ollama. The automated suite is green on all of it; nothing has been through a
  real vault. **Test 29** was added 9 Sep 2026 for the silence refusal, and needs the
  microphone's input volume at zero — its more important half is that a real dictation
  still goes through. **Test 23 was re-run on 10 Sep 2026** on the two supported pairs
  and met Phase 2.75 item 6's bar — 14 clean of 14, shape honoured on every run that
  asked for one, word errors unmoved. **Gemini is the row still outstanding** (one run,
  and it fell back), and item 6 stays open until the whisper model measurement (item 10)
  has changed the transcribe leg under it.
- `src/app/lib/vaultSave.ts` / `attachments.ts` / `threadStore.ts` — the additive half
  of Phase 2. `vaultSave.ts` names a source and shapes it (`analysis-<topic>.md` for an
  answer, `note-<topic>.md` for a dictation) and the name is derived from the question
  so it is **stable** — that is what makes a second save a duplicate rather than a
  second copy. `attachments.ts` reads a dropped `File` in the renderer, which is why
  no read-a-path IPC exists. `threadStore.ts` is history's shape applied to
  conversations.
- **`src/app/lib/structureCues.ts` + `polishGuard.ts` are the two halves of a polish
  step you can rely on** (Phase 2.75, 9 Sep 2026), and the split is the design.
  **`structureCues.ts` decides the SHAPE, in code, before the model reads anything** —
  the prompt then *states* the answer instead of asking for it. **`polishGuard.ts`
  reads what came back**, as a pure function of (text sent, text returned, plan), so it
  is settled by reading tests rather than by running a model. Both are import-clean —
  no settings, no storage, no DOM — because `scripts/doctor-polish.js` imports them
  directly. The finding that produced them: fourteen runs of the §10.5 script, the same
  words each time, came back as **five different shapes**, and all fourteen were
  recorded as successes. Two of the five were serious — one duplicated a paragraph and
  moved a third of the content, one invented *"OpenAI is the second fastest"* — and
  both were **technically obedient**, because every rule in the prompt forbade changing
  the speaker's words and none forbade adding new ones.
- `src/app/lib/textPipeline.ts` — the 5-stage dictation pipeline:
  dictionaryCorrect → spokenPunctuation → polish LLM → vibeCodeProcessor →
  snippets. Order is load-bearing (see Working rules).
- `src/app/lib/voiceflowSettings.ts`, `dataStore.ts` — settings/data,
  file-backed in Electron, localStorage fallback when `window.api` is absent.
- `src/app/hooks/useDictationPipeline.ts` — shared record→transcribe→polish→
  paste state machine used by both the Compose page and the floating widget.
  Takes an `autoPaste` option — Compose passes `false` (it renders the transcript
  in the page), the widget leaves it on. A new surface built on this hook has to
  opt in rather than inherit widget behaviour by accident.
- **`src/app/hooks/useCopyToClipboard.ts` is the only place that copies**, and a
  sixth hand-rolled `useState` + `setTimeout(…, 2000)` is the thing not to write
  (added 8 Sep 2026, replacing five). The three faults it removes were in **all
  five** copies, which is the argument: `writeText`'s promise was dropped, so a
  rejected write still rendered "Copied!"; `navigator.clipboard` is absent outside
  a secure context and only one guarded for it; and the timer outlived the
  component, holding a `setState` on something unmounted. Pass a `key` for a list
  (`isCopied(row.id)`) and nothing for a single control. Copying a second thing
  clears the first confirmation **on purpose** — the clipboard holds one thing.
  Note it is `async`, so a test asserting the confirmation needs `findByText`
  rather than `getByText`.
- **A delete that cannot be undone asks first, through `ConfirmDialog`.** History's
  row delete did not until 8 Sep 2026, while `TranscriptionDetail` — the detail
  view of the same entry, calling the same `deleteHistoryEntry` — always had, in a
  dialog reading *"This action cannot be undone."* Two screens disagreeing about
  one action is the shape to watch for. **Settings → Snippets, Styles and Agents
  followed the same day, so the rule is now simply: a delete asks.** No screen is
  left deciding for itself which kind of delete it has. **`ThreadBar.tsx` and
  Settings → Dictionary were the last two holdouts, closed the same day** — the
  first deleted a saved conversation on the first click while Settings → Threads
  guarded *delete all* over the same `deleteThread`, and the second was the one
  Dictate tab missed when Snippets/Styles/Agents got dialogs. Dictionary's delete
  still acts on the entry's **real index**, not its text: `visibleEntries` carries
  that index through the search filter on purpose, and keying the dialog on the
  word would delete both of two entries sharing it.

  **`Button` has a `size="icon"` (40px square, no padding) and a trash icon in a
  list row uses it.** Added 8 Sep 2026 because there was no square size, so six
  screens each hand-wrote a raw `<button>` for that one control — 28px, 40px and
  44px targets, icons at `w-3.5`/`w-4`/`w-5`, and `SettingsAgents` putting the
  hover colour on the *icon* so it only lit up over the 16px glyph. A new
  icon-only control has a size to reach for now; a seventh hand-rolled one is the
  thing not to write.

  **Styles is the exception worth knowing, and it is about wording, not whether it
  asks.** Four of its five styles are built-ins, and the trash icon on one removes
  your *override* — `deleteStyleProfile` drops the stored entry and
  `getVisibleStyleProfiles()` puts the built-in back, so the style stays on the
  page. `pendingDeleteIsBuiltIn` therefore switches the dialog to "Reset style" /
  "Reset", and only a custom profile gets "Delete" and the words "cannot be
  undone". A dialog that promises permanence over something that plainly comes
  back is how a user learns to stop reading dialogs. `settingsPages.test.tsx`
  pins both wordings, and its pre-existing delete test deletes **Formal** — a
  built-in — so it clicks Reset.

## Working rules

The claim is the rule. Its evidence, measurement and dated history are in
[`docs/working-rules.md`](docs/working-rules.md), same order as here — read the entry there before
changing anything its rule names.

- **Format is computed; register is inferred. Do not give the model the format decision back.**
- **A bulleted list means a list the speaker rattled off.**
- **There are three shapes, and `sections` is the one for topics that carry detail**
- **The shape is computed from the transcript, so shape stability is bounded by transcription accuracy**
- **A guard violation costs the style pass, never the words.**
- **An agent or a list-shaped style licenses structure, and both the prompt and the guard must agree about that through one function.**
- **A guard check is a violation only if it is provable from the text.**
- Keep the pipeline order in `textPipeline.ts` intact: dictionary + punctuation must run pre-LLM, vibe-code + snippets post-LLM.
- Vibe Coding's global switch in Settings is only the **fallback** for apps with no App Context.
- New Settings tabs get registered in **both** `routes.tsx` and the `tabs` array in `pages/Settings.tsx` — they're two separate lists that must agree.
- **A data category is a whitelist, in *three* places that must agree**
- **The dev product name lives twice, and `scripts/` cannot be imported from `electron/`.**
- **`ollama.js` talks to Ollama's native `/api/chat`, and must keep sending `num_ctx` and `think`**
- **The renderer must never navigate anywhere, and `electron/navigationGuard.js` is where that is decided**
- Anything that asks Ollama a question reads **`getOllamaModelFor(role)`**, never `getOllamaModel()`.
- **The Ollama model pickers live in their own "Ollama models" section, not inside the Polish engine radio**
- **Every JSON file this app writes goes through `writeJsonAtomic`**
- **Every `fetch` to a local server needs its own budget, and a deadline checked after an `await` is not one**
- **A loud peak is not evidence of intelligible speech, and a Bluetooth mic is how you find that out**
- **Silence is refused before it is sent, and an echo of the Dictionary prompt is refused when it comes back**
- Desktop persistence goes through `dataStore.js`, not raw `localStorage`.
- **The vault has a fourth level above the project — the *space* — and it is the one destination field a model never chooses**
- **Nothing writes to the vault except an approved plan, and four separate things make that safe**
- **`assertInsideVault` fell back to a lexical resolve when the target did not exist, which is *always* true of a file being created.**
- **The compiler builds one plan per source and they must share an `overlay`.**
- **`removedLines` decides its flag on words and its list on lines**
- **A settings write from a running app clobbers a file edit.**
- No telemetry/analytics collection — this is a stated security property.
- When a setting moves between tabs (it has happened — see gotchas), update README.md/docs/installation.md in the same change, not later.
- **`localStorage.clear()` is not "delete my data", and was the whole of Delete Account until 21 Aug 2026.**
- **`raw/` is also written by a person in Finder, and the compiler's read path had no format gate until 2 Sep 2026.**
- **Three things learned by running the compiler for real**
- **`raw/` is written by `vaultRaw.js`, and it is create-only**
- **An attachment is read in the renderer, and that is a security decision, not a convenience.**
- **A file dropped anywhere in the window navigates it to `file://` and blanks the app**
- **A thread is written whole, when the conversation settles.**
- **An empty page selection from stage 1 is answered, not refused**
- **The deeper vault read reuses its page set and adds an answer rather than replacing one.**
- `docs/code-conventions.md` holds the code/UI conventions (comments record *why*; container queries inside the shell; colour from tokens; no control that renders without acting; every module reachable).
- **Nine docs were renamed on 17 Aug 2026**
- **`docs/archive/` holds finished documents**
- **There is now exactly one by-hand test guide, `docs/manual-testing.md`, and it is pinned by a test.**

## Commands

- `npm install` — plain, no flags. `--legacy-peer-deps` was once required because
  `@types/react` sat at `^19` while `react` was `18.3.1`. Both are on `^19` since
  the React 19 upgrade (2026-08-16), so they match and there is no peer conflict.
  Don't reintroduce the flag — it hides exactly the conflicts an upgrade needs to
  surface.
- `npm run dev` — web preview at `localhost:5173`.
- `npm test` / `npm run test:watch` — Vitest.
- `npm run benchmark` — reads `history.json` and prints the docs/manual-testing.md
  §10.5 provider table (speed *and* word-error-rate), grouped by provider pair.
  **`--since <date>` is not optional once the app has changed what it sends**
  (added 8 Sep 2026). **A row is keyed on `polishModel`, and for a cloud run that field
  holds the *provider* id, not the model id** — `useDictationPipeline.ts:588` sets
  `engineDetail` to `polishProviderId` for `cloud` and to the model only for `ollama`. So
  `openai → cloud:openai` and `openai → cloud:groq` separate on their own, and two
  *OpenAI* models collapse into one row. Comparing models inside one provider needs one
  line changed (write the model id) — do not assume the fix is needed for a cross-provider
  comparison, which was the wrong call made on 11 Sep 2026 and corrected the same day.
  A pair is not a fixed thing: the pre- and
  post-`reasoning_effort` OpenAI runs key to the same `openai → cloud:openai`
  row, and their blended median reported **5.6s** — a number describing no
  version of this app that ever existed, with the run that proved the fix being
  the one averaged away. An entry with no timestamp is left out when a cutoff is
  given, on purpose: it cannot be shown to be after it.
  Read-only. Benchmark runs are detected automatically: §10.5's script is fixed,
  so `benchmark.ts` recognises it and scores the raw transcript against it —
  there is no mode to switch on, and deliberately no UI for it.
- `npm run typecheck` — `tsc --noEmit`. **Run it alongside the tests.** Neither
  `vite build` nor Vitest checks types — both hand the files to esbuild, which
  strips annotations without reading them — so a green test run says nothing
  about the types. The project had no `tsconfig.json` at all until 2026-08-13,
  which meant `tsc --noEmit` silently checked nothing and reported success.
- `npm run electron:dev` — desktop app straight from source.
- `npm run electron:pack` — fast unsigned `.app` in `release/mac-arm64/`.
- `npm run install:app` — packs, then replaces `/Applications/Voice Flow.app`
  and deletes the build output. The normal way to update your own copy;
  only an installed copy registers as a login item.
- `npm run uninstall:app` — full removal: bundle, prefs, caches, login item, TCC
  grants and the LaunchServices registration. Keeps user data unless `--purge`.
  `--dry-run` prints the plan.
- `npm run reset:permissions` — the TCC + LaunchServices half of the above with
  no deletion of the app or data. This is the fix for duplicate Privacy rows.
- `npm run doctor:paste` — asks macOS the paste path's own focus question about
  every running app and prints the verdict per app. Read-only. **Run it after
  touching `focusTarget.js`, and after a macOS update.** It exists because
  nothing in `npm test` can see this class of bug: `clipboard.test.js` replaces
  `focusTarget.js` wholesale and `focusTarget.test.js` feeds the parser canned
  osascript output, so a probe that was simply *wrong about macOS* passed 964
  tests while blocking every paste into Slack, VS Code and Claude Desktop. The
  suite proves the code does what it says; this proves macOS agrees. The script
  asserts its copy of the query still matches `focusedElementState()` and exits
  2 if they have drifted, so it cannot report health for a script the app no
  longer runs.
- `npm run doctor:polish` — replays the raw/polished pairs already in `history.json`
  through `structureCues.ts` and `polishGuard.ts` and prints what the guard would have
  said about dictations that have already happened. Read-only, no model, instant, and
  **exits 0 whatever it finds** — past violations are the measurement, not a failure of
  the run. `--since <date>`, `--verbose`, `--plans`. Same argument as `doctor:paste`:
  the suite proves the guard is self-consistent, this proves it agrees with a real
  history. It is also where a threshold gets chosen rather than guessed, and it has
  already earned that twice — it demoted `dropped-content` to a warning, and it found
  two bugs in the guard itself (a false duplicate whenever whisper returned one
  unpunctuated blob, and a stemmer reading "getting" as `gett` so it did not match
  "get"). **It runs stage 2 on the raw before comparing**, because the guard's contract
  is that it sees what the *model* saw; it cannot run stage 1, since
  `dictionaryCorrect.ts` imports `voiceflowSettings`, so a proper noun the Dictionary
  would have repaired still reads as the model changing a word.
- **`npm run doctor:polish -- --rerun --model <a,b,c>` is the other half of that
  command, and it produces new polishes rather than reading old ones** (added 9 Sep
  2026). It sends the stored raws through the real prompt and the real guard against
  named **Ollama** models and reports, per model, the shape that came back and the share
  of the speaker's words that survived. `--limit n` caps the run; `--runs n` asks the
  same input repeatedly, which is how the phase's own question — the same dictation
  twice, same shape? — gets asked. Nothing is written: no history entry, no setting, no
  audio. Four things about it not to undo. **One prompt for every model** —
  `auto-detect`, no agent, no custom writing rules, AI Processing at its defaults —
  because this is a comparison between models and an active agent suppresses the
  structure rule entirely (`structureLicensedByChoice`), which would leave the run
  printing a shape table that measures nothing. **Ollama only**, because
  `electron/ollama.js` is the client the app uses while `llmProvider.ts` reads settings
  and cannot be imported here — the cloud half of a model question belongs to
  `npm run benchmark`. **A run the model cut short is named and not scored**, since
  `completedPolish` would refuse it outright. And **the report reads
  `structureCounts`/`contentWordDelta` out of `polishGuard.ts`** rather than counting
  bullets and lost words itself: a ruler that disagrees with the thing it measures is
  worse than no ruler, and `polishGuard.test.ts` pins that the words-kept number is
  built from the same two numbers `dropped-content` puts in its own message. Note the
  kept column is **set membership**, so a halved word count beside 100% kept means
  repetition went, not content.
- `npm run doctor:vault` — the wiki health check, read-only. Twelve mechanical
  checks over the Obsidian vault; exits 1 on a problem, 0 otherwise. The same
  report is behind **Check my wiki** in Settings → Vault. **A link to a page with
  no file is two findings, not one, and what separates them is the declaration
  rather than the missing file** (split 8 Sep 2026). `[[mod-hero]]` is named in
  `app-hero-driver-hd-od`'s `modules:`, so the taxonomy says that page exists and
  is awaiting its first source — `declared-not-written`, a **note**, the same
  class as `empty-page`. A link nothing declares is a typo or a deleted page, so
  it stays `broken-link` and stays a **problem**. While both were red this exited
  1 on a vault with nothing wrong with it, which is an exit code that cannot gate
  anything and a report that has to be explained away every run. Do not merge them
  back. Findings are also deduped per missing page — that one page links
  `[[mod-hd]]` twice.
- `npm run compile:vault` — compile every source in `raw/` no page cites yet.
  **Preview by default**; `--apply` writes. `--only <substring>`, `--model <name>`
  and `VAULT_ROOT=…` all work. The same flow is behind **Compile** in Settings →
  Vault. The vault is a git repo as of 21 Aug 2026, and **the undo depends on whether
  the change is committed**: straight after an apply nothing is staged, so it is
  `git checkout -- .`; `git revert` is for a compile you already committed. Getting
  this the wrong way round is a no-op that reads as a failed undo.
- `npm run electron:build` — full `.dmg` in `release/`.

## Known pitfalls

The claim is the rule. Its evidence, measurement and dated history are in
[`docs/known-pitfalls.md`](docs/known-pitfalls.md), same order as here — read the entry there before
changing anything its rule names.

- **Small local models need `format: 'json'`, not a prompt asking for JSON.**
- **The vault's own schema disagrees with the vault in one place.**
- Signing is done by `scripts/install-app.js` after `ditto`, not by electron-builder (`identity: null`, it does **not** sign).
- What governs macOS permission grants is the **designated requirement**, and ad-hoc signing gets it wrong: no certificate chain means the requirement is a bare `cdhash`, which changes every build, so each rebuild is a new app to TCC.
- Duplicate Privacy rows are not only a cdhash story.
- **Stale LaunchServices rows are not only about bundles that claim the appId — Electron helpers claim ids that *extend* it, and nothing enumerated them until 19 Aug 2026.**
- **Both migrations are gone (19 Aug 2026), and `preload.cjs` no longer touches `localStorage`.**
- **The security table in `docs/roadmap.md`'s security table named a control that did not exist**
- **The pre-rename migration code is gone (19 Aug 2026), and `productName` is now the only place the app's name lives.**
- `systemPreferences.isTrustedAccessibilityClient()` can return **true** while the real AX calls are still denied (a stale grant row from an earlier build).
- System Events cannot coerce an AX element reference into a variable for many apps: `set x to value of attribute "AXFocusedUIElement" of proc` errors on Slack, VS Code and Claude Desktop even with a text field plainly focused.
- **A missing `AXFocusedUIElement` is not an empty app — it is Chromium.**
- **The floating capsule follows the cursor's display, and that is deliberate — not a bug in position persistence.**
- **History's entry cap is 5000, and uncapped is the stated goal.**
- **Cloud transcription now writes code forms itself, and that starves every spoken-cue rule in `vibeCodeProcessor.ts`.**
- **`electron/` and `scripts/` are 29% of this codebase and `tsc` has never read a line of either.**
- **A polish the provider cut off is refused, and so is an empty one**
- **A dictionary pair does not license guessing, and every canonical used to be a fuzzy target**
- **`whisper-server` decodes with `--beam-size 5`, not greedily**
- **Word errors are a transcription story, not a polish one**
- **The polish step restores standard written grammar, and that reverses an earlier rule**
- **A style or agent must never cap the output length.**
- **`AiProcessing` is the exception to the rule below, and conflating the two has already cost a wrong answer**
- **Seeded defaults only ever reach a fresh install.**
- **Never pass `--no-timestamps` to `whisper-server`.**
- **A GUI app does not inherit your shell's `PATH`.**
- Anything the main process loads from disk at runtime must be in the electron-builder `files` array.
- Debugging a launch from VS Code's terminal: `ELECTRON_RUN_AS_NODE=1` is set in the extension host, so the app binary runs as plain Node and exits 0 instantly with no window and no error.
- Sentence punctuation is added by the **transcription** stage on the Gemini path (`transcriptionPrompt.ts`), not only by polish.
- The `pnpm.overrides` Vite pin is **gone** (removed with the Vite 8 bump, 2026-08-16).
- `@types/react` 19 **removed the no-argument `useRef<T>()` overload**.
- Vite 8 warns on `__dirname` in config files (its future native config loader won't support it).
- API keys, transcription/polish provider choice, and Auto-punctuation live in **Settings → Models & Keys**, not General — General was trimmed down in a refactor and this has already caused README/INSTALL to go stale once.
- **Every cloud transcription provider now has a model override, and Gemini's is a quality control rather than a version field**
- **Gemini polish is `gemini-3.6-flash` with `thinkingBudget: 1`, and those two are one change**
- **A model shortlist rots, and two of OpenAI's three ids did not exist**
- **There is one learn-and-retry loop for refused parameters, not one per parameter**
- **`reasoning_effort: 'none'` goes on every OpenAI-compatible polish request**
- Provider model ids rot on the provider's schedule, and each failure looks different.
- `npm outdated` has two blind spots worth knowing: it reads only the `latest` dist-tag, so **electron-builder** (whose tag is stale, and now reports *older* than what is installed) and **react-router** never appear.
- `tsconfig.json` sets `types`, which **disables automatic `@types/node` pickup**. vitest 3 supplied it by accident; vitest 4 made it an optional peer and seven errors appeared in untouched files.
- **There are two Node runtimes here, and they do not match.**
- The Account page's Change Photo/Password/2FA/Cancel Subscription controls are non-functional "Coming Soon" placeholders, not bugs.
- `Help.tsx` is no longer a placeholder: the stale copy was rewritten against what the app does, and the dead Quick Links (Video Tutorials / Documentation / Community) and "Still need help?" buttons were deleted rather than left pointing at `href="#"`.
- **History is read-only, and `Help.tsx` is the reason**
- The `react-router` advisory (GHSA-qwww-vcr4-c8h2, RSC-mode CSRF) is **no longer outstanding** — corrected 2026-08-16.
- `react-router` is on **8.3.0** since 2026-08-16. v8 moved the DOM-specific exports out of the root entry: `RouterProvider` imports from **`react-router/dom`**, everything else (`Link`, `Navigate`, `Outlet`, `MemoryRouter`, `createBrowserRouter`, the hooks) stays on `react-router`.
