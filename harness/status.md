# Setup status

The one current view of where the `~/.claude` setup stands. Pointers, not copies.
Commits, branches, push state and file counts are never recorded here — read them from
git. Updated by every changing setup plan (`.claude/CLAUDE.md`).

**Last verified:** 31-10-2026

## Current phase

**Finish plan, approved 09-10-2026.** T1 open-item review + T2 token baseline →
project checkups in each project's own session (FinNode, Voice-Flow, Emp-Portal), with
T0 — remove `rtk proxy *` — in the first two → T3 drift warning →
T4 Check 2 + about 5 sample `ask` probes → T5 `harness/overview.md` and what "finished"
means → T6 cleanup: sort → update → surgical cleanup, then an independent read-only
check and Amit's review. Reference docs are archived, never deleted. Account switch
(open test 6) deferred until Amit asks. P1B finished 08-10-2026. T1–T5 and the three
project checkups are done; T6 is closed, reviewed and committed (Amit, 11-10-2026).

## In progress

- **Read-only audit, three stages** (approved 31-10-2026; scope and gates in
  `.claude/current-task.md`). **Stage C, security, done 31-10-2026:**
  `baselines/audit-security-31-10-2026.md`. 0 P1, 0 P2, 8 P3, 5 P4. No leak, no exposed
  secret. One fix on Amit's word: rtk telemetry turned off (C2, `rtk telemetry status`
  shows "enabled: no"). **Stage A, clarity, done 31-10-2026:**
  `baselines/audit-clarity-31-10-2026.md`. 0 P1, 0 P2, 12 P3, 6 P4; no fix made.
  **Stage B, cleanup, done 31-10-2026:** `baselines/audit-cleanup-31-10-2026.md`.
  0 P1, 0 P2, 1 P3, 3 P4; nothing needs deleting; no fix made. **Combined summary:**
  `baselines/audit-summary-31-10-2026.md` — 35 findings, 0 P1, 0 P2, 21 P3, 14 P4.
  Audit wording corrected 01-11-2026: `baselines/audit-corrections-31-10-2026.md`.
- **Stage C fixes** (approved 01-11-2026, D44). C1, C3–C7 applied; C2 recorded; report
  `baselines/stage-c-fix-report-01-11-2026.md`. Waiting on Amit: the box tests, PDF
  viewer off in `/plugin`, default-mode repeat, then his review. Nothing committed.
  Stage A and B fixes wait for his approval of the Stage C report.
  Cross-checks (Opus): plan · change, 7 of 8 taken · 70.5k tokens; changed rules · keep,
  2 of 3 taken · 32.2k tokens.

## Completed

Entries up to and including T6 moved unchanged to
`baselines/status-completed-11-10-2026.md` (11-10-2026), and entries from 11-10-2026 to
23-10-2026 to `baselines/status-completed-23-10-2026.md` (29-10-2026), to keep this file
to the current state.

- **Deleted Voice Flow copies cleared from the docs** — 31-10-2026, approved by Amit.
  `Voice Flow_v1` (deleted by Amit) and `Voice-Flow-main` confirmed absent with `ls`.
  Current-state lines removed or corrected in `ENVIRONMENT.md` (§ *Duplicate trees*,
  § *Project-tree decisions*, § *Full project descriptions*), `project-rules/README.md`
  § *Detached* and § *Open* here; history files unchanged. `drift.sh` 13 current,
  0 drifted and `session-check.sh` silent, before and after. Cross-check (Sonnet) · KEEP ·
  21.6k tokens measured.
- **FinNode mirror refreshed** — 30-10-2026, approved by Amit. `sync.sh --pull` copied
  FinNode `CLAUDE.md` (new "never reads `private/`" rule) and `.claude/settings.json`
  (`git add` and `docs/` edit allows out, `private/` read denies in) from FinNode PR #6.
  `drift.sh`: 13 current, 0 drifted. Both files are committed on FinNode `main` via PR #6
  (`234517a`, merged `aec7df5`), so no FinNode rule commit is pending.
