---
name: claude-setup-is-a-global-standard-not-a-project
description: "Claude Setup" is Amit's global Claude Code standard and configuration framework, homed in ~/.claude — not a project, repository, product, feature or app; definition in STANDARDS.md § Claude Setup; the "Claude Setup cross-check" in harness/cross-check.md § Claude Setup cross-check
metadata:
  type: feedback
---

**Claude Setup is a global Claude Code standard and configuration framework** that
defines how every project is structured and worked on. It is not a project,
repository, product, feature, or app; `~/.claude` is where it lives, not what it is.
Product projects such as Voice Flow follow it. A **Claude Setup cross-check** is a
read-only, chat-only check of the current project against it — not the agent
cross-check (`harness/cross-check.md` holds both). Definition: `STANDARDS.md`
§ *Claude Setup*; the check itself: `harness/cross-check.md` § *Claude Setup cross-check*.

**Why:** Amit, 12-10-2026, as a permanent clarification — the term needs one meaning
in every session, and `.claude/CLAUDE.md` had called `~/.claude` "a project".

**How to apply:** never list Claude Setup in `PROJECTS.md` or treat it as a product
project; setup sessions still run in project mode (`.claude/CLAUDE.md`). Run a Claude
Setup cross-check in the project's own session; report, change nothing. Related:
[[claude-setup-status]].
