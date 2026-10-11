# Setup status

The one current view of where the `~/.claude` setup stands. Pointers, not copies.
Commits, branches, push state and file counts are never recorded here — read them from
git. Updated by every changing setup plan (`.claude/CLAUDE.md`).

**Last verified:** 11-10-2026

## Current phase

**Finish plan, approved 09-10-2026.** T1 open-item review + T2 token baseline →
project checkups in each project's own session (FinNode, Voice-Flow, Emp-Portal), with
T0 — remove `rtk proxy *` — in the first two → T3 drift warning →
T4 Check 2 + about 5 sample `ask` probes → T5 `harness/overview.md` and what "finished"
means → T6 cleanup: sort → update → surgical cleanup, then an independent read-only
check and Amit's review. Reference docs are archived, never deleted. Account switch
(open test 6) deferred until Amit asks. P1B finished 08-10-2026. T1–T5 and the three
project checkups are done; T6 is closed, reviewed and committed (Amit, 11-10-2026).

## Completed

Entries up to and including T6 moved unchanged to
`baselines/status-completed-11-10-2026.md` (11-10-2026), to keep this file to the
current state.

- **Token-saving changes** — 11-10-2026, approved by Amit. Status-line thresholds
  lowered to 200K/300K/400K in `statusline/context.py` and `ENVIRONMENT.md` § *Status
  line*; this section's log moved to `baselines/` (copy checked with `cmp`), with a naming
  exception added to `baselines/README.md`. `drift.sh` 0 drifted and
  `session-check.sh` silent before and after. Cross-check: none — skipped by Amit's
  decision; no rule, permission or hook changed.

## Open

- **Setup tests** — `baselines/global-open-tests.md` owns the list. Not repeated here.
- **Rejected 10-10-2026 (Amit, T6): a per-project `SessionStart` check** comparing a
  project's settings with its mirror copy. It would have a project session reach into
  `~/.claude`, which D23 and D31 avoid; the setup-session check already catches drift at
  the next setup session. Revisit if drift is found to have gone unnoticed in between.

## Blocked

None.

## Known contradictions

None. All three settled 10-10-2026 (T6): `PROJECTS.md`'s progress wording fixed; D23
reworded by **D38**; `SETUP-PLAN.md` § *Standing context* given a dated correction. The
original entries are in `baselines/t6-removals.md` entry 6.

## Decisions in force

D33 (this harness) and the D-rows in `SETUP-PLAN.md`; the rules in `STANDARDS.md`.

## Next gate

**Now:** nothing in progress — the finish plan is done. The setup is finished when every
line of `harness/overview.md` § *What "finished" means* is true. Deferred until Amit asks:
the account switch (open test 6) and open test 3's replay (Amit, 09-10-2026).

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