- **Backlog value bar; FinNode backlog 6 closed here** — 30-10-2026, approved by Amit
  (`SETUP-PLAN.md` D43). `STANDARDS.md` § *Stay on the task*: backlog entries get a next
  step only if they clear the value bar; before working an unapproved backlog item, Claude
  says worth it or not, priority, size and rough tokens, then waits. Backlog template
  updated to match. The `git add` finding is in `ENVIRONMENT.md` § 3 (commit `1ac21ab`).
- **F5 `git switch` for branches; F9 value bar** — 30-10-2026, approved by Amit
  (`SETUP-PLAN.md` D42). F5: `STANDARDS.md` § *Git* — move with `git switch <branch>`,
  create with `git switch -c <branch> main`; `git checkout` stays boxed. About 120 of 140
  past `git checkout` calls were branch moves (~190 of its 223 boxes). F9: after Claude
  offered 8 follow-ups as mostly P2 and then judged 2 worth doing when Amit pushed back,
  `STANDARDS.md` and `templates/deferred-improvements.md` share a new P1–P3 line (P2 needs
  a case that has happened or a named normal-use trigger), § *Stay on the task* adds the
  value bar, and memory `stay-on-the-asked-task` carries one line. Cross-checks (Opus):
  F5+F2 · keep with 4 changes · 32.7k tokens; F9 · change, all taken except P1 for every
  open security risk (narrowed to risks normal use exposes) · 22.9k tokens.
- **S4 — fewer permission boxes, holes closed** — 30-10-2026, approved by Amit as one
  package (steps 1–6). Decision `SETUP-PLAN.md` D41; record
  `baselines/s4-permissions-30-10-2026.md`. Replay of past
  Bash history on the real files: boxed calls **2,241 → 1,722 (−519, −23%)**; non-auto
  calls with a part no allow rule covers 1,765 → 1,766 (+1). Success measure met. Ask
  rules that boxed reads were narrowed to their writing forms (`gh pr|repo|auth|api`,
  `git merge`, `git * commit`, `security`, `tccutil`, `brew install`, Voice-Flow script
  rules, blanket `git pull`/`git switch`). Holes closed: `git -C … push`-style forms of
  dangerous git commands, `--output`, `--upload-pack`, remote remove/rename, forced
  switch, `pull --rebase/--force`, FinNode `gradlew` uninstall/publish/init-script; broad
  allows that could write removed or narrowed. 12 files changed: `settings.json`, both
  setup settings files, and 9 live project files plus their mirrors. All JSON valid;
  `drift.sh` 18 current, 0 drifted. Live box tests 5/5 as expected: 3 former boxes now
  run without one, 2 new rules box (`git -* merge *`, `*git *--output*`, the latter after
  the rtk rewrite). Not verified: `$(…)`, `env`/`xargs` and double-space matching; whether
  repeated auto-mode blocks turn into boxes. Cross-checks (Opus): plan v1 · CHANGE · 6
  fixes taken · 51.3k tokens; final · keep after 5 fixes · 46.3k tokens.
- **Setup audit, Session 2 — clearer and shorter, no rule lost** — 29-10-2026, each piece
  approved by Amit. Findings and their outcome: `baselines/audit-29-10-2026.md`. Results
  against the success measure: (1) rules weakened, judged rule by rule against `e996dc9`:
  0 apart from C1, which Amit accepted (permission explanations for risky boxes only);
  (2) A1–A5 and A8 fixed, A6, A7 and A9 deferred to project sessions; (3) every file path
  in the live docs exists (18/18), `§` pointers checked 30-10-2026 (2 broken and 1 loose fixed); (4) dates: 0 non-DD-MM-YYYY
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
  FinNode edit complete, committed with FinNode PR #6** (`234517a`). Cross-check 29-10-2026 · Opus · CHANGE · all points
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
  `drift.sh` before and after: the same 6 drifts. **Proven 30-10-2026:** the check runs after
  `/clear` — a controlled test with a temporary known drift; method and result in
  `baselines/global-open-tests.md`, item 13.
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

