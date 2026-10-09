# Setup status

The one current view of where the `~/.claude` setup stands. Pointers, not copies.
Commits, branches, push state and file counts are never recorded here — read them from
git. Updated by every changing setup plan (`.claude/CLAUDE.md`).

**Last verified:** 09-10-2026

## Current phase

**Finish plan, approved 09-10-2026.** T1 open-item review + T2 token baseline →
project checkups in each project's own session (FinNode, Voice-Flow, Emp-Portal), with
T0 — remove `rtk proxy *` — in the first two → T3 drift warning →
T4 Check 2 + about 5 sample `ask` probes → T5 `harness/overview.md` and what "finished"
means → T6 cleanup: sort → update → surgical cleanup, then an independent read-only
check and Amit's review. Reference docs are archived, never deleted. Account switch
(open test 6) deferred until Amit asks. P1B finished 08-10-2026.

## Completed

- The read-only setup audit and the Part 2 cleanup review, 03-10-2026.
- Parts 1, 2A, 2B — the small-change path and permission forms, stale-status
  corrections, backup cleanup and the open-tests index.
- **P1A** — harness control desk (D33). Built, reviewed, approved by Amit and committed
  08-10-2026. Cross-check 08-10-2026 · Opus · final diff in scope · 2 fixed (D33 reason,
  a step-4 contradiction) · 33.4k tokens measured.
- **P1B-1** — reviewed by Amit and committed 08-10-2026. The history in
  `.claude/current-task.md` is copied unchanged to `baselines/03-10-2026.md` (checked
  with `cmp`); the status copies in `SETUP-PLAN.md` § *START HERE* and the
  `claude-setup-status` memory note are retired and now point here; the open-tests
  index points at the tracked copy; D32 records the Part 2B decisions.
  `.claude/current-task.md` was not changed (same SHA-256 before and after).
  Cross-check: none — skipped by Amit's decision, as the approved handoff says.
- **P1B-2** — done 08-10-2026. `.claude/current-task.md` is now only a live task record
  on the `templates/handoff.md` shape, at *Status: none*. Its history was removed after
  two checks against `baselines/03-10-2026.md` (`cmp` and SHA-256), and every other
  fact in it was first confirmed to have a tracked owner. It stays gitignored (D31).
  Cross-check: none — skipped by Amit's decision.
- **Check 2 runs** — 09-10-2026. The blanket `Bash(rtk proxy *)` allow rule had come
  back; Amit approved removing it again. Check 2 is partly answered — open-tests item 1.
- **Mirror drift run** — 09-10-2026. 2 of 18 files drifted, both the `rtk proxy *`
  allow rule in a project `settings.local.json`; not synced — open-tests items 2 and 4.
  Cross-check: none — read-only run.
- **T1 open-item review** — 09-10-2026. Test 7 closed (the hook rewrote it —
  `hook-audit.log`), test 6 deferred, decisions recorded for tests 3 and 5, the
  `archive/README.md` order fixed, sorted by whether git can recover it — Amit's call,
  09-10-2026. Cross-check: none — reads and doc edits only.
- **T2 token baseline** — 09-10-2026. `rtk gain` 60.9% over 12,104 commands; fresh-session
  `/context all` 22.9k (Opus 5.5, 2.1.295), with memory files 6.8k, of which
  `STANDARDS.md` 5.5k. Both in `ENVIRONMENT.md`. Cross-check: none — measurement and doc
  edits only.
- **FinNode checkup + T0** — 09-10-2026, in FinNode's own session. `Bash(rtk proxy *)`
  removed from `settings.local.json`; `drift.sh` shows FinNode 0 drifted, no sync needed.
  No contradictions with `STANDARDS.md`. Deferred items in FinNode's `docs/BACKLOG.md`
  § *Setup and tooling — deferred*. Uncommitted there, by design.
- **Voice-Flow checkup + T0** — 09-10-2026, in Voice-Flow's own session. `Bash(rtk proxy *)`
  removed from `settings.local.json`; broad `settings.json` allows narrowed (`rtk git *`
  → four read/add forms, `rtk gh *` removed, `rtk npm *` → `rtk npm run *`); mirror
  pulled with `sync.sh --pull`, `drift.sh` 0 drifted. Then the dead
  `screencapture … __TRACKED_VAR__` rule removed from `settings.local.json`, pulled the
  same way. Core rules: `CLAUDE.md` and `settings.json` are gitignored there, against
  `STANDARDS.md` § *Git*; logged as a decision in its backlog. Deferred items in
  Voice-Flow's `docs/backlog.md`. Uncommitted there, by design.
