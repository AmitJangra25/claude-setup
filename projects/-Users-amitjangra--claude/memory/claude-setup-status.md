---
name: claude-setup-status
description: "Where the Claude Code setup's status lives — ~/.claude/harness/status.md is the one current view; read it before changing any rule, setting, permission, hook or memory"
metadata:
  node_type: memory
  type: project
  originSessionId: c68b536f-cba2-4bd5-a222-40996918bc2d
  modified: 2026-10-08T00:00:00.000Z
---

Amit's Claude Code setup lives in `~/.claude`, which is itself the git repo
`github.com/AmitJangra25/claude-setup`. **Current status is in
`~/.claude/harness/status.md` (D33) — this note carries none.** The written spec,
every decision and the account-switch runbook are in `~/.claude/SETUP-PLAN.md`.

**Why:** status drifted across four copies, this note among them, and nothing made a
session check them. One owned file per kind of fact (D32); this note only points.

**Block 4** — the account switch. "User B" means a second Claude account used by Amit
on this same Mac, not another macOS user. Never tested; the runbook is
`SETUP-PLAN.md` § *Rebuilding on another account*.

**Start setup sessions from `~/.claude`, not `~/Documents`.** Memory is stored per
starting folder, which is how these notes ended up in the wrong place. `~/Documents`
is not a repo and holds every project at once, so it is the widest possible working
directory — the opposite of the one-project boundary the rules exist to keep.

**How to apply:** read `~/.claude/harness/status.md` before changing any rule,
setting, permission, hook or memory, and update it when they change. Nothing is
removed or blocked without Amit's explicit approval. See [[stay-on-the-asked-task]]
and [[propose-skills-from-observed-work]]; for skill and plugin settings, see
[[skill-overrides-name-only]]. The always-recommend-an-option rule is not a note
here — it is global, in `STANDARDS.md` § *When something is unclear*: never present
options neutrally, name the one you recommend and why not the others.
