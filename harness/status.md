# Setup status

The one current view of where the `~/.claude` setup stands. Pointers, not copies.
Commits, branches, push state and file counts are never recorded here — read them from
git. Updated by every changing setup plan (`.claude/CLAUDE.md`).

**Last verified:** 29-10-2026

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
`baselines/status-completed-11-10-2026.md` (11-10-2026), and entries from 11-10-2026 to
23-10-2026 to `baselines/status-completed-23-10-2026.md` (29-10-2026), to keep this file
to the current state.

- **Setup audit, Session 2 — clearer and shorter, no rule lost** — 29-10-2026, each piece
  approved by Amit. Findings and their outcome: `baselines/audit-29-10-2026.md`. Results
  against the success measure: (1) rules weakened, judged rule by rule against `e996dc9`:
  0 apart from C1, which Amit accepted (permission explanations for risky boxes only);
  (2) A1–A5 and A8 fixed, A6, A7 and A9 deferred to project sessions; (3) every file path
  in the live docs exists (18/18), `§` pointers not re-checked; (4) dates: 0 non-DD-MM-YYYY
  except five kept file and heading names in `baselines/global-open-tests.md`; (5) shell
  `.env` reads denied (13/13 refused, controls read) and `find -delete`/`-exec`/`xargs rm`
  ask (6/6 boxes); not airtight, stated in `ENVIRONMENT.md`; (6) `drift.sh` 18 current,
  `session-check.sh` silent, `settings.json` valid; (7) `/clear` still unverified (open
  test 13); (8) always-loaded words 4,189 → 3,743; `.claude/CLAUDE.md` 110 → 225, mostly
  the C5/C9 moves. `settings.json` deny 2 → 34, ask 90 → 96. Pointers to the setup-only
  file now read `~/.claude/.claude/CLAUDE.md` in `CLAUDE.md:10` and `STANDARDS.md:51, 264`.
  Agents, all Opus: finder 174k tokens; plan cross-check · CHANGE · fixes taken · 63.8k;
  final review · 0 weakened apart from C1 · two fixes taken · 78.8k.
- **Success measure and goal checks** — 29-10-2026, approved by Amit. Cause: FinNode
  categories sorted 8/142, logged as a note while building went on (~350k tokens lost); no
  rule asked for a success measure. `STANDARDS.md`: Plan opens with the goal and a success
  measure plus a quick real-data check; cross-check asked whether the plan can reach it;
  Review and Stop measure against it; speak up and stop when a result shows the measure
  will be missed; test what proves the goal, not tests that restate the code; general mode
  may read any project read-only when asked; project mode stays put, cross-project work
  only when asked; § *Claude Setup*: a setup session may edit a project's `CLAUDE.md` and
  its mirror on exact approval, project-side edit left uncommitted. `templates/handoff.md`:
  keep-short line, goal and latest-result fields first. FinNode `CLAUDE.md` "carry on"
  rule now stops on a missed success measure — mirror copy committed here; **live
  FinNode edit complete, its FinNode commit pending** (see *Open*). Cross-check 29-10-2026 · Opus · CHANGE · all points
  taken · 40.9k tokens measured; fixes 10–11 added after it, covered by the final review.
  `drift.sh` and `session-check.sh` before: 6 drifted copies and `Bash(rtk proxy *)` in
  `.claude/settings.local.json`, all pre-existing, accepted as baseline by Amit.
- **Session check after `/clear`; `rtk proxy` only for reads** — 29-10-2026, approved by
  Amit (`d08c059`). The `SessionStart` hook ran only on `startup`, so `/clear` dropped the
  drift warning; matcher now `startup|clear`. The script is not executable, which is fine:
  the hook runs it with `bash`. `Bash(rtk proxy *)` returned on 23-10-2026 when a commit
  wrapped in `rtk proxy` was approved with "don't ask again" (setup session `26b8c4c8`);
  removed from `.claude/settings.local.json`, and `STANDARDS.md` § *Reuse what is already
  there* now says `rtk proxy` is for reads only and to answer plain "Yes" to that offer
  (moved to `RTK.md` § *`rtk proxy`* on 29-10-2026). Not
  added to the `ask` list (Amit: fewer clicks). Opus review · CLEAN · 22.3k tokens measured.
  `drift.sh` before and after: the same 6 drifts. Unverified: the `startup|clear` matcher is
  set, but whether the check runs after `/clear` is not proven. A clean session produces no
  check output, so silence does not distinguish between "hook ran silently" and "hook did
  not run". A controlled test would require temporarily creating a known drift; deferred to
  avoid unnecessary changes and token use.
