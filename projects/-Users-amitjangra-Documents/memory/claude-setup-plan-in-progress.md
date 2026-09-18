---
name: claude-setup-plan-in-progress
description: The Claude Code setup is being repaired against a written plan at ~/.claude/SETUP-PLAN.md — read it before touching rules, settings or permissions
metadata:
  type: project
---

Amit's whole Claude Code setup — global rules, per-project rules, 560 permission
rules, the rtk hook, cloud skills and plugins, and memory — is being inventoried
and repaired against a written specification at `~/.claude/SETUP-PLAN.md`.
Started 2026-09-18. The plan is also the rebuild runbook for switching Claude
accounts, which is why it exists.

**Why:** the setup grew by accident over ~120 sessions and nobody designed it.
The plan file holds the verified inventory, all 14 decisions with their
reasoning, and a record of the six claims that turned out to be wrong when
checked — so work resumes from a known state rather than a guess.

**How to apply:** read `~/.claude/SETUP-PLAN.md` in full before changing any
rule, setting, permission, hook or memory, and update it when they change. Its
"START HERE" section holds the current step and shell commands to verify that
state rather than trust it. Nothing is removed or blocked without Amit's
explicit approval. See [[always-recommend-an-option]] and
[[report-findings-dont-chase-them]].
