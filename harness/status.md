# Setup status

Purpose: The one current view of where the `~/.claude` setup stands. Pointers, not copies.
Audience: Claude and Amit.
Read when: Setup session start, for setup work (`.claude/CLAUDE.md`).
Owner: Setup sessions (changes are Amit's decision).
Update rule: Every changing setup plan. Overwrite; finished items move to a dated record. Commits, branches, push state and file counts are never recorded here — read them from git.
Related: `harness/backlog.md` · `harness/overview.md` · `harness/doc-structure-plan.md` · `baselines/global-open-tests.md` · `SETUP-PLAN.md` (decisions)
Status: active
Last reviewed: 27-11-2026

---

**Last verified:** 27-11-2026

## Current phase

**Phase 15 — Skills and hooks: session 1 started 27-11-2026 (D58).** Plan: `harness/doc-structure-plan.md` § 3 *Phase 15 plan* (`plan-reviewer` Opus, concerns, all findings applied; approved 27-11-2026, Amit). S1.0 done 27-11-2026: plan moved, D58 written, backlog B48–B62 added.

**Phase 14 — Sub-agents: complete 27-11-2026 (D57).** `harness/doc-structure-plan.md` § 3 *Phase 14 plan*: rewrite `change-reviewer` from try 2, `plan-reviewer` fixes (B41), project facts-file path (I1), close B24; I2–I8 not built now. Cross-check result and Amit's decisions are in the plan. B43 logged. **WP1 built 27-11-2026:** both agents, `cross-check.md`, `WRITING-GUIDE.md`, `templates/agent.md`, test packets in `harness/drafts/phase14/`, key in `harness/drafts/phase14-key.md`. Checks: `tools:` lines unchanged; descriptions 36 → 36 and 68 → 66 words; one `## Example` and one `Example:` line each; no pronoun for Amit; `doc-check.sh` same 4 warnings. Review: `change-reviewer` Opus, **concerns**, 6 findings; 635 words, retried once, 372 (pass); 51,249 measured including the retry. All 6 applied on Amit's approval; checks re-run (descriptions 36 and 66 words; `doc-check.sh` same 4 warnings). B44 logged (scratch files deleted without approval). **WP1 done.** Plan total corrected to about 185–230K (Amit, 27-11-2026). `plan-reviewer`'s three extra sections: open for Amit at WP3. **WP2 run 27-11-2026: P1 pass, P2 fail, P3 pass** (each retried once for shape). P2 gave `concerns` for a missing-test finding the key expects as clean; root-cause fix to `agents/change-reviewer.md` (missing-check bar, Nits alone give `no concerns`) applied on Amit's approval; description 36 words, `doc-check.sh` same 4 warnings. B45 logged. Result: plan § 3 *Phase 14 plan* → WP2. **P2 re-run 27-11-2026 (fresh session, Sonnet): pass**: `no concerns`, two true Nits, no planted defect reported; 214 words, retried once for shape, 94. Second B45 case: "Facts checked" claims `RULES.md`, `report.py` and `test_hours.py` were read, but the transcript shows they were never opened; the wrong `report.py:58` is a diff line number (the file has 23 lines). P2 pass stands (Amit); B45 open. **WP2 passed.** Wording clarification 27-11-2026 (Amit-approved): `agents/change-reviewer.md` § *Report* adds "Delete unused numbered lines too."; description unchanged (34 words of text, 36 with the `description: >` key); `doc-check.sh` same 4 warnings; not re-tested. Measure 3: agents load 240 tokens (`/context`, fresh session 27-11-2026), under the 0.26k cap. **WP3 done 27-11-2026:** D57 recorded; B24, B41, B42, B43 closed; B39 open for its Phase 16 file; B46 added; Phase 14 checklist ticked; `plan-reviewer`'s three extra sections allowed (Amit). **Phase 14 complete 27-11-2026.**

**Phase 13 — Planning: closed 26-11-2026** (D56 closed). Planning skill and six guides rewritten in the new style; new seventh kind, research or business (`research-business.md`); review sizes in `harness/cross-check.md` § *Review sizes*; "money" defined in `STANDARDS.md`. Closing session (fresh, 26-11-2026): `/context` observed about 10.61k (not a gate, Amit); routing test (printers) passed; B37 closed by a new root-cause rule — the requesting session checks a `plan-reviewer` report with `wc -w` and its skeleton and sends it back once (`harness/cross-check.md` § *The reviewer*); re-test 7 passed after one retry each (T7 201/300, T1 343/500). `change-reviewer` (Opus) on that rule: concerns, 4 findings — 1–3 fixed on Amit's approval 26-11-2026 ("The reviewer must not…"; 300/500 is the limit for this check; working copy in `harness/drafts/` or a project's git-ignored scratch path, not a record), 4 (minor duplication) accepted; `doc-check.sh` same 4 warnings. Six reviewer issues recorded for Phase 14, not fixed: B41 (`plan-reviewer`: "he" ×2, "say so" with no slot, "blocks approval") and B42 (`change-reviewer`: no skeleton or length check, no example line, `cross-check.md` list mismatch). Detail: `harness/doc-structure-plan.md` § 3 *Phase 13 plan* → *Closing session*.

