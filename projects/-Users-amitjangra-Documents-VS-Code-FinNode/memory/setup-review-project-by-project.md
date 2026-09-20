---
name: setup-review-project-by-project
description: Amit's Claude setup is being reviewed project by project against ~/.claude/SETUP-PLAN.md; Voice-Flow and FinNode are done, six projects remain
metadata:
  type: project
---

Amit's whole Claude Code setup — global rules, per-project rules, permissions and
memory — is being reviewed **one project at a time**, against a written plan at
`~/.claude/SETUP-PLAN.md`. The global rules are deliberately reviewed **last**,
because what belongs in `STANDARDS.md` cannot be decided until every project has
been seen. **Voice-Flow and FinNode are done (both 2026-09-20). Six remain**, and
`vthrudebugger_v1` is the recommended next — it holds the last two universal rules
still trapped in one project.

**Why:** Amit asked for this order explicitly, after an earlier attempt tried to
promote global rules first and would have had to reopen them. He also asked for
8–10 questions per project — every removal is a question, never an inference —
and for **every deletion to be cross-checked twice, by two different methods**.
That has now caught an error in already-written work in **both** passes, so it is
a fixed step, not a precaution.

**How to apply:** read the **START HERE** block and **§ PHASE 10** of
`~/.claude/SETUP-PLAN.md` before starting — not the whole file, which is ~106 KB.
Back up first, into `~/.claude/backups/<date>-<project>/`, verified with `cmp`.

**The shape a pass produces:** claim in `CLAUDE.md`, evidence in `docs/`, and a
skill to force the right doc open when it matters. Three cost tiers drive it —
`CLAUDE.md` and its imports load *every turn*; `docs/`, skills and memory bodies
load *only when opened*; permissions and hooks cost *nothing ever*.

**But the shape is a hypothesis, not a formula — FinNode proved that.** The
obvious move there was to split its 949-word `Hard rules` section the way
Voice-Flow's was split. Measured first, it was already 62% claim, and splitting
would have hidden the "why" on the rules this project's defects produced for a
~470-token saving. It was left whole. **Measure the section before proposing the
fix**, every time.

FinNode's result: `CLAUDE.md` 2,501 → 2,118 words, ~7,363 → ~6,948 tokens a turn,
permissions 25 → 13 (two arbitrary-code holes closed), 3 skills, commit `725ca2e`.
See [[rtk-proxy-suppresses-dry-run-output]] and [[always-recommend-an-option]],
both now marked as governed globally.
