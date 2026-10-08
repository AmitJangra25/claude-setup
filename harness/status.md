# Setup status

The one current view of where the `~/.claude` setup stands. Pointers, not copies.
Commits, branches, push state and file counts are never recorded here — read them from
git. Updated by every changing setup plan (`.claude/CLAUDE.md`).

**Last verified:** 08-10-2026

## Current phase

**None in progress.** P1A finished 08-10-2026. P1B is next, not started, and needs its
own approval.

## Completed

- Parts 1, 2A, 2B — the small-change path and permission forms, stale-status
  corrections, backup cleanup and the open-tests index.
- **P1A** — harness control desk (D33). Built, reviewed, approved by Amit and committed
  08-10-2026. Cross-check 08-10-2026 · Opus · final diff in scope · 2 fixed (D33 reason,
  a step-4 contradiction) · 33.4k tokens measured.

## Open

- **P1B** — move the durable detail out of `.claude/current-task.md`, then make this
  file the only status source. Not started; needs its own approval.
- **Setup tests** — `baselines/global-open-tests.md` owns the list. Not repeated here.

## Blocked

- **Check 2** — needs auto mode turned off for one command, a settings change.
  Waiting on Amit.

## Known contradictions — stale until P1B

- `SETUP-PLAN.md` § *START HERE* and the memory note `claude-setup-status` still carry
  their own status; this file supersedes both. `SETUP-PLAN.md` still lists Part 2B as
  open; it is done.
- Open tests 1–4 and 7 point into `.claude/current-task.md`, which git does not keep.
- `SETUP-PLAN.md` expects a tracked-file count that no longer matches git.
- The handoff's *Known gaps* points to `SETUP-PLAN.md` line ~2077 for the rule-replay
  method. That measurement is under § *FinNode — open, not acted on*, at about line
  2124 (checked 08-10-2026). The pointer should use the section name. The concern
  stands: no new permission rule without replaying it against Bash history first.
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
usage. Next: P1B-1, after a cold Orient gate and its own plan approval.

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