**Phases 12–21 — expert rewrite programme: agreed 26-11-2026 (Amit, D54).** Brief, phase list, Phase 12 plan, kit findings and the *Programme checklist* (tick boxes for every point, archived when all are done): `harness/doc-structure-plan.md` § 3 *Phases 12–21*. Phase 10 closed at WP3b; Phase 11 merged in. **Phase 12 (26-11-2026):** checklist reviewed with Amit and 6 gaps added; every-session load baseline recorded (our part 10.7k, final check 5); plan revised after a `plan-reviewer` cross-check (Opus, concerns, 9 findings, all taken in, 44,487 measured); **WP0 kit inventory done and approved** (79 files: 2 take, 36 adapt, 41 skip; 52,015 measured). **WP1** `WRITING-GUIDE.md` and 5 templates written; clashes decided by Amit. **WP2** blind test: gate no on try 1, yes on try 2. **WP3** `change-reviewer` Opus, concerns, 6 findings (40,000 measured): 2–6 fixed in two rounds, 1 (map rows) done in WP4. **WP4** D55 recorded (`SETUP-PLAN.md`; full list in the plan's § *Phase 12 decisions and rule changes (D55)*), map rows added. Measure (3): missed by about 0.05k (10.75k against 10.7k). Cause: two memory-index lines added on Amit's request during Phase 12; no Phase 12 file loads every session. Accepted by Amit. **Phase 12 closed 26-11-2026**; its last checklist item ("copy the kit and reshape it into our style") recorded 26-11-2026.

**Phase 10 — clean-up and rewrite: plan approved 25-11-2026 (Amit); closed at WP3b 26-11-2026 (D54).** Plan, gates and work packages: `harness/doc-structure-plan.md` § 3 *Phase 10*. **Phase 10 WP1 committed 0085d31 and pushed 25-11-2026:** baseline and inventory in `baselines/phase10-wp1-25-11-2026.md` (163 tracked files, 46 memory notes; keep 86 · ask 70 · remove 7); Amit's decisions in the plan's *Item dispositions*; new `harness/project-cleanup-list.md`. Phase 10 WP2a committed 56c9fbd and pushed 25-11-2026. Phase 10 WP2b (Packbly) committed a3846d4 and pushed 25-11-2026. Phase 10 WP3 design approved 25-11-2026 (D53), written into the plan's *WP3 design*. Phase 10 WP3 committed 1e352eb and pushed 25-11-2026. Phase 10 WP3b (link check) committed 2f40fd8 and pushed 25-11-2026. Phase 10 WP3b part 2 committed f4513c0 and pushed 25-11-2026 (see *Next gate*). Cross-checks 25-11-2026: `plan-reviewer`, Opus, round 1 concerns (9 findings, 48.9k measured), round 2 concerns (8 findings, 23.8k measured); all taken into the plan with Amit's approval.

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
| — | `plan-reviewer` rewritten in a teaching style (Amit, 26-11-2026): why-this-exists with a real case, five lenses incl. deferrals, outcome tags, 500-word default (Phase 10). `change-reviewer` Sonnet: concerns, 3 fixes applied (22,584 measured); `change-reviewer` stays at 400 words. First fresh-session R4 (26-11-2026): gap named but ranked second, verdict concerns, about 600 words (B37); cause: `blocked` rule clashed with the success-measure check. Fixed (Amit, 26-11-2026): `blocked` = could not review; a missing, unclear or weak measure is finding 1 with `concerns`; two rewraps. R4 re-test, fresh session (26-11-2026): **passed** — missing measure is finding 1, verdict `concerns`, no "approved", deferrals (2) and outcome tags present; about 550 words by eye, not counted (B37); token cost not measured; one non-finding listed as finding 4 without a tag | [x] tested, committed `5645c5f`, pushed 26-11-2026 (Amit) | None — next work is Phase 12 (D54) | `agents/plan-reviewer.md` |
| B45, B46 | Reviewers claimed files they never opened: *Files opened* slot, `diff:<n>` rule, requester log check (built 27-11-2026) | [x] tested 27-11-2026: P1, P2, P3 pass after one retry each; every *Files opened* entry in its log; B45, B46 closed; committed `8ad4fd0`, pushed 27-11-2026 | None | `harness/doc-structure-plan.md` § 3 *B45 fix* → *Test result* |

## Open

| ID | Item | Decision | Link |
|---|---|---|---|
| B21, B14, B9, B11 | Rest of the old wave 3: B21, B14, B9, then B11 | Planned and approved 06-11-2026; not started; now in Phase 11 (D50) | `harness/backlog.md` |
| — | `project-rules/FinNode/CLAUDE.md` mirrors FinNode's `phase3/sms` branch, not `main` (14-11-2026) | Copy again after `phase3/sms` reaches `main` | *Current phase* above |
| C11 | Account/org UUIDs and Amit's emails in `SETUP-PLAN.md` | Deferred; must be handled before the repo goes public. Also check then (no change now): `baselines/task-history-11-11-2026.md`, tracked since T15, holds project paths, the backup-folder path, the ccusage cost figure, and gitleaks counts with the folder where hits were found | `baselines/status-completed-11-11-2026.md` § *Open* |
| C13 | Whether the rtk hook-audit log stops growing | Left for now (Amit) | same record |
| A6, A7, A9 | Audit contradictions in project files (29-10-2026) | Wait for those projects' sessions | same record § *Known contradictions* |
| — | VT: never run `sync.sh --pull` for VT. Only the sanitized `CLAUDE.md` is backed up. If a VT session creates `.claude/settings.local.json`, drift.sh may report "NO COPY YET"; that is expected. Do not back up settings files for VT (16-11-2026) | Standing rule | *Current phase* above |
| — | Voice-Flow and Emp portal `CLAUDE.md` drifted from their copies (session check, 26-11-2026) | Fix inside those projects' own sessions (Amit, 26-11-2026) | `project-rules/drift.sh` |
| — | `ENVIRONMENT.md` 390 lines, over 300 (`doc-check.sh`) | Wait for the later rewrite phase, likely Phase 17 (Amit, 26-11-2026) | `harness/doc-structure-plan.md` § 3 *Phases 12–21* |
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
rules in `STANDARDS.md`. This harness: D33. Newest: D58 (27-11-2026, Phase 15 skills and hooks: 26 verdicts; open). D57 (27-11-2026, Phase 14 sub-agents: reviewers rewritten and fixed, I1 facts-file path, description-versus-body rule, I-decisions; WP2 passed; closed 27-11-2026 with Phase 14). D56 (26-11-2026, Phase 13 planning: seventh kind, review sizes, money defined; closed 26-11-2026 with Phase 13). D55 (26-11-2026, Phase 12 writing guide; `/context` miss accepted by Amit; closed 26-11-2026). D54 (26-11-2026, expert rewrite programme; open). D53 (25-11-2026, Phase 10 WP3 design; approved; open until WP5–WP9 apply it). D52 (24-11-2026, Phase 9 design; approved; WP2 committed; reviewer agents committed, WP3 reviewer tests complete (R5 waived), committed; WP4 skills built, K1–K5 passed 25-11-2026, committed `37fc42b`; WP5 I1–I5 passed 25-11-2026; closed 25-11-2026, Amit). D51 (23-11-2026, planning system design; final plan approved 24-11-2026; switched on 24-11-2026; deferred checks passed in Phase 9 WP5; closed 25-11-2026, Amit); D50 clarified 23-11-2026.

## Next gate

Phase 15 session 1 (skills): S1.0 done 27-11-2026; next S1.1–S1.4, then commit on Amit's word and a handoff naming session 2 (hooks and permissions, fresh, Opus). Phase 14 and the B45 fix complete and pushed 27-11-2026. Phase 13 closed 26-11-2026. Still waiting from Phase 10: deleting `/tmp/wp3b2-scratch` needs Amit's separate message. Phase 10 detail: the plan's § 3 *Phase 10* results. Every commit and every push needs Amit's separate approval.

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
