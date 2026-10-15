---
name: stop-at-earliest-gate
description: "When a message has several approval gates, stop at the earliest open one before any later destructive step (branch deletion, install)"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 6e42a24a-0a93-4328-b1bd-2fee888b3523
  modified: 2026-10-15T16:17:53.471Z
---

When Amit approves a multi-step list that contains a "show me X before Y" gate, stop at that gate. Don't carry on to later steps in the same turn, even ones he pre-approved, if they delete or publish something (branch deletion, `install:app`, merges).

**Why:** on 15-10-2026 he approved doc fixes ("show me the diff before committing") and a 23-branch deletion in one message. I deleted the branches before he had seen the diff, and he asked me to "stop at my latest approval gate before any branch deletion".

**How to apply:** do the read-only and reversible work, show the gated item, and end the turn. Destructive steps wait for the next message, even if approved earlier. Related: [[report-findings-dont-chase-them]], [[cannot-see-permission-prompts]].
