---
name: claude-setup-plan-in-progress
description: The Claude Code setup repair is COMPLETE — the plan at ~/.claude/SETUP-PLAN.md is now the finished record and the rebuild runbook; read it before touching rules, settings or permissions
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

**COMPLETE 2026-09-21. Every phase is closed, and so is the last open item** — Voice-Flow's git history was rewritten that day at Amit's request, stripping `CLAUDE.md` from all 162 commits on both branches, with a mirror backup of the originals in `~/.claude/backups/2026-09-21-voice-flow-history/`. **Nothing is open; do not invent a next piece.** Earlier status: **every phase closed** — 2c, 8 and 9 were confirmed done on 2026-09-21, the last three markers having been stale rather than open work; the only item left is the Voice-Flow git-history rewrite, which waits for that repo going public. Earlier: Phases 1-7 and 5.1-5.8 are done, **all five project
passes are done**, and **Phase 11's six global files are done** — 3,201 → 2,444 words,
~4,225 → ~3,226 tokens every turn. **Phase 11 is complete** — the permission list was
passed too, adding 5 rules and removing none (`ask` 107 → 112, `allow` 35, `deny` 2).
The permission lesson worth carrying: **the
rtk hook rewrites a command before the permission check**, so a fence needs every
spelling the hook can produce — `wget` was fenced bare and via `rtk proxy` but not
`rtk `, and so was not fenced at all.
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
**The arbitrary-code rules are closed** — this note said they were still open in
Debugger v2 and Voice Flow_v1 (`python3 -c ' *`) until 2026-09-22, when a sweep of
both files found **zero**; Phase 10 had already removed them. Voice-Flow keeps two
`python3` rules, but each spells the whole command out with no wildcard, so neither
is a hole. And **measure a section before proposing its
fix** — FinNode's biggest section looked like Voice-Flow's problem and
measurement said otherwise. That held a second time on 2026-09-22: see decision D26 in
`SETUP-PLAN.md` — trim a rule file only where the content is a *procedure*, never
where it is a *rule*.

Three review pages: setup https://claude.ai/artifact/2WH7CSysZCJY7Ta6EhskA3 · permissions https://claude.ai/artifact/YAJNnNkSemQyCCtMsNkzDD · structure https://claude.ai/artifact/JPhMJ7z3bAMux6w5G3ZaMy

**How to apply:** read the START HERE block and § PHASE 11 of
`~/.claude/SETUP-PLAN.md` before changing any rule, setting, permission, hook or
memory, and update the plan when they change. Its "START HERE" section holds the
current step and shell commands to verify that state rather than trust it.
Nothing is removed or blocked without Amit's explicit approval. See
[[always-recommend-an-option]] and [[report-findings-dont-chase-them]].
