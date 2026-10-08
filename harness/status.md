# Setup status

The one current view of where the `~/.claude` setup stands. Pointers, not copies.
Commits, branches, push state and file counts are never recorded here — read them from
git. Updated by every changing setup plan (`.claude/CLAUDE.md`).

**Last verified:** 08-10-2026

## Current phase

**None in progress.** P1B-1 finished 08-10-2026 and is waiting for Amit's diff review;
not committed. P1B-2 is next, not planned, and needs its own approval.

## Completed

- Parts 1, 2A, 2B — the small-change path and permission forms, stale-status
  corrections, backup cleanup and the open-tests index.
- **P1A** — harness control desk (D33). Built, reviewed, approved by Amit and committed
  08-10-2026. Cross-check 08-10-2026 · Opus · final diff in scope · 2 fixed (D33 reason,
  a step-4 contradiction) · 33.4k tokens measured.
- **P1B-1** — not committed; waiting for Amit's diff review. The history in
  `.claude/current-task.md` is copied unchanged to `baselines/03-10-2026.md` (checked
  with `cmp`); the status copies in `SETUP-PLAN.md` § *START HERE* and the
  `claude-setup-status` memory note are retired and now point here; the open-tests
  index points at the tracked copy; D32 records the Part 2B decisions.
  `.claude/current-task.md` was not changed (same SHA-256 before and after).
  Cross-check: none — skipped by Amit's decision, as the approved handoff says.

## Open

- **P1B-2** — the rest of P1B, including what becomes of `.claude/current-task.md` now
  its history is tracked. Not planned; needs its own approval.
- **Setup tests** — `baselines/global-open-tests.md` owns the list. Not repeated here.

## Blocked

- **Check 2** — needs auto mode turned off for one command, a settings change.
  Waiting on Amit.

## Known contradictions

- `.claude/current-task.md` still holds legacy task status that reads as live — its
  *Complete*, *Still open* and *Exact next step* sections, the last still calling
  P1B-1 not started. This file wins. That file stays as written until P1B-2, because
  P1B-1 kept it read-only.
- `.claude/current-task.md` *Known gaps* still points to `SETUP-PLAN.md` line ~2077 for
  the rule-replay method; it is in § *FinNode — open, not acted on*. The tracked copy
  in `baselines/03-10-2026.md` carries that correction in its header. The handoff
  stays as written until P1B-2. The concern stands: no new permission rule without
  replaying it against Bash history first.
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
usage. P1B-1 done 08-10-2026 after the cold Orient gate passed. Next: Amit reviews the
P1B-1 diff; commit and push each need separate approval. Then P1B-2, planned and
approved on its own.

## Source of truth

| Question | Owner |
|---|---|
| Global rules | `STANDARDS.md` |
| Setup-only rules | `.claude/CLAUDE.md` |
| Current setup status | this file |
| The task in progress | `.claude/current-task.md` |
| Decisions and history | `SETUP-PLAN.md` |
| Setup tests | `baselines/global-open-tests.md` |
| Machine facts, measurement method | `ENVIRONMENT.md` |
| Cross-check procedure | `harness/cross-check.md` |
| Project status and tests | the project's own files, read in its own session |
| Git and recovery | git; `archive/README.md`; `SETUP-PLAN.md` § *Rebuilding on another account* |
