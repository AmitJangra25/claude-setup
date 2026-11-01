# Setup status

The one current view of where the `~/.claude` setup stands. Pointers, not copies.
Commits, branches, push state and file counts are never recorded here — read them from
git. Updated by every changing setup plan (`.claude/CLAUDE.md`).

**Last verified:** 01-11-2026

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
  `baselines/stage-c-fix-report-01-11-2026.md`. Box tests, default-mode repeat and C6
  (PDF viewer verified off at the next session start) done; report approved by Amit;
  committed locally, not pushed (01-11-2026). Cross-checks (Opus): plan · change, 7 of 8
  taken · 70.5k tokens; changed rules · keep, 2 of 3 taken · 32.2k tokens.
- **Stage A+B fixes — done 01-11-2026, report accepted by Amit** (approved 01-11-2026):
  fact corrections, then structure and history moves, two local commits, not pushed.
  Fixed CL1–CL8, CL10, CL12, CL18 (with CL7), CB1, CB2; CL9 already met; no action on
  CL11, CL13, CL17, CB3, CB4; CL14–CL16 deferred with the `STANDARDS.md` pass (§ *Open*).
  Moves verbatim (`cmp`); always-loaded words 3,967 before and after. Tests:
  `baselines/doc-test-before-01-11-2026.md` and `doc-test-after-01-11-2026.md` — match,
  apart from the three allowed changes; G1 passed both times. Cross-checks (Opus): plan ·
  change, 10 taken, 2 rejected · 77.4k tokens; moves · change then keep, 4 of 4 taken ·
  78.3k tokens.
- **Nothing else in progress.** Waiting on Amit: push of the local commits; the
  decisions listed in § *Open*.

## Completed

Entries up to and including T6 moved unchanged to
`baselines/status-completed-11-10-2026.md` (11-10-2026), and entries from 11-10-2026 to
23-10-2026 to `baselines/status-completed-23-10-2026.md` (29-10-2026), and entries from
29-10-2026 to 31-10-2026 to `baselines/status-completed-01-11-2026.md` (01-11-2026), to
keep this file to the current state.

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
- **Audit 31-10-2026, Stage C — decisions (Amit, 01-11-2026):**
  - C8 · **accepted** — allowed test/build commands (`./gradlew *` and similar, 4
    projects) can run any code; a normal development trade-off.
  - C4 · **decided 01-11-2026, no change** — `gist` is a GitHub CLI minimum scope and
    cannot be removed; the D44 ask rules stay (D45).
  - C7 hook · **done 01-11-2026** — `pre-commit` secret check in `~/.claude` (D45).
  - C9 · **done 01-11-2026** — bypass mode disabled in Claude Code (D45). Waiting on
    Amit: switch off "Allow bypass permissions mode" in Claude Desktop's settings.
  - C10 · **done 01-11-2026** — error reports off; telemetry and updates stay on (D45).
  - C11 · **deferred** — account/org UUIDs and Amit's emails in `SETUP-PLAN.md`; must be
    handled before the repo goes public.
  - C12 · **deferred** — Voice-Flow bundle not unpacked, cloned, scanned or deleted.
  - C13 · **done 01-11-2026** — rtk hook-audit logging off from the next session; the
    6.7 MB log kept (D45). To confirm in a fresh session: the log no longer grows.
  - **Proposed `STANDARDS.md` changes from 31-10-2026, pending:** P1–P4 scale, summary
    first, pushback rule, and audit CL14–CL16 wording. Not added while they would raise
    always-loaded tokens; a separate pass, only with Amit's approval (01-11-2026).
- **Setup-session token target broken (01-11-2026), for a separate task:** the 11-10-2026
  target is 23k or less (`harness/overview.md`); Amit's fresh `/context all` on
  01-11-2026 read **25.5k** (`ENVIRONMENT.md` § *What every session loads*). Target not
  changed and cause not investigated in the Stage A+B pass (Amit, 01-11-2026).
- **Audit findings deferred to project sessions** — A6, A7, A9, B7, B8, E5, E6, E8, F6
  (FinNode, Debugger files); S5a–c (Emp Portal app fixes; Packbly's share is
  parked with Packbly, above). S4 is
  done (`baselines/status-completed-01-11-2026.md`). Detail: `baselines/audit-29-10-2026.md`.
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
