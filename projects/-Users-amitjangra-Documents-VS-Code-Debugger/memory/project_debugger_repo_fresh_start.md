---
name: project-debugger-repo-fresh-start
description: The Debugger/ folder is a deliberate fresh start; DebugProvider.tsx is a verbatim snapshot and vthrudebugger_v1 is out of scope
metadata: 
  node_type: memory
  type: project
  originSessionId: 555c5825-3b04-4678-b7fe-330f5cbfded4
  modified: 2026-08-03T04:40:11.307Z
---

As of 2026-08-03, `/Users/amitjangra/Documents/VS Code/Debugger` was seeded as a **new,
standalone repo** from the V-Thru app's `DebugProvider.tsx` overlay (source + `ARCHITECTURE.md` +
`DEPENDENCIES.md` + scaffold). The user creates the GitHub repo themselves.

Two decisions the user made explicitly:

1. **`DebugProvider.tsx` is a verbatim snapshot.** Its app-internal imports (`App`, `theme`,
   `consts`, `components/*`, `.svg` assets) are intentionally left broken. `npm run typecheck`
   reporting `TS2307` for them is expected, not a bug to fix. Don't rewrite the imports, inline
   the theme, or stub the eventEmitter unless asked.
2. **Fresh start, unrelated to `vthrudebugger_v1`.** The user already owns
   `github.com/AmitJangra25/vthrudebugger_v1` — a standalone library port of this same file, with
   three clones on disk (`~/Debugger/vthrudebugger_v1` is furthest ahead: mocks, storage, filter,
   InfoPanel, report). It is deliberately **out of scope**: don't copy from it or cite it as prior
   art in this project's output.

**Why:** Without this, the obvious-looking "helpful" moves — fixing the unresolved imports, or
pointing at the existing port — are both things the user already declined.

**How to apply:** Treat the saved source as read-only reference. See
[[feedback-debugger-overlay-intentional]] for the related rule that the file's internal design
choices are also intentional.