- **Emp-Portal checkup** — 09-10-2026, in its own session; rules, config and structure
  only, no data files opened. No `rtk proxy *` there. `settings.json`: `rtk lint *`,
  `rtk git add *` and `rtk npm run *` replaced by six exact lint/typecheck/test commands;
  builds and `git add` are no longer allowed. Mirror pulled with `sync.sh --pull`,
  `drift.sh` 0 drifted. No backlog entry. Structure and core-rules results were not in
  the session's summary.
  Cross-check of all three checkup records: 09-10-2026 · Opus · 5-file set correct,
  3 overstatements fixed, 2 stale sentences fixed · 35.5k tokens measured.
- **T3 drift warning** — 09-10-2026. `harness/session-check.sh`, run by a `SessionStart`
  hook in `.claude/settings.json`, so only sessions started in `~/.claude`. Runs
  `drift.sh` and searches this repo's settings and every mirror copy for
  `Bash(rtk proxy *)` or `:*`; prints nothing when clean, warns and changes nothing
  otherwise. `.claude/CLAUDE.md` makes Claude raise a warning first. Verified: search
  line on test files, silent at 0 drift, warning on a deliberate break (then undone,
  `drift.sh` 0); fresh sessions — warning raised first with drift, silent at 0, no
  check in FinNode (Amit). Cross-check 09-10-2026 · Opus · 1 blocking (script was
  gitignored) + 4 changes, all taken · 33.0k tokens measured.

## Open

- **Setup tests** — `baselines/global-open-tests.md` owns the list. Not repeated here.
- **Idea, not planned — for T6 to place:** a per-project `SessionStart` check comparing
  only that project's own settings with its mirror copy, silent when clean. Settle D23
  first (see *Known contradictions*): the copies live in `~/.claude`, outside the project.

## Blocked

None.

## Known contradictions

- `PROJECTS.md` says project progress lives in each `README.md`; FinNode's rules point
  to `docs/ROADMAP.md`. Checked 09-10-2026 in FinNode's session: progress lives in
  `docs/ROADMAP.md` § *Phase 2 → Checkpoints*, with a one-line summary in `README.md`.
  `PROJECTS.md`'s wording is the part that is wrong — fix in T6.
- Can a project session read `~/.claude`? D23 and PHASE 1 disagree (see D31). Nothing
  depends on it. Left for T6.
- `SETUP-PLAN.md` § *Standing context* says no project holds a broad arbitrary-code
  rule; FinNode and Voice-Flow did until 09-10-2026. Historical text — fix in T6.

## Decisions in force

D33 (this harness) and the D-rows in `SETUP-PLAN.md`; the rules in `STANDARDS.md`.

## Next gate

**Now:** T1, T2, all three project checkups and T3 done; `drift.sh` 0 drifted. Next: T4
— Check 2 in default mode + about 5 sample `ask` probes — in its own session. Still
Amit's to run: the `rtk proxy wc` test (open test 2).

Done: Opus diff review, Amit's review, `/context all` before and after (setup 22.6k →
22.9k, FinNode 28.4k → 28.6k, measured), setup-only load test passed. The earlier
requirement for two P1A setup sessions before P1B was replaced by Amit's approval of
P1B-1 in direction, 08-10-2026. The cold Orient gate sessions do not count as P1A
usage. P1B-1 done 08-10-2026 after the cold Orient gate passed, and committed after
Amit's diff review. P1B-2 done 08-10-2026 after its own plan approval. Mirror drift closed 09-10-2026:
`rtk proxy *` removed in each project's own session, `drift.sh` 0 drifted. Committing and
pushing each need Amit's separate approval.

## Source of truth

| Question | Owner |
|---|---|
| Global rules | `STANDARDS.md` |
| Setup-only rules | `.claude/CLAUDE.md` |
| Current setup status | this file |
| The task in progress — scope, progress, next step; never setup status | `.claude/current-task.md` (gitignored; *Status: none* between tasks) |
| Decisions and history | `SETUP-PLAN.md` |
| Setup tests | `baselines/global-open-tests.md` |
| Machine facts, measurement method | `ENVIRONMENT.md` |
| Cross-check procedure | `harness/cross-check.md` |
| Project status and tests | the project's own files, read in its own session |
| Git and recovery | git; `archive/README.md`; `SETUP-PLAN.md` § *Rebuilding on another account* |
