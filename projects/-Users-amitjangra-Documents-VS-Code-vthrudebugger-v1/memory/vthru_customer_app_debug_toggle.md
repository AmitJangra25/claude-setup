---
name: vthru-customer-app-debug-toggle
description: "V-Thru's customer app already has a UI toggle to enable/disable the in-app debugger"
metadata: 
  node_type: memory
  type: project
  originSessionId: ee77ee9c-b7ce-4cd9-ab8f-c072298953c7
  modified: 2026-07-25T09:05:08.213Z
---

The V-Thru customer app (the intended first consumer of `@amitjangra25/vthru-debugger`, see [[vthru-debugger-plan]]) already has its own toggle button for QA/testers to enable or disable the debugger.

**Why:** This confirms PLAN.md's open decision #4 ("QA build flag") should stay resolved as "host app decides" — `DebuggerProvider`'s `enabled` prop is host-controlled by design (see `src/react-native/DebuggerProvider.tsx`), not baked into the library via MMKV or any storage mechanism of its own.

**How to apply:** When wiring up Step 9 (consuming the package from V-Thru), the existing toggle button's on/off state should be passed straight into `<DebuggerProvider enabled={...}>` — no new toggle UI or storage key needs to be built in the library.
