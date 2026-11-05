---
name: main-session-opens-projects-by-add-dir
description: "When the ~/.claude main session needs to read a project, name the folder and ask Amit for /add-dir — the read block is not the end of the road"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 09c9f96c-a2c9-4c97-a895-0075bc24aa4d
  modified: 2026-11-05T14:17:13.348Z
---

When the `~/.claude` main session needs to read a project (e.g. to confirm a project
session's results), say which folder and why, then ask Amit to type
`/add-dir <folder>`. Read only; it lasts for that session. Never read around the block
with a shell command.

**Why:** 05-11-2026 — I could not confirm Session C because
`blockReadsOutsideWorkingDirectories` blocked FinNode, and I sent Amit to fetch the
results instead of offering `/add-dir`, which had already worked for `/tmp` that day.
The rule (`STANDARDS.md` § *Which project*) allows reads he asks for; D23 in
`SETUP-PLAN.md` says other folders open "by prompt, not by a standing grant" — `/add-dir`
is that prompt. A standing settings grant was judged overkill (Amit, 05-11-2026).

**How to apply:** at the first blocked read of a project folder, offer `/add-dir` in one
line; never treat the block as final and never go round it. Related:
[[claude-setup-status]], [[stay-on-the-asked-task]].
