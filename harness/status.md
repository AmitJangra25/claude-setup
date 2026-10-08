# Setup status

The one current view of where the `~/.claude` setup stands. Pointers, not copies.
Commits, branches, push state and file counts are never recorded here — read them from
git. Updated by every changing setup plan (`.claude/CLAUDE.md`).

**Last verified:** 08-10-2026

## Current phase

**P1A — harness control desk.** Built, reviewed, and functionally approved by Amit
08-10-2026; awaiting commit approval. Plan and scope: `.claude/current-task.md` § *Exact next step*.
Cross-check 08-10-2026 · Opus · final diff in scope · 2 fixed (D33 reason, a step-4
contradiction) · 33.4k tokens measured.

## Completed

- Parts 1, 2A, 2B — the small-change path and permission forms, stale-status
  corrections, backup cleanup and the open-tests index.

## Open

- **P1A commit** — waiting on Amit.
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
- A `SETUP-PLAN.md` pointer still uses a line number (~2077).
- `archive/README.md` lists the new tarball out of order.
- `PROJECTS.md` says project progress lives in each `README.md`; FinNode's rules point
  to `docs/ROADMAP.md`. Unverified until a FinNode session checks.
- Can a project session read `~/.claude`? D23 and PHASE 1 disagree (see D31). Nothing
  depends on it.

## Decisions in force

D33 (this harness) and the D-rows in `SETUP-PLAN.md`; the rules in `STANDARDS.md`.

## Next gate

Done: Opus diff review, Amit's review, `/context all` before and after (setup 22.6k →
22.9k, FinNode 28.4k → 28.6k, measured), setup-only load test passed. Next: P1A used in
two setup sessions, accurate at the end of each, before P1B.

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
