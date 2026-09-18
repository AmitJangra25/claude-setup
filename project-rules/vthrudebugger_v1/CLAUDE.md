# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

`@amitjangra25/vthru-debugger` is a tiny, drop-in in-app debugger for React Native apps (web is a planned Phase 2, not yet started). It auto-captures `console.*` output, `fetch`/`XMLHttpRequest` traffic, and uncaught errors with zero manual logging calls, classifies events by severity, and pushes toasts when something looks wrong (5xx, timeouts, `console.error`, slow requests) so QA testers can spot problems without opening a panel. Tapping a toast opens a bottom-sheet panel with Logs / Network / Mocks / Info tabs. It also supports client-side response mocking and exporting a bug-report JSON blob. It's extracted and generalized from the V-Thru employee app's original `DebugProvider` (kept for reference in `REFERENCE.tsx`, not compiled or shipped) to remove that app's private coupling (global event emitter, MMKV, project-specific components/theme).

Published to **GitHub Packages** (not public npm) under the `@amitjangra25` scope — see [README.md](./README.md) for consumer install steps.

## Tech stack

- TypeScript 5.4, strict mode, compiled with `tsc` (no bundler) — target ES2020, module ESNext, `moduleResolution: bundler`
- React 18 (peer dep) + React Native ≥0.71 (peer dep)
- `react-native-gesture-handler` ≥2.9 and `react-native-reanimated` ≥3.0 — drive the FAB drag and bottom-sheet resize/dismiss gestures
- `react-native-safe-area-context` ≥4.5 — inset-aware layout
- `react-native-svg` ≥13.0 — icons
- Vitest 4 for tests (no vitest config file; defaults apply)
- No ESLint/Prettier config in this repo — match existing style by hand

All of the above except `react` are **peer** dependencies, not bundled — the library expects the host app to already have RN and these native modules.

## Architecture

Three layers, in `src/`:

```
core/            pure TypeScript, zero React/RN imports, zero peer deps
  ├─ debugger.ts     DebuggerCore class — the singleton (getDebugger()); owns ring buffers
  │                  for logs/requests/breadcrumbs, mock rules, and wires the AlertEngine
  ├─ bus.ts          EventBus<T> — minimal pub/sub used both for the raw event stream
  │                  and (separately) for alerts
  ├─ buffer.ts       RingBuffer<T> — fixed-capacity buffer backing logs/requests/breadcrumbs
  ├─ severity.ts     defaultRules: Rule[] — first-match-wins classifier (see table below);
  │                  classify() runs an event through the rules
  ├─ alerts.ts       AlertEngine — subscribes to the core event bus, runs classify(),
  │                  applies mute/ignore/cooldown, emits Alert on its own bus
  ├─ config.ts       DebuggerConfig + defaultConfig + mergeConfig()
  ├─ mocks.ts        MockRule type, findMock() (first-match-wins), serialize/parse for
  │                  persistence (RegExp urlPattern rules are dropped on persist)
  ├─ interceptors/   fetch.ts, xhr.ts, console.ts, unhandled.ts — each returns an
  │                  uninstall function; monkey-patch globals, call back into DebuggerCore
  ├─ redact.ts       header redaction (used by Network tab display and interceptors)
  ├─ report.ts       buildBugReport() — bundles logs/requests/breadcrumbs/appInfo to JSON
  ├─ storage.ts      DebuggerStorage interface (host supplies get/set/delete; MMKV/AsyncStorage-shaped)
  └─ types.ts        LogEntry, RequestEntry, BreadcrumbEntry, DebuggerEvent, Alert, Severity, Priority

react-native/    UI layer, the only runtime-specific adapter today
  ├─ DebuggerProvider.tsx   the whole feature: FAB, gesture-driven bottom sheet, tab bar,
  │                         installs/uninstalls interceptors on mount, hydrates mocks from
  │                         `storage`, subscribes to the core bus + alert bus
  ├─ AlertHost.tsx          renders toasts from subscribeAlerts(), swipe-to-dismiss
  ├─ LogsList.tsx, RequestsList.tsx, MocksList.tsx, InfoPanel.tsx   the four panel tabs
  ├─ JsonTreeViewer.tsx     collapsible JSON viewer used in the Network response detail
  ├─ useScrollableList.ts   ScrollableHandle — lets DebuggerProvider scroll Logs to a given id
  └─ theme.ts, icons.tsx    self-contained styling/icons (no host theme dependency)
```

`src/index.ts` re-exports `./react-native` (the only shipped entry point today, despite the "subspath exports" plan in [PLAN.md](./PLAN.md) — there is no separate `/core` or `/react` package export yet, just internal module boundaries under one `main`).

### Key invariants

- **`DebuggerCore` is a process-wide singleton** (`getDebugger()` in `core/debugger.ts`). `config` passed to `<DebuggerProvider>` only takes effect on the *first* mount — later mounts get the already-constructed instance. Tests that need a fresh instance must reset the module-level `instance` var (see existing tests in `test/core/debugger.test.ts` for the pattern).
- **Severity classification is first-match-wins** (`severity.ts::classify`), in the fixed order of `defaultRules`. When adding a rule, order matters — put more specific rules before broader ones (same convention as mock rules).
- **Mock matching is also first-match-wins** (`mocks.ts::findMock`) — same ordering convention, independent list.
- **Interceptors must never throw into the app's real call path.** Every interceptor wraps its own capture logic in try/catch so a bug in capture code can't break the app's actual `fetch`/`XHR`/console call. Preserve this when touching `core/interceptors/*`.
- **Alerts are cooldown-gated per `ruleId:url`** (`alerts.ts`), separately from the raw event bus — a request/log always lands in the panel even when its toast is suppressed by mute, `ignoreRules`, or cooldown.
- **Mock persistence only stores string `urlPattern`s** — `RegExp` rules are dropped on `serializeMocks` since they can't survive JSON; they must be re-registered from code on each launch.
- **Redaction is applied at capture and export time**, not display time — `redactHeaders` config masks headers before they ever reach the ring buffer.
- Don't touch `REFERENCE.tsx` — it's excluded from the TS build (`tsconfig.json` `exclude`) and kept only as the pre-refactor original to compare against; known bugs in it are intentionally left unfixed there (see its header comment).

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

## Known pitfalls

- `DebuggerProvider`'s interceptor-install `useEffect` re-runs whenever `enabled` or any `captures.*` flag changes identity — but since `captures` is typically an inline object literal at the call site, pass a stable reference (or destructure primitives) if you need to avoid needless reinstall/uninstall cycles.
- The mock-hydration effect in `DebuggerProvider.tsx` gates writes on a `hydrated` ref specifically to avoid the initial empty `mocks` state overwriting stored rules before the async `storage.get` resolves — don't remove that guard when touching mock persistence.
- `serializeMocks`/`parseMocks` silently drop malformed or `RegExp`-backed rules; if mocks seem to "disappear" after a reload, check whether the rule uses a `RegExp` `urlPattern`.
- The FAB and bottom-sheet drag gestures both use `runOnJS(true)` and Reanimated shared values — if you add new gesture-driven UI, follow that pattern rather than mixing worklet and JS-thread state.
- `fetch`/`XHR` interceptors record `__vthru_orig_fetch__` (and equivalent) on `globalThis` to detect double-install; if you add a new interceptor, follow the same guard-and-warn pattern instead of patching blindly.
