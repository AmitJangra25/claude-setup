---
name: rename-before-the-next-pass
description: Amit will rename this project — repo, folder and the name inside the code — as the first act of the next session working on it; the Claude setup pass comes after
metadata:
  type: project
---

**Do not start the rename unprompted.** This records a decision, not a task.

Amit picked this project's name at random when he started it, and has said he will
**rename it first** the next time he works on it — the GitHub repo, the local folder,
and the name wherever it appears in the code. The Claude setup pass for this project
runs **after** that, not before, so the pass records the final name.

Today: local `vthrudebugger_v1` · repo `AmitJangra25/vthrudebugger_v1` — folder and repo already agree; both are the random name. 9 uncommitted files, parked on branch `alert-swipe-to-dismiss`.

**Why the order matters:** Claude's memory directory is named from the project's
absolute path, so renaming the folder orphans this memory and every other one here —
the breakage `~/.claude/SETUP-PLAN.md` § PHASE 7a had to repair by hand once already.
`project-rules/manifest.tsv`, `PROJECTS.md` and the repo URL break the same way.

**How to apply.** Move the memory folder in the same step as the folder rename, and
update `manifest.tsv` and `PROJECTS.md` with it. No new permission is needed:
`gh repo *` and `git mv *` are on the global `ask` list and a bare `mv` prompts by
default, which is correct for something irreversible and outward-facing.

**Then drop what the rename made pointless.** This project has 39 permission
rules and has never had a setup pass, so expect the category FinNode's pass removed:
spent one-off literals — a single exact command left over from a finished session.
Rules actually holding the old path or name: **zero**. Clear those in the same
sitting, then run the pass proper. See `~/.claude/SETUP-PLAN.md` § *Project names,
and what a rename costs*.
