# vthrudebugger_v1

## Commands

```bash
npm run build        # tsc -p tsconfig.json — emits dist/ (used by prepublishOnly)
npm run typecheck     # tsc --noEmit — fast check without emitting
npm test              # vitest run — all tests in test/, mirrors src/ layout
npx vitest run test/core/severity.test.ts   # run a single test file
npx vitest run -t "some test name"          # run tests matching a name
npm run clean         # rm -rf dist
```

There is no lint script and no CI workflow that runs tests — [.github/workflows/publish.yml](.github/workflows/publish.yml) only builds and publishes on `v*` tags. Run `npm run typecheck` and `npm test` yourself before considering a change done.

## Hard rules

- No ESLint/Prettier config in this repo — match existing style by hand
- **Interceptors must never throw into the app's real call path.** Every interceptor wraps its own capture logic in try/catch so a bug in capture code can't break the app's actual `fetch`/`XHR`/console call. Preserve this when touching `core/interceptors/*`.
- **`pathOf()` must not use `new URL()`.** React Native's `URL` getters (including `pathname`) throw "not implemented". It is parsed by hand, drops the query/hash, returns `/` for a bare host, and strips the V-Thru `/api/v<n>` prefix (kept for everyone, matching the mobile app's copy). Tests: `test/core/url.test.ts`.
- **Drag gesture lives only on the grip strip** (`DRAG_SNAP_DISTANCE`), never on the whole panel, so it can't win a race against a button or text-field tap. Colours: `panel` is translucent, `ink` is the opaque near-black for text on badges.

## Past defects

- The mock-hydration effect in `DebuggerProvider.tsx` gates writes on a `hydrated` ref specifically to avoid the initial empty `mocks` state overwriting stored rules before the async `storage.get` resolves — don't remove that guard when touching mock persistence.
- `serializeMocks`/`parseMocks` silently drop malformed or `RegExp`-backed rules; if mocks seem to "disappear" after a reload, check whether the rule uses a `RegExp` `urlPattern`.
- The FAB and bottom-sheet drag gestures both use `runOnJS(true)` and Reanimated shared values — if you add new gesture-driven UI, follow that pattern rather than mixing worklet and JS-thread state.
- `fetch`/`XHR` interceptors record `__vthru_orig_fetch__` (and equivalent) on `globalThis` to detect double-install; if you add a new interceptor, follow the same guard-and-warn pattern instead of patching blindly.

## Documents

- `PROJECT-MAP.md` — which folder holds what; read before searching code
- `.claude/current-task.md` — the task in progress (git-ignored)
- `docs/ROADMAP.md` — phases and tasks
- `docs/BACKLOG.md` — found work not yet planned
- `docs/DECISIONS.md` — decisions in force
- `docs/archive/` — dated records: the old `CLAUDE.md`, the old plan (`plan-16-11-2026.md`, was `PLAN.md`) and the Phase 1 build prompts
- `README.md`, `INTEGRATION.md` — consumer install and integration guides; both ship in the npm package, so no Claude headers or internal notes go in them
- `MOBILE-CONTEXT.md` — local only, git-ignored: background on the main host app; never commit it
