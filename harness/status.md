# Setup status

Purpose: The one current view of where the `~/.claude` setup stands. Pointers, not copies.
Audience: Claude and Amit.
Read when: Setup session start, for setup work (`.claude/CLAUDE.md`).
Owner: Setup sessions (changes are Amit's decision).
Update rule: Every changing setup plan. Overwrite; finished items move to a dated record. Commits, branches, push state and file counts are never recorded here — read them from git.
Related: `harness/backlog.md` · `harness/overview.md` · `harness/doc-structure-plan.md` · `baselines/global-open-tests.md` · `SETUP-PLAN.md` (decisions)
Status: active
Last reviewed: 14-11-2026

---

**Last verified:** 14-11-2026

## Current phase

Documentation structure: Phase 7 under way. **FinNode done** in its own session: PR #7
(Phase 7 docs commit `7d3b28e`, merge `959d7a7`) merged into `phase3/sms`, **not `main`**;
`phase3/sms` is 5 commits ahead of `main`, including the unaccepted Phase 3 WIP commit `aec8d49`.
FinNode's `CLAUDE.md` (with the project-map rule line, B16) is in that merge, so the old
"uncommitted rule line" item is closed. `project-rules/FinNode/CLAUDE.md` copied 14-11-2026
from FinNode's checked-out `phase3/sms` file (`cmp`-identical) — it mirrors `phase3/sms`, not
`main`. Next project: Emp Portal.

Phase 6 (Voice-Flow pilot) done in Voice-Flow's own session
(Voice-Flow PR #94, merged). Phase 6 follow-ups done 13-11-2026: `project-rules/Voice-Flow/CLAUDE.md`
copied from the merged source (`cmp`-identical); done-file rule settled (D49, B36).
Phase 5 (T21 `ENVIRONMENT.md`) done 12-11-2026 — built, all Go 2
checks passed, committed locally after Amit's review. `ENVIRONMENT.md` 396 lines, 7,680 words; old text in
`baselines/environment-old-12-11-2026.md`; results in `baselines/doc-test-after-12-11-2026-run2.md`.
Word limit now ≤ 7,690 (Amit, 12-11-2026): 7,300 was a Go 1 estimate (the private-store deny
rule blocked counting the draft); +54 for labelling 11 undated figures. `harness/doc-check.sh`
empty-section test now skips code blocks (Amit, 12-11-2026). Plan:
`harness/doc-structure-plan.md` § 3 *Phase 5 plan*. Phase 4 done 12-11-2026.

## In progress

| ID | Item | State | Next step | Link |
|---|---|---|---|---|
| B7, B16 | FinNode trials: write block, project map | [~] trial | Dates and review: the backlog rows | `harness/backlog.md` |

## Open

| ID | Item | Decision | Link |
|---|---|---|---|
| B21, B14, B9, B11 | Rest of the old wave 3: B21, B14, B9, then B11 | Planned and approved 06-11-2026; not started | `harness/backlog.md` |
| — | `project-rules/FinNode/CLAUDE.md` mirrors FinNode's `phase3/sms` branch, not `main` (14-11-2026) | Copy again after `phase3/sms` reaches `main` | *Current phase* above |
| C11 | Account/org UUIDs and Amit's emails in `SETUP-PLAN.md` | Deferred; must be handled before the repo goes public. Also check then (no change now): `baselines/task-history-11-11-2026.md`, tracked since T15, holds project paths, the backup-folder path, the ccusage cost figure, and gitleaks counts with the folder where hits were found | `baselines/status-completed-11-11-2026.md` § *Open* |
| C13 | Whether the rtk hook-audit log stops growing | Left for now (Amit) | same record |
| A6, A7, A9 | Audit contradictions in project files (29-10-2026) | Wait for those projects' sessions | same record § *Known contradictions* |
| — | Session-start drift: vthrudebugger_v1 `CLAUDE.md` differs from its `project-rules/` copy (Voice-Flow settled 13-11-2026) | Settled in its own session | `harness/doc-structure-plan.md` § 8 |
| — | The Phase 7 line in `harness/doc-structure-plan.md` § 3 *Phase 7* is superseded by the list in *Next gate* below (Amit, 13-11-2026); the plan stays as history | Use the *Next gate* list | this file |

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
rules in `STANDARDS.md`. This harness: D33. Newest: D49 (13-11-2026), closed 13-11-2026.

## Next gate

Phase 7, each project in its own fresh session, on Amit's word. **Next: Emp Portal.** Phase 7 projects:
FinNode (done 14-11-2026) · Emp Portal · vthrudebugger_v1 · AtWorkpe (AW). AtWorkpe is on GitHub only
(`github.com/AmitJangra25/AtWorkpe`) — clone it before its Phase 7 session. Removed
13-11-2026: Debugger v2 (Amit). No push without his word. The uncommitted Voice-Flow and vthrudebugger files stay
out of setup commits. The setup is finished when every line of `harness/overview.md` § *What
"finished" means* is true. Deferred until Amit asks: the account switch (TC6) and TC3's
replay.

## Older records

- `baselines/status-completed-11-10-2026.md` — entries up to and including the old finish-plan T6.
- `baselines/status-completed-23-10-2026.md` — entries 11-10-2026 to 23-10-2026.
- `baselines/status-completed-01-11-2026.md` — entries 29-10-2026 to 31-10-2026.
- `baselines/status-completed-11-11-2026.md` — the whole body before the 11-11-2026 reshape.
- `baselines/old-document-maps-11-11-2026.md` — the *Source of truth* table (D47).
- `baselines/task-history-11-11-2026.md` — the setup task file before T15 (handoffs 31-10-2026 to 11-11-2026).
