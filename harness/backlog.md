# Backlog — Claude Setup

Purpose: Setup improvements and open items for `~/.claude` not yet built.
Audience: Claude and Amit.
Read when: Planning setup work, or when a finding comes up.
Owner: Setup sessions (changes are Amit's decision).
Update rule: When an item is found, planned (row says "→ T#"), deferred or closed. Overwrite rows; history goes to a dated record.
Related: `harness/status.md` · `STANDARDS.md` § *IDs and progress* (P1–P4) · `baselines/backlog-log-11-11-2026.md`
Status: active
Last reviewed: 20-11-2026

Next ID: B47

Not built without a plan and Amit's approval. Raise it at once if it blocks the approved task or risks safety, security or data loss.

B-numbers keep the old item numbers: item n = Bn (11-11-2026). Tokens are rough estimates to plan, build and check.

Phases 8–11 (D50, 20-11-2026) have their tasks in `harness/doc-structure-plan.md` § 3, not here. Rows below say which phase picks them up.

## To build

| ID | Item | Why | Worth doing | Blocks current task | Priority | Size | Tokens | Status | Next action |
|---|---|---|---|---|---|---|---|---|---|
| B1 | Model rule | One table for Opus / Sonnet / Haiku; switch between sessions, not mid-chat | yes | no | P1 | S | ~15k | [x] 05-11-2026 | None — rule in `harness/models.md` |
| B2 | Handoff "Errors and fixes" line | Idea from Planning-with-Files; not installed | yes | no | P1 | S | ~3k | [x] 05-11-2026 | None |
| B3 | ccusage token baseline | Baseline before the trials (B3 in full) | yes | no | P1 | S | ~10k | [x] 05-11-2026 | Manual only, always `--offline`; Claude may suggest when |
| B5 | Claude Code survey off | Clicking "Yes" on the follow-up uploads the whole transcript; projects hold personal data | yes | no | P2 | S | ~5k | [x] 05-11-2026 | None |
| B6 | gitleaks secret scan | Manual scan, FinNode first; no hook. 0 leaks in history and tracked files | yes | no | P2 | S | ~15k | [x] 05-11-2026 | Claude may suggest when to run it |
| B7 | Block writes outside the working folder | Stops Claude's file tools writing outside the project (B7 in full) | yes | no | P2 | S | ~10k | [~] trial | Keep or remove on 05-12-2026, together with the overdue B7 + B16 review (small separate task, D54) |
| B8 | GitHub CLI telemetry off | gh 2.91.0+ turns telemetry on by default | yes | no | P3 | S | ~3k | [x] 06-11-2026 | Check it still reads `disabled` after any gh update |
| B9 | Claude Code usage metrics | Keep on if Remote Control or claude.ai skill sync is used, else `DISABLE_TELEMETRY=1`; metrics carry no code, prompts or paths (Anthropic docs) | yes | no | P3 | S | ~5k | [ ] | Session 3 of the rest of old wave 3, approved 06-11-2026; not started; Phase 11 (D50). Plan: `baselines/task-history-11-11-2026.md`, *Rest of wave 3* bullet |
| B10 | Planning ideas into `templates/new-project.md` | Spec, architecture, system design and go-live ideas, plus licence and "still on goal" checks; plugins not enabled | yes | no | P3 | M | ~25k | [x] 06-11-2026 | None — Phase 8 new-project path reuses it |
| B11 | markitdown | On-demand command only, no Azure or AI options; never with the PDF/DOCX skills on one document; 15–30 day trial | yes | no | P3 | S | ~10k | [ ] | Session 4, after B21, B14, B9; approved 06-11-2026, not started; Phase 11 (D50). Plan: `baselines/task-history-11-11-2026.md`, *Rest of wave 3* bullet |
| B13 | Status-line thresholds | Warnings at 200K/300K/400K vs the 250K plan limit | yes | no | P3 | S | ~3k | [x] 06-11-2026 | None — kept, tie written in `ENVIRONMENT.md` § 2 |
| B14 | Ollama network calls | Own update checks not covered in Stage 1; cloud models already off (D45) | yes | no | P3 | S | ~5k | [ ] | Session 3 of the rest of old wave 3, approved 06-11-2026; not started; Phase 11 (D50). Plan: `baselines/task-history-11-11-2026.md`, *Rest of wave 3* bullet |
| B15 | Acting without approval | Rule exists in `STANDARDS.md`; auto mode may be the cause | yes, once a real case is seen | no | P3 | S | ~5k | [ ] | Wording fix only after a real example; Phase 10 if one is seen (D50) |
| B16 | Project map (Graphify idea) | Read a short folder map before searching code (B16 in full) | yes | no | P3 | M | ~15k + ~10k per project | [~] trial | FinNode `PROJECT-MAP.md` written in FinNode's own Phase 7 session (PR #7, on `phase3/sms`, 13-11-2026). Still open: the combined review with B7 (check 20-11-2026), ccusage measure, then the roll-out decision. Phase 9 reviewers read one map section, so this trial feeds it (D50) |
| B17 | Deny-rule bypass test | Focused security test: 8 probes, 7 blocked, 1 → B21 | yes | no | P4 | S | ~15k | [x] 06-11-2026 | None |
| B19 | New-tool rule | Check network calls, telemetry and cost before adopting any tool | yes | no | P1 | S | ~5k | [x] 05-11-2026 | None — rule in `STANDARDS.md` |
| B20 | rtk exact allow rules | rtk issue #3673 reads an exact allow rule as a prefix | yes | no | P3 | S | ~10k | [x] 06-11-2026 | None — allow rules narrowed, box-tested |
| B21 | git alias reads secrets | `git -c alias.x='!cat' x .env` printed a made-up `.env` (B21 in full) | yes | no | P3 | S | ~10k | [ ] | Session 3 of the rest of old wave 3, approved 06-11-2026 after an Opus cross-check; not started: ASK rules (not deny), box-tested in default and auto mode; Phase 11 (D50). Plan: `baselines/task-history-11-11-2026.md`, *Rest of wave 3* bullet |
| B32 | Decide whether the old backlog working rules are still live | The old rules — group small fixes in one commit, separate commit for settings changes, copied skill ideas as name plus one line — now exist only in `baselines/backlog-log-11-11-2026.md` | yes | no | P3 | S | ~5k | [x] | Leave as history; existing rules already cover the useful parts. |
| B33 | Voice Flow `git branch` allow rules in plain-git form | Voice Flow's project settings file (.claude/settings.json, lines 93–98) has the same `git branch` allow rules in plain-git form (noted 06-11-2026, after B20); probably harmless (rtk rewrites first), not verified inside Voice Flow | unverified | no | P4 | S | ~5k | [ ] | Assess in Voice-Flow's own session |
| B34 | Align `ALLOWED_DUP` in `harness/doc-check.sh` with `DOCUMENTATION-STANDARD.md` | The checker now allows the task-file template's standing "After compaction…" line, but § *Allowed copies* in `DOCUMENTATION-STANDARD.md` does not list it yet | yes | no | P3 | S | ~5k | [x] 25-11-2026 | None — closed in Phase 10 WP2a |
| B35 | "Imports only" vs the comment in global `CLAUDE.md` | `DOCUMENTATION-STANDARD.md` line 51 says imports only; Amit keeps one non-loading HTML comment (D48). This item authorises the line-51 change | yes | no | P4 | S | ~3k | [x] 11-11-2026 | None — line 51 changed in Go 2; D48 closed |
| B36 | Done files only by size | The Voice-Flow Phase 6 pilot (its D22) kept finished work in one file with history in `docs/archive/`; the old trigger (about 300 lines or 10 done rows) created `-DONE`/`-OLD` files too early. This item authorises the § *Growth and rollover* change (D49) | yes | no | P3 | S | ~25k | [x] 13-11-2026 | None — rule in `DOCUMENTATION-STANDARD.md` § *Growth and rollover* |
| B37 | Plan-reviewer report over its word limit | Plan-reviewer R4 report exceeded its 500-word limit (about 600 words, 26-11-2026); tighten report instructions during the planning redo. Phase 13 WP5 (26-11-2026): 0 of 8 reports within limit (383–700 words). Fix applied 26-11-2026: report shaped by review size (`agents/plan-reviewer.md` § *Report*). In-session re-test invalid — both re-reviews (T1 785 words, T7 494) used the old shape, likely because agent files load at session start. Fresh-session re-test 26-11-2026: T1 812 words (limit about 500), T7 523 (about 300) — both fail; third failed attempt. Smaller shape approved by Amit 26-11-2026 and applied (top 2 / top 3 findings, two lines each, only unchecked deferrals; limits unchanged). Fresh-session re-test 3 (26-11-2026): T1 790, T7 473 — both fail; cause: "lines" have no length. Per-part maximum word budgets approved by Amit 26-11-2026 and applied (`agents/plan-reviewer.md` § *Report*; `change-reviewer` Opus: diff no defects). Fresh-session re-test 4 (26-11-2026): T7 301 words, total within about 300 but not in the budget shape (findings 1–2 at 70 and 48 vs 40; others 50, 25, 26 vs 15, with fix lines; deferrals 32 vs 30); T1 not run. Fifth failed attempt; cause: the reviewer cannot count words, so word budgets do not bind. Sentence limits per part approved by Amit 26-11-2026 and applied (`agents/plan-reviewer.md` § *Report*; totals unchanged; `change-reviewer` Opus: shape matches, concerns only on the routing wording). Fresh-session re-test 5 (26-11-2026): T7 471 words vs about 300, every part over its sentence limit (opening 2/1, findings 1–2 4/2 and 6/2, 6 others vs 4, deferrals 2/1, facts 3/1); T1 not run. Sixth failed attempt; lines, words and sentences have all failed, so the unit is not the cause — the reviewer does not hold to a shape it must measure. Amit: fix, not accept. Literal fill-in skeleton applied 26-11-2026 (`agents/plan-reviewer.md` § *Report*; `change-reviewer` Opus: concerns — skeleton dropped "assumptions and files read beyond the packet"; no per-slot length cap); both fixed 26-11-2026 on Amit's approval (length cap as an instruction; facts slot includes assumptions and files read beyond the packet). Re-test 6 (fresh session): T7 439 — seventh failure. Root-cause fix (Amit, 26-11-2026): the requesting session checks `wc -w` and the skeleton and sends the report back once (`harness/cross-check.md` § *The reviewer*). Re-test 7: T7 422 → 201, T1 590 → 343 after one retry each — pass | yes | no | P3 | S | ~20k | [x] 26-11-2026 | None |
| B38 | Session-start warnings (26-11-2026) | Session-start check: Voice-Flow and Emp portal `CLAUDE.md` drifted from their `project-rules/` copies; `ENVIRONMENT.md` 390 lines, over 300 (needs a rollover proposal) | yes | no | P3 | S | ~10k | [ ] | `ENVIRONMENT.md` size: Phase 17; project drift: Phase 20 (D54); drift resync follows the project-edit rules in `.claude/CLAUDE.md` |
| B39 | Case study for `change-reviewer` | The agent template asks for one real case with its date under *Why this exists*. Dated `change-reviewer` results exist in `harness/doc-structure-plan.md` (e.g. 25-11-2026, Phase 10 WP3b part 2: an empty map made the coverage check pass silently, confirmed by test), but no case study is written, and the blind-test inputs hold none | yes | no | P3 | S | ~5k | [ ] | Case used inline in `agents/change-reviewer.md` § *Why this exists* (Phase 14, D57). Still open: the case-study file, in Phase 16 |
| B40 | V-Thru-only planning ideas from the backend kit | Kept out of global files in Phase 13 (names only): tracker ticket and attachment reading · live design frames and the design-freshness gate · company spec fields · local ticket-file layout and statuses · master versus long-lived branch-chain wording · alerts a spec names · checks against company tracker and scale figures | yes | no | P3 | M | ~20k | [ ] | Phase 20, inside the V-Thru projects' own rules (VT, VOS Dashboard, Emp Portal); ask Amit before classifying the debuggers (D54, D56) |
| B41 | `plan-reviewer` small wording issues | Found 26-11-2026: (1) "he" for Amit — § *Report* "a real conflict only he can settle" and § *Lessons* "If his words contradict themselves, that is a question for him"; agent text should not assume pronouns; (2) § intro "review the first and say so" has no slot in the skeleton ("write nothing outside it"); (3) § *The five lenses* 5 "it blocks approval" can be confused with the `blocked` verdict (= could not review) | yes | no | P4 | S | ~3k | [x] 27-11-2026 | None — fixed in Phase 14 WP1 (D57) |
| B42 | `change-reviewer` gaps | Found 26-11-2026 at the Phase 13 close: (1) no report skeleton and no length check — its reports still run long (the 26-11-2026 review ran past 300 words); (2) no example line in its description, required by the D55 examples rule; (3) `harness/cross-check.md` § *The reviewer* lists what `change-reviewer` reports, and the list does not match its body § *Report* | yes | no | P3 | M | ~15k | [x] 27-11-2026 | None — fixed in Phase 14 WP1, tested in WP2 (D57) |
| B43 | Agent example in the description: one line, not a block | Found 27-11-2026 (Phase 14 planning): the Phase 12 blind-test try 2 (`harness/drafts/change-reviewer-phase12-try2.md`, 26-11-2026) put a full `<example>` block in its description, which loads every session, against `templates/agent.md` (one `Example: … → …` line) and D55; `WRITING-GUIDE.md` § *Agents* does not say how the description line and the body's *Example* differ | yes | no | P3 | S | ~3k | [x] 27-11-2026 | None — rule in `WRITING-GUIDE.md` § *Agents* and `templates/agent.md` (D57) |
| B44 | Claude deleted its own scratch files without approval | Found 27-11-2026 (Phase 14 WP1): while renaming test folders, Claude ran `rm -f` on two diff files it had made minutes earlier in the Phase 14 drafts folder (named seeded.diff and clean.diff, now gone), replaced by change-a.diff and change-b.diff. `STANDARDS.md` § *What may happen without asking* already forbids any delete without approval; there is no exception for Claude's own just-created scratch files. Rule (Amit, 27-11-2026): Claude's own just-created scratch files are replaced or deleted only with approval, unless Amit changes the rule. First logged case (the ladder's first step) | yes | no | P3 | S | ~2k | [ ] | No new rule now (the rule exists). If a second case is logged, propose a one-line instruction, then a hook (`WRITING-GUIDE.md` § *Rule plus case*); judged in Phase 15 (ladder in practice) |
| B45 | `change-reviewer` claimed files read that it never opened | Found 27-11-2026 (Phase 14 WP2, P1 retry): "Facts checked" said RULES.md:5, README.md:15, report.py:20 and test_hours.py:18 were "read in the change-a files". Its transcript shows it read only the brief and `change-a.diff`, plus one Glob for RULES.md; none of those four files was opened. The same line admits the line numbers came from diff hunk offsets. The findings themselves were true . Second case, 27-11-2026 (P2 re-run): "Facts checked" claimed `RULES.md`, `report.py` and `test_hours.py` were read; the transcript shows only the brief, the diff, `hours.py` and `README.md` were opened, and the cited `report.py:58` is a diff line number (the file has 23 lines) | yes | no | P3 | S | ~3k | [x] 27-11-2026 | None — *Files opened* slot, `diff:<n>` rule and requester log check (B45 fix); fresh-session test P1, P2, P3 passed 27-11-2026, every *Files opened* entry in its log (D57) |
| B46 | Agent template and `plan-reviewer`: unused numbered finding slots | Found 27-11-2026 (Phase 14 WP2, P2 re-run): the report skeleton did not say what happens to the numbered finding lines when only Nits are found. `agents/change-reviewer.md` § *Report* now says "Delete unused numbered lines too." (Amit, 27-11-2026); `templates/agent.md` and `agents/plan-reviewer.md` § *Report* do not yet say the same, so `plan-reviewer`, or a new agent built from the template, could repeat the gap | yes | no | P4 | S | ~2k | [x] 27-11-2026 | None — line added to both in the B45 fix; P3 test 27-11-2026 passed with the line in place (D57) |
Done-file rollover: see `DOCUMENTATION-STANDARD.md` § *Growth and rollover* (D49).

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
| B12 | Own post-edit checker (Kotlin, lint, project checks; must not clash with B4) — P3 · M · ~30k | Not set — deferred 06-11-2026; revisit in Phase 11 (D50) |
| B18 | rtk update | 05-01-2027 |

## Known and accepted

| ID | Item | Reason |
|---|---|---|
| B22 | Status-line simplification | 84 lines, no network, no token cost; not worth it (C6) |
| B23 | Re-read returns the whole file (Claude Code 2.1.317) | No setting; Claude avoids re-reading unchanged files (C5) |
| B24 | A separate checker helper | **Closed 27-11-2026 (D57, I8):** built as `plan-reviewer` and `change-reviewer` (Phase 9, D52) |
| B25 | Engineering skills not copied (`testing-strategy`, `tech-debt`, `incident-response`, `standup`, `code-review`, `debug`, `documentation`) | Covered by existing rules or not needed repeatedly. **Being revisited (D50, 20-11-2026):** still true for these generic skills, but Phases 8–9 build Amit's own skills from his rules; review this row in Phase 10 |
| B26 | gitleaks and markitdown network behaviour not verified from source | Checked when each tool's trial starts |
| B27 | Box-test gaps — old IDs F1, F3, F4, F6 and 30-10 T1–T3 (wrapped commands, auto-mode blocks, `git remote -v add`, `git -c` alias, more `.env`/`~/.ssh` read denies, `git stash pop/apply` outside `~/.claude`, one-line box explanations) | Value bar, 30-10-2026; F3 mostly fixed by D44 (limits in `ENVIRONMENT.md` § 3). Detail: `baselines/status-completed-11-11-2026.md` § *Open* |
| B28 | GitHub write commands not separately boxed (old F2) | 0 historical uses; auto mode is a second guard (30-10-2026). If asked later, propose only `gh release create\|delete`, `gh secret set\|delete`, `gh workflow run` |
| B29 | Allowed test/build commands (`./gradlew *` and similar, 4 projects) can run any code (old C8) | A normal development trade-off (Amit, 01-11-2026) |
| B30 | Claude Desktop's own bypass toggle (old C9) | Left as it is (Amit, Team plan, 01-11-2026); bypass is off in Claude Code (D45) |
| B31 | A per-project `SessionStart` drift check | Rejected 10-10-2026 (Amit): a project session would reach into `~/.claude` (D23, D31); the setup-session check catches drift. Revisit if drift goes unnoticed in between |

## Older records

- `baselines/backlog-log-11-11-2026.md` — the numbered-item backlog, done notes, working rules and items 1 and 16 in full, up to 11-11-2026.
