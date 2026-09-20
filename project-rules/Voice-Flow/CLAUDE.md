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

One line per module. The reasoning behind each piece, and what has already gone wrong
in it, is in [`docs/architecture.md`](docs/architecture.md) — read it before changing
anything in `electron/` or `src/app/lib/`.

- `electron/` — main process. `main.js` (main window + always-on-top widget),
  `preload.cjs` (contextBridge → `window.api`), `accountStore.js`, `dataStore.js`
  (file-backed JSON), `clipboard.js` (auto-paste), `focusTarget.js` (frontmost app),
  `hotkey.js`, `localLlm.js`/`localWhisper.js` (servers this app spawns and owns),
  `ollama.js` (an Ollama service *you* run — no spawn, models picked by name).
- **The twelve vault modules in `electron/`.** `vaultPaths.js` is the only place a path
  is decided · `vaultApply.js` the only thing that writes · `vaultRaw.js` the other
  write path, create-only into `raw/` · `vaultStore.js` proves containment. **Seven
  touch no filesystem at all** — `vaultPaths`, `vaultPlan`, `vaultPage`, `vaultEdit`,
  `vaultTemplate`, `vaultDecide`, `vaultCompile` — and they hold the decisions worth
  being certain about, so they are settled by reading tests rather than by pointing a
  compiler at a real vault. The other five read or write: `vaultStore`, `vaultTree`,
  `vaultLint`, `vaultApply`, `vaultRaw`.
- `src/app/routes.tsx` — route table. The desktop build redirects `/` → `/app`.
- `src/app/pages/` — one file per route. `settings/` has 13 tabs grouped by Compose
  mode through a `group` field on the `tabs` array, so a fourth group is one field
  rather than a second list.
- `src/app/pages/Compose.tsx` + `pages/compose/` — the main screen at `/app`. One
  surface, three modes: Dictate, Local, Vault. **This was `Recorder.tsx`; docs written
  before the rename mean this page.** The shell owns `useDictationPipeline`, so
  switching modes cannot tear down a running recording.
- `src/app/lib/textPipeline.ts` — the five-stage pipeline: dictionaryCorrect →
  spokenPunctuation → polish LLM → vibeCodeProcessor → snippets.
- `src/app/lib/structureCues.ts` + `polishGuard.ts` — the two halves of a polish step
  you can rely on. `structureCues` decides the shape **in code, before the model reads
  anything**; `polishGuard` reads what came back. Both are import-clean.
- `src/app/lib/` also holds `historyStats.ts` (Insights; the streak is calendar days,
  not milliseconds), `usageStats.ts` (lifetime counters, deliberately separate from
  history), `appContext.ts` (per-app adaptation), `vaultSave.ts` / `attachments.ts` /
  `threadStore.ts`, and `voiceflowSettings.ts` / `dataStore.ts`.
- `src/app/hooks/useDictationPipeline.ts` — the shared record→transcribe→polish→paste
  state machine, used by Compose and the widget. `autoPaste` is opt-in, not inherited.
- **`src/app/hooks/useCopyToClipboard.ts` is the only place that copies.** A sixth
  hand-rolled `useState` + `setTimeout` is the thing not to write.
- **A delete that cannot be undone asks first, through `ConfirmDialog`.** No screen
  decides for itself. Styles is the exception in *wording* only — it resets a built-in.
- **Tests 25–29 in `docs/manual-testing.md` have never been run.**

## Working rules

The claim is the rule. Its evidence, measurement and dated history are in
[`docs/working-rules.md`](docs/working-rules.md) — **which holds all 42, not just the
20 below.** Read it before changing anything in the polish pipeline, the vault, or
`textPipeline.ts`.

- Keep the pipeline order in `textPipeline.ts` intact: dictionary + punctuation must run pre-LLM, vibe-code + snippets post-LLM.
- New Settings tabs get registered in **both** `routes.tsx` and the `tabs` array in `pages/Settings.tsx` — they're two separate lists that must agree.
- **A data category is a whitelist, in *three* places that must agree**
- **The dev product name lives twice, and `scripts/` cannot be imported from `electron/`.**
- **The renderer must never navigate anywhere, and `electron/navigationGuard.js` is where that is decided**
- Anything that asks Ollama a question reads **`getOllamaModelFor(role)`**, never `getOllamaModel()`.
- **Every JSON file this app writes goes through `writeJsonAtomic`**
- **Every `fetch` to a local server needs its own budget, and a deadline checked after an `await` is not one**
- Desktop persistence goes through `dataStore.js`, not raw `localStorage`.
- **The vault has a fourth level above the project — the *space* — and it is the one destination field a model never chooses**
- **Nothing writes to the vault except an approved plan, and four separate things make that safe**
- **`assertInsideVault` fell back to a lexical resolve when the target did not exist, which is *always* true of a file being created.**
- **A settings write from a running app clobbers a file edit.**
- No telemetry/analytics collection — this is a stated security property.
- When a setting moves between tabs (it has happened — see gotchas), update README.md/docs/installation.md in the same change, not later.
- **`localStorage.clear()` is not "delete my data", and was the whole of Delete Account until 21 Aug 2026.**
- **`raw/` is written by `vaultRaw.js`, and it is create-only**
- **An attachment is read in the renderer, and that is a security decision, not a convenience.**
- **A file dropped anywhere in the window navigates it to `file://` and blanks the app**
- `docs/code-conventions.md` holds the code/UI conventions (comments record *why*; container queries inside the shell; colour from tokens; no control that renders without acting; every module reachable).