- **FinNode handoff trimmed — one-time exception** — 29-10-2026, approved by Amit (option B).
  Done from this setup session although `STANDARDS.md` § *Claude Setup* limits reach-in edits
  to a project's `CLAUDE.md`. FinNode `.claude/current-task.md` 44,129 → 4,610 bytes (about
  11k → 1.2k tokens per read, estimated); the old file copied verbatim to
  `.claude/handoff-history-29-10-2026.md` (`cmp` identical). Both untracked in FinNode;
  nothing committed there. No other FinNode file changed.
- **Mirror drift cleared; bypass rules removed — one-time exception** — 29-10-2026, approved
  by Amit (option a). Four stale copies synced file by file (not `sync.sh --pull`): FinNode
  `settings.json`, Packbly_web `settings.local.json`, Voice-Flow `settings.json` and
  `CLAUDE.md`. `Bash(rtk proxy *)` had returned in the live FinNode and Voice-Flow
  `settings.local.json`, plus `Bash(rtk git *)` in Voice-Flow; removed from the live files
  from this setup session — an exception to § *Claude Setup*, which excludes project
  settings — and those two copies synced. No other rule changed; nothing committed in either
  project (local settings are untracked). Five memory changes written by the FinNode and
  Voice-Flow sessions committed as they were. `STANDARDS.md` § *When something is unclear*:
  "cloud" is "Claude" added to the dictation example.
- **Session check reads live project settings** — 29-10-2026, approved by Amit.
  `harness/session-check.sh` now also searches each manifest project's live
  `.claude/settings.json` and `.claude/settings.local.json` — and nothing else in the
  project — for `Bash(rtk proxy *)` and `Bash(rtk git *)`, naming project, file and rule.
  Before, such a rule showed only as drift. Tested in a scratch copy under `/tmp/sc-test`
  with a fake project: old script → drift line only; new script → both rules named; rules
  removed → silent. Real run: silent; `drift.sh` 0 drifted.

## Open

- **Live FinNode `CLAUDE.md` edit** — complete in
  `/Users/amitjangra/Documents/VS Code/FinNode/CLAUDE.md` lines 24–25, matching
  `project-rules/FinNode/CLAUDE.md`; only its commit in the FinNode repository is pending,
  with FinNode's next PR (29-10-2026).
- **Audit findings deferred to project sessions** — A6, A7, A9, B7, B8, E3, E5, E6, E8, F6
  (FinNode, Voice-Flow, Debugger files); S5a–c (Packbly and Emp Portal app fixes); S4
  (project allow lists unreviewed). Detail: `baselines/audit-29-10-2026.md`.

- **Setup tests** — `baselines/global-open-tests.md` owns the list. Not repeated here.
- **Rejected 10-10-2026 (Amit, T6): a per-project `SessionStart` check** comparing a
  project's settings with its mirror copy. It would have a project session reach into
  `~/.claude`, which D23 and D31 avoid; the setup-session check already catches drift at
  the next setup session. Revisit if drift is found to have gone unnoticed in between.

## Blocked

None.

## Known contradictions

Three found 29-10-2026 and settled the same day by the success-measure change above:
`STANDARDS.md` "speak up only if broken" and FinNode `CLAUDE.md` "carry on with the task"
let a missed goal go on unreported; general mode forbade project reads Amit asks for. The
29-10-2026 audit settled A1–A5 and A8; A6, A7 and A9 are in project files and wait for
those sessions (*Open*). The 10-10-2026 set is in `baselines/t6-removals.md` entry 6.

## Decisions in force

D33 (this harness) and the D-rows in `SETUP-PLAN.md`; the rules in `STANDARDS.md`.

## Next gate

**Now:** the Session 2 audit changes are complete and closed (29-10-2026). Nothing else
in progress. As of 29-10-2026
nothing is broken; the FinNode-side commit is pending (see *Open*). The `/clear` limitation is unverified, not confirmed failed. The setup is
finished when every line of `harness/overview.md` § *What "finished" means* is true.
Deferred until Amit asks: the account switch (open test 6) and open test 3's replay
(Amit, 09-10-2026).

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
