# Voice Flow

Personal macOS dictation app: a floating mic widget with a global hotkey,
speech-to-text, an AI polish pass, and auto-paste back into the app the
dictation started in (never into Voice Flow itself). Also runs as a plain web
app for local dev, but the desktop build is the real product. Success =
dictation that lands correctly formatted in that app without the user touching
the keyboard.

## Documents

- [`PROJECT-MAP.md`](PROJECT-MAP.md) — every code folder and document, and where to start.
- The reasoning behind each module, and what has already gone wrong
  in it, is in [`docs/architecture.md`](docs/architecture.md) — read it before changing
  anything in `electron/` or `src/app/lib/`. Its § *Tech stack* holds the versions and npm facts.
- **Every polish rule, by prompt block, is in [`docs/polish-rules.md`](docs/polish-rules.md)** —
  read it before changing the prompt, an app context, or `paragraphs.ts`.
- Creating a document, or reviewing one in depth: follow the *Documentation rules* in
  [`docs/working-rules.md`](docs/working-rules.md) — overview table first, details below.

## Working rules

The claim is the rule. Why it holds, where it is pinned and the measurement that
decided it are in [`docs/working-rules.md`](docs/working-rules.md) — **which holds all
43, not just the 20 below**, in the same order. The dated history is in
[`docs/archive/working-rules-to-20-10-2026.md`](docs/archive/working-rules-to-20-10-2026.md).
Read it before changing anything in the polish pipeline, the vault, or `textPipeline.ts`.

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
- When a setting moves between tabs (it has happened — see Known pitfalls), update README.md/docs/installation.md in the same change, not later.
- **`localStorage.clear()` is not "delete my data", and was the whole of Delete Account until 21 Aug 2026.**
- **`raw/` is written by `vaultRaw.js`, and it is create-only**
- **An attachment is read in the renderer, and that is a security decision, not a convenience.**
- **A file dropped anywhere in the window navigates it to `file://` and blanks the app**
- `docs/code-conventions.md` holds the code/UI conventions (comments record *why*; container queries inside the shell; colour from tokens; no control that renders without acting; every module reachable).

## Safety rules

The reasoning behind both is in [`docs/architecture.md`](docs/architecture.md) § *Modules*.

- **`src/app/hooks/useCopyToClipboard.ts` is the only place a *copy control*
  copies** — `useDictationPipeline.ts` also writes to the clipboard, for
  auto-paste, which is a different job. A sixth
  hand-rolled `useState` + `setTimeout` is the thing not to write.
- **A delete that cannot be undone asks first, through `ConfirmDialog`.** No screen
  decides for itself. Styles is the exception in *wording* only — it resets a built-in.

## Commands

Why each flag exists, and the failure that produced it, is in
[`docs/commands.md`](docs/commands.md) — read the entry there before changing how a
command is used.

- `npm install` — plain, no flags. **Do not reintroduce `--legacy-peer-deps`.**
- `npm run dev` — web preview at `localhost:5173`.
- `npm test` / `npm run test:watch` — Vitest.
- `npm run typecheck` — `tsc --noEmit`, then `tsconfig.node.json` over `electron/` and
  `scripts/` (`checkJs`, `strict` off). **Run it alongside the tests.** Neither
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
- `npm run doctor:paste` — read-only. Checks the front-app read and lists which apps a
  paste would refuse. **Run it after touching `focusTarget.js`, and after a macOS
  update.** Nothing in `npm test` can see this class of bug.
- `npm run doctor:polish` — replays real `history.json` pairs through the guard.
  Read-only, no model, **exits 0 whatever it finds**. `--since`, `--verbose`, `--plans`.
- `npm run doctor:polish -- --rerun --model <a,b,c>` — produces *new* polishes against
  named **Ollama** models. Writes nothing. `--limit n` (**always `--limit 120`** for a
  before/after), `--runs n`, `--app <id>` (dev only: replay one app profile's dictations
  with its instruction).
- `npm run doctor:vault` — wiki health check, read-only. Thirteen checks; exits 1 on a
  problem. Same report as **Check my wiki** in Settings → Vault.
- `npm run compile:vault` — compiles every source in `raw/` no page cites yet.
  **Preview by default; `--apply` writes.** Undo depends on whether it was committed:
  `git checkout -- .` straight after an apply, `git revert` after a commit.
- `npm run signing:cert` / `npm run build:icon` — signing certificate and app icon.
- `npm run build:whisper` — builds the bundled `whisper-server` into `resources/bin/`
  (not in git). Needs `cmake`; once per machine. **Every pack refuses to build without
  it** (`build-whisper.sh --check`).

## Known pitfalls

[`docs/known-pitfalls.md`](docs/known-pitfalls.md) holds all 48, each with why it
happens and where it is handled; the full dated story is in
[`docs/archive/known-pitfalls-to-20-10-2026.md`](docs/archive/known-pitfalls-to-20-10-2026.md).
These 14 are the ones that cost time before you would think to look.

- **Small local models need `format: 'json'`, not a prompt asking for JSON.**
- Signing is done by `scripts/install-app.js` after `ditto`, not by electron-builder (`identity: null`, it does **not** sign).
- What governs macOS permission grants is the **designated requirement**, and ad-hoc signing gets it wrong: no certificate chain means the requirement is a bare `cdhash`, which changes every build, so each rebuild is a new app to TCC.
- **`electron/` and `scripts/` are typechecked by a second config, and only loosely.** `strict` is off, so a field in a `= {}` options object needs its own default, or it reads as required.
- **A style or agent must never cap the output length.**
- **`AiProcessing` is the exception to the seeded-defaults rule (*Seeded defaults only ever reach a fresh install*, in `docs/known-pitfalls.md`), and conflating the two has already cost a wrong answer**
- **Never pass `--no-timestamps` to `whisper-server`.**
- **A GUI app does not inherit your shell's `PATH`.**
- Anything the main process loads from disk at runtime must be in the electron-builder `files` array.
- Debugging a launch from VS Code's terminal: `ELECTRON_RUN_AS_NODE=1` is set in the extension host, so the app binary runs as plain Node and exits 0 instantly with no window and no error.
- API keys live in **Settings → API keys**, transcription/polish provider choice in **Settings → Engine**, and Auto-punctuation in **Settings → Text processing** (Dictate group) — not General, and no longer one "Models & Keys" tab (split 16-10-2026, `docs/settings-design.md`). Moves like these have already left README/INSTALL stale twice.
- **`reasoning_effort: 'none'` goes on every OpenAI-compatible polish request**
- `tsconfig.json` sets `types`, which **disables automatic `@types/node` pickup**. vitest 3 supplied it by accident; vitest 4 made it an optional peer and seven errors appeared in untouched files.
- **There are two Node runtimes here, and they do not match.**
