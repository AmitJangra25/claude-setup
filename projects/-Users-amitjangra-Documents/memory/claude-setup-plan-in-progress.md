---
name: claude-setup-plan-in-progress
description: The Claude Code setup is being repaired against a written plan at ~/.claude/SETUP-PLAN.md — read it before touching rules, settings or permissions
metadata:
  type: project
---

Amit's whole Claude Code setup — global rules, per-project rules, permission
rules, the rtk hook, cloud skills and plugins, and memory — is being inventoried
and repaired against a written specification at `~/.claude/SETUP-PLAN.md`.
Started 2026-09-18. The plan is also the rebuild runbook for switching Claude
accounts, which is why it exists.

**Why:** the setup grew by accident over ~120 sessions and nobody designed it.
The plan file holds the verified inventory, all 20 decisions with their
reasoning, and a record of every claim that turned out to be wrong when checked
— so work resumes from a known state rather than a guess.

**Where it stands 2026-09-20.** Phases 1-7 and 5.1-5.8 are done, **all five project
passes are done**, and **Phase 11's six global files are done** — 3,201 → 2,444 words,
~4,225 → ~3,226 tokens every turn. **Only the global permission list remains** in
Phase 11: 107 `ask`, 35 `allow`, 2 `deny`. Phases 2c, 8 and 9 are still partial.
The lesson from the global pass: **measure before proposing, and expect correctness
rather than weight** — the five files on 2026-09-20 netted 93 words but fixed five
wrong or dead facts, and `PROJECTS.md` got *heavier* for the right reason.

**Renames are decoupled — ignore them.** Amit renames a project when he opens it
to work on. A pass runs on the current name and must never propose a rename or
wait for one. This was briefly made a prerequisite on 2026-09-20, which turned a
project chore into a blocker and sent a session off to global files instead. Both
were reversed the same day. That sequencing question is now moot: every project pass
is finished, and the global files after them.

Four facts worth carrying. **There is no global memory**, so a universal
preference saved in a project is structurally trapped there — which is why this
note exists in more than one project folder. **A hand-written global skill is
picked up immediately**, not at next session start, but it is gitignored unless
added to `.gitignore` by name, and would otherwise be lost on an account switch.
**Project rules that execute arbitrary code are still open in Debugger v2 and
Voice Flow_v1** (`python3 -c ' *`). And **measure a section before proposing its
fix** — FinNode's biggest section looked like Voice-Flow's problem and
measurement said otherwise.

Three review pages: setup https://claude.ai/artifact/2WH7CSysZCJY7Ta6EhskA3 · permissions https://claude.ai/artifact/YAJNnNkSemQyCCtMsNkzDD · structure https://claude.ai/artifact/JPhMJ7z3bAMux6w5G3ZaMy

**How to apply:** read the START HERE block and § PHASE 11 of
`~/.claude/SETUP-PLAN.md` before changing any rule, setting, permission, hook or
memory, and update the plan when they change. Its "START HERE" section holds the
current step and shell commands to verify that state rather than trust it.
Nothing is removed or blocked without Amit's explicit approval. See
[[always-recommend-an-option]] and [[report-findings-dont-chase-them]].