## Commands

Why each flag exists, and the failure that produced it, is in
[`docs/commands.md`](docs/commands.md) — read the entry there before changing how a
command is used.

- `npm install` — plain, no flags. **Do not reintroduce `--legacy-peer-deps`.**
- `npm run dev` — web preview at `localhost:5173`.
- `npm test` / `npm run test:watch` — Vitest.
- `npm run typecheck` — `tsc --noEmit`. **Run it alongside the tests.** Neither
  `vite build` nor Vitest checks types.
- `npm run benchmark` — provider speed and word-error-rate from `history.json`.
  Read-only. **`--since <date>` is not optional once the app has changed what it sends.**
- `npm run electron:dev` — desktop app straight from source.
- `npm run electron:pack` — fast unsigned `.app` in `release/mac-arm64/`.
- `npm run electron:build` — full `.dmg` in `release/`.
- `npm run install:app` — packs, then replaces `/Applications/Voice Flow.app`. The
  normal way to update your own copy; only an installed copy registers as a login item.
- `npm run uninstall:app` — full removal. Keeps user data unless `--purge`; `--dry-run`
  prints the plan.
- `npm run reset:permissions` — the TCC + LaunchServices half of the above, deleting
  nothing. This is the fix for duplicate Privacy rows.
- `npm run doctor:paste` — read-only. **Run it after touching `focusTarget.js`, and
  after a macOS update.** Nothing in `npm test` can see this class of bug.
- `npm run doctor:polish` — replays real `history.json` pairs through the guard.
  Read-only, no model, **exits 0 whatever it finds**. `--since`, `--verbose`, `--plans`.
- `npm run doctor:polish -- --rerun --model <a,b,c>` — produces *new* polishes against
  named **Ollama** models. Writes nothing. `--limit n`, `--runs n`.
- `npm run doctor:vault` — wiki health check, read-only. Twelve checks; exits 1 on a
  problem. Same report as **Check my wiki** in Settings → Vault.
- `npm run compile:vault` — compiles every source in `raw/` no page cites yet.
  **Preview by default; `--apply` writes.** Undo depends on whether it was committed:
  `git checkout -- .` straight after an apply, `git revert` after a commit.
- `npm run signing:cert` / `npm run build:icon` — signing certificate and app icon.

## Known pitfalls

[`docs/known-pitfalls.md`](docs/known-pitfalls.md) holds all 47 with the full story.
These 15 are the ones that cost time before you would think to look.

- **Small local models need `format: 'json'`, not a prompt asking for JSON.**
- Signing is done by `scripts/install-app.js` after `ditto`, not by electron-builder (`identity: null`, it does **not** sign).
- What governs macOS permission grants is the **designated requirement**, and ad-hoc signing gets it wrong: no certificate chain means the requirement is a bare `cdhash`, which changes every build, so each rebuild is a new app to TCC.
- **`electron/` and `scripts/` are 29% of this codebase and `tsc` has never read a line of either.**
- **A style or agent must never cap the output length.**
- **`AiProcessing` is the exception to the rule below, and conflating the two has already cost a wrong answer**
- **Never pass `--no-timestamps` to `whisper-server`.**
- **A GUI app does not inherit your shell's `PATH`.**
- Anything the main process loads from disk at runtime must be in the electron-builder `files` array.
- Debugging a launch from VS Code's terminal: `ELECTRON_RUN_AS_NODE=1` is set in the extension host, so the app binary runs as plain Node and exits 0 instantly with no window and no error.
- API keys, transcription/polish provider choice, and Auto-punctuation live in **Settings → Models & Keys**, not General — General was trimmed down in a refactor and this has already caused README/INSTALL to go stale once.
- **`reasoning_effort: 'none'` goes on every OpenAI-compatible polish request**
- `tsconfig.json` sets `types`, which **disables automatic `@types/node` pickup**. vitest 3 supplied it by accident; vitest 4 made it an optional peer and seven errors appeared in untouched files.
- **There are two Node runtimes here, and they do not match.**
- The Account page's Change Photo/Password/2FA/Cancel Subscription controls are non-functional "Coming Soon" placeholders, not bugs.
