# Setup status

The one current view of where the `~/.claude` setup stands. Pointers, not copies.
Commits, branches, push state and file counts are never recorded here — read them from
git. Updated by every changing setup plan (`.claude/CLAUDE.md`).

**Last verified:** 05-11-2026

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
- **Token pass, 01-11-2026 (A, B, H approved by Amit):** `STANDARDS.md` *Which model*
  shortened (full text moved to `harness/models.md`) and *Stay on the task* merged;
  `RTK.md` shortened (name note moved to `ENVIRONMENT.md` § 1). Always-loaded words
  4,192 → 3,851; starting count expected ~24.8k, not yet measured. Sonnet line-by-line
  check (28.5k tokens): no rule lost. K (unused skills off) left to Amit in `/skills`.
  "Never shorten for its own sake" reworded as a caution, not a standing rule.
- **Skills, 01-11-2026:** claude-api, plugin-authoring, ollama set to name-only in
  `settings.json` (`3fa82b8`); verified by Amit's fresh `/context all`: skills 261 tokens,
  total 24.8k.
- **`STANDARDS.md` pass, 01-11-2026 (Plan 2, approved by Amit):** P1–P4 scale (also
  `templates/deferred-improvements.md`); priority, size and tokens for planned work;
  skipped decided work listed; summary first; pushback rule; CL14–CL16 wording; denial
  rule — one explained retry after a first No with no reason, second No or a reasoned No
  final, auto-mode or rule blocks not retried. Opus cross-check (24.1k tokens): change —
  all 5 fixes taken.
- **Model rules, 01-11-2026 (approved by Amit):** Haiku for tiny single-step tasks only;
  compare helper or `/model` switch cost before switching; smaller model hands back with
  "Part complete. Switch back to Opus with /model." (replaced 05-11-2026 by the 27k test,
  wave 1 item 1); plan to fit ~250K, finish if 80%+ done. `STANDARDS.md` and
  `harness/models.md`.
- **Improvements backlog, 05-11-2026:** Stage 1 checks done (C1–C8, C9 closed); agreed
  list with priority, size and tokens in `harness/backlog.md`. Wave 1 plan approved by
  Amit 05-11-2026 (`.claude/current-task.md`). **Session A done 05-11-2026:** items 1, 2,
  5, 19 and two moves (Claude Setup cross-check → `harness/cross-check.md`; rtk dry-run
  note → `ENVIRONMENT.md` § 1). The § *Git* "goes public" move dropped (Amit): the
  `project-rules/README.md` pointer would loop. Always-loaded words (`STANDARDS.md` +
  `RTK.md`) 3,572 → 3,529. Cross-check (Opus, 47.2k measured): change — B1–B3 and B5
  wording taken; summaries-to-Haiku and E1–E4 known and accepted. **Item 3 done
  05-11-2026:** ccusage baseline in `harness/backlog.md`; wave 2 not before 12-11-2026.
  **Session C done 05-11-2026 (FinNode):** item 6 gitleaks — 0 leaks in history and
  tracked files, 37 hits only in git-ignored logs (FinNode backlog row 7); item 7
  `blockWritesOutsideWorkingDirectories` on in FinNode, tested on/off, memory writes work,
  mirrored (`9b0e172`); trial check 20-11-2026, keep or remove 05-12-2026. **Wave 1 done.**
- **Pre-wave 2, 06-11-2026 (approved by Amit):** the 12-11 wait is dropped. Order:
  Session 1 (items 16, 20, 17) → Session 2 (10, 13, 8) → wave 2 → rest of wave 3; one
  combined review 15 days after the last trial starts. Cross-check (Opus, 56.7k measured):
  change — 3 fixes taken. **Session 1 done 06-11-2026:** project-map template + FinNode
  trial line (FinNode `CLAUDE.md` left uncommitted); `git branch` allow rules narrowed,
  box tests passed; bypass probes 7/8 blocked, git alias got through (backlog row 21, P3).
  Results in `harness/backlog.md`. Next: Session 2 on Sonnet.
- **Main session reading projects, 05-11-2026 (Amit):** the rule (`STANDARDS.md`
  § *Which project*) and the read block agree. A project is opened by `/add-dir` when
  Amit asks (D23: by prompt, not a standing grant); no settings change.
- **Nothing else in progress.** Stage C switches done (D45).

## Completed

Entries up to and including T6 moved unchanged to
`baselines/status-completed-11-10-2026.md` (11-10-2026), and entries from 11-10-2026 to
23-10-2026 to `baselines/status-completed-23-10-2026.md` (29-10-2026), and entries from
29-10-2026 to 31-10-2026 to `baselines/status-completed-01-11-2026.md` (01-11-2026), to
keep this file to the current state.

## Open

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
  unchanged.
- **Audit 31-10-2026, Stage C — decisions (Amit, 01-11-2026):**
  - C8 · **accepted** — allowed test/build commands (`./gradlew *` and similar, 4
    projects) can run any code; a normal development trade-off.
  - C4 · **decided 01-11-2026, no change** — `gist` is a GitHub CLI minimum scope and
    cannot be removed; the D44 ask rules stay (D45).
  - C7 hook · **done 01-11-2026** — `pre-commit` secret check in `~/.claude` (D45).
  - C9 · **done 01-11-2026** — bypass mode disabled in Claude Code (D45). Claude
    Desktop's own toggle left as it is: Amit is on the Team plan and chose to ignore it.
  - C10 · **done 01-11-2026** — error reports off; telemetry and updates stay on (D45).
  - C11 · **deferred** — account/org UUIDs and Amit's emails in `SETUP-PLAN.md`; must be
    handled before the repo goes public.
  - C13 · **done 01-11-2026** — rtk hook-audit logging off from the next session; the
    6.7 MB log kept (D45). Checking that the log stops growing: left for now (Amit).
  - **Proposed `STANDARDS.md` changes from 31-10-2026 — done 01-11-2026** (Plan 2,
    § *In progress*).
- **Starting tokens 25.2k (01-11-2026,** `ENVIRONMENT.md` § *What every session loads*).
  No fixed target; keep lowering where it helps (Amit).
- **Project items live in each project's own backlog;** history in
  `baselines/status-completed-01-11-2026.md` § *Moved from Open*.

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
