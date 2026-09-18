---
name: check-history-json-before-chasing-polish
description: "For any \"polish is wrong\" report, read history.json's raw/polished pair first — it is the ground truth and often shows the pipeline was fine"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: ee152e10-87e1-440c-9ad9-3cd8edfd3500
  modified: 2026-09-08T12:30:39.190Z
---

When Amit reports the dictation polish misbehaving, read
`~/Library/Application Support/Voice Flow/data/history.json` before changing
anything. Each entry stores `raw`, `polished`, `polishEngine`, `polishModel`,
`polishFellBack` and `polishMs` — so it settles in one read whether the pipeline
ran, which engine answered, and exactly what it produced.

**Why:** on 8 Sep 2026 he reported the new grammar rule as "not working" twice.
history.json showed both dictations polished correctly (`fellBack: false`), and
the real cause was that he had misread my own test instruction — I had written
that "kindly revert" must survive *verbatim*, and he read it as "kindly" should
become "please". Two rounds of investigation went into a working feature.

**How to apply:** read the newest entries first and show him the raw → polished
pair as a table. If the stored output is correct, the bug is in what he is
looking at (or in the instruction I gave him), not in the pipeline — ask which
surface disagrees rather than editing the prompt. Only if `polishFellBack` is
true, or the stored `polished` is genuinely wrong, is there code to fix. Same
verify-the-real-artifact instinct as [[verify-shipped-bundle-not-source]], and
related to [[amit-uses-voice-input]] since his reports arrive as dictated prose.
