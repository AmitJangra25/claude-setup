# Voice Flow_v1

Personal macOS dictation app: a floating mic widget with a global hotkey,
speech-to-text, an AI polish pass, and auto-paste into whatever app is
focused. Also runs as a plain web app for local dev, but the desktop build
is the real product. Success = dictation that lands correctly formatted in
the focused app without the user touching the keyboard.

## Stack

React 18.3.1, React Router ^7.18.2, Vite ^6.4.3, Tailwind CSS 4.1.12.
Electron ^43.2.0 + electron-builder ^26.15.3 for the desktop shell/packaging.
Radix UI primitives, Motion, Lucide icons. Vitest ^3.2.7 + Testing Library + jsdom.

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
- `src/app/pages/` — one file per route. `settings/` has 7 tabs: General,
  **Models & Keys**, Dictionary, Snippets, Styles, Vibe Coding, Agents.
- `src/app/lib/textPipeline.ts` — the 5-stage dictation pipeline:
  dictionaryCorrect → spokenPunctuation → polish LLM → vibeCodeProcessor →
  snippets. Order is load-bearing (see Working rules).
- `src/app/lib/voiceflowSettings.ts`, `dataStore.ts` — settings/data,
  file-backed in Electron, localStorage fallback when `window.api` is absent.
- `src/app/hooks/useDictationPipeline.ts` — shared record→transcribe→polish→
  paste state machine used by both the Recorder page and the floating widget.

## Working rules

- Keep the pipeline order in `textPipeline.ts` intact: dictionary +
  punctuation must run pre-LLM, vibe-code + snippets post-LLM.
- New Settings tabs get registered in **both** `routes.tsx` and the `tabs`
  array in `pages/Settings.tsx` — they're two separate lists that must agree.
- Desktop persistence goes through `dataStore.js`, not raw `localStorage`.
  `localStorage` is the browser-only fallback path — don't use it as the
  primary store for anything meant to survive in the desktop build.
- No telemetry/analytics collection — this is a stated security property.
- When a setting moves between tabs (it has happened — see gotchas), update
  README.md/INSTALL.md in the same change, not later.

## Commands

- `npm install --legacy-peer-deps` — required; `@types/react` is pinned to
  `^19` while `react` is `18.3.1` (types-only conflict).
- `npm run dev` — web preview at `localhost:5173`.
- `npm test` / `npm run test:watch` — Vitest.
- `npm run electron:dev` — desktop app straight from source.
- `npm run electron:pack` — fast unsigned `.app` in `release/mac-arm64/`.
- `npm run install:app` — packs, then replaces `/Applications/Voice Flow_v1.app`
  and deletes the build output. The normal way to update your own copy;
  only an installed copy registers as a login item.
- `npm run electron:build` — full `.dmg` in `release/`.

## Known pitfalls

- The app is unsigned: first launch needs right-click → Open, not a plain
  double-click.
- `pnpm.overrides` pins Vite to `6.3.5`, but the documented flow uses
  `npm install`, which resolves Vite `^6.4.3` from `package.json` instead —
  the override silently doesn't apply.
- API keys, transcription/polish provider choice, and Auto-punctuation live
  in **Settings → Models & Keys**, not General — General was trimmed down in
  a refactor and this has already caused README/INSTALL to go stale once.
- Pricing page and the Account page's Change Photo/Password/2FA/Cancel
  Subscription controls are non-functional "Coming Soon" placeholders, not
  bugs.
- `Help.tsx` has known-stale copy (a recording-length limit, "coming soon"
  language, a wrong settings path) inherited from an earlier draft.
- `npm audit` reports a permanent high-severity advisory on `react-router`
  (GHSA-qwww-vcr4-c8h2, RSC-mode CSRF). It does not apply: the app is a
  client-only SPA on `createBrowserRouter` with no server and no RSC. There
  is no patched 7.x — the fix is `8.3.0`, which requires React `>=19.2.7`
  while this app is on 18.3.1, so clearing it means a full React 19
  migration. **Never run `npm audit fix --force`** — it "fixes" this by
  downgrading to `react-router@7.11.0`. Revisit only alongside React 19.
