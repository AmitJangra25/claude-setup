# Setup status

Purpose: The one current view of where the `~/.claude` setup stands. Pointers, not copies.
Audience: Claude and Amit.
Read when: Setup session start, for setup work (`.claude/CLAUDE.md`).
Owner: Setup sessions (changes are Amit's decision).
Update rule: Every changing setup plan. Overwrite; finished items move to a dated record. Commits, branches, push state and file counts are never recorded here — read them from git.
Related: `harness/backlog.md` · `harness/overview.md` · `harness/doc-structure-plan.md` · `baselines/global-open-tests.md` · `SETUP-PLAN.md` (decisions)
Status: active
Last reviewed: 11-11-2026

---

**Last verified:** 11-11-2026

## Current phase

Documentation structure — Phase 2, Pass 2A committed locally as 4f468e6; not pushed.
**Phase 2, Pass 2B (T10–T14) built 11-11-2026 (Opus), awaiting Amit's review.** Goal, tasks, formats and
the Pass 2B plan: `harness/doc-structure-plan.md`.

## In progress

| ID | Item | State | Next step | Link |
|---|---|---|---|---|
| T10–T14 | Phase 2, Pass 2B: `PROJECTS.md`, `REPOS.md`, open tests, two READMEs, records | [~] built 11-11-2026; format check clean; Sonnet check: no real problems | Amit reviews; then a setup-only commit | `harness/doc-structure-plan.md` § 3 *Pass 2B plan* |
| B7, B16 | FinNode trials: write block, project map | [~] trial | Dates and review: the backlog rows | `harness/backlog.md` |

## Open

| ID | Item | Decision | Link |
|---|---|---|---|
| B21, B14, B9, B11 | Rest of the old wave 3: B21, B14, B9, then B11 | Planned and approved 06-11-2026; not started | `harness/backlog.md` |
| C11 | Account/org UUIDs and Amit's emails in `SETUP-PLAN.md` | Deferred; must be handled before the repo goes public | `baselines/status-completed-11-11-2026.md` § *Open* |
| C13 | Whether the rtk hook-audit log stops growing | Left for now (Amit) | same record |
| A6, A7, A9 | Audit contradictions in project files (29-10-2026) | Wait for those projects' sessions | same record § *Known contradictions* |
| — | Session-start drift: Voice-Flow and vthrudebugger_v1 `CLAUDE.md` differ from their `project-rules/` copies | Settled in each project's own session | `harness/doc-structure-plan.md` § 8 |

Known and accepted items: `harness/backlog.md` § *Known and accepted*. Open setup tests: `baselines/global-open-tests.md`.

## Blocked

None yet

## Known contradictions

- `STANDARDS.md` § *How a task runs* says decisions are recorded in the roadmap; the
  `roadmap.md` template moves them to `DECISIONS.md`. Resolve in T20.
- `templates/deferred-improvements.md` § *In full* has a "Next step" field;
  `DOCUMENTATION-STANDARD.md` § *Structure per file* lists only Found in · Decision ·
  Detail.

## Decisions in force

The D-rows in `SETUP-PLAN.md` (index at its top; moves to `DECISIONS.md` in T30) and the
rules in `STANDARDS.md`. This harness: D33.

## Next gate

Amit reviews Phase 2, Pass 2B (T10–T14, built 11-11-2026), then approves a setup-only
commit. After that: T15. Phase 2 is pushed
as a whole when it ends (Amit). The uncommitted Voice-Flow and vthrudebugger files stay
out of setup commits. The setup is finished when every line of `harness/overview.md` § *What
"finished" means* is true. Deferred until Amit asks: the account switch (TC6) and TC3's
replay.

## Older records

- `baselines/status-completed-11-10-2026.md` — entries up to and including the old finish-plan T6.
- `baselines/status-completed-23-10-2026.md` — entries 11-10-2026 to 23-10-2026.
- `baselines/status-completed-01-11-2026.md` — entries 29-10-2026 to 31-10-2026.
- `baselines/status-completed-11-11-2026.md` — the whole body before the 11-11-2026 reshape.
- `baselines/old-document-maps-11-11-2026.md` — the *Source of truth* table (D47).
