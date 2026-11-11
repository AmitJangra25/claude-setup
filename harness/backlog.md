# Backlog — Claude Setup

Purpose: Setup improvements and open items for `~/.claude` not yet built.
Audience: Claude and Amit.
Read when: Planning setup work, or when a finding comes up.
Owner: Setup sessions (changes are Amit's decision).
Update rule: When an item is found, planned (row says "→ T#"), deferred or closed. Overwrite rows; history goes to a dated record.
Related: `harness/status.md` · `STANDARDS.md` § *Plan before building* (P1–P4) · `baselines/backlog-log-11-11-2026.md`
Status: active
Last reviewed: 11-11-2026

Next ID: B36

Not built without a plan and Amit's approval. Raise it at once if it blocks the approved task or risks safety, security or data loss.

B-numbers keep the old item numbers: item n = Bn (11-11-2026). Tokens are rough estimates to plan, build and check.

## To build

| ID | Item | Why | Worth doing | Blocks current task | Priority | Size | Tokens | Status | Next action |
|---|---|---|---|---|---|---|---|---|---|
| B1 | Model rule | One table for Opus / Sonnet / Haiku; switch between sessions, not mid-chat | yes | no | P1 | S | ~15k | [x] 05-11-2026 | None — rule in `harness/models.md` |
| B2 | Handoff "Errors and fixes" line | Idea from Planning-with-Files; not installed | yes | no | P1 | S | ~3k | [x] 05-11-2026 | None |
| B3 | ccusage token baseline | Baseline before the trials (B3 in full) | yes | no | P1 | S | ~10k | [x] 05-11-2026 | Manual only, always `--offline`; Claude may suggest when |
| B5 | Claude Code survey off | Clicking "Yes" on the follow-up uploads the whole transcript; projects hold personal data | yes | no | P2 | S | ~5k | [x] 05-11-2026 | None |
| B6 | gitleaks secret scan | Manual scan, FinNode first; no hook. 0 leaks in history and tracked files | yes | no | P2 | S | ~15k | [x] 05-11-2026 | Claude may suggest when to run it |
| B7 | Block writes outside the working folder | Stops Claude's file tools writing outside the project (B7 in full) | yes | no | P2 | S | ~10k | [~] trial | Check 20-11-2026; keep or remove 05-12-2026 |
| B8 | GitHub CLI telemetry off | gh 2.91.0+ turns telemetry on by default | yes | no | P3 | S | ~3k | [x] 06-11-2026 | Check it still reads `disabled` after any gh update |
| B9 | Claude Code usage metrics | Keep on if Remote Control or claude.ai skill sync is used, else `DISABLE_TELEMETRY=1`; metrics carry no code, prompts or paths (Anthropic docs) | yes | no | P3 | S | ~5k | [ ] | Session 3 of the rest of old wave 3, approved 06-11-2026; not started. Plan: `baselines/task-history-11-11-2026.md`, *Rest of wave 3* bullet |
| B10 | Planning ideas into `templates/new-project.md` | Spec, architecture, system design and go-live ideas, plus licence and "still on goal" checks; plugins not enabled | yes | no | P3 | M | ~25k | [x] 06-11-2026 | None |
| B11 | markitdown | On-demand command only, no Azure or AI options; never with the PDF/DOCX skills on one document; 15–30 day trial | yes | no | P3 | S | ~10k | [ ] | Session 4, after B21, B14, B9; approved 06-11-2026, not started. Plan: `baselines/task-history-11-11-2026.md`, *Rest of wave 3* bullet |
| B13 | Status-line thresholds | Warnings at 200K/300K/400K vs the 250K plan limit | yes | no | P3 | S | ~3k | [x] 06-11-2026 | None — kept, tie written in `ENVIRONMENT.md` § 2 |
| B14 | Ollama network calls | Own update checks not covered in Stage 1; cloud models already off (D45) | yes | no | P3 | S | ~5k | [ ] | Session 3 of the rest of old wave 3, approved 06-11-2026; not started. Plan: `baselines/task-history-11-11-2026.md`, *Rest of wave 3* bullet |
| B15 | Acting without approval | Rule exists in `STANDARDS.md`; auto mode may be the cause | yes, once a real case is seen | no | P3 | S | ~5k | [ ] | Wording fix only after a real example |
| B16 | Project map (Graphify idea) | Read a short folder map before searching code (B16 in full) | yes | no | P3 | M | ~15k + ~10k per project | [~] trial | FinNode writes its `PROJECT-MAP.md` in its own session |
| B17 | Deny-rule bypass test | Focused security test: 8 probes, 7 blocked, 1 → B21 | yes | no | P4 | S | ~15k | [x] 06-11-2026 | None |
| B19 | New-tool rule | Check network calls, telemetry and cost before adopting any tool | yes | no | P1 | S | ~5k | [x] 05-11-2026 | None — rule in `STANDARDS.md` |
| B20 | rtk exact allow rules | rtk issue #3673 reads an exact allow rule as a prefix | yes | no | P3 | S | ~10k | [x] 06-11-2026 | None — allow rules narrowed, box-tested |
| B21 | git alias reads secrets | `git -c alias.x='!cat' x .env` printed a made-up `.env` (B21 in full) | yes | no | P3 | S | ~10k | [ ] | Session 3 of the rest of old wave 3, approved 06-11-2026 after an Opus cross-check; not started: ASK rules (not deny), box-tested in default and auto mode. Plan: `baselines/task-history-11-11-2026.md`, *Rest of wave 3* bullet |
| B32 | Decide whether the old backlog working rules are still live | The old rules — group small fixes in one commit, separate commit for settings changes, copied skill ideas as name plus one line — now exist only in `baselines/backlog-log-11-11-2026.md` | yes | no | P3 | S | ~5k | [ ] | Decide in Phase 4, T20; move live rules to `STANDARDS.md` or leave as history |
| B33 | Voice Flow `git branch` allow rules in plain-git form | Voice Flow's project settings file (.claude/settings.json, lines 93–98) has the same `git branch` allow rules in plain-git form (noted 06-11-2026, after B20); probably harmless (rtk rewrites first), not verified inside Voice Flow | unverified | no | P4 | S | ~5k | [ ] | Assess in Voice-Flow's own session |
| B34 | Align `ALLOWED_DUP` in `harness/doc-check.sh` with `DOCUMENTATION-STANDARD.md` | The checker now allows the task-file template's standing "After compaction…" line, but § *Allowed copies* in `DOCUMENTATION-STANDARD.md` does not list it yet | yes | no | P3 | S | ~5k | [ ] | Decide in Phase 4, T20 or the 30-day review; update the standard through the normal backlog-item and D-number process |
| B35 | "Imports only" vs the comment in global `CLAUDE.md` | `DOCUMENTATION-STANDARD.md` line 51 says imports only; Amit keeps one non-loading HTML comment (D48). This item authorises the line-51 change | yes | no | P4 | S | ~3k | [x] 11-11-2026 | None — line 51 changed in Go 2; D48 closed |
10 or more done rows: rollover to a `-DONE` file is due (`DOCUMENTATION-STANDARD.md` § *Growth and rollover*); proposed, not done.

## In full

### B3 — ccusage baseline

- **Found in:** Stage 1 checks, 05-11-2026
- **Decision:** None yet
- **Detail:** baseline figures and the code check of 20.0.48: `baselines/backlog-log-11-11-2026.md` (item 3).

### B4 — TypeScript code helper

- **Found in:** Stage 1 checks, 05-11-2026
- **Decision:** deferred 06-11-2026 (Amit)
- **Detail:** P1 · M · ~40k + ~5k/week when re-planned. The official `typescript-lsp` plugin needs TypeScript's `tsserver.js`; Voice Flow is on TypeScript 7.0.2, which has none. The trial, when re-planned: 4 weeks in Voice Flow on its own branch; npm type lookup off if the plugin allows; weekly 5-minute check; keep if nothing broke, tokens flat or lower, and it caught a real problem.

### B7 — Block writes outside the working folder

- **Found in:** Stage 1 checks, 05-11-2026
- **Decision:** D46 (made global 10-11-2026)
- **Detail:** `permissions.blockWritesOutsideWorkingDirectories`. Covers Claude's file tools only, not shell commands. Not tested: plan-mode files. Seen once, cause unknown: a write refused with the key at `false`. While it is on, Claude cannot edit any Claude Code settings file — Amit edits FinNode settings by hand during the trial (05-11-2026). With B16: one combined review 15 days after the last trial starts (06-11-2026).

### B16 — Project map

- **Found in:** Stage 1 checks, 05-11-2026
- **Decision:** D47 supersedes its "setup map = `harness/overview.md`" part
- **Detail:** the seven staleness guards live in `templates/project-map.md`. The rule line is trialled in FinNode `CLAUDE.md`, not `STANDARDS.md` until the trial works; measure with ccusage, then roll out.

### B17 — Deny-rule bypass test

- **Found in:** Stage 1 checks, 05-11-2026
- **Decision:** None yet
- **Detail:** 7 of 8 probes on a made-up `.env` blocked (`nl`, `base64`, `sort`, `diff`, `od`, `strings`, `cut` — none on the deny list; cause not confirmed: the Read rule applied to Bash, or auto mode). The Read deny rule also blocks the Write tool from creating a `.env`. Grep and Glob tools still untested.

### B18 — rtk update

- **Found in:** Stage 1 checks, 05-11-2026
- **Decision:** policy (Amit, 05-11-2026): stay on the latest stable, free version; move only when a version is shown better
- **Detail:** candidate 0.52.0 (last 0.x, Apache-2.0) fixes three permission-gate holes but rewrites more commands; not shown better yet. 1.x changes the licence and renames `rtk proxy`. Recheck: #4644 and #3673 fixed? 0.49–0.52 notes; the 1.x licence and whether rtk-oss is the free one; telemetry stays off (`RTK_TELEMETRY_DISABLED=1`); box tests before and after. Nothing broken on 0.48.

### B21 — git alias reads secrets

- **Found in:** B17 probes, 06-11-2026
- **Decision:** fix plan approved by Amit 06-11-2026 — ASK rules, not deny (no D-number); not started. Plan: `baselines/task-history-11-11-2026.md`, *Rest of wave 3* bullet
- **Detail:** same root as F1. A security risk, unlikely in normal use: it needs a deliberate odd command.

## Deferred

| ID | Item | Recheck date |
|---|---|---|
| B4 | TypeScript code helper — does `typescript-lsp` support TypeScript 7? | 05-01-2027 |
| B12 | Own post-edit checker (Kotlin, lint, project checks; must not clash with B4) — P3 · M · ~30k | Not set — deferred 06-11-2026 |
| B18 | rtk update | 05-01-2027 |

## Known and accepted

| ID | Item | Reason |
|---|---|---|
| B22 | Status-line simplification | 84 lines, no network, no token cost; not worth it (C6) |
| B23 | Re-read returns the whole file (Claude Code 2.1.317) | No setting; Claude avoids re-reading unchanged files (C5) |
| B24 | A separate checker helper | Already exists as the cross-check agent (`harness/cross-check.md`); used sparingly |
| B25 | Engineering skills not copied (`testing-strategy`, `tech-debt`, `incident-response`, `standup`, `code-review`, `debug`, `documentation`) | Covered by existing rules or not needed repeatedly |
| B26 | gitleaks and markitdown network behaviour not verified from source | Checked when each tool's trial starts |
| B27 | Box-test gaps — old IDs F1, F3, F4, F6 and 30-10 T1–T3 (wrapped commands, auto-mode blocks, `git remote -v add`, `git -c` alias, more `.env`/`~/.ssh` read denies, `git stash pop/apply` outside `~/.claude`, one-line box explanations) | Value bar, 30-10-2026; F3 mostly fixed by D44 (limits in `ENVIRONMENT.md` § 3). Detail: `baselines/status-completed-11-11-2026.md` § *Open* |
| B28 | GitHub write commands not separately boxed (old F2) | 0 historical uses; auto mode is a second guard (30-10-2026). If asked later, propose only `gh release create\|delete`, `gh secret set\|delete`, `gh workflow run` |
| B29 | Allowed test/build commands (`./gradlew *` and similar, 4 projects) can run any code (old C8) | A normal development trade-off (Amit, 01-11-2026) |
| B30 | Claude Desktop's own bypass toggle (old C9) | Left as it is (Amit, Team plan, 01-11-2026); bypass is off in Claude Code (D45) |
| B31 | A per-project `SessionStart` drift check | Rejected 10-10-2026 (Amit): a project session would reach into `~/.claude` (D23, D31); the setup-session check catches drift. Revisit if drift goes unnoticed in between |

## Older records

- `baselines/backlog-log-11-11-2026.md` — the numbered-item backlog, done notes, working rules and items 1 and 16 in full, up to 11-11-2026.
