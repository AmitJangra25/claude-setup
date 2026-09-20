---
name: setup-review-finnode-is-next
description: Amit's Claude setup is being reviewed project by project; Voice-Flow is done and FinNode is the next project in that pass
metadata:
  type: project
---

Amit's whole Claude Code setup — global rules, per-project rules, permissions and
memory — is being reviewed **one project at a time**, against a written plan at
`~/.claude/SETUP-PLAN.md`. The global rules are deliberately reviewed **last**,
because what belongs in `STANDARDS.md` cannot be decided until every project has
been seen. **Voice-Flow was done on 2026-09-20. FinNode is next.**

**Why:** Amit asked for this order explicitly, after an earlier attempt tried to
promote global rules first and would have had to reopen them. He also asked for
8–10 questions per project — every removal is a question, never an inference —
and for **every deletion to be cross-checked twice, by two different methods**,
which has already caught two errors in work reported as done.

**How to apply:** read the **START HERE** block and **§ PHASE 10** of
`~/.claude/SETUP-PLAN.md` before starting — not the whole file, which is ~79 KB.
START HERE lists what is already known to be waiting in FinNode. Back up first,
into `~/.claude/backups/<date>-finnode/`, verified with `cmp`.

The shape every pass produces: **claim in `CLAUDE.md`, evidence in `docs/`, and a
skill to force the right doc open at the moment it matters.** Three cost tiers
drive it — `CLAUDE.md` and its imports load *every turn*; `docs/`, skills and
memory bodies load *only when opened*; permissions and hooks cost *nothing ever*.

Two things in this project are already flagged in the plan:
[[rtk-proxy-suppresses-dry-run-output]] is a universal rule trapped here and
should be promoted to `~/.claude/RTK.md`, and
[[always-recommend-an-option]] is already in `STANDARDS.md` § *When something is
unclear*, so it needs a pointer line rather than a second copy.
