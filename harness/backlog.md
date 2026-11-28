# Backlog — Claude Setup

Purpose: Setup improvements and open items for `~/.claude` not yet built.
Audience: Claude and Amit.
Read when: Planning setup work, or when a finding comes up.
Owner: Setup sessions (changes are Amit's decision).
Update rule: When an item is found, planned (row says "→ T#"), deferred or closed. Overwrite rows; history goes to a dated record.
Related: `harness/status.md` · `STANDARDS.md` § *IDs and progress* (P1–P4) · `baselines/backlog-log-11-11-2026.md`
Status: active
Last reviewed: 27-11-2026

Next ID: B79

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
| B15 | Acting without approval | Rule exists in `STANDARDS.md`; auto mode may be the cause | yes, once a real case is seen | no | P3 | S | ~5k | [x] 27-11-2026 | None — merged into B44 (D58 T5); B44 is its real case |
| B16 | Project map (Graphify idea) | Read a short folder map before searching code (B16 in full) | yes | no | P3 | M | ~15k + ~10k per project | [~] trial | FinNode `PROJECT-MAP.md` written in FinNode's own Phase 7 session (PR #7, on `phase3/sms`, 13-11-2026). Still open: the combined review with B7 (check 20-11-2026), ccusage measure, then the roll-out decision. Phase 9 reviewers read one map section, so this trial feeds it (D50) |
| B17 | Deny-rule bypass test | Focused security test: 8 probes, 7 blocked, 1 → B21 | yes | no | P4 | S | ~15k | [x] 06-11-2026 | None |
| B19 | New-tool rule | Check network calls, telemetry and cost before adopting any tool | yes | no | P1 | S | ~5k | [x] 05-11-2026 | None — rule in `STANDARDS.md` |
| B20 | rtk exact allow rules | rtk issue #3673 reads an exact allow rule as a prefix | yes | no | P3 | S | ~10k | [x] 06-11-2026 | None — allow rules narrowed, box-tested |
| B21 | git alias reads secrets | `git -c alias.x='!cat' x .env` printed a made-up `.env` (B21 in full) | yes | no | P3 | S | ~10k | [x] 27-11-2026 | None — 8 ask rules (`6e83018`); box tests passed 27-11-2026 (S3.0, measure 4); over-match → B69 |
| B32 | Decide whether the old backlog working rules are still live | The old rules — group small fixes in one commit, separate commit for settings changes, copied skill ideas as name plus one line — now exist only in `baselines/backlog-log-11-11-2026.md` | yes | no | P3 | S | ~5k | [x] | Leave as history; existing rules already cover the useful parts. |
| B33 | Voice Flow `git branch` allow rules in plain-git form | Voice Flow's project settings file (.claude/settings.json, lines 93–98) has the same `git branch` allow rules in plain-git form (noted 06-11-2026, after B20); probably harmless (rtk rewrites first), not verified inside Voice Flow | unverified | no | P4 | S | ~5k | [ ] | Assess in Voice-Flow's own session |
| B34 | Align `ALLOWED_DUP` in `harness/doc-check.sh` with `DOCUMENTATION-STANDARD.md` | The checker now allows the task-file template's standing "After compaction…" line, but § *Allowed copies* in `DOCUMENTATION-STANDARD.md` does not list it yet | yes | no | P3 | S | ~5k | [x] 25-11-2026 | None — closed in Phase 10 WP2a |
| B35 | "Imports only" vs the comment in global `CLAUDE.md` | `DOCUMENTATION-STANDARD.md` line 51 says imports only; Amit keeps one non-loading HTML comment (D48). This item authorises the line-51 change | yes | no | P4 | S | ~3k | [x] 11-11-2026 | None — line 51 changed in Go 2; D48 closed |
| B36 | Done files only by size | The Voice-Flow Phase 6 pilot (its D22) kept finished work in one file with history in `docs/archive/`; the old trigger (about 300 lines or 10 done rows) created `-DONE`/`-OLD` files too early. This item authorises the § *Growth and rollover* change (D49) | yes | no | P3 | S | ~25k | [x] 13-11-2026 | None — rule in `DOCUMENTATION-STANDARD.md` § *Growth and rollover* |
| B37 | Plan-reviewer report over its word limit | Plan-reviewer R4 report exceeded its 500-word limit (about 600 words, 26-11-2026); tighten report instructions during the planning redo. Phase 13 WP5 (26-11-2026): 0 of 8 reports within limit (383–700 words). Fix applied 26-11-2026: report shaped by review size (`agents/plan-reviewer.md` § *Report*). In-session re-test invalid — both re-reviews (T1 785 words, T7 494) used the old shape, likely because agent files load at session start. Fresh-session re-test 26-11-2026: T1 812 words (limit about 500), T7 523 (about 300) — both fail; third failed attempt. Smaller shape approved by Amit 26-11-2026 and applied (top 2 / top 3 findings, two lines each, only unchecked deferrals; limits unchanged). Fresh-session re-test 3 (26-11-2026): T1 790, T7 473 — both fail; cause: "lines" have no length. Per-part maximum word budgets approved by Amit 26-11-2026 and applied (`agents/plan-reviewer.md` § *Report*; `change-reviewer` Opus: diff no defects). Fresh-session re-test 4 (26-11-2026): T7 301 words, total within about 300 but not in the budget shape (findings 1–2 at 70 and 48 vs 40; others 50, 25, 26 vs 15, with fix lines; deferrals 32 vs 30); T1 not run. Fifth failed attempt; cause: the reviewer cannot count words, so word budgets do not bind. Sentence limits per part approved by Amit 26-11-2026 and applied (`agents/plan-reviewer.md` § *Report*; totals unchanged; `change-reviewer` Opus: shape matches, concerns only on the routing wording). Fresh-session re-test 5 (26-11-2026): T7 471 words vs about 300, every part over its sentence limit (opening 2/1, findings 1–2 4/2 and 6/2, 6 others vs 4, deferrals 2/1, facts 3/1); T1 not run. Sixth failed attempt; lines, words and sentences have all failed, so the unit is not the cause — the reviewer does not hold to a shape it must measure. Amit: fix, not accept. Literal fill-in skeleton applied 26-11-2026 (`agents/plan-reviewer.md` § *Report*; `change-reviewer` Opus: concerns — skeleton dropped "assumptions and files read beyond the packet"; no per-slot length cap); both fixed 26-11-2026 on Amit's approval (length cap as an instruction; facts slot includes assumptions and files read beyond the packet). Re-test 6 (fresh session): T7 439 — seventh failure. Root-cause fix (Amit, 26-11-2026): the requesting session checks `wc -w` and the skeleton and sends the report back once (`harness/cross-check.md` § *The reviewer*). Re-test 7: T7 422 → 201, T1 590 → 343 after one retry each — pass | yes | no | P3 | S | ~20k | [x] 26-11-2026 | None |
| B38 | Session-start warnings (26-11-2026) | Session-start check: Voice-Flow and Emp portal `CLAUDE.md` drifted from their `project-rules/` copies; `ENVIRONMENT.md` 390 lines (393 on 27-11-2026), over 300 (needs a rollover proposal) | yes | no | P3 | S | ~10k | [ ] | `ENVIRONMENT.md` size: Phase 17; project drift: Phase 20 (D54); drift resync follows the project-edit rules in `.claude/CLAUDE.md` |
| B39 | Case study for `change-reviewer` | The agent template asks for one real case with its date under *Why this exists*. Dated `change-reviewer` results exist in `harness/doc-structure-plan.md` (e.g. 25-11-2026, Phase 10 WP3b part 2: an empty map made the coverage check pass silently, confirmed by test), but no case study is written, and the blind-test inputs hold none | yes | no | P3 | S | ~5k | [ ] | Case used inline in `agents/change-reviewer.md` § *Why this exists* (Phase 14, D57). Still open: the case-study file, in Phase 16 |
| B40 | V-Thru-only planning ideas from the backend kit | Kept out of global files in Phase 13 (names only): tracker ticket and attachment reading · live design frames and the design-freshness gate · company spec fields · local ticket-file layout and statuses · master versus long-lived branch-chain wording · alerts a spec names · checks against company tracker and scale figures | yes | no | P3 | M | ~20k | [ ] | Phase 20, inside the V-Thru projects' own rules (VT, VOS Dashboard, Emp Portal); ask Amit before classifying the debuggers (D54, D56) |
| B41 | `plan-reviewer` small wording issues | Found 26-11-2026: (1) "he" for Amit — § *Report* "a real conflict only he can settle" and § *Lessons* "If his words contradict themselves, that is a question for him"; agent text should not assume pronouns; (2) § intro "review the first and say so" has no slot in the skeleton ("write nothing outside it"); (3) § *The five lenses* 5 "it blocks approval" can be confused with the `blocked` verdict (= could not review) | yes | no | P4 | S | ~3k | [x] 27-11-2026 | None — fixed in Phase 14 WP1 (D57) |
| B42 | `change-reviewer` gaps | Found 26-11-2026 at the Phase 13 close: (1) no report skeleton and no length check — its reports still run long (the 26-11-2026 review ran past 300 words); (2) no example line in its description, required by the D55 examples rule; (3) `harness/cross-check.md` § *The reviewer* lists what `change-reviewer` reports, and the list does not match its body § *Report* | yes | no | P3 | M | ~15k | [x] 27-11-2026 | None — fixed in Phase 14 WP1, tested in WP2 (D57) |
| B43 | Agent example in the description: one line, not a block | Found 27-11-2026 (Phase 14 planning): the Phase 12 blind-test try 2 (`harness/drafts/change-reviewer-phase12-try2.md`, 26-11-2026) put a full `<example>` block in its description, which loads every session, against `templates/agent.md` (one `Example: … → …` line) and D55; `WRITING-GUIDE.md` § *Agents* does not say how the description line and the body's *Example* differ | yes | no | P3 | S | ~3k | [x] 27-11-2026 | None — rule in `WRITING-GUIDE.md` § *Agents* and `templates/agent.md` (D57) |
| B44 | Claude deleted its own scratch files without approval | Found 27-11-2026 (Phase 14 WP1): while renaming test folders, Claude ran `rm -f` on two diff files it had made minutes earlier in the Phase 14 drafts folder (named seeded.diff and clean.diff, now gone), replaced by change-a.diff and change-b.diff. `STANDARDS.md` § *What may happen without asking* already forbids any delete without approval; there is no exception for Claude's own just-created scratch files. Rule (Amit, 27-11-2026): Claude's own just-created scratch files are replaced or deleted only with approval, unless Amit changes the rule. First logged case (the ladder's first step). Second case: 27-11-2026 (S3.0): ran P1 on the setup output before Amit's agreed 'done' | yes | no | P3 | S | ~2k | [~] | propose a one-line instruction (Amit to agree the wording) |
| B45 | `change-reviewer` claimed files read that it never opened | Found 27-11-2026 (Phase 14 WP2, P1 retry): "Facts checked" said RULES.md:5, README.md:15, report.py:20 and test_hours.py:18 were "read in the change-a files". Its transcript shows it read only the brief and `change-a.diff`, plus one Glob for RULES.md; none of those four files was opened. The same line admits the line numbers came from diff hunk offsets. The findings themselves were true . Second case, 27-11-2026 (P2 re-run): "Facts checked" claimed `RULES.md`, `report.py` and `test_hours.py` were read; the transcript shows only the brief, the diff, `hours.py` and `README.md` were opened, and the cited `report.py:58` is a diff line number (the file has 23 lines) | yes | no | P3 | S | ~3k | [x] 27-11-2026 | None — *Files opened* slot, `diff:<n>` rule and requester log check (B45 fix); fresh-session test P1, P2, P3 passed 27-11-2026, every *Files opened* entry in its log (D57) |
| B46 | Agent template and `plan-reviewer`: unused numbered finding slots | Found 27-11-2026 (Phase 14 WP2, P2 re-run): the report skeleton did not say what happens to the numbered finding lines when only Nits are found. `agents/change-reviewer.md` § *Report* now says "Delete unused numbered lines too." (Amit, 27-11-2026); `templates/agent.md` and `agents/plan-reviewer.md` § *Report* do not yet say the same, so `plan-reviewer`, or a new agent built from the template, could repeat the gap | yes | no | P4 | S | ~2k | [x] 27-11-2026 | None — line added to both in the B45 fix; P3 test 27-11-2026 passed with the line in place (D57) |
| B47 | Agent description example line must not name the agent itself | Found 27-11-2026 (Phase 14 cross-check, O2): `templates/agent.md` says the description's example line "does not name the agent itself"; `WRITING-GUIDE.md` § *Agents* item 1 lacks that rule, so the two disagree | yes | no | P4 | S | ~1k | [x] 27-11-2026 | None — phrase added to `WRITING-GUIDE.md` § *Agents* item 1 (D58 T8) |
| B63 | Skill-header parse check in `harness/doc-check.sh` | Found 27-11-2026 (S2.0 early check): two skill headers did not parse as YAML — an unquoted `: ` in the description (`skills/wrap-up/SKILL.md` line 3, `skills/send-for-review/SKILL.md` line 4); wrap-up's description never loaded, and both passed session 1 and its review. Fixed with ` —`; no check catches the next one | yes | no | P2 | S | ~3k | [ ] | Add a check that parses every `skills/*/SKILL.md` header and warns on failure; not built in the S2.0 fix task |
| B64 | Claude assumed pronouns for Amit (second case after B41) | Found 27-11-2026 (Phase 15 S2.0 retest): the chat handoff said "Once he names it" and "Wait for him"; Amit's pronouns are not stated anywhere. First case: B41 (agent text, fixed 27-11-2026). Second case, so the next rung | yes | no | P3 | S | ~2k | [ ] | Propose one line in `WRITING-GUIDE.md`: refer to Amit by name or "they", never an assumed pronoun. Not `STANDARDS.md`: it loads every session and measure 6 already fails |
| B65 | Unchecked data claim before an Ollama decision | Found 27-11-2026 (S2.0 retest): Claude said "The Vthru projects hold real data" without reading `PROJECTS.md` § *Project data*, which says only VT holds real data; Emp Portal (Vthru-Emp) uses dummy data. The claim was partly wrong. First case | yes | no | P3 | S | ~1k | [ ] | No new text now: `OLLAMA.md` already points to that section. On a second case, propose one line in the `ollama` skill |
| B66 | Handoff presented an unapproved measure as agreed, and called drift "Known" without a check | Found 27-11-2026 (S2.0 retest): the chat handoff's *Goal / success measure* gave a measure Claude wrote, never approved by Amit; its *Noting* list called the Voice-Flow and Emp portal drift "Known" unchecked (it is in `harness/status.md` § *Open*, so true, but not checked). First case | yes | no | P3 | S | ~1.5k | [ ] | One line in `skills/handoff/SKILL.md` step 4: "If no measure was agreed, write *proposed, not approved*; say where each 'known' claim was checked" |
| B67 | Claude trusted a summary instead of the source | Found 27-11-2026 (Phase 15 S2.0), three cases in one session, each one read away from the source: (1) did not read `harness/status.md` at Orient (`.claude/CLAUDE.md`), treating the first S2.0 probe as a simple task, so the vague `documents` and `ollama` probes were not flagged before they failed; (2) recommended `/skills` for built-in skills from the one-line memory index, without opening the note; `/skills` does not list them; (3) gave the key `ship` before checking, while saying it was unsure; the real name is `ship-local`. First logged case. Second case, 27-11-2026 (Phase 15 wrap-up): a keyboard shortcut given from memory (recorded in `.claude/current-task.md`) | yes | no | P2 | S | ~2k | [~] | Applied (Amit, 27-11-2026): `harness/session-check.sh` prints the next gate every setup session; memory note `skill-overrides-name-only.md` and its index line corrected. Second case logged: propose the one-line rule (Amit to agree the wording) |
| B68 | Skill loaded after work started | Found 27-11-2026 (Phase 15 S2.0 probe 1): on "check `templates/handoff.md` before I restructure it", Claude read the file and ran three searches before loading `documents`, treating it as a simple read; the description matched from the start. First logged case | yes | no | P3 | S | ~1k | [ ] | Logged at the lowest rung, no change now. On a second case, propose one instruction line |
| B69 | `*git -* -c *` ask rule over-matches | Found 27-11-2026 (S3.0 P6): `git -C <dir> switch -c y` boxed on `Bash(*git -* -c *)` in auto mode; the rule cannot tell `switch -c` from `git -c`. Same pattern, not tested: `git -C <dir> log -c`; read-only `git config --get` and `git --exec-path` also box (S2.3 review) | yes | no | P3 | S | ~10k | [ ] | Amit decides whether and how to narrow the rule; a rule change needs a plan, `rtk hook check` on every spelling and new box tests |
| B70 | Box probe sent without asking Amit to watch | 27-11-2026 (S3.0): P1 and P3 sent without 'watch for a box'; results unknown; both rerun. The rule exists (`STANDARDS.md` § *Evidence, not assumption*: ask for the box text). First case | yes | no | P3 | S | ~1k | [ ] | No new rule text now. On a second case, propose one instruction line (`WRITING-GUIDE.md` § *Rule plus case*) |
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
- **Decision:** fix plan approved by Amit 06-11-2026 — ASK rules, not deny; built in Phase 15 (D58 T2, `6e83018`), box-tested 27-11-2026; closed. Remaining routes: `ENVIRONMENT.md` § 3 *Known gaps*
- **Detail:** same root as F1. A security risk, unlikely in normal use: it needs a deliberate odd command.

## Deferred

| ID | Item | Recheck date |
|---|---|---|
| B4 | TypeScript code helper — does `typescript-lsp` support TypeScript 7? | 05-01-2027 |
| B12 | Own post-edit checker (Kotlin, lint, project checks; must not clash with B4) — P3 · M · ~30k | Phase 20 (D58 T9): a project code checker, not Claude Setup |
| B18 | rtk update | 05-01-2027 |
| B48 | L1 kit 1 + 3: pre-commit with gitleaks for projects — P4 · M · ~30k (D58) | Phase 20; needs an install and a new-tool check (B26) |
| B49 | L2 kit 51: stale-branches script — P4 · S · ~10k (D58) | Phase 20 (projects use feature branches) |
| B50 | L3 kit 72: resolve-conflicts skill — P4 · M · ~20k (D58) | First real merge conflict in a project |
| B51 | L4 kit 34: destructive-git guard hook — P4 · S · ~10k (D58) | A destructive git command gets past the ask rules |
| B52 | L5 kit 31: main-checkout switch guard — P4 · S · ~10k (D58) | Amit runs several sessions on one repo |
| B53 | L6 kit 36: sub-agent push guard — P4 · S · ~10k (D58) | Any helper gets a shell tool |
| B54 | L7 unproven-excuse hook — P4 · S · ~10k (D58) | First logged case (`wrap-up` records it) |
| B55 | L8 kit 35 part 2: no shell writes into `.claude/` or memory — P4 · S · ~10k (D58) | First logged case (owner: `wrap-up`); recheck at the Phase 16 audit |
| B56 | L9 kit 53: hook wiring in `settings.json` — P4 · S · ~5k (D58) | With the first new Claude Code hook |
| B57 | L10 old candidate skills: testing, feature-brief, debugging-method, documentation-update, project-onboarding, release-checklist, agent-quality-review — P4 · M · ~25k (D58) | Phase 16 audit: the S1.2 gap check (not run in Phase 15) — a real gap brings it back; otherwise it stays here with "covered by …" |
| B58 | L11 researcher helper (Phase 14 addition) — P4 · M · ~20k (D58). **Merged into B74, 28-11-2026 (D59)** | See B74 |
| B59 | Kit 23 job-to-helper routing table (Phase 14 addition) — P4 · S · ~5k (D58) | With any future worker-agent decision (I4) |
| B60 | Skill tiers: daily = on, sometimes = `name-only`, rare = `user-invocable-only` (D28; earlier "no skill folders by P1–P4", `SETUP-PLAN.md` Phase 8–9 notes); saves about 100–300 tokens a session (estimate) — P4 · S · ~5k (D58). Part pulled forward into D58 (Amit, 27-11-2026): `ship-local` and `steward` set to `user-invocable-only` | With the `STANDARDS.md` rewrite (Phase 17) |
| B61 | Lighter agents: recheck what each agent file carries — P4 · M · ~15k (D58) | Phase 16 audit, then the rewrite phases |
| B62 | Recheck reviewer word limits (5 of 7 first reports over the limit on 27-11-2026; each fit after one retry) — P4 · S · ~5k (D58) | Phase 16 audit, with B61 |
| B71 | Coder agent — future work, not scheduled (D59). Job: build the smallest approved change. Inputs: approved plan, named files, project facts file. Output: the change and a short report (files, checks, open items). Use: approved work too large for the main session, or independent parts. Not for: unapproved work, design choices, risky changes. May read: only files named in the plan. Run about 30–80K, about 120 tokens every session once built (estimates). Never approves, commits, pushes, deletes, installs, publishes, deploys, changes permissions or bypasses a box. Building it also triggers B53 and I5 (a shell can commit and push) | Phase 20 or later; trigger: a logged case of the main session running out of context while building |
| B72 | Tester agent — future work, not scheduled (D59). Job: write and run only the tests that prove the approved goal. Inputs: goal, success measure, changed files. Output: tests, run output, pass/fail against the goal. Use: testing would overload the main session. Not for: weakening a test, testing outside the goal. May read: changed files, tests, the goal. Run about 20–60K, about 120 every session (estimates). Same never-list as B71; also triggers B53 and I5 | Phase 20 or later; trigger: a logged case of missed tests or context overloaded by test runs |
| B73 | Documentation-writer agent — future work, not scheduled (D59). Job: update only docs an approved change affects. Inputs: the diff, affected docs from the map. Output: updated docs and links checked. Use: after an approved change whose affected docs the map lists. Not for: new docs, rule files. May read: the diff and those docs. Run about 15–30K, about 120 every session (estimates). Same never-list as B71 | Phase 20 or later; trigger: a logged case of docs left stale after an approved change (`wrap-up` logs it) |
| B74 | Business-analyst agent — future work, not scheduled (D59); merges B58. Job: business, market, product, customer, competitor, pricing or similar analysis when Amit asks. Inputs: the question, named sources, limits. Output: short findings with sources and one recommendation. Use: research that needs a recommendation, when Amit asks. Not for: building anything; private data. May read: named sources; the web only if the plan approves. Run about 40–100K, about 120 every session (estimates). Same never-list as B71 | Phase 20 or later; trigger: the same kind of analysis asked for 4 times |
| B76 | `AGENTS.md` for Amit's other AI tools — future work (D59) | After Phase 19; trigger: Amit uses another AI tool on a project regularly |
| B77 | Remove the 9 Office notes already on GitHub (5 DB1, 4 DB2) from git history (D59) | Amit's separate decision and approval; history rewrite is hard to undo |
| B78 | Full VOS Dashboard setup (`~/Documents/VS Code/VOS Dashboard`): rules backup, `Area: Office` line (D59) | Phase 20 |

## Known and accepted

| ID | Item | Reason |
|---|---|---|
| B22 | Status-line simplification | 84 lines, no network, no token cost; not worth it (C6) |
| B23 | Re-read returns the whole file (Claude Code 2.1.317) | No setting; Claude avoids re-reading unchanged files (C5) |
| B24 | A separate checker helper | **Closed 27-11-2026 (D57, I8):** built as `plan-reviewer` and `change-reviewer` (Phase 9, D52) |
| B25 | Engineering skills not copied (`testing-strategy`, `tech-debt`, `incident-response`, `standup`, `code-review`, `debug`, `documentation`) | **Closed 27-11-2026 (D58 T7):** built-in `code-review`, `security-review`, `simplify` and our rules cover them |
| B26 | gitleaks and markitdown network behaviour not verified from source | Checked when each tool's trial starts |
| B27 | Box-test gaps — old IDs F1, F3, F4, F6 and 30-10 T1–T3 (wrapped commands, auto-mode blocks, `git remote -v add`, `git -c` alias, more `.env`/`~/.ssh` read denies, `git stash pop/apply` outside `~/.claude`, one-line box explanations) | Value bar, 30-10-2026; F1 (`git -c` alias) closed 27-11-2026 by B21; F3 mostly fixed by D44 (limits in `ENVIRONMENT.md` § 3). Detail: `baselines/status-completed-11-11-2026.md` § *Open* |
| B28 | GitHub write commands not separately boxed (old F2) | 0 historical uses; auto mode is a second guard (30-10-2026). If asked later, propose only `gh release create\|delete`, `gh secret set\|delete`, `gh workflow run` |
| B29 | Allowed test/build commands (`./gradlew *` and similar, 4 projects) can run any code (old C8) | A normal development trade-off (Amit, 01-11-2026) |
| B30 | Claude Desktop's own bypass toggle (old C9) | Left as it is (Amit, Team plan, 01-11-2026); bypass is off in Claude Code (D45) |
| B75 | Separate Office Claude setup (a second config only for Office) | Not needed, 28-11-2026 (Amit, D59): Claude's suggestion, not Amit's request; project separation and keeping Office notes off GitHub cover the need today |
| B31 | A per-project `SessionStart` drift check | Rejected 10-10-2026 (Amit): a project session would reach into `~/.claude` (D23, D31); the setup-session check catches drift. Revisit if drift goes unnoticed in between |

## Older records

- `baselines/backlog-log-11-11-2026.md` — the numbered-item backlog, done notes, working rules and items 1 and 16 in full, up to 11-11-2026.
