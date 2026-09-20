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

**Where it stands 2026-09-20.** Phases 1-7 and 5.1-5.8 are done. The order was
**reversed on 2026-09-20**: the work is now **Phase 11 — the global pass**, and
the three remaining projects are reviewed only when Amit next opens them. Each
needs a rename first, the rename is his to do, and setup work must not wait on
it. **Do not propose project work as the next setup step** — that mistake was
made once and corrected.

Phase 10 (projects) is done for **Voice-Flow** and **FinNode**; `vthrudebugger_v1`,
`Emp portal` and `Debugger v2` are deferred, not queued. Phase 11 has done
**`OLLAMA.md`** — 797 → 133 words, detail moved verbatim to
`~/.claude/skills/ollama/SKILL.md`, **~878 tokens saved on every turn in every
project** (global files 3,139 → 2,474 words). **`STANDARDS.md` is next** — 1,559
words, 63% of the remaining global weight.

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
