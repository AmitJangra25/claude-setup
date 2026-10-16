---
name: state-workaround-behaviour-before-building
description: "Before building a partial fix, spell out the exact user-visible behaviour and any manual step; never let it pass as a full fix"
metadata:
  node_type: memory
  type: feedback
  originSessionId: f71cad5e-2878-46fa-8c48-abc54867337a
  modified: 2026-10-16T07:47:07.331Z
---

When an approval covers an investigation, stop after it and present options; don't roll into building one. When the chosen option is a partial workaround, say in one plain line what the user will actually see — especially any manual step — before building it, and again in the test steps. Never frame a workaround as the fix.

**Why:** 16-10-2026, clipboard fix (PR #33). Amit chose "option 2" and expected Cmd+V to give back his copy; it needs a right-click → Restore previous clipboard in Chromium apps (Comet, VS Code, Slack). He tested, saw the dictation, and concluded the fix failed and that I was guessing. He also objected to being steered toward small side issues.

**How to apply:** for any workaround, lead with "after this, X still happens; you do Y to get Z". Keep "noting" lists short, and don't re-raise deferred issues (clipboard auto-restore is deferred until after Phase 3/4). Related: [[fix-root-cause-flag-workarounds]], [[report-findings-dont-chase-them]].
