---
name: v1-is-rnd-mobile-lags-on-purpose
description: "v1 is the R&D/experiment project; mobile's vendored copy is intentionally older and only gets hand-picked changes"
metadata:
  node_type: memory
  type: project
  originSessionId: b612bb10-fc9c-4549-8aab-04730588de04
  modified: 2026-11-09T08:32:34.993Z
---

v1 (this repo) is where the user does R&D and experiments. The mobile app's vendored copy (`mobile/src/debugger/`) is intentionally behind and only receives changes the user selects (said 09-11-2026).

**Why:** Mobile is the customer app, so it should stay stable. v1 can move ahead and try things.

**How to apply:** Never suggest "sync mobile with v1" or treat drift between them as a problem. Only describe what to port when the user names specific changes. Mobile stays read-only: [[mobile-project-read-only]].
