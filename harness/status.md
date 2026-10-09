# Setup status

The one current view of where the `~/.claude` setup stands. Pointers, not copies.
Commits, branches, push state and file counts are never recorded here — read them from
git. Updated by every changing setup plan (`.claude/CLAUDE.md`).

**Last verified:** 09-10-2026

## Current phase

**None in progress.** P1B finished 08-10-2026 — P1B-1 and P1B-2 both done. No next
phase is planned; the items under *Open* and *Blocked* wait for Amit.

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

## Open

- **Setup tests** — `baselines/global-open-tests.md` owns the list. Not repeated here.

## Blocked

None.

## Known contradictions

- `archive/README.md` lists the new tarball out of order.
- `PROJECTS.md` says project progress lives in each `README.md`; FinNode's rules point
  to `docs/ROADMAP.md`. Unverified until a FinNode session checks.
- Can a project session read `~/.claude`? D23 and PHASE 1 disagree (see D31). Nothing
  depends on it.

## Decisions in force

D33 (this harness) and the D-rows in `SETUP-PLAN.md`; the rules in `STANDARDS.md`.

## Next gate

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
