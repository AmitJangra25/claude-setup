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
The plan file holds the verified inventory, all 20 decisions with their
reasoning, and a record of every claim that turned out to be wrong when checked
— so work resumes from a known state rather than a guess.

**Where it stands 2026-09-20:** phases 1-7 and 5.1-5.8 are done. The work is now
**Phase 10 — a project-by-project review**, which supersedes doing the global
rules first: walk each project, decide what is universal only after seeing them
all, then one global pass at the end. **Voice-Flow is done** (per-turn cost in it
10,056 -> 6,003 tokens; permissions 234 -> 180; 3 skills added; both its repos
committed and pushed). **FinNode is next.** Phase 8 is half done (2 of 5 trapped
rules promoted) and Phase 9 is still only surveyed.

Three facts worth carrying. **There is no global memory**, so a universal
preference saved in a project is structurally trapped there — which is why this
note exists in more than one project folder. **Project rules that execute
arbitrary code are still open in FinNode, Debugger v2 and Voice Flow_v1**
(`python3 -c ' *`); Voice-Flow's five were closed 2026-09-20. And **the START HERE
block of the plan is now the handoff** — read that plus § PHASE 10, not the whole
79 KB file.

Three review pages: setup https://claude.ai/artifact/2WH7CSysZCJY7Ta6EhskA3 · permissions https://claude.ai/artifact/YAJNnNkSemQyCCtMsNkzDD · structure https://claude.ai/artifact/JPhMJ7z3bAMux6w5G3ZaMy

**How to apply:** read `~/.claude/SETUP-PLAN.md` in full before changing any
rule, setting, permission, hook or memory, and update it when they change. Its
"START HERE" section holds the current step and shell commands to verify that
state rather than trust it. Nothing is removed or blocked without Amit's
explicit approval. See [[always-recommend-an-option]] and
[[report-findings-dont-chase-them]].
