# Setup status

The one current view of where the `~/.claude` setup stands. Pointers, not copies.
Commits, branches, push state and file counts are never recorded here — read them from
git. Updated by every changing setup plan (`.claude/CLAUDE.md`).

**Last verified:** 09-10-2026

## Current phase

**Finish plan, approved 09-10-2026.** T1 open-item review + T2 token baseline →
T0 remove `rtk proxy *` in FinNode's and Voice-Flow's own sessions → T3 drift warning →
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

## Open

- **Setup tests** — `baselines/global-open-tests.md` owns the list. Not repeated here.

## Blocked

None.

## Known contradictions

- `PROJECTS.md` says project progress lives in each `README.md`; FinNode's rules point
  to `docs/ROADMAP.md`. To be checked in the T0 FinNode session.
- Can a project session read `~/.claude`? D23 and PHASE 1 disagree (see D31). Nothing
  depends on it. Left for T6.

## Decisions in force

D33 (this harness) and the D-rows in `SETUP-PLAN.md`; the rules in `STANDARDS.md`.

## Next gate

**Now:** T1 and T2 done. Next is T0 — remove `rtk proxy *` in FinNode's and Voice-Flow's
own sessions, then re-run `drift.sh` here.

Done: Opus diff review, Amit's review, `/context all` before and after (setup 22.6k →
22.9k, FinNode 28.4k → 28.6k, measured), setup-only load test passed. The earlier
requirement for two P1A setup sessions before P1B was replaced by Amit's approval of
P1B-1 in direction, 08-10-2026. The cold Orient gate sessions do not count as P1A
usage. P1B-1 done 08-10-2026 after the cold Orient gate passed, and committed after
Amit's diff review. P1B-2 done 08-10-2026 after its own plan approval. Mirror drift closes when the
`rtk proxy *` rule is removed in FinNode's and Voice-Flow's own sessions and a
`drift.sh` re-run shows 0 drifted. Committing and
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
