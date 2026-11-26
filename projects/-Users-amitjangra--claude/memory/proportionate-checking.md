---
name: proportionate-checking
description: "Scale evidence to the change — tiny approved wording or record edits get a diff, an unchanged check and one format check per batch"
metadata:
  node_type: memory
  type: feedback
  originSessionId: fad229a7-cfd5-4640-98c4-4ae3905a9ccb
  modified: 2026-11-26T09:25:41.690Z
---

For tiny approved wording or record edits: show only the exact diff, confirm the protected draft or output is unchanged, and run the format check once at the end of the batch. Do not repeat the full evidence checklist for each one-line change.

Keep full evidence (complete diffs, raw check output, proof of which files changed, two-method listings) for: a new blind-test draft, a rule-file or template change, or a risky or irreversible change.

**Why:** Amit, 26-11-2026, during Phase 12 WP2–gate follow-ups: repeating the full WP2 evidence checklist for every one-line record edit was out of proportion.

**How to apply:** decide the evidence level per batch from what changed, not from the last task's checklist. Still push back if something is wrong or risky. Related: [[stay-on-the-asked-task]], [[agreement-is-not-approval]].

**Also (Amit, 26-11-2026):** "you are wasting 100k tokens just to fix 15 tokens … do not waste time in small small things." When a measure misses by a rounding-sized margin, say so in one line with the cost of fixing vs accepting, and recommend the cheap path; never grow a tiny fix into a plan-and-review cycle.
