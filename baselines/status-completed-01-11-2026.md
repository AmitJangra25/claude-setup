# Setup status — Completed log, 29-10-2026 to 31-10-2026 — preserved record

Moved unchanged on 01-11-2026 from `harness/status.md` § *Completed*, the entries dated
29-10-2026 to 31-10-2026, to keep the current status short (Stage A+B fix pass, approved
by Amit 01-11-2026). Nothing below the rule has been edited; the dated CL5 correction in
the session-check entry was added 01-11-2026, before the move. Current status lives in
`harness/status.md`. Inside the copy, "this file" and section names such as § *Open*
mean the original `harness/status.md`.

---

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
  *Correction 01-11-2026 (audit CL5):* read "returned on 23-10-2026 when" as "was
  **observed** on 23-10-2026 **after**". That the "don't ask again" answer caused it is
  not proven (`baselines/global-open-tests.md`, item 2; `ENVIRONMENT.md` § 3).
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