- **Live project settings edits from S4** — complete and matching their mirrors
  (30-10-2026). No commit is pending. Voice-Flow `.claude/settings.json` went in with
  Voice-Flow PR #82 (`c09f206`, merged `a09ce14`). FinNode's `CLAUDE.md` and
  `.claude/settings.json` went in with FinNode PR #6 (`234517a`, merged `aec7df5`).
  Gitignored, so nothing to commit there: FinNode, Voice-Flow and vthrudebugger_v1
  `.claude/settings.local.json`; Debugger v2 `.claude/settings.json`. Exact paths:
  `baselines/s4-permissions-30-10-2026.md`.
- **Parked / detached, not active — Packbly Web, Voice Flow v1 (and Packbly v2):**
  detached from Claude Setup on 30-10-2026. Packbly folders and data remain local; the
  Voice Flow_v1 folder was deleted by Amit, confirmed absent 31-10-2026. Removed from
  `PROJECTS.md` and `project-rules/manifest.tsv`; mirror copies deleted (in git history).
  Pointers, not current work: Packbly Web's S5 app-security findings —
  `baselines/project-handoffs-29-10-2026.md` § *Packbly Web*, which of S5a–c are its own
  to be asked of Amit. S4 settings edits: live in Packbly_web `.claude/settings.local.json`,
  gitignored there, so no commit is pending; Voice Flow_v1's went with its folder.
- **Known, accepted, not planned (30-10-2026, value bar):** T1 wrapped commands
  (`$(…)`, `env`/`xargs`, double spaces); T2 auto-mode blocks turning into boxes; T3
  `git remote -v add`; F1 `git -c` alias bypass; F3 more `.env`/`~/.ssh` read denies
  (widened by audit C1 and **mostly fixed 01-11-2026**, D44 — remaining limits in
  `ENVIRONMENT.md` § 3); F4 `git stash pop/apply` outside `~/.claude`; F6 one-line box
  explanations.
- **Known, accepted:** GitHub write commands are not separately boxed; 0 historical uses;
  auto mode provides secondary protection. (F2, 30-10-2026. If asked for later, propose
  only `gh release create|delete`, `gh secret set|delete` and `gh workflow run`.)
- **Corrected 01-11-2026 (audit C3):** the 30-10-2026 line here said `git add` runs with
  no box because no rule matches it. In fact rtk's hook returned "allow" for it, taken from
  `Bash(git add *)` in both local settings files. Those rules are removed, and setup
  sessions now ask for `git add` and `git stage` (D44, `ENVIRONMENT.md` § 3). Projects are
  unchanged. The FinNode backlog 6 row itself waits for a FinNode session.
- **Audit 31-10-2026, Stage C — decisions recorded, not implemented (Amit, 01-11-2026):**
  - C8 · **accepted** — allowed test/build commands (`./gradlew *` and similar, 4
    projects) can run any code; a normal development trade-off.
  - C9 · **needs decision** — Claude Desktop bypass mode is available, not known to be
    used; Desktop settings unchanged.
  - C10 · **needs decision** — Claude Code telemetry and nonessential traffic not
    switched off; no change without approval.
  - C11 · **deferred** — account/org UUIDs and Amit's emails in `SETUP-PLAN.md`; must be
    handled before the repo goes public.
  - C12 · **deferred** — Voice-Flow bundle not unpacked, cloned, scanned or deleted.
  - C13 · **needs decision** — `RTK_HOOK_AUDIT=1` and rtk's logs kept as they are.
  - **Proposed `STANDARDS.md` changes from 31-10-2026, pending:** P1–P4 scale, summary
    first, pushback rule. Not added while they would raise always-loaded tokens.
- **Audit findings deferred to project sessions** — A6, A7, A9, B7, B8, E5, E6, E8, F6
  (FinNode, Debugger files); S5a–c (Emp Portal app fixes; Packbly's share is
  parked with Packbly, above). S4 is
  done (*Completed*). Detail: `baselines/audit-29-10-2026.md`.
  Handoff notes for each: `baselines/project-handoffs-29-10-2026.md`.

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

**Now:** S4, F5, F9 and D43 (backlog value bar) are complete and pushed (30-10-2026). Nothing in progress. As of 30-10-2026 nothing is broken. Voice-Flow's
`.claude/settings.json` went in with its PR #82, and FinNode's with its PR #6. Voice-Flow's audit item E3 is done. The session check is proven to run after `/clear` (open test 13). The setup is
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
