---
name: claude-setup-status
description: Where the Claude Code setup stands — the spec is ~/.claude/SETUP-PLAN.md; read its START HERE block before changing any rule, setting, permission, hook or memory
metadata:
  type: project
---

Amit's Claude Code setup lives in `~/.claude`, which is itself the git repo
`github.com/AmitJangra25/claude-setup`. The written spec, every decision and the
account-switch runbook are in `~/.claude/SETUP-PLAN.md`.

**Why:** the setup grew by accident over ~120 sessions and nobody designed it. The
plan file holds the verified inventory, the decisions with their reasoning, and a
record of every claim that turned out to be wrong when checked — so work resumes
from a known state rather than a guess.

**Where it stands, 2026-09-26.** The original repair plan closed 2026-09-21. Work
since then is a second pass on the same repo, organised as blocks:

- **Block 1 — rules, workflow, templates, permissions, baseline.** Done. Two modes
  and the task order are in `STANDARDS.md`; four templates load on demand.
- **Block 2 — startup context.** Done and measured. **58.3k → 34.3k → 21.9k.**
  See [[skill-overrides-name-only]] for the mechanism that did most of it, and for
  the part settled 2026-09-26: plugin skills are **locked by plugin** and no
  `skillOverrides` key reaches them, so the only lever is `/plugin`. That is ~1.1k of
  the remaining 22.0k.
- **Block 3 — fix verified local defects, then test.** Three defects fixed
  2026-09-26: the auto-mode trusted-repo line named `~/Documents`, these notes were
  stranded in the `~/Documents` memory folder, and `README.md` said five imports
  when there are three. Task tests not yet run.
- **Block 4 — repo review, then switch accounts.** Not started. "User B" means a
  second Claude account used by Amit on this same Mac, not another macOS user —
  which is exactly what the runbook in `SETUP-PLAN.md` was written for. Never tested.

**Start setup sessions from `~/.claude`, not `~/Documents`.** Memory is stored per
starting folder, which is how these notes ended up in the wrong place. `~/Documents`
is not a repo and holds every project at once, so it is the widest possible working
directory — the opposite of the one-project boundary the rules exist to keep.

**How to apply:** read the START HERE block of `~/.claude/SETUP-PLAN.md` before
changing any rule, setting, permission, hook or memory, and update the plan when
they change. Nothing is removed or blocked without Amit's explicit approval. See
[[stay-on-the-asked-task]] and [[always-recommend-an-option]].
