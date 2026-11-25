# Setup status

Purpose: The one current view of where the `~/.claude` setup stands. Pointers, not copies.
Audience: Claude and Amit.
Read when: Setup session start, for setup work (`.claude/CLAUDE.md`).
Owner: Setup sessions (changes are Amit's decision).
Update rule: Every changing setup plan. Overwrite; finished items move to a dated record. Commits, branches, push state and file counts are never recorded here — read them from git.
Related: `harness/backlog.md` · `harness/overview.md` · `harness/doc-structure-plan.md` · `baselines/global-open-tests.md` · `SETUP-PLAN.md` (decisions)
Status: active
Last reviewed: 24-11-2026

---

**Last verified:** 24-11-2026

## Current phase

**Phase 10 — clean-up and rewrite: plan approved 25-11-2026 (Amit).** Plan, gates and work packages: `harness/doc-structure-plan.md` § 3 *Phase 10*. **Phase 10 WP1 committed 0085d31 and pushed 25-11-2026:** baseline and inventory in `baselines/phase10-wp1-25-11-2026.md` (163 tracked files, 46 memory notes; keep 86 · ask 70 · remove 7); Amit's decisions in the plan's *Item dispositions*; new `harness/project-cleanup-list.md`. Phase 10 WP2a committed 56c9fbd and pushed 25-11-2026. Phase 10 WP2b (Packbly) committed a3846d4 and pushed 25-11-2026 (see *Next gate*). Cross-checks 25-11-2026: `plan-reviewer`, Opus, round 1 concerns (9 findings, 48.9k measured), round 2 concerns (8 findings, 23.8k measured); all taken into the plan with Amit's approval.

**Phase 8 — planning system (D51) — complete 25-11-2026 (Amit); its deferred checks passed in Phase 9 WP5.** Design saved 23-11-2026 (WP1); final plan approved 24-11-2026; WP2 done 24-11-2026 — drafts kept inactive in a git-ignored staging folder (deleted 24-11-2026), paper run of all 12 routing scenarios passed; WP3 done 24-11-2026 — skill live in `skills/planning/`, core rules kept in `STANDARDS.md` (Amit), two cross-check rounds closed (`a80a494`); WP4 results recorded 24-11-2026: `harness/doc-structure-plan.md` § 3 *Phase 8* → *Acceptance result (WP4)*. Order: 8
planning → 9 reviewer agents and skills → 10 clean-up and rewrite (absorbs old Phase 8 T30–T33) → 11
further checks. Full plan, Q1–Q8 status and sources: `harness/doc-structure-plan.md` § 3 *Phase 8*.
Research notes: `harness/planning-research.md` (temporary, git-ignored; deletion needs Amit's separate approval).

Documentation structure: Phase 7 complete (16-11-2026). **FinNode done** in its own session: PR #7
(Phase 7 docs commit `7d3b28e`, merge `959d7a7`) merged into `phase3/sms`, **not `main`**;
`phase3/sms` is 5 commits ahead of `main`, including the unaccepted Phase 3 WIP commit `aec8d49`.
FinNode's `CLAUDE.md` (with the project-map rule line, B16) is in that merge, so the old
"uncommitted rule line" item is closed. `project-rules/FinNode/CLAUDE.md` copied 14-11-2026
from FinNode's checked-out `phase3/sms` file (`cmp`-identical) — it mirrors `phase3/sms`, not
`main`. **AtWorkpe done** in its own session: PR #1 (docs commit `7a0d8e4`, merge `a0a9641`)
merged into **`main`**; `project-rules/AtWorkpe/CLAUDE.md` copied 16-11-2026 from `main` at
`c151e44` (includes PR #3), `cmp`-identical. **Emp Portal done** in its own session: PR #14
(merge `6e93913`) and PR #15 (merge `6d05bc6`) merged into **`main`**. Its local folder is still
on `fix/dead-code-cleanup-and-test-fix`, so `project-rules/Emp portal/CLAUDE.md` was copied
16-11-2026 from GitHub `main` (`6d05bc6`, read with `git show`), not from the folder;
`cmp`-identical. **vthrudebugger_v1 done** in its own session: PR #11 (merge `03b949e`) and
PR #12 (merge `db38534`) merged into **`main`**; `project-rules/vthrudebugger_v1/CLAUDE.md`
resynced 16-11-2026 from the local folder on `main` at `db38534` (clean, level with GitHub),
`cmp`-identical. **Phase 7 complete** for FinNode, AtWorkpe, Emp Portal and vthrudebugger_v1.
**VT (Vthru Customer app, folder `mobile`) local-only Claude setup complete** (16-11-2026) in
its own session. It has no GitHub repository; its repo is the company GitLab, and nothing goes
there — Claude files are hidden with `.git/info/exclude`. Only the sanitized `CLAUDE.md` is
backed up (`project-rules/VT/`, `cmp`-identical, backup scan clean).
Next: Phase 10 (clean-up and rewrite), on Amit's word.

Phase 6 (Voice-Flow pilot) done in Voice-Flow's own session
(Voice-Flow PR #94, merged). Phase 6 follow-ups done 13-11-2026: `project-rules/Voice-Flow/CLAUDE.md`
copied from the merged source (`cmp`-identical); done-file rule settled (D49, B36).
Phase 5 (T21 `ENVIRONMENT.md`) done 12-11-2026 — built, all Go 2
checks passed, committed locally after Amit's review. `ENVIRONMENT.md` 396 lines, 7,680 words; old text in
`baselines/environment-old-12-11-2026.md`; results in `baselines/doc-test-after-12-11-2026-run2.md`.
Word limit now ≤ 7,720 (Amit, 16-11-2026: +30 so the AtWorkpe and Vthru Customer app entries
keep their safety facts; was ≤ 7,690 from 12-11-2026). Measured 16-11-2026: 398 lines, 7,711 words. `harness/doc-check.sh`
empty-section test now skips code blocks (Amit, 12-11-2026). Plan:
`harness/doc-structure-plan.md` § 3 *Phase 5 plan*. Phase 4 done 12-11-2026.

## In progress

| ID | Item | State | Next step | Link |
|---|---|---|---|---|
| B7, B16 | FinNode trials: write block, project map | [~] trial | Dates and review: the backlog rows | `harness/backlog.md` |

## Open

| ID | Item | Decision | Link |
|---|---|---|---|
| B21, B14, B9, B11 | Rest of the old wave 3: B21, B14, B9, then B11 | Planned and approved 06-11-2026; not started; now in Phase 11 (D50) | `harness/backlog.md` |
| — | `project-rules/FinNode/CLAUDE.md` mirrors FinNode's `phase3/sms` branch, not `main` (14-11-2026) | Copy again after `phase3/sms` reaches `main` | *Current phase* above |
| C11 | Account/org UUIDs and Amit's emails in `SETUP-PLAN.md` | Deferred; must be handled before the repo goes public. Also check then (no change now): `baselines/task-history-11-11-2026.md`, tracked since T15, holds project paths, the backup-folder path, the ccusage cost figure, and gitleaks counts with the folder where hits were found | `baselines/status-completed-11-11-2026.md` § *Open* |
| C13 | Whether the rtk hook-audit log stops growing | Left for now (Amit) | same record |
| A6, A7, A9 | Audit contradictions in project files (29-10-2026) | Wait for those projects' sessions | same record § *Known contradictions* |
| — | VT: never run `sync.sh --pull` for VT. Only the sanitized `CLAUDE.md` is backed up. If a VT session creates `.claude/settings.local.json`, drift.sh may report "NO COPY YET"; that is expected. Do not back up settings files for VT (16-11-2026) | Standing rule | *Current phase* above |
| — | Emp Portal `CLAUDE.md` shows as drifted: the copy is GitHub `main`, the local folder is on the old fix branch (16-11-2026) | Expected until the local folder is on `main`; until then do not run `sync.sh --pull` for Emp Portal (it would copy the old file back) | *Current phase* above |

Known and accepted items: `harness/backlog.md` § *Known and accepted*. Open setup tests: `baselines/global-open-tests.md`.

## Blocked

None yet

## Known contradictions

- Closed 12-11-2026: roadmap vs `DECISIONS.md` — the new `STANDARDS.md` § *How a task runs*
  step 8 records decisions in `DECISIONS.md` (Setup's in `SETUP-PLAN.md` until T30); all Go 2
  checks passed.
- Memory note `skill-overrides-name-only.md:40` cites `ENVIRONMENT.md` § *3. Permissions — what
  stops and asks*; after T21 the heading is § *3. Permissions*. Memory is out of Phase 5 scope.
- `templates/deferred-improvements.md` § *In full* has a "Next step" field;
  `DOCUMENTATION-STANDARD.md` § *Structure per file* lists only Found in · Decision ·
  Detail.

## Decisions in force

The D-rows in `SETUP-PLAN.md` (index at its top; moves to `DECISIONS.md` in T30) and the
rules in `STANDARDS.md`. This harness: D33. Newest: D52 (24-11-2026, Phase 9 design; approved; WP2 committed; reviewer agents committed, WP3 reviewer tests complete (R5 waived), committed; WP4 skills built, K1–K5 passed 25-11-2026, committed `37fc42b`; WP5 I1–I5 passed 25-11-2026; closed 25-11-2026, Amit). D51 (23-11-2026, planning system design; final plan approved 24-11-2026; switched on 24-11-2026; deferred checks passed in Phase 9 WP5; closed 25-11-2026, Amit); D50 clarified 23-11-2026.

## Next gate

Phase 10 WP2 split into WP2a and WP2b (Amit, 25-11-2026). WP2a (rule fixes and project-data wording) applied 25-11-2026. Phase 10 WP2a committed 56c9fbd and pushed 25-11-2026. Reviews and results in the plan's *WP2a result* (`plan-reviewer` 1 round, `change-reviewer` 2 rounds, all findings decided by Amit). Routing tests 2, 7, 8 passed 25-11-2026 in a fresh session (self-reported, checked against the saved pass criteria): test 2 small approved change, no planning files, no trigger · tests 7 and 8 bug fix, light, `SKILL.md` + `bug-fix.md`, deep only if the cause remains unknown after a first look · test 7 no UI check · test 8 UI check at about 360px. Packbly lock dropped (Amit, 25-11-2026); the existing deny rules stay. Phase 10 WP2b committed a3846d4 and pushed 25-11-2026: Packbly removed from active setup docs; one line kept (`PROJECTS.md:12`); `ENVIRONMENT.md:145` kept (live deny rules); the existing Packbly deny rules in `settings.json` remain; Emp Portal and sensitive-data lines point to `PROJECTS.md` § *Project data*. Packbly search: only those two kept lines. Emp Portal search: no real-data claim left. `doc-check.sh`: 1 warning, none new. `change-reviewer` Opus: no concerns, 3 low findings (24,440 measured) — 1 applied, 2 skipped, 3 accepted (Amit). Detail: the plan's *WP2b result*. Next: WP3, on Amit's word. Every commit and every push needs Amit's separate approval.

Earlier: **Phase 9 complete 25-11-2026 (Amit). WP5 tests passed 25-11-2026: I1 (ten routing tests, all routing passed), I2 (recovery in a local copy), I3 (loading; Phase 8 share estimated, accepted by Amit) and I5 (scripts, no new warning) and I4 (restart, fresh session) passed and recorded in `harness/doc-structure-plan.md` § 3 *Phase 9* → *Integration test result (WP5)*. Separately, Amit marked Phase 8 and Phase 9 complete 25-11-2026; D51 and D52 closed. Bug tests 7–8 depth accepted as-is; trigger wording reviewed in Phase 10 (Amit). The recovery copy was deleted on 25-11-2026 after the WP5 recovery test passed and the records were pushed (Amit; two-method target check). Earlier: Phase 9 WP4 complete 25-11-2026, committed `37fc42b`: skill tests K1–K5 passed (K3 with an approved substitution: fresh helper instead of a fresh main session; K2 with Amit's PR-state clarification; K1 menu check confirmed by Amit). Detail: `harness/doc-structure-plan.md` § 3 *Phase 9* → *Skill test result*. Test helpers 24,320 (K3) and 36,794 (documents) measured; main session not measured. Skills created 24-11-2026 — `skills/handoff/` · `skills/send-for-review/` (`disable-model-invocation: true`; overlap with built-in `ship-local` reported, Amit kept `send-for-review`) · `skills/documents/`; no `allowed-tools`. Migration: `.gitignore` (six named lines) · `STANDARDS.md` step 9 and § *Git* (one pointer each; gate sentences unchanged) · `DOCUMENT-MAP.md` § *Not documents* row. `harness/cross-check.md` and `.claude/CLAUDE.md` unchanged (Amit). `doc-check.sh`: same 2 warnings, none new. Docs check helper 22,108 measured. WP4 cross-check 24-11-2026: `change-reviewer`, Sonnet, verdict concerns, 2 low findings (a `documents` pointer named the wrong section; `send-for-review` ignored project branching rules such as `~/.claude`), both fixed with Amit's approval, no second round; 33,185 measured. WP3 complete and committed: agents `34a5e9f`, test results `cbd7307` (R1–R4, R6–R8 passed; R5 waived). WP2 committed (`8f98442`).** Plan: `harness/doc-structure-plan.md` § 3 *Phase 9* (D52; cross-check 24-11-2026: Opus, verdict concerns, 10 findings, 56K measured — all closed). Phase 8 WP4 recorded 24-11-2026: acceptance partly verified; named checks deferred to Phase 9's final integration package (`harness/doc-structure-plan.md` § 3 *Phase 8* → *Acceptance result (WP4)*). WP3 done 24-11-2026: activation list applied; skill discovered; pointers resolve; "step 4" still means Approve; `ENVIRONMENT.md` 7,716 words; `doc-check.sh` no new warnings; Sonnet cross-check, two rounds (63K measured), all findings closed or decided by Amit. Amit's decisions: "tell Amit first" lives in `STANDARDS.md` step 3; testing = checks that matter plus major tests; a wording fix that keeps the meaning is no risk trigger, *Never* list still applies. Committed (`a80a494`); the WP2 staging folder deleted 24-11-2026 (Amit). Waiting on Amit: deleting `harness/planning-research.md` (sources kept first, WP4). The final Phase 8 plan
was approved 24-11-2026 (retry rule; routing tests in fresh sessions; optional draft commits;
Q1, Q4, Q6, Q8) — `harness/doc-structure-plan.md` § 3 *Phase 8*. The `SETUP-PLAN.md` split (T30–T33) moved into Phase 10 (D50). Phase 7 is complete:
FinNode (done 14-11-2026) · AtWorkpe (done 16-11-2026) · Emp Portal (done 16-11-2026) · vthrudebugger_v1 (done 16-11-2026); VT local-only setup done 16-11-2026. Removed
13-11-2026: Debugger v2 (Amit). No push without his word. Project memory notes go in their own
commit, after a check that each moved note left a pointer (done 14-11-2026, `2960c9d`). The setup is finished when every line of `harness/overview.md` § *What
"finished" means* is true. Deferred until Amit asks: the account switch (TC6) and TC3's
replay.

## Older records

- `baselines/status-completed-11-10-2026.md` — entries up to and including the old finish-plan T6.
- `baselines/status-completed-23-10-2026.md` — entries 11-10-2026 to 23-10-2026.
- `baselines/status-completed-01-11-2026.md` — entries 29-10-2026 to 31-10-2026.
- `baselines/status-completed-11-11-2026.md` — the whole body before the 11-11-2026 reshape.
- `baselines/old-document-maps-11-11-2026.md` — the *Source of truth* table (D47).
- `baselines/task-history-11-11-2026.md` — the setup task file before T15 (handoffs 31-10-2026 to 11-11-2026).
