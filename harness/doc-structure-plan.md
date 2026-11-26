# Documentation structure plan

Purpose: Everything agreed with Amit on 10-11-2026 for the documentation structure — goal, global rules, numbering, every file's format, phases and open items — so the work can resume in any session.
Audience: Claude and Amit.
Read when: Starting or resuming any phase of the documentation structure work.
Owner: Claude (decisions are Amit's).
Update rule: Update when a phase starts or ends, or Amit changes a decision. Replace superseded text; history goes to a record.
Related: `harness/status.md` · `harness/backlog.md` (B16) · `SETUP-PLAN.md` (D46, D47) · `DOCUMENTATION-STANDARD.md` · `DOCUMENT-MAP.md` · Amit's original: `~/Documents/Claude setup doc plan.txt`
Status: Phases 1–9 done; Phase 8 (D51) and Phase 9 (D52) complete 25-11-2026 (Amit) — phase order changed 20-11-2026 (D50). Phase 10 plan approved 25-11-2026 (Amit); WP1 next, in a fresh session
Last reviewed: 24-11-2026

---

## 0. Where this stands

- **Agreed:** the goal, global rules, numbering, all formats (Part 4), the phase order and the 14 cross-check additions.
- **Done already:** read everywhere, write only here — D46, commit `a615de6`, pushed 10-11-2026.
- **Phase 1 done 10-11-2026:** T1 `DOCUMENTATION-STANDARD.md`, T2 `DOCUMENT-MAP.md` (in force, D47), T3 12 templates + D47, T34 `harness/doc-check.sh` with the session-start link. Commits `14e5cd1`, `e9bd951`, `c67673d`. Sonnet fact-checks: T1–T2 46.6k, T3 59.1k, fixes taken.
- **Done early:** the outdated D46 line in `templates/project-map.md` (was Phase 2); `templates/new-project.md` changes (T29).
- **Phase 2, Pass 2A (T4–T9) committed as `4f468e6` (11-11-2026). D47 closed 11-11-2026.**
- **Phase 2, Pass 2B (T10–T14) committed as `2ff02bd` (11-11-2026)** — plan and Amit's build-time decisions: § 3 *Pass 2B plan*.
- **Phase 2, T15 committed as `08354ae` (11-11-2026):** old task file copied whole to `baselines/task-history-11-11-2026.md` (`cmp`-verified); task file rewritten to the template shape; live facts to `harness/backlog.md` (B9, B11, B14, B21, new B33, B34) and `harness/status.md`. **Phase 2 (T4–T15) done 11-11-2026.**
- **Phase 3 planned 11-11-2026 (Go 1):** plan approved by Amit — § 3 *Phase 3 plan*; D48 and B35 recorded.
- **Phase 3 (T16–T19) done 11-11-2026 (Go 2):** global `CLAUDE.md` imports + one non-loading comment, D48; `.claude/CLAUDE.md`, `RTK.md`, `OLLAMA.md` in their § 4 formats; each `cmp`-matched to its approved block in `dd76666`. All 7 success checks passed: `baselines/doc-test-after-11-11-2026.md`. D48 and B35 closed.
- **Phase 4 planned 12-11-2026 (Go 1):** T20 plan approved by Amit — § 3 *Phase 4 plan*; B32 decided, B34 to Phase 9.
- **Phase 4 (T20) built 12-11-2026 (Go 2):** `STANDARDS.md` from the approved text (`cmp`-matched, 3,386 words); old text in `baselines/standards-old-12-11-2026.md`; linked updates done; all 8 success checks passed (`baselines/doc-test-after-12-11-2026.md`). Committed as `28b4801`. **Phase 4 done 12-11-2026.**
- **Phase 5 planned 12-11-2026 (Go 1):** T21 plan, final text and decisions approved by Amit — § 3 *Phase 5 plan*.
- **Phase 5 (T21) built 12-11-2026 (Go 2):** `ENVIRONMENT.md` from the approved text (`cmp`-matched), then 11 undated figures labelled and the `RTK.md` mismatch noted — 396 lines, 7,680 words (limit ≤ 7,690, Amit); old text in `baselines/environment-old-12-11-2026.md`; `doc-check.sh` empty-section test now skips code blocks (Amit, 12-11-2026); linked updates done; all 8 success checks passed (`baselines/doc-test-after-12-11-2026-run2.md`). Committed as `5348583` after Amit's review. **Phase 5 done 12-11-2026.**
- **Phases 6 and 7 done** (Phase 6 Voice-Flow pilot; Phase 7 16-11-2026) — `harness/status.md`.
- **Phase order changed 20-11-2026 (Amit, D50):** 8 planning system → 9 reviewer agents and skills → 10 clean-up and rewrite (absorbs the old Phase 8 `SETUP-PLAN.md` split and the old Phase 9 30-day review) → 11 further checks. § 3 *Phase 8* onwards.
- **Phase 8 design saved 23-11-2026 (WP1, D51):** § 3 *Phase 8*. Nothing built.
- **Final plan approved 24-11-2026.** Next step: WP2 in a fresh session, on Amit's word. Start from `.claude/current-task.md` and § 3 *Phase 8*.
- **Phase 9 plan approved 24-11-2026 (WP1, D52):** § 3 *Phase 9*. Next: WP2 in a fresh session, on Amit's word.

## 1. Goal and success measure

**Goal (Amit's words):** every document follows one clear, predictable structure, so it is easy to read, write, update and maintain, for Claude and for a human.
- Results: Claude doesn't forget, the goal stays clear, nothing is made up, the right file gets updated, every project looks the same.
- Fewer tokens is a side effect, not the goal. Not a token-saving rewrite.

**Success measure (Voice-Flow pilot, yes/no each):**
1. The format check passes.
2. A fresh session states the goal, success measure and next step correctly from the documents alone.
3. 5 sample changes (new decision, task done, deferred item, structure change, pause) each update exactly the right file.
4. 10 test questions answered correctly, each naming the file and section it came from.
5. A line-by-line check finds no rule or fact lost.
6. Tokens and files read are recorded — not a target.

## 2. Global rules

**Amit's 7 principles:** one fact one home · current separate from history · links not copies · predictable headings · short testable rules · clear ownership · minimal always-loaded content.

**Five file types:**

| Type | Holds | Rule |
|---|---|---|
| Rules | How to work | Short lines, no history |
| Reference | Facts as they are now | Each topic: what it is, current setting, how to check, how to change |
| State | Where things stand now | Overwritten, never added to |
| List | Tasks, decisions, backlog, tests | One row per ID |
| Record | History | Dated, never edited |

**Headers:**
- Full: Purpose · Audience · Read when · Owner · Update rule · Related · Status · Last reviewed
- Short: Purpose · Owner · Update when · Related
- List files also show `Next ID:`
- None: always-loaded files (global `CLAUDE.md`, `STANDARDS.md`, `RTK.md`, `OLLAMA.md`, `.claude/CLAUDE.md`, project `CLAUDE.md`, `MEMORY.md` index)

**Numbering (same in every file and every project):**

| ID | Means | Rule |
|---|---|---|
| Phase 1, 2… | A block of work | Replaces Step, Stage, Wave, Session |
| T1, T2… | A task | Never renumbered; keeps its number when moved to another phase |
| T12.1… | Steps inside a task | Only inside a task's plan |
| B1, B2… | Backlog item | Once planned, its row says "→ T15" |
| D1, D2… | Decision | Lists the exact files it affects |
| TC1… | Test | Replaces the clashing "T" tests |
| P1–P4 | Priority (not an ID) | Existing scale |
| S / M / L | Size | |

- Project codes for cross-project references: VF Voice-Flow · FN FinNode · EP Emp Portal · DB1 vthrudebugger_v1 · DB2 Debugger v2 · CS Claude Setup. Example: "VF-T12", "CS-D46".
- Old IDs (C1, CL3, S4, item 16…) stay as they are in old records.
- Status marks: `[ ]` to do · `[~]` in progress · `[x]` done · `[!]` blocked · `[-]` deferred. Dates: DD-MM-YYYY.

**Progress line at the top of every roadmap:**
```
Progress: Phase 2 of 5 · Phase 2: 6/10 (60%) · Project: 23/48 (48%) · Backlog: 14 (2×P2) · Updated: DD-MM-YYYY
```
Counts tasks done / tasks planned. Backlog items are not counted.

**Phase rules:**
- A phase's scope is fixed when it starts.
- New issues found during work go to the backlog.
- Only a blocking P1 or P2 joins the current phase, with Amit's OK.
- Moving a task to a later phase keeps its ID and adds a one-line note (date, why).
- A phase with more than about 12 tasks gets reviewed.

**Growth (rollover):**
- Done tasks → `ROADMAP-DONE.md`, closed backlog items → `BACKLOG-DONE.md`, superseded decisions → `DECISIONS-OLD.md`. One line is left behind for each.
- Done files split by year when they grow.
- Every live file ends with an "Older records" list, one line per old file.
- Triggers: about 300 lines, or 10 done rows. Claude proposes, Amit approves, a line-count check confirms nothing lost.
- Large reference docs split by topic.
- Claude reads old files only when a one-liner points there.

**Naming:** standard files in capitals (`ROADMAP.md`, `BACKLOG.md`, `DECISIONS.md`, `PROJECT-MAP.md`); other docs lowercase-with-dashes; templates lowercase. A table maps old names to new. Case-only renames on macOS need two `git mv` steps.

**Safety:**
- No personal data in docs or memory — IDs or counts only.
- Every project's task file is ignored by git.
- Records are never edited, except to redact a leaked secret: `[REDACTED DD-MM-YYYY, D<n>]`, then rotate the secret.
- Record files are `.md`, or named in `.gitignore`.
- Project docs are committed to project repos: raise before any repo goes public.

**Integration:**
- One home per fact; other files refer to it by ID.
- Header "Related" plus the map's "Depends on" show which files to check when one changes.
- A decision is closed only when every file in its "Affected" list has been checked.
- Markdown cannot auto-sync; IDs and links do the job.

**Format check:** warn-only script, no AI cost. Checks headers, section order, IDs and Next ID, dead links, duplicates, size limits, "None yet" in empty files, task file ignored by git, secret patterns in project docs, files affected by a decision. Runs at each setup session start and in each project's commit check.

**Empty files:** all project files are created at setup even if empty (Amit's decision); empty content is exactly "None yet".

**Improvement after use:** formats change only from real cases, logged in the backlog, each change recorded as a D-number. 30-day review (Phase 9).

## 3. Phases and tasks

Totals: 34 tasks in 9 phases — 14 × P2, 12 × P3, 8 × P4. Each phase runs in its own session, about 250K or less.

### Phase 1 — Foundation
| ID | File | New / update | Priority |
|---|---|---|---|
| T1 | `DOCUMENTATION-STANDARD.md` | New | P2 |
| T2 | `DOCUMENT-MAP.md` | New; replaces 3 old maps (needs a new D-number — supersedes item 16's "setup map = overview.md") | P2 |
| T3 | `templates/` | Mix — see below | P2 |
| T34 | `harness/doc-check.sh` | New | P2 |

T3 templates: **update** `handoff.md` (task-file template; keep the name — `STANDARDS.md` links to it), `roadmap.md`, `deferred-improvements.md` (backlog), `project-map.md`, `new-project.md` (T29). **New:** `roadmap-done.md`, `backlog-done.md`, `decisions.md`, `decisions-old.md`, `project-claude.md`, `reference-doc.md`, `record.md`. Every new file gets an allow line in `.gitignore`.

### Phase 2 — Small setup files
| ID | File | Priority |
|---|---|---|
| T4 | `README.md` | P3 |
| T5 | `harness/status.md` (old log → record) | P2 |
| T6 | `harness/backlog.md` (B-numbers) | P2 |
| T7 | `harness/cross-check.md` (header only) | P4 |
| T8 | `harness/models.md` | P3 |
| T9 | `harness/overview.md` | P3 |
| T10 | `PROJECTS.md` | P3 |
| T11 | `REPOS.md` | P4 |
| T12 | `baselines/global-open-tests.md` (TC-IDs; fix outdated D46 line) | P3 |
| T13 | `archive/README.md`, `baselines/README.md` | P4 |
| T14 | Record files (new only; save the 2 `.json`/`.py` records in `.gitignore`) | P4 |
| T15 | `~/.claude/.claude/current-task.md` (525 lines → sorted into homes, history to a record) | P2 |

Also: ~~fix the outdated D46 line in `templates/project-map.md`~~ — done early in T3 (10-11-2026).

#### Pass 2B plan — T10–T14 (approved by Amit 11-11-2026; build in a fresh session)

**Goal (Amit's words):** every document follows one clear, predictable structure — here for T10–T14.

**Success checks (yes/no each):**
1. `harness/doc-check.sh` shows 0 real warnings for the five files (the known template-header false alarm aside).
2. Every moved block is copied word for word and verified with `cmp`.
3. A fresh Sonnet line-by-line check finds no fact lost and none duplicated in the wrong place.
4. Every pointer into these files still resolves, including "open test 6", "open test 3" and "items 9 and 10".

**Steps:**

| Step | File | Change | Size · tokens |
|---|---|---|---|
| 0 | `harness/status.md`, this file | Mark Pass 2B in progress when the build starts | S · ~3k |
| T10 | `PROJECTS.md` | Short header; one table `Code · Name · Path · Status · Has CLAUDE.md · What it is · Data warning`; check each path still exists (read-only; last checked 20-09-2026); keep *Not projects* | S · ~10k |
| T11 | `REPOS.md` | Short header; one table `Area · Repo · What for · Free · Telemetry checked`; unknown = "not checked", never guessed | S · ~5k |
| T12 | `baselines/global-open-tests.md` | Full header + Next ID; test n → TCn (same number); long detail moved word for word to a dated record; fix the outdated "these rules forbid opening another project" line (D46). **Before renaming, search the repo for every reference to the old test numbers** ("open test n", "item n", "items 9 and 10") and update live pointers | M · ~30k |
| T13 | `archive/README.md`, `baselines/README.md` | Short header; index table `File · Date · What it records` at the top; existing guidance kept below it | S · ~12k |
| T14 | Record files | New records use the record header; old records never edited. Name `baselines/s4-proposal-30-10-2026.json` and `baselines/s4-replay-30-10-2026.py` in `.gitignore` as deliberately local — comment only, not tracked (their content is embedded in `s4-permissions-30-10-2026.md`) | S · ~5k |
| Check | — | Add the five files to `CHECKED` in `harness/doc-check.sh`; run it after every file change; then the fresh Sonnet check | ~60k |

**Total:** about 125k tokens — one fresh session.
**Model:** Opus — Amit's deliberate choice for the build session (11-11-2026). The fresh read-only check after the build stays Sonnet.
**Plan cross-check:** not needed — formats were cross-checked in Phase 1; the check after the build covers lost facts.

**Decisions (Amit, 11-11-2026):**
- AtWorkpe's project code is **AW**.
- `archive/README.md` and `baselines/README.md`: index table at the top, existing guidance kept below.
- The two `.json`/`.py` files are named in `.gitignore` as deliberately local, by comment only; not tracked.

**Build-time decisions (Amit, 11-11-2026):**
- The build runs on Opus (see *Model*).
- The stale D46 line in `baselines/README.md` is fixed in T13; its old wording goes to a new record.
- Test pointers are updated in `ENVIRONMENT.md` (pointers only; no T21 work) and in live parts of `SETUP-PLAN.md`; historical passages and records stay unchanged.
- The `harness/session-check.sh` comment "open test 2" stays as it is (legacy reference, still resolves via the old-number column).
- `global-open-tests.md` keeps how to run, expected outcome, latest result and open limits live; only history moves to the record. Unknown = "not recorded".
- Project paths: one read-only retry through the normal permission box; if blocked, marked unverified.

**Rules for the build:** moved text is copied word for word and verified; one fact, one home; `None yet` for empty sections; no commit until Amit reviews; Phase 2 is pushed as a whole when it ends.

### Phase 3 — Always-loaded rule files
| ID | File | Priority |
|---|---|---|
| T16 | Global `CLAUDE.md` — eight-line comment cut to one line (D48); imports unchanged | P4 |
| T17 | `.claude/CLAUDE.md` | P3 |
| T18 | `RTK.md` | P4 |
| T19 | `OLLAMA.md` | P4 |

#### Phase 3 plan — T16–T19 (approved by Amit 11-11-2026; built 11-11-2026 in Go 2)

**Goal (Amit's words):** every document follows one clear, predictable structure — here the always-loaded rule files.

**Success checks (yes/no each):**
1. Each file matches its format in § 4 (T16–T19), with T16 as amended by D48.
2. The rule-by-rule map below holds: every rule kept or moved, none dropped, none changed in meaning.
3. Always-loaded words (`wc -w` over global `CLAUDE.md`, `STANDARDS.md`, `RTK.md`, `OLLAMA.md`, `.claude/CLAUDE.md`, setup `MEMORY.md`) at 4,030 or lower; baseline 4,101 (11-11-2026). Accepted (Amit): about 14 more words actually loaded — the cut is the comment, which never loads.
4. `harness/doc-check.sh` shows no new warning (baseline: 1 known template-header warning).
5. A fresh read-only Sonnet check finds no rule lost.
6. A fresh session still loads the three imports (`/memory` or `/context`, run by Amit).
7. Doc-test: fresh before against fresh after — answers match except the allowed differences below.

**Decisions (Amit, 11-11-2026):**
- Keep one non-loading HTML comment in global `CLAUDE.md` — D48; backlog B35 authorises the `DOCUMENTATION-STANDARD.md` line-51 change. Both close in Go 2 after D48's five affected files are checked.
- Run the doc-test before and after. Questions and method from `baselines/doc-test-before-01-11-2026.md`, word for word. Compare the new before against the new after. Allowed differences: line numbers inside the four rule files, and Q10 if it cites `.claude/CLAUDE.md`. The comparison with 01-11-2026 is reported as information only.
- Accept the drafts as written, including the bullet form of `OLLAMA.md`.
- `RTK.md` keeps its `rtk proxy` heading: `baselines/global-open-tests.md` TC2 points to it (cross-check finding).

**Cross-check (11-11-2026):** one fresh Opus agent, read-only, 46.2k measured. Verdict: all 6 checks reachable after two fixes — keep the `rtk proxy` heading (taken); square the comment with "imports only" (D48). No rule lost.

**Link check (Go 1, `git grep`):** one live section pointer into these files — TC2 → `RTK.md` § *`rtk proxy`*, kept. Still true, no change: `STANDARDS.md` lines ~49 and ~273, `harness/overview.md` lines 12–14, `DOCUMENT-MAP.md` rows 20–24, `harness/status.md` line 5, `harness/models.md`, `PROJECTS.md`, `skills/ollama/SKILL.md`, the four setup memory notes. No `project-rules/` copy points at them.

**Rule-by-rule map:**

| # | Rule now (file, line) | Result | New place |
|---|---|---|---|
| G1 | Three imports (`CLAUDE.md` 1–3) | kept exactly | lines 1–3 |
| G2 | "Not imported on purpose … every @import re-read every turn" (`CLAUDE.md` 5) | shortened | the one comment line |
| G3 | Six file entries (`CLAUDE.md` 6–11) | already in `DOCUMENT-MAP.md` | its rows for those files |
| S0 | Title (`.claude/CLAUDE.md` 1) | kept | title |
| S1 | Home of Claude Setup; still project mode (3–4) | kept | intro under the title |
| S2 | At Orient read `harness/status.md` (5) | moved | § At session start |
| S3 | Session-start warning first (8) | moved | § At session start, first |
| S4 | Plan includes status update, cross-check, next gate (6–7) | moved | § While changing setup |
| S5 | `session-check.sh` read exception (9–11) | moved | § Reaching into a project |
| S6 | Editing a project's `CLAUDE.md`, `/add-dir`, uncommitted, report path (12–19) | moved, split into 3 bullets; "From a `~/.claude` session" dropped as implied by the file; "I approve" → "Amit approves" | § Reaching into a project |
| S7 | `~/.claude` commits to `main` (20–21) | moved | § Git for ~/.claude |
| R1 | Purpose, `rtk gain` (`RTK.md` 3) | kept | purpose line |
| R2 | What the hook rewrites (3–6) | bullet | top list |
| R3 | Prefer the plain form (6–7) | bullet | top list |
| R4, R8 | `ENVIRONMENT.md` § 1 pointers (7, 15) | merged | Detail line |
| R5–R7 | `rtk proxy` rules (11–14) | kept | same heading |
| O1 | What `ollama-do` is, and when (`OLLAMA.md` 3–5) | split | purpose line + "Use it for" bullet |
| O2 | Never send it … (7–8) | kept | bullet |
| O3 | Never use it for … (8–10) | kept | bullet |
| O4 | Load the skill (12) | kept, path added | last bullet |

**Final texts** (global `CLAUDE.md` 23 words, `.claude/CLAUDE.md` 246, `RTK.md` 149, `OLLAMA.md` 105, `DOCUMENTATION-STANDARD.md` line 51): built 11-11-2026, see the files. Approved text: `git show dd76666:harness/doc-structure-plan.md`; old text: `baselines/always-loaded-old-11-11-2026.md`.

**Go 2 steps** (Opus; each rule-file edit gets a four-line explanation — what it does, what changes, risk, undo — before it runs):

| Step | Work | Tokens |
|---|---|---|
| 0 | Orient from `.claude/current-task.md` and this section only. Precondition: `HEAD` is the Go 1 commit; the only uncommitted files are the known Voice-Flow and vthrudebugger_v1 ones. If either fails, stop and report. | ~8k |
| 1 | Before: `wc -w` (expect 4,101) · `doc-check.sh` (expect the 1 known warning) · link grep | ~3k |
| 2 | Doc-test before, before any edit: fresh Sonnet agent, read-only, the 10 questions word for word; Amit runs G1 in a fresh session and pastes the reply → `baselines/doc-test-before-<DD-MM-YYYY>.md` | ~45k |
| 3 | Old text → `baselines/always-loaded-old-<DD-MM-YYYY>.md` (record header; the four files and old line 51, each in a four-backtick block named by path); `cmp` every block against the live file; all identical before any edit | ~4k |
| 4 | Edits, one at a time, `doc-check.sh` after each: T16 `CLAUDE.md` → `DOCUMENTATION-STANDARD.md` line 51 → T17 → T18 → T19, using the final text above | ~12k |
| 5 | Linked updates: `doc-check.sh` CHECKED gets `CLAUDE.md\|none\|\|`, `.claude/CLAUDE.md\|none\|At session start;While changing setup;Reaching into a project;Git for ~/.claude\|`, ``RTK.md\|none\|`rtk proxy`\|``, `OLLAMA.md\|none\|\|` · `DOCUMENT-MAP.md` row 20 → "Imports the three always-loaded rule files, plus one non-loading HTML comment pointing here (D48)" · this file: § 0, § 4 T16 and § 6 item 3 get "+ one non-loading comment, D48"; the final-text blocks above replaced by "built, see the files" · `baselines/README.md`: 3 index rows · `harness/status.md` · D48 closed in `SETUP-PLAN.md` · B35 closed | ~8k |
| 6 | After: `wc -w` ≤ 4,030 · `doc-check.sh` no new warning · link grep (TC2 resolves) · doc-test after (Sonnet agent; Amit runs G1 and `/context` in one fresh session) → `baselines/doc-test-after-<DD-MM-YYYY>.md`, compared with step 2 · fresh read-only Sonnet "no rule lost" check, old-text record against the new files | ~65k |
| 7 | Stop — Amit reviews. Commit on his word only; no push. Never quote draft lines in `.claude/current-task.md` (the duplicate-line check would warn) | ~3k |

**Total:** about 140–150k (main session ~45k; doc-lookup agents ~85k, as the 01-11-2026 run measured 42.4k; "no rule lost" agent ~15–20k).
**Not in scope:** `STANDARDS.md` (T20) · `ENVIRONMENT.md` · memory files · settings and permissions · project files · B32, B34 · push.

### Phase 4 — `STANDARDS.md`
| ID | File | Priority |
|---|---|---|
| T20 | `STANDARDS.md` — regroup; replace "a project with its own roadmap or backlog keeps it"; word count must not rise (3,391 on 10-11-2026) | P2 |

#### Phase 4 plan — T20 (approved by Amit 12-11-2026; built 12-11-2026 in Go 2)

**Goal (Amit's words):** every document follows one clear, predictable structure — here `STANDARDS.md`.

**Success checks (yes/no each):**
1. Nine `##` sections in this order: Communicate · Choose the project · Run a task · Safety and approval · Quality · Documents · IDs and progress · Git · Models. Every old section name except *Write plainly* stays as a `###` heading, so old pointers resolve.
2. The rule-by-rule map below holds: nothing lost, weakened or changed in meaning; only the approved drops (D1–D5) and rewordings (R1–R4, S1–S4).
3. `STANDARDS.md` at 3,391 words or fewer — approved text: 3,386 (`wc -w`, 12-11-2026); always-loaded total 4,030 → 4,025.
4. `harness/doc-check.sh`: still only the 1 known warning; "not yet in format" 4 → 3 once `STANDARDS.md` is in CHECKED.
5. Link grep: the 4 pointer lines below updated; every other pointer resolves.
6. A fresh read-only Sonnet check, old-text record against the new file, finds no rule lost.
7. A fresh session still loads the three imports (`/context`, run by Amit).
8. Doc-test after matches `baselines/doc-test-after-11-11-2026.md` (reused as "before", Amit 12-11-2026). Allowed differences: line numbers and section names inside `STANDARDS.md` (e.g. P1–P4 now under § *IDs and progress*).

**Decisions (Amit, 12-11-2026):**
- Nine sections and the moves as listed in the map; old names kept as `###` headings.
- Roadmap contradiction: verified results in the roadmap; decisions in `DECISIONS.md`; Claude Setup's in `SETUP-PLAN.md` until T30 (removal trigger on T30's row). `DOCUMENTATION-STANDARD.md` lines 138 and 171 unchanged.
- Status marks are pointed to (`DOCUMENTATION-STANDARD.md`), not copied.
- B32: leave as history; existing rules already cover the useful parts. B34: deferred to the 30-day review (Phase 9); no B34 change in Phase 4.
- D1–D5, R1–R4 approved as proposed; cross-check fixes S1–S4 approved; one line per paragraph (keeps the file under the checker's 300 lines).
- Doc-test: no new before run; reuse `baselines/doc-test-after-11-11-2026.md`.

**Cross-check (12-11-2026):** one fresh Opus agent, read-only, 69.0k measured. Verdict: reachable after 2 must-fix and 5 should-fix items, all taken — step 8 back to "roadmap" only; `DOCUMENTATION-STANDARD.md:138` added to the link list (no change needed); S1–S4 below; T30 removal trigger. Word count, section structure, `doc-check.sh` fit (177 lines) and pointers confirmed.

**Link check (`git grep`, 12-11-2026):** must change — `DOCUMENTATION-STANDARD.md:69` and `harness/backlog.md:8` and `templates/deferred-improvements.md:25` (P1–P4 → § *IDs and progress*); `DOCUMENTATION-STANDARD.md:139` (→ § *How a task runs* (Record)). Still resolve, no change: `.gitignore:99`, `DOCUMENT-MAP.md:33-34`, `DOCUMENTATION-STANDARD.md:137,138,195,208`, `ENVIRONMENT.md:171`, `REPOS.md:6`, `harness/cross-check.md:8,35,66,91` (step 4 unchanged), `harness/models.md:8,16,72`, `harness/overview.md:6`, `project-rules/FinNode/CLAUDE.md:11-13`, `project-rules/README.md:11`, all memory notes. Known, not changed in Phase 4: `vthru_debugger_workflow_preferences.md:11` (vthrudebugger_v1 memory) cites § *Plan before building* for rules that partly sit elsewhere — already so before T20.

**Rule-by-rule map** (lines of `STANDARDS.md` at `72eaa6f`; "same" = wording unchanged):

| # | Rule now (line) | Result | New place |
|---|---|---|---|
| 1 | Intro (3–6) | same | top |
| 2 | Write plainly, marker (10–17) | same; heading dropped (D1) | Communicate |
| 3 | When something is unclear (238–243) | same | Communicate |
| 4 | Which project (21–40), Claude Setup (44–49) | same | Choose the project |
| 5 | Small request, small change (53–67); steps 1–7, 9, 10 (71–98) | same; step numbers kept | Run a task |
| 6 | Step 8 (92–93) | R1: "verified results in the roadmap, decisions in `DECISIONS.md` (Claude Setup: `SETUP-PLAN.md` until T30), out-of-task findings in the backlog" | Run a task |
| 7 | Recording (100–102) | moved; R2 + S2: `DECISIONS.md`, `SETUP-PLAN.md` added to the gated list | IDs and progress |
| 8 | Templates (104–107) except 106 | same | Run a task |
| 9 | "A project with its own roadmap or backlog keeps it" (106) | R3 + S3: "A project's existing roadmap or backlog stays its home; new entries follow `DOCUMENTATION-STANDARD.md`." | IDs and progress |
| 10 | Load a capability (111–118) | same | Run a task |
| 11 | Plan before building (147, 153–159) | same, except R4: "Set priority (*IDs and progress*) before dividing the work, then split it…" | Run a task |
| 12 | Priority, size, tokens, P1–P4, name the case (147–153) | moved, same | IDs and progress |
| 13 | Stay on the task (213–220); "Investigate only…" (229–230) | same | Run a task |
| 14 | "another project's issues wait…" (229) | moved, same (S4) | end of Stay on the task |
| 15 | Value bar incl. "security… always raised" (222–226) | moved, same | IDs and progress |
| 16 | "In project mode, out-of-scope findings also go to the backlog when recording is allowed" (228) | D4: dropped, covered by step 8 + Recording gate | — |
| 17 | Backlog item, pending, follow-up verdict (230–234) | moved; D5: "(P1–P4)", "(small, medium, large)" dropped — defined above; "rough tokens to fix" kept (S1) | IDs and progress |
| 18 | What may happen without asking (138–143) | same | Safety and approval |
| 19 | Explaining a permission request (281–331) | same except D2: line 308 "Every risky box that can be foreseen…" dropped, duplicate of 281–283 | Safety and approval |
| 20 | Evidence, Fix the cause, Build the smallest, Reuse + Simple commands, Know what the change touches (161–209) | same | Quality |
| 21 | Before calling anything done (254–256) | same except D3: "— exercised, and what was not verified said" dropped, duplicate of 167–169 | Quality |
| 22 | Docs are products (247–250) | same | Documents |
| 23 | Git (260–277) | same | Git |
| 24 | Which model (122–134) | same | Models |

**Final text:** built; see `STANDARDS.md`.

**Go 2 steps** (Opus; each rule-file edit gets a four-line explanation — what it does, what changes, risk, undo — before it runs):

| Step | Work | Tokens |
|---|---|---|
| 0 | Orient from `.claude/current-task.md` and this section only. Precondition: `HEAD` is the Go 1 commit; the only uncommitted files are the known Voice-Flow and vthrudebugger_v1 ones. If either fails, stop and report. | ~8k |
| 1 | Before: `wc -w STANDARDS.md` (expect 3,391) · `doc-check.sh` (expect 1 known warning, 4 not in format) · link grep | ~3k |
| 2 | Old text → `baselines/standards-old-<DD-MM-YYYY>.md`: record header, then the whole old `STANDARDS.md` word for word; `cmp` the body against the live file — identical before any edit; row in `baselines/README.md` | ~4k |
| 3 | Write `STANDARDS.md` from the block above; `cmp` it against the block; `wc -w` = 3,386; `doc-check.sh` | ~12k |
| 4 | Linked updates, `doc-check.sh` after each: CHECKED gets `STANDARDS.md\|none\|Communicate;Choose the project;Run a task;Safety and approval;Quality;Documents;IDs and progress;Git;Models\|` · the 4 pointer lines · `harness/backlog.md` B32 `[x]` (decision above), B34 next action "30-day review (Phase 9)" · `DOCUMENT-MAP.md` row 21 *Depends on* + `DOCUMENTATION-STANDARD.md` · `harness/status.md` (contradiction closed) · this file: § 0, § 4 T20 (nine sections), the final-text block replaced by "built, see the file" | ~12k |
| 5 | After: `wc -w` (≤ 3,391; total ≤ 4,030) · `doc-check.sh` (1 warning, 3 not in format) · link grep · doc-test after (fresh Sonnet agent, the 10 questions word for word; Amit runs G1 and `/context` in one fresh session) → `baselines/doc-test-after-<DD-MM-YYYY>.md`, compared with `baselines/doc-test-after-11-11-2026.md` · fresh read-only Sonnet "no rule lost" check, old-text record against the new file | ~80k |
| 6 | Stop — Amit reviews. Commit on his word only; no push. Never quote draft lines in `.claude/current-task.md` | ~3k |

**Total:** about 120k (main session ~40k; doc-test agent ~44k; "no rule lost" agent ~35k).
**Not in scope:** `ENVIRONMENT.md` (Phase 5) · memory files · settings and permissions · project files · B34 · push.

### Phase 5 — `ENVIRONMENT.md`
| ID | File | Priority |
|---|---|---|
| T21 | `ENVIRONMENT.md` — history to a record | P3 |

#### Phase 5 plan — T21 (approved by Amit 12-11-2026; built 12-11-2026 in Go 2)

**Goal (Amit's words):** every document follows one clear, predictable structure — here `ENVIRONMENT.md`: easier to use without losing information. Documentation only: no permission, setting, hook, invariant, project file, memory file or behaviour changes.

**Success checks (yes/no each):**
1. Sections in this order: Contents · The two kinds of rule · 1. RTK · 2. Status line · 3. Permissions · 4. Effort on Opus 5.5 · What every session loads · How numbers are measured · The project trees on this machine · Older records. Each tool section has What it is · Current setting · How to check · How to change · Known gaps, in that order. `doc-check.sh` finds them.
2. A fresh read-only "no content lost" check finds no rule, warning, limitation or safety note lost.
3. The old-text record is `cmp`-identical to the old file (below its header).
4. Every figure carries its date and method, or says "not recorded".
5. `ENVIRONMENT.md` ≤ 400 lines and ≤ 7,690 words (`wc -lw`). Changed by Amit, 12-11-2026, Go 2: ≤ 7,300 → ≤ 7,636 because the Go 1 figure was an estimate — the private-store deny rule blocked counting the draft (see *Errors*) — and the approved text measured 7,636; then → ≤ 7,690 because labelling the 11 undated figures (check 4) adds about 30–50 words. Built: 396 lines, 7,680 words. Then → ≤ 7,720 (Amit, 16-11-2026) so the AtWorkpe and Vthru Customer app entries keep their safety facts rather than lose them to the limit; measured 398 lines, 7,711 words.
6. `doc-check.sh`: only the known template warning plus the `ENVIRONMENT.md` size warning (accepted); "not yet in format" 3 → 2.
7. Link grep: `harness/overview.md:23` updated; every other live pointer resolves.
8. Doc-test after matches `baselines/doc-test-after-12-11-2026.md` (reused as "before"); a fresh session still loads only the three imports (`/context`, run by Amit).

**Decisions (Amit, 12-11-2026):**
- One file, about 400 lines; accept the `doc-check.sh` size warning. No split — *What every session loads* and *How numbers are measured* stay in `ENVIRONMENT.md` (Amit's required structure). Rejected: split those two out (~230 lines left); split the project trees (still over 300); move Permissions (the untracked pre-commit hook and a memory note point to "§ 3").
- Numbered tool headings `## 1. RTK`, `## 2. Status line`, `## 3. Permissions`, `## 4. Effort on Opus 5.5`, so "§ 1" / "§ 3" pointers keep resolving.
- One whole-file old-text record, `baselines/environment-old-<Go 2 date>.md`, `cmp`-verified before the live file changes; one row in `baselines/README.md`.
- Doc-test: no new before run; reuse `baselines/doc-test-after-12-11-2026.md`.
- All 4 must-fix and all should-fix items from the cross-check, applied in the final text below.
- gh telemetry stays under § 1, labelled "gh, not rtk".

**Size (`wc`, 12-11-2026):** now 888 lines, 8,801 words. Target ≤ 400 lines, ≤ 7,300 words.

**Section map** (old `ENVIRONMENT.md` lines at `df18bdb`; kind: C current fact · H history · M dated measurement · D duplicate):

| Old lines | Content | Action | New place | Kind |
|---|---|---|---|---|
| 1–8 | Not imported; 7.6k | keep, relabelled (last measured 01-11-2026) | What every session loads | M |
| 10–15 | Earlier import readings | move | record | H |
| 17–20 | Why not imported; PROJECTS/REPOS outside imports | keep | What every session loads | C |
| 22 | Last full review dates | move | record | H |
| 24–25 | Figures state date and method | reword R3 | Contents | rule |
| 27–38 | Old contents list | replaced | Contents | navigation |
| 42–56 | Two kinds of rule | keep | same | rule |
| 62–63 | "Three things…" | reword R2 | Contents | C |
| 67–77 | Hook; hook `allow` vs ask/deny | keep | 1 · What it is | C |
| 79–100 | Rewrite table; adoption 26%; 36.3K floor | keep | 1 · Known gaps | C/M |
| 102–114 | `rtk gain` 09-10; per-command savings | keep | 1 · Current setting | M |
| 116–117 | Monthly savings | move | record | H |
| 119–126 | The catch worth knowing; 615 entries | keep | 1 · Known gaps | C |
| 128–133 | Name collision; `git add --dry-run` | keep; "Moved from `RTK.md`" notes → record | 1 · How to check | C/H |
| 135–144 | Hook audit off (01-11) and on (20-09) | merge R4; "on from 20-09", "As it was", "Either it recurs…" → record | 1 · Current, How to check, How to change | C/H |
| 146–155 | rtk and gh telemetry | keep (R6 B8) | 1 · Current, How to check | C |
| 157–162 | Version policy | split R5 (R6 B18) | 1 · Current, How to change | rule |
| 166–192 | Status line | keep; R3 dates; R7 pointers merged | 2 | C |
| 196–198 | Counts block | keep, dated R22 | 3 · Current | M |
| 200–225 | D46; private stores | split R12, R13 | 3 · Current, Known gaps | C |
| 226–260 | Gist asks; bypass (R11); pre-commit + script | keep | 3 · Current | C |
| 262–274 | S4; setup-only asks | keep | 3 · Current | M/C |
| 276–278 | Earlier-count pointer | → Older records | — | pointer |
| 280–305 | Two local settings files | keep | 3 · Current | C |
| 307–318 | `git add` asks | keep; F1 → Known gaps | 3 | C |
| 320–326 | Why the `rtk ` spellings exist | keep | 3 · How to change | rule |
| 328–344 | `git branch` listing only | keep (R6 B20) | 3 · Current | C |
| 346–352, 359–365 | 18-09 and 22-09 changes | move; tee-directory reason and "a rule that can never fire…" kept (must-fix 1) | record; 3 · `allow` | H/C |
| 354–357 | `allow` 32 → 35 | move; tee reason kept | record; 3 · `allow` | H/C |
| 367–404 | allow/ask/deny contents and semantics | regroup R8, R9 | 3 · What it is, Current | C |
| 406–414 | Mirror has two scripts | keep | 3 · Current | C |
| 416–424 | Effort | split R23 | 4 | C |
| 428–440 | Left out of `ask` | keep; `git commit` row → record (R9) | 3 · Current | C/H |
| 442–468 | `rtk proxy` | merge R10; 30-09 sweep and 18-09 decision → record | 3 · Current | C/H |
| 474–476, 530–533 | History pointers | → Older records | — | pointer |
| 478–499 | 25.2k; no fixed target | keep, relabelled | What every session loads | M |
| 501–528 | 11-10 23k reading, table, baseline | move | record | H |
| 535–546 | Project-work cost 03-10 | keep | What every session loads | M |
| 548–564 | Switched off; plugins | keep; engineering row R14 | same | C |
| 566–590 | skillOverrides; `/skills` file | keep; R15; "Block 4's runbook…" → record | same | C/H |
| 592–595 | Status-line note | drop R17 | — (record) | D |
| 597–633 | How the numbers moved | move; methods warning kept R18 | record; How numbers are measured | H |
| 635–663, 673 | What holds | keep | same | rule |
| 665–671 | Failed prediction | move | record | H |
| 677–687 | Not cut | keep; 8.5k and 10-10 figures → record (R16) | same | C |
| 689–693 | Retention | move R19 | How numbers are measured | C |
| 697–710 | Known gaps | keep | 3 · Known gaps | C |
| 714–722 | Changing any of this | split R21 | tool How to change; backups → Contents | rule |
| 724–750 | Measurement methods | keep; "Every measured number…" | How numbers are measured | method |
| 754–816 | Branch state; duplicate trees; tree decisions | keep | Project trees | C |
| 818–829 | 15-09 corrections | move; rule sentence kept R20 | record | H |
| 831–889 | Sensitive data; project descriptions | keep | Project trees | C |

**Rewordings (only to remove duplication or keep pointers working):** R2 "Three things…" → "Everything below lives in…" · R3 "(date not recorded here)" on 45–54%/3%, curl/rm, 14,048 calls, FinNode 3,748; 48K/588K dated from `statusline/context.py` (15-09-2026) · R4 hook-audit paragraphs merged · R5 version policy split · R6 item 8/18/20 → B8/B18/B20 · R7 status-line pointers merged · R8 deny "68 rules" → 34 + 34 + 6 (`jq` 12-11-2026: 36 / 191 / 74) · R9 `git commit` into the `ask` list · R10 `rtk proxy` merged, inner-form examples kept · R11 "Also 01-11-2026" → "Bypass mode is off" · R12 "Known limits" sentences moved verbatim to Known gaps · R13 `.claude/backups` → `~/.claude/backups` (else a dead-link warning) · R14 engineering row names the record and keeps "Causation is inferred, not proven" · R15 the two 30-09 "not yet verified" sentences → record · R16 8.5k "latest" (wrong: the same-day table sums 8,223) → pointer to the table · R17 duplicate status-line note dropped · R18 "in this table" → "The two startup methods" · R19 "this section" → "this file" · R20 corrections' rule sentence kept · R21 "Changing any of this" split · R22 counts dated · R23 effort heading → gap line · R24 Effort How to check = None yet · R25 "The replay script below" → § *How numbers are measured* → *Prompt volume* · R26 7.6k and 25.2k relabelled "last measured 01-11-2026; not re-measured since `STANDARDS.md` changed (12-11-2026)" · R27 "Every number…" → "Every measured number…" · R28 tee-directory reason and "a rule that can never fire…" added to `allow`.

**No rule lost:** every current rule, warning, limitation and safety note is in the final text; only history, superseded values and exact duplicates move, and the whole old file is kept word for word in the record.

**Cross-check (12-11-2026):** one fresh Sonnet agent, read-only, 71.5k measured. Verdict: reachable with fixes; no permission, setting, hook or invariant changes; settings facts confirmed against `settings.json`; CHECKED line, order, dead links (R13 needed) and pointers confirmed. Must-fix (all taken): tee-directory reason and "a rule that can never fire…" kept (R28); engineering-row pointer and caveat (R14); "replay script below" (R25); split offered as an option (decided: no split). Should-fix (all taken): "Moved from `RTK.md`" notes, "Block 4's runbook needs this" and "Either it recurs…" to the record; R26; R27; two-slashes text once only; memory pointer listed as stale (below); record header says "superseded; read the live file".

**Link check (`git grep`, 12-11-2026):** must change — `harness/overview.md:23` (§ *Permissions — what stops and asks* → § *3. Permissions*). Still resolve, no change: `DOCUMENT-MAP.md:22`, `RTK.md:17` (§ 1) · `PROJECTS.md:6`, `README.md:42` (§ *Branch state*) · `STANDARDS.md:64,68,109` · `harness/backlog.md:32` (§ 2), `:107` (§ 3) · `harness/doc-structure-plan.md:382` · `.gitignore:35` · all `SETUP-PLAN.md` pointers · the pre-commit hook comment (§ 3). Known stale, not changed in Phase 5: memory note `projects/-Users-amitjangra--claude/memory/skill-overrides-name-only.md:40` cites § *3. Permissions — what stops and asks*; the "— what stops and asks" tail no longer matches the heading. Records (31 files in `baselines/`) are never edited.

**Old-text record header** (`baselines/environment-old-<Go 2 date>.md`), then `---`, a blank line and the whole old file:
```
# Old ENVIRONMENT.md — <Go 2 date>

Purpose: The whole text of `ENVIRONMENT.md` before Phase 5 (T21) put it into the reference format and moved its history out — kept so the "no content lost" check and any later reader can compare old against new. Superseded; read the live file.
Date: <Go 2 date>
Status: record — superseded; read the live file `ENVIRONMENT.md`
From: `ENVIRONMENT.md` at <Go 1 commit> (888 lines, 8,801 words), whole file. Below the line: the file word for word. Inside it, "this file", "above" and "below" mean the old `ENVIRONMENT.md`.
```

**Final text:** built; see `ENVIRONMENT.md`. Written 12-11-2026 from the approved block, `cmp`-matched before the block was removed. Then, on Amit's approval: 11 undated figures labelled (a date from the old record, else "not recorded"), and the `RTK.md` 641 / 404 mismatch explained by a note (641 is before `c808989` shortened `RTK.md`; both kept). Detail and all Go 2 checks: `baselines/doc-test-after-12-11-2026-run2.md`.

**Go 2 steps** (Opus; each change to a setup doc is announced; commit and push only on Amit's word):

| Step | Work | Tokens |
|---|---|---|
| 0 | Orient from `.claude/current-task.md` and this section only. Precondition (hard stop): `HEAD` is the Go 1 commit; the only uncommitted files are the known Voice-Flow, vthrudebugger_v1 and memory files. | ~10k |
| 1 | Before: `wc -lw ENVIRONMENT.md` (expect 888 / 8,801) · `doc-check.sh` (expect 1 known warning, 3 not in format) · link grep (`git grep -n "ENVIRONMENT" -- ':!baselines/' ':!archive/'`). No new before doc-test (reuse `baselines/doc-test-after-12-11-2026.md`). | ~4k |
| 2 | Old text → `baselines/environment-old-<date>.md`: the header above, then the whole old `ENVIRONMENT.md` word for word; `tail -n +10` of the record (header is 9 lines: title, blank, 4 fields, blank, `---`, blank) `cmp` against the live file — identical before any edit. Row in `baselines/README.md` (index, and the "not runs" note). | ~6k |
| 3 | Write `ENVIRONMENT.md` from the final-text block, `<Go 2 date>` replaced; check: `awk` between the ````` ````markdown ````` and closing ````` ```` ````` lines of this file, `sed` the date in, `cmp -` against `ENVIRONMENT.md`. `wc -lw` (≤ 400 / ≤ 7,300). `doc-check.sh`. Bash commands must not name the private-store paths — the deny rule refuses them. | ~15k |
| 4 | Linked updates, `doc-check.sh` after each: CHECKED gets `ENVIRONMENT.md\|full\|Contents;The two kinds of rule;1. RTK;2. Status line;3. Permissions;4. Effort on Opus 5.5;What every session loads;How numbers are measured;The project trees on this machine;Older records\|` · `harness/overview.md:23` → § *3. Permissions* · `harness/status.md` · this file: § 0, § 4 T21 (numbered names), the final-text block replaced by "built, see the file". `DOCUMENT-MAP.md` row 29: re-check, no change expected. | ~12k |
| 5 | After: `wc -lw` · `doc-check.sh` (expect 2 warnings: the known one and the `ENVIRONMENT.md` size warning; 2 not in format) · link grep · doc-test after (fresh Sonnet agent, the 10 questions word for word; Amit runs G1 and `/context` in one fresh session — only the three imports load) → `baselines/doc-test-after-<date>.md`, compared with `baselines/doc-test-after-12-11-2026.md` · fresh read-only Sonnet "no content lost" check: the old-text record and `baselines/environment-history-01-11-2026.md` against the new file. | ~100k |
| 6 | Stop — Amit reviews. Commit on his word only; no push. | ~3k |

**Total:** about 150k (main session ~50k; doc-test agent ~45k; "no content lost" agent ~55k).
**Errors in Go 1:** counting the draft with `wc` through a heredoc was refused by the private-store deny rule (the draft names those paths) — not retried; counts above are estimates.
**Not in scope:** memory files (incl. the stale pointer above) · settings and permissions · hooks · project files · Phase 6 · push.

### Phase 6 — Voice-Flow pilot (in Voice-Flow's own session)
Before changing anything: record the "before" score (`baselines/doc-pilot-before-<date>.md`); decide whether Voice-Flow's `docs/README.md` becomes its map or is replaced.

| ID | File | Priority |
|---|---|---|
| T22 | `CLAUDE.md` | P2 |
| T23 | `PROJECT-MAP.md` | P3 |
| T24 | `.claude/current-task.md` (581 lines today) | P2 |
| T25 | `docs/ROADMAP.md` (+ `ROADMAP-DONE.md`) | P2 |
| T26 | `docs/BACKLOG.md` (+ `BACKLOG-DONE.md`) | P2 |
| T27 | `docs/DECISIONS.md` (+ `DECISIONS-OLD.md`) | P2 |
| T28 | Other reference docs (split big ones by topic: `manual-testing.md` 120K, `roadmap.md` 57K) | P3 |

Also: rename to the naming style; old task-history files become records; memory notes holding goals or decisions move to the roadmap or decisions file with a pointer left; record the "after" score.

### Phase 7 — Other projects (each in its own session)
FinNode, Emp Portal, vthrudebugger_v1, Debugger v2: T22–T28 each. Plus: task file into `.gitignore` in FinNode, Emp Portal, vthrudebugger_v1; files with no home (`PLAN.md`, `INTEGRATION.md`, `MOBILE-CONTEXT.md`, `DEPENDENCIES.md`, skills, acceptance sheets, `launch.json`…) get a row in the map.

| ID | File | Priority |
|---|---|---|
| T29 | `templates/new-project.md` | P4 |

### Phase 8 — Planning system (D51; in use since 24-11-2026; complete 25-11-2026, Amit)

**Why (Amit):** planning is the foundation. Good plans make building, review, testing and clean-up easier; reviewers (Phase 9) can only review well if the plan is clear.
**Goal (Amit):** one planning system that gives each job the right amount of planning — small work stays small, risky work gets care — without dropping any safety, approval or verification gate.
**Success measure:** every WP4 acceptance check passes, and no conflicting active planning instruction remains in the affected files.
**Status:** **complete 25-11-2026 (Amit).** The deferred checks passed in Phase 9 WP5 (*Acceptance result (WP4)* below). Earlier (24-11-2026): implemented and in use; acceptance partly verified; named checks deferred to Phase 9's final integration package (Amit's scheduling choice, 24-11-2026 — not a technical dependency). The success measure is not yet met. Design saved (WP1, 23-11-2026); final plan approved by Amit 24-11-2026; WP2 and WP3 done 24-11-2026 (switch-on commit `a80a494`); WP4 results recorded 24-11-2026 in *Acceptance result (WP4)* below — the one detailed record.

#### How the planning system works

1. **Question only** → answer it. No planning.
2. **Check risk first.** Triggers: security or login · permissions or settings · personal data · money · deleting things · data or schema changes · more than one project or a global setting · unclear cause or requirement · a new tool or library · work needing more than one session.
3. **No trigger and a tiny one-file change** → the tiny-change route in `STANDARDS.md`, as today. A small file count or small diff never skips the risk check.
4. **Everything else** → the planning skill. It picks two things separately:
   - **Kind of work** (one of six, below).
   - **Depth** — light, or deep if any risk trigger applies. Risk deepens the plan; it does not change the kind. A risky small enhancement stays a small enhancement, planned deeply.
5. **Before substantial work, tell Amit in a few lines:** kind of work, risk, depth, priority (P1–P4 urgency), rough total tokens, likely sessions. Read the relevant code or documents first; if that reading is not finished, call the judgement *provisional*. Amit can ask for less explanation or a different scope; safety, approval and verification gates stay.
6. "Plan this" does not by itself mean a big formal plan. Depth follows the job, not the word.

**Gates never skipped:** Amit's approval before any change · verification sized to the job · fix the cause · record important results · handoff when work is unfinished.

#### Six kinds of work

| Kind | Use when | Minimum plan | Add when needed | Testing | Skip |
|---|---|---|---|---|---|
| New project | Nothing exists yet | Problem, users, success measure, first-version limits, stack and why, data and privacy, first usable milestone | Architecture, integrations, deployment and recovery, accessibility | Test approach per milestone; how each milestone is accepted | Detailed plans for distant milestones |
| New feature | New behaviour across several files or screens | Need, expected behaviour, acceptance scenarios, affected areas, reuse, ordered steps | Data or schema changes, compatibility, rollout and undo | One check per scenario; UI checks only if UI is touched | Restating the whole app design |
| Small enhancement | A focused addition, few files | Behaviour, files, acceptance checks | Deeper sections if a risk trigger applies | A focused check | A separate design doc or task list |
| Bug fix | Something works wrongly | Actual vs expected, reproduction or best evidence, cause (or labelled guess), fix, check | Root-cause investigation, regression risks | Whatever proves the fix: existing test, command, manual repro or new test; UI check if the bug is visible | Spec, design doc, full test suite by default |
| Documentation | Writing or updating docs | Reader, purpose, source of truth, sections affected, fact check | — | Facts, links, format. Runbooks, safety instructions and commands that must run get real verification | Builds and UI tests for plain prose |
| Claude Setup change | Any change to `~/.claude` | Goal, success measure, files, loading impact, safety and permission impact, undo | Migration and pointers, cross-project effect, fresh-session test | Existing checks; fresh-session test when loading changes | Heavy process for a wording fix |

- New feature and small enhancement share one guide (two depths). Six kinds, five guide files.
- Dependency or config changes inside a project use that project's path plus the risk checks — not the Setup path.
- Refactoring: feature path, "behaviour must not change", checks before and after. Data migration: always deep (backup, dry run, undo).
- **Combining kinds:** pick one main kind; add only the lines another kind needs. Never two plans.
- **Technical design section** (any kind, only when needed): affected parts, interfaces and data, approach, main alternatives, risks. Small, plain work needs no separate technical document.
- **Idea assessment** (approved 24-11-2026, Q4): a short section in the skill ending in go / needs more information / do not do. Not a separate guide for now.
- **Root cause:** a labelled guess is fine while investigating. It never justifies a speculative real fix — confirm it with evidence, or report the limit and ask Amit.

#### Checks, review and stopping

- Run the checks that matter for the change, plus the project's major and important tests (money, data, security, the main user path), as the project's rules allow. No "run everything" rule (Amit, 24-11-2026; home: `STANDARDS.md` § *Before calling anything done*).
- If a check fails, say whether it failed before the change or because of it.
- Results are **done and verified**, **partly verified** or **blocked**. Only the first may be called done.
- Independent review follows the existing levels in `harness/cross-check.md` until Phase 9 reviewers exist. No new agent is a Phase 8 dependency.
- **Retry and escalation (approved 24-11-2026):**
  - After two unsuccessful corrective attempts on the same unresolved issue: checkpoint, show the evidence and a recommended next step, and ask Amit before continuing.
  - New evidence can shape the next approach but must not reset the count again and again.
  - Ordinary development and check cycles that succeed are not failed attempts.
  - Escalate at once for safety, wider scope, missing access, or a decision that is Amit's.
  - After two review-and-fix rounds, open findings go to Amit — never approved or dropped automatically.
- **Completion:** besides ticking the task, name any lasting requirement, project doc or decision that needs updating (adapted from OpenSpec's archive step). This reminder stays always-on so tiny changes do not miss it.

#### Sessions and estimates

- 220K checkpoint and 250K planned maximum apply to the **main session's context only**. Stop earlier if the real context or usage limit needs it.
- Helpers work in their own context; their working tokens do not fill the main context, but their reports do — keep reports short. Helper usage still counts in the rough total estimate.
- Estimates are information for Amit's now-or-later decision, not spending targets. Label them as estimates; never invent a measurement.
- Split large work into packages that can each be verified alone. Do not start a package the remaining main context is unlikely to cover, including checks and handoff.

#### What stays always-on vs. moves to the skill

- **Stays in `STANDARDS.md`:** the 10 steps as short signposts (same names and numbers, so existing references keep their meaning) · every gate · the risk triggers and the rule "check risk before the tiny-change route; anything beyond it uses the planning skill" · verification and done rules · "tell Amit first" (step 3; moved from the skill at switch-on, Amit 24-11-2026) · depth defined (light by default, deep on any trigger) · the completion reminder · handoff · fix the cause · the retry rule (once approved) · session limits.
- **Moves to the skill:** what a plan contains · the five guides · test planning · technical design · work-package splitting · idea assessment.
- Project data-safety rules stay in each project's rules; the skill points to them.

#### Saved plans

| Work | Canonical plan | Handoff |
|---|---|---|
| Claude Setup | A section in this file | `.claude/current-task.md` points to it |
| Project work over more than one session | The project's existing plan or roadmap section, linked from the roadmap row — never crammed into one cell | The project's `.claude/current-task.md` points to it |
| Work finished in one session | Chat is enough | — |
| VT | Local only (`.git/info/exclude`); nothing to GitLab | Local |

`current-task.md` stays a short handoff with the open questions needed to continue — never a copy of the plan.

#### Files

- **Staging (WP2):** `harness/planning-draft/`, entry file named `entry.md` (not `SKILL.md`), outside every skills folder.
- **Final (WP3):** `skills/planning/SKILL.md` · `new-project.md` · `feature.md` · `bug-fix.md` · `documentation.md` · `setup-change.md`.
- **Activation list (WP3):** the skill files · `STANDARDS.md` (signposts, risk check before the tiny-change route, skill pointer, retry rule, § *Plan before building* limits) · `ENVIRONMENT.md` line about the 250K limit and 80% rule · `.gitignore` (allow `skills/planning/`; remove staging lines) · `DOCUMENT-MAP.md` (new row) · `templates/handoff.md` ("Plan:" link line).
- **Verify only, edit only if a meaning changed:** `harness/cross-check.md` ("step 4" must still mean Approve, including the deletion rule) · `DOCUMENTATION-STANDARD.md` lines 137–139 · `harness/overview.md` · `.gitignore` comment on templates.
- Writing style for every guide: plain, simple English, the way a person explains it; short sentences; one home per rule.
- Write in simple, everyday human English. Keep it short where that helps; never force it short or cut facts (Amit, 24-11-2026).

#### Work packages (rough estimates, not targets)

| WP | Scope | Main context | Total usage | Session | Done when |
|---|---|---|---|---|---|
| 1 Save design | This section · D51 and the D50 clarification · `harness/status.md` · handoff | 60–90K | + ~20–30K read-test helper | Session 1 | A fresh reader states scope, acceptance checks, open choices and next step from the handoff and this section |
| 2 Draft, inactive | Six files and the new `STANDARDS.md` wording in staging | 100–140K | same | Its own fresh session (WP1 finished in the design session, 23-11-2026) | Draft not discovered as a skill; paper run of every routing scenario passes |
| 3 Switch on | The activation list, checks, one cross-check helper | 120–170K | + 40–60K helper | Always a fresh session | Activation checks below pass |
| 4 Test and record | Acceptance checks, measured loading impact, records, research-file deletion proposal | 70–120K | + 150–250K short fresh test sessions | Fresh session | All checks pass, or each failure is labelled |

About **540–830K** rough total for WP2–WP4 plus WP1's main context (main context 350–520K + WP3 helper 40–60K + test sessions 150–250K); WP1's read-test helper (~20–30K) is extra. 3–4 main work sessions, plus short fresh-session tests.

#### Activation and recovery (WP3)

- **Before activation:** Amit's go · a fresh session · `git status` shows only expected changes · HEAD is where WP2 left it. A failed precondition stops the work.
- **Order:** apply the whole activation list, then run the checks. If the main context runs short before activation, leave the drafts inactive and hand off. Never leave an active instruction pointing to a missing skill.
- **If checks fail before a commit:** move the skill back to staging; restore only the files on the activation list, one by one, with Amit's approval; confirm no active instruction points to a missing skill.
- **After a commit:** revert that one commit, with Amit's approval.
- Never use resets or broad clean-up; unrelated changes are kept.
- Moving files back does not remove instructions the current conversation already loaded — check the recovered state in a fresh session.
- Draft commits are optional and need Amit's explicit approval; a package need not end in a commit.

#### Acceptance checks (WP4)

- **Routing**, in short fresh sessions, with compatible scenarios grouped (not twelve separate sessions):
  1. Question only → no planning.
  2. Tiny wording fix → tiny-change route.
  3. One-line login-check change → not the tiny-change route; deep plan.
  4. Low-risk small enhancement → light plan.
  5. Small enhancement touching personal data → deep, still a small enhancement.
  6. Feature → depth from the full trigger list.
  7. Non-UI bug → focused check, no UI test.
  8. UI bug → plus a UI check.
  9. Plain-prose doc → no build.
  10. Runbook or doc with commands that must run → real verification.
  11. New app → deep; cross-check before building.
  12. Risky Setup change → deep; cross-check; fresh-session test.
- **Loading:** the entry point and only the relevant guide are read.
- **Activation:** the draft is not discovered before activation and is after it · every pointer resolves · kept references still mean the same thing · a search of the affected files finds no conflicting planning rule (this covers the affected files, not the whole setup) · recovery steps work.
- **Restart:** a fresh session resumes from the handoff, its linked canonical plan, the relevant rules and the current working state, without the old conversation.
- **Cross-check:** the existing procedure still works without Phase 9 agents.
- **Supporting only:** `doc-check.sh`, file sizes, and the description under 1,536 characters. These do not prove behaviour.
- Report measured loading and context impact where available; no savings promised before testing.

#### Acceptance result (WP4, recorded 24-11-2026)

Phase 8 is implemented, with acceptance partly verified. Named checks are deferred to Phase 9's final integration package by Amit's scheduling choice (24-11-2026); this is not a technical dependency. Phase 8 is not accepted until each deferred check passes or Amit decides otherwise. Recording these results does not declare any untested check passed. Other files point here. **Update 25-11-2026 (Phase 9 WP5):** the deferred routing, recovery and loading checks are recorded below; restart re-tested and passed (I4). WP5 tests passed. Phase 8 marked complete 25-11-2026 (Amit), as a separate decision.

| Check | Result | Evidence, or destination and trigger |
|---|---|---|
| Routing 12 — risky Setup change | Routing passed. Cross-check proposed, not performed | Phase 9 planning session, 24-11-2026: Claude Setup change, deep, fresh-session test named; read only `skills/planning/SKILL.md` and `setup-change.md` |
| Routing 6 — feature | Feature/deep routing supported by the supplied excerpt; full plan acceptance checks not assessed. Cross-check proposed, not performed | VOS Phase 1 planning reply, pasted by Amit 24-11-2026 (excerpt; 75 lines hidden); reported reading only `SKILL.md` and `feature.md` |
| Look before acting | Supported; not a routing test | VOS discovery session, 24-11-2026: read the folder, stopped and asked; no planning files read |
| Routing 11 — new app | **Routing passed** (25-11-2026). Cross-check proposed, not performed | Phase 9 WP5, I1 — § *Phase 9* → *Integration test result (WP5)*. Hypothetical, read-only scenario |
| Routing 1–5 and 7–10 | **Routing passed** (25-11-2026), all nine. Cross-check proposed, not performed, for 3 and 5 | Phase 9 WP5, I1 — § *Phase 9* → *Integration test result (WP5)* |
| Loading — entry file and one guide only | Passed in 2 sessions (one seen in-session, one self-reported) | Routing 12 and 6 above |
| Activation — skill listed, pointers resolve, "step 4" still means Approve, no conflicting planning rule | Passed in the affected files checked: `STANDARDS.md`, `ENVIRONMENT.md`, `harness/cross-check.md`, `templates/handoff.md`, the skill files | WP4 self-run checks, 24-11-2026 |
| Draft not discovered before switch-on | Passed at WP2; not re-checked | WP2 record in `harness/status.md` |
| Restart | Passed: resumed from the handoff and its referenced documents and current working state, without requiring the old conversation | WP4 session, 24-11-2026 |
| Cross-check works without Phase 9 agents | Performed and passed at WP3 (Sonnet, two rounds, 63K measured); no separate WP4 run | WP3 record in `harness/status.md` |
| Recovery | **Passed in a local copy** (25-11-2026); live-session behaviour after an undo stays paper-reviewed | Phase 9 WP5, I2 — `a80a494` reverted in the copy with the Phase 9 commits |
| Loading impact | **Estimated**, accepted by Amit (25-11-2026): about 0.8k tokens per session | Phase 9 WP5, I3 — no pre-Phase-8 measurement exists |
| Description length | Passed: 505 characters (limit 1,536) | WP4 self-run checks |
| Format check | In the checked files, the dead link to the deleted WP2 staging folder in `harness/status.md` is removed by this recording; other existing warnings unchanged | `harness/doc-check.sh`, before and after this recording, 24-11-2026 |
| VOS safety recommendation (wrong-password test step) | Prepared; delivery not confirmed | VOS-specific; not a setup rule |

#### Open questions (Q1–Q8)

| Q | Amit decided | Recommendation (approved 24-11-2026) |
|---|---|---|
| Q1 Testing scale | P1–P4 is urgency only | Risk-based testing and acceptance criteria; no extra scale |
| Q2 When built | Phase 8 | — |
| Q3 Bug flow | A kind of work inside planning | — |
| Q4 Idea assessment | Only if really needed | A short section, not a guide |
| Q5 Research file | Temporary; deletion approved separately, after useful content and sources are kept and references checked | — |
| Q6 Overlaps | — | Mark "potentially covered by …" (§ *Phase 11*); verify before declaring covered |
| Q7 Research | Verified for the ideas used, with gaps | — |
| Q8 Saved plans | Reuse existing places; must survive a restart; handoff points to the plan | The *Saved plans* table above |

Also decided by Amit: test planning stays inside planning · Voice-Flow brief waits for Phase 9 · required cross-checks stay until Phase 9 reviewers exist · Phase 8 migrates only the planning rules it replaces; Phase 10 is the whole-setup clean-up.
Choices approved 24-11-2026: the retry rule · routing tests in short fresh sessions Amit starts · optional draft commits.

#### Adopted ideas and sources (retrieved 23-11-2026; adapted, not installed)

| Source | What it says | Our adaptation | Gap |
|---|---|---|---|
| OpenSpec `docs/concepts.md` (github.com/Fission-AI/OpenSpec) | Older docs: "Most changes should stay in Lite mode"; full spec for higher-risk changes | Light by default; deep by risk — our own rule | The docs mark themselves partly out of date; the v2.1.1 site has no "Lite mode" (checked 24-11-2026) |
| OpenSpec `schemas/spec-driven/schema.yaml` | `design.md` "create only if any apply" | Technical design only when needed | — |
| OpenSpec README and schema | Requirements with WHEN/THEN scenarios | Acceptance scenarios in plain words | — |
| OpenSpec `docs/concepts.md` | Archiving merges change specs into the maintained specs | Completion step names lasting docs and decisions to update; no spec folder system | — |
| Spec Kit `templates/spec-template.md` (github.com/github/spec-kit) | Prioritised user stories, Given/When/Then, `[NEEDS CLARIFICATION]` marks | Acceptance scenarios; "Open:" items block approval | — |
| Spec Kit `templates/commands/clarify.md` | At most 5 questions, one at a time | Keep our 2–3 questions rule | — |
| Spec Kit `templates/commands/analyze.md` | Read-only consistency check of spec, plan, tasks | Self-check now; `plan-reviewer` input in Phase 9 | — |
| Spec Kit `templates/tasks-template.md` | Tasks by user story; first usable version first | Work packages each verifiable alone | — |
| Spec Kit `templates/plan-template.md` | "Constitution Check" gate | Check the plan against `STANDARDS.md` and the project's rules | — |
| Spec Kit README | Bug add-on (assess, fix, test; verified / partial / failed); assess add-on (go / needs-clarification / kill) | Bug result labels; idea-assessment section | Add-ons outside the core; only the README read |

Ideas from Amit's summary of zazencodes (not checked against the repos): checks before review · findings back to the builder · bounded retries — adopted above. Risk-based reviewer choice waits for Phase 9. Not adopted: automatic merging, parallel jobs, the author's personal setup.
Claude Code skill loading (code.claude.com/docs/en/skills, read 23-11-2026): skill descriptions load at session start; the body loads when the skill is used and stays; other files in the folder load only when read; description plus `when_to_use` is cut at 1,536 characters; `@imports` always load. The page was cut off after about 100,000 characters.

### Phase 9 — Reviewer agents and skills (agreed 20-11-2026, D50) — plan **approved 24-11-2026 (D52)**, **complete 25-11-2026 (Amit)**

**State:** approved by Amit 24-11-2026 (D52), with the acceptance criteria below. WP2, WP3 and WP4 built; WP3 reviewer tests complete (*Reviewer test result*); WP4 skill tests complete (*Skill test result*); WP5 tests passed — I1–I5 passed and recorded 25-11-2026 (*Integration test result (WP5)*). Phase 9 marked complete 25-11-2026 (Amit), as a separate decision. Saved in WP1, revised after one cross-check (24-11-2026, Opus, verdict *concerns*, 10 findings, 56K measured): every finding fixed, decided by Amit, or not applicable after his decision; the overlap with `ship-local` stays an open item for WP4. Amit also decided 24-11-2026: skip the fake `.env` test; recovery is verified in a local copy only, never by undoing the live setup. Kind: Claude Setup change. Depth: deep (agents, skills, rule-file pointers, more than one session).

**Goal (Amit, 20-11-2026 and 24-11-2026):** two fresh, read-only reviewers and three focused skills that give each review and each repeated chore the minimum context it needs, without copying rules and without dropping any gate.

**Success measure (approved):** yes/no. Yes when every check below (R1–R8, K1–K5, I1–I5) is **passed, or waived by Amit**, and a search of the affected files finds no conflicting active instruction. A failed check is fixed and re-run, or brought to Amit; it never counts towards "yes".

**Phase 8 stays implemented but not fully accepted** until I1–I3 pass or Amit waives them (§ *Phase 8* → *Acceptance result (WP4)*).

#### Agreed design

- Sub-agents stay one level deep (no sub-sub-agents): plan reviewer, change reviewer, and a researcher if needed (Amit, 24-11-2026).
- `change-reviewer` (merged small-change + feature reviewer) and `plan-reviewer`: fresh and read-only. Tools Read, Grep, Glob · `omitClaudeMd: true` · reviewer memory unset. Behaviour is proven by tests, not by a setting's name. Verdict `no concerns / concerns / blocked`; reports, never approves. Models: `change-reviewer` Sonnet (Opus for security or data); `plan-reviewer` Opus.
- `omitClaudeMd` leaves out user, project and local `CLAUDE.md` at start. Managed policy may still apply. Folder-specific instructions may load later when files are opened.
- Context in four layers, minimum sufficient: agent file · short project brief · neutral task packet (no author verdict; earlier checks are evidence the reviewer may challenge; it may ask for a missing file) · linked detail only when needed. No full `STANDARDS.md` copy for any reviewer.
- Claude Setup brief `harness/agent-brief.md`: purpose, tech stack, features, entry points, critical rules, where to look next — one-liners and links. Not in `project-rules/` (copies only). Its one-line rules need a row in `DOCUMENTATION-STANDARD.md` § *Allowed copies*; listed in `DOCUMENT-MAP.md`; no new registry. Voice-Flow's brief is decided in its own later session.
- `harness/doc-check.sh` checks dead links only in its own listed files, and only backticked paths in named folders — not `agents/`, not other projects. Link checks for new files are done by hand in this phase.
- **Three skills** (Amit, 24-11-2026 — `setup-cross-check` dropped, see *Not built*):
  - `handoff` — reuses `templates/handoff.md`, incl. B2's "Errors and fixes".
  - `send-for-review` — **manual only: the model never starts it by itself.** Amit typing it is the same as Amit saying "send it for review" (`STANDARDS.md` § *Git*, unchanged): branch off `main`, commit, push to GitHub, open the PR with short details. Then stop. Amit reviews and merges by hand and tells Claude. Claude never merges. After Amit confirms the PR is merged, Claude may delete **only the local branch**, after checking git shows it merged (the deletion is confirmed as `STANDARDS.md` step 4 says). Remote branch deletion follows the repository setting or a separate instruction from Amit. Claude never merges a PR and never pushes outside this approved flow. No `dev` branch; suggest GitHub's "delete branch after merge". VT exception — Claude never pushes there. The skill points to the gates; it does not restate them.
  - `documents` — checklist pointing to `DOCUMENTATION-STANDARD.md`.
- Replaced instructions are migrated in the same package that switches on their replacement. The final package only tests and records.
- Not built: `setup-cross-check` (Amit, 24-11-2026: a 5-line procedure already read on demand in `harness/cross-check.md`; a skill would add a description every session) · `git-safety` (stays in `STANDARDS.md` + settings ask list) · `code-review-checklist` (inside the reviewer agents) · `data-safety-review` (project limits go in each brief) · `test-plan` (inside `planning`) · plan-review template. `bug-fix-workflow`: Q3 (inside planning).

#### Files (exact)

Every WP that changes setup also updates `harness/status.md` (`.claude/CLAUDE.md`) and `.claude/current-task.md`.

| WP | Create | Change (migration in the same WP) |
|---|---|---|
| 2 | `harness/agent-brief.md` · disposable `harness/phase9-scratch/` (git-ignored, never tracked) | `.gitignore` (allow the brief by name) · `DOCUMENT-MAP.md` (brief row) · `DOCUMENTATION-STANDARD.md` § *Allowed copies* (brief row) |
| 3 | `agents/change-reviewer.md` · `agents/plan-reviewer.md` | `.gitignore` (`!agents/` plus each file by name) · `harness/cross-check.md` § *The reviewer* (line 42 "fresh `general-purpose` agent" → the named agents; line 54 "read-only … not by a lock" rewritten only if R1–R2 prove the tool limit) · `DOCUMENT-MAP.md` § *Not documents* |
| 4 | `skills/handoff/SKILL.md` · `skills/send-for-review/SKILL.md` · `skills/documents/SKILL.md` | `.gitignore` (`!skills/<name>/` plus each file by name) · `STANDARDS.md` step 9 and § *Git*: a skill pointer only — every gate sentence stays · `DOCUMENT-MAP.md` § *Not documents* |
| 5 | Nothing new | Records only: this section · `harness/status.md` · `.claude/current-task.md` · `SETUP-PLAN.md` (D52 status, D51 status) |

`STANDARDS.md` gates (approval, commit/push, deletion, recording) are never moved into a skill; skills point to them.

#### Disposable test location

- `harness/phase9-scratch/` inside `~/.claude`: already ignored by `.gitignore`'s `*`. Inside the working folder, so no write outside it (D46) and no shell route around the file-tool lock. `session-check.sh`, `doc-check.sh` and `drift.sh` read only their listed files, so they do not walk into it (cross-check, 24-11-2026).
- **Every search for the K and I checks excludes this folder.**
- Synthetic data only: a setup-style doc diff with one planted mistake and a clean one; a small doc plan with one planted gap and a clean one; a throwaway write target with a known checksum. No real project data, no secrets, no `.env`.
- Deleting it at the end needs Amit's approval and the two-method target check (`STANDARDS.md` step 4).

#### Work packages (rough estimates, not targets)

| WP | Scope | Main context | Helper / test-session usage | Session | Done when |
|---|---|---|---|---|---|
| 1 Save plan | This section, pointers, one cross-check | 70–90K | + 56K cross-check (measured) | This session (24-11-2026) | Amit approves the plan, or sends changes |
| 2 Brief and fixtures, inactive | Files row 2; fixtures; loading baseline for I3 | 60–90K | — | Fresh | Brief reviewed by Amit; fixtures in place; baseline recorded |
| 3 Reviewers on | Files row 3; migration; R1–R8 | 120–160K | + 60–100K reviewer test runs | Fresh | R1–R8 passed or waived by Amit |
| 4 Skills on | Files row 4; migration; K1–K5; one cross-check | 100–150K | + 40–60K cross-check | Fresh | K1–K5 passed or waived by Amit |
| 5 Final integration | Tests and records only: I1–I5; recovery copy last | 70–110K | + 150–250K short fresh test sessions Amit starts | Fresh | Every I-check passed or waived by Amit; records updated |

About **420–600K** main context and **300–470K** helpers and test sessions: roughly **0.72–1.07M** total, estimated. 5 main sessions (this one included) plus short test sessions. Priority **P3** (good to have: one review system and less copied context; nothing broken). Model: Opus for the main sessions (agents, rule-file pointers).

Undo per WP: before a commit, restore only that WP's listed files, one by one, with Amit's approval; after a commit, revert that one commit with Amit's approval. No resets, no broad clean-up. Check the recovered state in a fresh session.

#### Acceptance criteria — approved by Amit 24-11-2026 (D52)

Reviewers (WP3), on the synthetic fixtures:
- **R1** The loaded agent's tool list is exactly Read, Grep, Glob — checked in the agent listing and by asking it to run a shell command (it must report it cannot).
- **R2** Asked to edit the throwaway target, it cannot; checksum unchanged.
- **R3** Without being given it, the reviewer cannot state a distinctive phrase that exists only in `STANDARDS.md`; its transcript shows it did not open `STANDARDS.md`. Control run: an ordinary `general-purpose` agent given the same question can state it. A folder `CLAUDE.md` loading later is noted, not failed.
- **R4** Planted-defect fixture: `change-reviewer` names the planted mistake; `plan-reviewer` names the planted gap.
- **R5** Clean fixture: `no concerns`, or at most one concern that Amit judges a false alarm.
- **R6** Verdict is always one of the three words; it never says "approved".
- **R7** A packet that leaves out one needed file: passes if the reviewer asks for it, or reads it itself and says so; fails if it guesses its content.
- **R8** Passes when the numbers are recorded: each reviewer run's helper usage and the main-context impact on separate lines, compared with the current `general-purpose` cross-check on the same fixture and model. Any token limit is set from these numbers later, not before.

Skills (WP4):
- **K1** Each skill is discovered; each description is under 1,536 characters.
- **K2** `send-for-review` cannot be started by the model on its own. A paper walk-through shows: branch off `main` → commit → push → open PR → stop; never merges; deletes only the local branch, only after Amit confirms the merge and git shows it merged; leaves the remote branch to the repository setting or Amit. No real push in the test.
- **K3** `handoff` run on a synthetic task in a fresh session gives a note in the `templates/handoff.md` shape.
- **K4** Every new pointer resolves; any moved text is word for word (`cmp` or diff); pointers counted before and after.
- **K5** A search of the affected files (scratch folder excluded) finds no conflicting active instruction; `doc-check.sh` shows no new warnings.

Final integration (WP5; Phase 8 deferred checks land here — not deferred again):
- **I1** Phase 8 routing tests 1–5 and 7–10 (nine) plus test 11 (ten in all), checked against § *Phase 8* → *Acceptance result (WP4)*, which lists exactly these. Grouped into short fresh sessions Amit starts. Test 11 uses a clearly hypothetical, read-only scenario — no real project, repository, install or file. Each must pass, or Amit waives it.
- **I2** Recovery, in an isolated copy (method below), or Amit waives it.
- **I3** Loading impact, per session (descriptions load once at session start): `/context` in a fresh session at WP2 start (baseline, Phase 8 already on) and again after WP4. Phase 8's own share cannot be measured live (no earlier baseline); it is estimated from the planning skill's description size and the `STANDARDS.md` word change, labelled *estimated*, and Amit accepts or waives that part. Passes when the numbers are recorded.
- **I4** Restart: a fresh session resumes from the handoff, its linked plan, the relevant rules and the current working state, without the old conversation (same wording as Phase 8's check).
- **I5** `doc-check.sh`, `session-check.sh` and `drift.sh` run; old warnings separated from new; no new warning from Phase 9.

Wording kept distinct in every record: **routing passed** (the right kind, depth and guide were picked) · **review proposed** (a cross-check was named, not run) · **review completed** (it ran; verdict and measured cost recorded).

#### Reviewer test result (WP3, recorded 24-11-2026)

**WP3 reviewer tests complete (24-11-2026):** R1–R4 and R6–R8 passed; R5 waived by Amit for both reviewers. Synthetic fixtures only (`harness/phase9-scratch/`). Every run is **review completed** (it ran; verdict and measured cost recorded). No routing was tested. Agents committed in `34a5e9f`.

| Test | Result | Evidence |
|---|---|---|
| R1 | **Passed** | Agent definitions and listing: Read, Grep, Glob. Each run's own tool list also shows `SubagentHandback`, the platform's mechanism for a background helper to return its report — expected infrastructure, not a reviewer capability. No write, edit, shell or agent-starting tool; both reported they could not run `pwd`. |
| R2 | **Passed** | Both had no write tool; `write-target.txt` checksum `9cc7fef9…` unchanged. |
| R3 | **Passed** — supports isolation, does not prove it | Both reviewers: "not in my context", 0 tool uses. General-purpose control (Sonnet), same question, 0 tools: answered correctly. The search proving the phrase exists only in `STANDARDS.md` was dropped (denied twice by Amit). No folder `CLAUDE.md` seen loading. |
| R4 | **Passed** | `change-reviewer` (rounds 1, 2): named `rm -rf` with no approval and no two-way target check. `plan-reviewer`: named the missing success measure in rounds 1 and 3; missed it in round 2, when plan-a's Checks line read like a measure (fixture weakness from the round-2 fix). |
| R5 | **Waived by Amit** — both reviewers | Waiver (Amit, 24-11-2026): "Clean-control fixture contains minor non-planted quality issues; reviewer correctly identified them. This is a fixture limitation, not a reviewer failure." `plan-reviewer` on plan-b, round 3: concerns, 3 findings — the search misses in-file `(#steps)` links; plain-text mentions are not stated as out of scope; `doc-check.sh` not run (optional). Round 4 (final attempt, Amit): in-file search and out-of-scope line added; concerns, 4 findings — the in-file search misses other link forms (`[x]: #steps`, titled links, `href`); no check for an existing "How to run" heading; heading level not checked; `Last reviewed` header not addressed (conditional). Waiver (Amit, 24-11-2026): "R5 plan-reviewer waived by Amit, 24-11-2026. Across four rounds, the plan-reviewer found real but progressively finer edge cases in the clean plan fixture; each was closed by the next fixture fix. In these R5 runs, it did not raise a false alarm and correctly confirmed that plan-b reached its explicit success measure. This is a fixture-completeness limit, not a reviewer failure." Correction to the waiver's wording: in its first plan-b run (round 1) the reviewer said "unclear" on reaching the success measure, because the original measure's search was too narrow; rounds 2–4 said "yes". No further R5 fixture or reviewer changes. |
| R6 | **Passed** | Every verdict was `concerns` or `blocked`; "approved" never appeared. |
| R7 | **Passed** | Both: `blocked`, named the missing file, did not guess its content. |
| R8 | **Passed** (numbers recorded) | Same packet and model: `change-reviewer` 8,370 vs general-purpose 21,893 (Sonnet); `plan-reviewer` 8,864 vs 22,894 (Opus) — 61–62% fewer tokens in these paired runs, not a general reduction. Bare start, 0 tools: ~5.1–5.3K vs 18.5K; the ~13K gap is an inference, not measured start-up context. |

Fixture changes (Amit, 24-11-2026), equal in each pair. Round 2: correct hunk counts; step 3 left as context; clean-up runs only after the copy is confirmed and clears the contents, not the folder; plans cover links in any file, search the whole repository, edit only after approval, undo every changed file. Round 3: plan-a's Checks line only ("re-run the step 2 search and list any matches"). Round 4: plan-b only — in-file `(#steps)` search added to the success measure, step 2, step 4 and Checks; one Out line for plain-text mentions. `write-target.sha256` now names a repository-root path.

Helper usage (measured): round 1 147,618 (reviewers 84,297; general-purpose controls 63,321) · round 2 34,629 · round 3 18,038 · round 4 9,442 · total 209,727. Main session: not measured.

Migration done: `harness/cross-check.md` § *The reviewer* — the "not by a lock" sentence replaced with Amit's approved wording (R1–R2 evidence).

#### Skill test result (WP4, recorded 25-11-2026)

**WP4 skill tests complete (25-11-2026):** K1–K5 passed (K3 with an approved substitution). Synthetic scenarios only; no real push, GitHub call or file write in any test. Skills created 24-11-2026: `skills/handoff/`, `skills/send-for-review/` (`disable-model-invocation: true`), `skills/documents/`; no `allowed-tools`. Overlap with the built-in `ship-local` (compared by its description; no file on disk): it self-reviews, fixes and watches until merge, so it is no substitute; kept separate and left alone (Amit). WP4 cross-check 24-11-2026: `change-reviewer`, Sonnet, concerns, 2 low findings, both fixed (Amit), 33,185 measured.

| Test | Result | Evidence |
|---|---|---|
| K1 | **Passed** | `handoff` and `documents` in the main session's skill listing and in two fresh helpers' listings; `send-for-review` in no model listing, by design; Amit confirmed 25-11-2026 that `/send` shows `send-for-review` in the menu (Enter not pressed). Descriptions 147, 200, 209 characters (limit 1,536). |
| K2 | **Passed** | Skill tool refused: "cannot be used with Skill tool due to disable-model-invocation". Paper walk-through: branch per project rules → commit → push → open PR → stop; never merges, approves or closes; local branch only, after Amit confirms the merge, never `-D`; remote branch to the repository setting or Amit. No real push. Clarification (Amit, 25-11-2026): "PR state MERGED is the primary merge verification; git branch --merged main is supporting evidence where applicable. If inconclusive, stop and ask. This clarifies the plan's 'git shows it merged' wording; it is not a test failure." |
| K3 | **Passed with approved substitution** | Amit, 25-11-2026: "Passed with approved substitution: fresh helper agent instead of a fresh main session. The helper started without this conversation's context, which satisfies the fresh-start purpose." Skill available, invoked, completed: read `templates/handoff.md`, filled every *Live* and *Resume* field incl. *Errors and fixes* and *Map updated*; chat only, no file written. |
| K4 | **Passed** | Every file and § pointer in the three skills resolves (main session and both helpers). No text moved. Pointers to the new skills in rule and map files: 0 before, 9 after (`STANDARDS.md` 2 · `DOCUMENT-MAP.md` 1 · `.gitignore` 6). |
| K5 | **Passed** | Search of active files (records and `harness/phase9-scratch/` excluded): no conflicting instruction. `doc-check.sh`: same 2 warnings as session start, none new; "not yet in new format" still 3. |

Extra (not a K test): `documents` run by a fresh helper on a synthetic draft — available, invoked, completed; it named the copied rule, mixed type, missing header, section order, ISO date, file name, missing map row and dated log; every pointer led to real text.

Helper usage (measured): docs-field check 22,108 · cross-check 33,185 · K3 helper 24,320 · documents helper 36,794 · total 116,407. Main session: not measured.

#### Integration test result (WP5, recorded 25-11-2026)

**WP5 tests passed: I1–I5.** Separately, Amit marked Phase 8 and Phase 9 complete 25-11-2026. Preconditions held: clean tree, HEAD `37fc42b`. Synthetic or hypothetical scenarios only; no change to agents, skills, fixtures, permissions, hooks or rule files; no commit or push.

| Check | Result | Evidence |
|---|---|---|
| I1 routing (10 tests) | **Passed** — routing passed in all ten | Four fresh sessions Amit started in `~/.claude`, one message each, hypothetical scenarios (test 1 a real read-only question). Table below |
| I2 recovery | **Passed in a local copy** | `git clone` into `harness/phase9-scratch/recovery/`; `git revert --no-commit` of `37fc42b`, `cbd7307`, `34a5e9f`, `8f98442`, `a80a494` (Amit approved adding `cbd7307` and `8f98442`: they hold the reviewer migration in `harness/cross-check.md` and the brief). Conflicts only in `SETUP-PLAN.md`, `harness/status.md`, `harness/doc-structure-plan.md` (expected). Grep of the copy: no active instruction points to a removed skill, agent or brief; the one mention left is backlog row B24, a record. Limit (Amit's wording): "Recovery verification passed in a local copy: no broken active pointers after undoing the relevant commits. It does not prove how a live session behaves after an undo." The recovery copy was deleted on 25-11-2026 after the WP5 recovery test passed and the records were pushed (Amit; two-method target check) |
| I3 loading | **Passed** (numbers recorded) | `/context all` in this fresh WP5 session (Opus 5.5) against `baselines/phase9-context-24-11-2026.md`. Memory 9.2k → 9.2k (`STANDARDS.md` 7.3k → 7.4k) · Skills 698 → 990 · Custom agents 0 → 176 · System prompt 2.8k → 2.8k · system tools 14.4k → 14.1k, deferred 18.4k → 18.5k. Amit's wording: "Phase 9 added about 0.4k tokens to the directly observed session-start categories (custom agents, skills, and STANDARDS.md pointers). Messages, MCP tools, and the autocompact buffer are not part of this comparison." The rest of the skills rise is built-in (`claude-approvals` ~150 new; `ship`, `steward` +10 each). "Estimated Phase 8 loading share: about 0.8k tokens per session; no pre-Phase-8 measurement exists, so this is an estimate, not a measured comparison." (accepted by Amit; basis: `planning` ~170 plus `STANDARDS.md` 3,386 → 3,851 words at `a80a494`) |
| I4 restart | **Passed** (25-11-2026) | Fresh session Amit started in `~/.claude` after these records; read only the handoff and `harness/status.md`. It stated correctly, without the old conversation: WP5 in progress · I1, I2, I3, I5 passed, I4 pending · limits (no rule, agent or skill change; no commit or push; recovery copy kept) · next gate (judge and record I4, then Amit decides Phase 8 and 9, then the commit). Minor gap: it named only § *Phase 9* as a record place, not § *Phase 8*. It flagged a stale "next gate" line in `harness/status.md`, removed in this recording |
| I5 scripts | **Passed** — no new warning | `doc-check.sh`: same 2 warnings (`ENVIRONMENT.md` 398 lines; repeated backlog header), "not yet in new format" still 3. `session-check.sh`: same drift and doc warnings. `drift.sh`: Voice-Flow and Emp portal drifted (known, carried over; exit 1 from drift), secret scan 160 files, 0 matches |

Routing tests (I1). "Review proposed" = a cross-check was named, not run. No review was completed in any test.

| Test | Session | Route, kind, depth | Planning files read | Result |
|---|---|---|---|---|
| 1 Question only | A | Small request; answered, no plan | `harness/session-check.sh` only | **Routing passed** |
| 2 Tiny wording fix | A | Small approved change | None | **Routing passed** |
| 9 Plain-prose doc | A | Documentation, light, P3; fact, link and format check, no build | `SKILL.md`, `documentation.md` | **Routing passed** |
| 3 One-line login change | B | Full plan; security or login; small enhancement, deep | `SKILL.md`, `feature.md` | **Routing passed.** Review proposed |
| 4 Low-risk small enhancement | B | Small enhancement, no trigger, light | `SKILL.md`, `feature.md` | **Routing passed** |
| 5 Personal data | B | Small enhancement, personal data, deep | `SKILL.md`, `feature.md` | **Routing passed.** Review proposed |
| 7 Non-UI bug | C | Bug fix, cause investigation, no UI test | `SKILL.md`, `bug-fix.md` | **Routing passed** |
| 8 UI bug | C | Bug fix with a UI check at narrow width | `SKILL.md`, `bug-fix.md` | **Routing passed** |
| 10 Runbook | C | Documentation, deep; restore really run in a scratch copy, else "partly verified" | `SKILL.md`, `documentation.md` | **Routing passed** |
| 11 New app | D | New project, deep, 4 triggers; three questions before planning | `SKILL.md`, `new-project.md`, `templates/new-project.md` (named by the guide) | **Routing passed.** Review proposed |

Notes, not failures: tests 7 and 8 went deep because the session read "cause not yet known" as the *unclear cause* trigger — a literal reading that would make most bug fixes deep; the criteria set no depth for 7–8. Amit's decision (25-11-2026): "Bug tests 7–8 went deep because 'cause not yet known' was treated as a risk trigger. Accepted as-is for WP5; review the trigger wording in Phase 10." Grouping three items in one message means a guide loaded for one item stays in context for the next; per-item file lists were asked for and given. Test 3: the session said it had not read `harness/cross-check.md` to confirm the review level.

Usage: helpers 0 (none started). Test sessions: not measured. Main session: 71.5k at `/context all` early in WP5.

#### Recovery verification (approved; the last step of WP5)

The live setup is never undone to test recovery. Each git command below is approved by Amit at the time.
1. Make a local copy: `git clone` of `~/.claude` into `harness/phase9-scratch/recovery/` (no network; ignored files such as settings and transcripts are not copied). Only after every other check is done; excluded from all searches.
2. In the copy only: `git revert --no-commit`, newest first, each Phase 9 switch-on commit, then `a80a494` (Phase 8 switch-on).
3. Judge each revert: conflicts in record files only (`SETUP-PLAN.md`, `harness/status.md`, `harness/doc-structure-plan.md`) are expected, because later record commits edited them — noted, not failed. A conflict in a rule, skill, agent, brief, `.gitignore` or `DOCUMENT-MAP.md` file fails. Then search the copy: no active instruction points to a missing skill, agent or brief.
4. Read the copy with Bash and Grep only, never by starting a session in it, so its `CLAUDE.md` files are not loaded.
5. Limit, stated in the result: this proves the reverts leave no broken pointer. It does not prove how a live session behaves after a revert; that part stays paper-reviewed unless Amit asks for a fresh session in the copy.
6. Deleting the copy afterwards: Amit's approval plus the two-method target check.

#### Open items

- Decided (Amit, 24-11-2026): no fake `.env` test; R1–R3 prove what it would show.
- Closed (25-11-2026): frontmatter field names — agents proven by R1–R3; skills' manual-only field is `disable-model-invocation`, proven by K2.
- Closed (25-11-2026): `send-for-review` vs `ship-local` overlap reported to Amit and decided (*Skill test result*).
- B16 project-map trial still feeds the brief's "where to look next" line.

#### Decision

**D52** (approved by Amit 24-11-2026) — Phase 9 final design: two reviewers, layered context, setup brief, three skills, migration rule, tests. Numbering checked 24-11-2026: D51 was the newest D-row in `SETUP-PLAN.md`.

### Phase 10 — Clean-up and rewrite (plan approved 25-11-2026, Amit)

> **Closed at WP3b, 26-11-2026 (Amit, D54).** WP1–WP3b are done. WP4–WP9 were not started; they move into Phases 12–19 — see *Phases 12–21* below. The text of this section stays as the record of what was planned.

Replanned 25-11-2026 in a read-only session, using the Phase 8 planning skill and two `plan-reviewer` rounds. This replaces the 20-11-2026 outline (D50) and the old T30–T33 and 30-day-review plans; those are in git history.

#### Goal and success

**Goal (Amit):** Claude Setup clean, simple, fast, easy to update, easy to maintain. One update in one place. Things stay connected and in sync — a rule changed in one place must not survive as copies elsewhere. Model: Wikipedia (one home per fact, others link) · library (one catalog of every file) · Obsidian (clickable links, "what links here").

**Success:** every check in *Final checks* below is yes. Phase 10 is complete only after Amit approves the final verification report.

#### Agreed requirements (Amit, 25-11-2026)

- No removal target, no percentage. Each file is classed **keep · ask Amit · remove**.
- Delete only files that are not required, or old and safe to delete.
- Design major documents before rewriting them.
- One fact or instruction has one home; other places link to it.
- **Length:** as long as the facts need, in simple words. Never cut facts to look short; no forced one-liners. Five lines are fine when five lines are needed.
- Never silently drop a live rule, an unresolved limit, a waiver, or evidence of what was actually tested.
- Check recoverability before proposing a deletion: local-only and ignored files are not in git.
- Surgical changes; the working system keeps working.
- Phase 10 changes only `~/.claude`. No change in other projects, no installs, no Phase 11 work.
- Conflicts with today's deletion and archive rules are resolved by changing the rules first (WP2), never bypassed.

#### Definitions

- **Live:** still in use — a rule, setting, limit, waiver, recovery instruction, open item, or a fact a file or process depends on.
- **Historical:** how something was, or how we got here. Nothing live depends on it.
- **Duplicate:** the same rule or fact in more than one place, word for word or same meaning. One place is the home; the others become links.
- **Obsolete:** was live, but is replaced or no longer true.
- **Orphan file:** a tracked file that is not in the catalog and that nothing links to.

#### Approval gates

1. Amit approves the final plan text (done 25-11-2026).
2. Only then: save the plan and update `harness/status.md` and `.claude/current-task.md` (done 25-11-2026).
3. Every commit needs Amit's separate approval.
4. Every push needs Amit's separate approval.
5. WP1 starts only in a fresh session.
6. Each work package starts only on Amit's word. A deletion waits for a separate message, even when approved (`STANDARDS.md` § *Plan before building*).

#### Deletion rule (built in WP2; stays after Phase 10)

A document may be removed only when **all** of these are true:
- It is tracked in git.
- It is obsolete, replaced or no longer needed.
- Its live content, if still needed, already has a new home.
- Amit approves it by exact file name.

Leave a one-line pointer when the removed file may still be referenced by another file, memory note, skill, agent, or external reference. The pointer gives the original file name, the date and the commit title (so it still works if commit IDs ever change, see C11).

Local-only files are never deleted through this rule. `STANDARDS.md` step 4 still applies: the two-method target check, and an agent review for consequential deletions.

**Built in WP2a (25-11-2026):** the rule's home is now `DOCUMENTATION-STANDARD.md` § *Moving and archiving*; `STANDARDS.md` § *Docs are products* points to it. The text below is the plan as approved.

WP2 replaces every "never delete" and "archive always" copy that WP1 finds. Known so far: `STANDARDS.md:156` · `DOCUMENTATION-STANDARD.md:32`, `:161`, `:196`, `:211` and § *Moving and archiving* · `DOCUMENT-MAP.md:42`, `:44` · `skills/documents/SKILL.md:19` · `skills/planning/documentation.md:21` · the templates and *Older records* pointers that depend on them.

#### Link and sync (WP3b)

- **Catalog:** `DOCUMENT-MAP.md` lists every active **git-tracked** setup file and its purpose.
  - One row per file for documents, scripts, skills and agents.
  - One row per folder where the folder has its own index (`baselines/README.md`, `archive/README.md`) or is a group (memory notes, `project-rules/` copies).
- **Local-only setup files:** listed in a short separate section, *Local-only (not in git)*, name and purpose only; not checked for coverage. Known: `.claude/current-task.md` · both `settings.local.json` · `harness/planning-research.md` · `harness/phase9-scratch/` · `baselines/s4-*.json/.py` · `skills/.trash/` (WP1 confirms).
- **Never catalogued:** project transcripts, caches, logs and Claude-managed folders — `projects/*/*.jsonl`, `file-history/`, `paste-cache/`, `sessions/`, `plugins/`, `skills/synced/`, `history.jsonl` and similar.
- **`doc-check.sh` checks:** broken links in both forms (backtick paths and clickable links) · catalog coverage · duplicates only for a short registered list of important rules (home file + key phrase).
- **"What links here":** a simple search report, run when needed. Not a permanent system.
- **Not attempted:** catching reworded copies automatically. The final review covers those.
- **Working habit:** change a rule in its home, run "what links here", fix the linked files in the same commit.
- **Session start:** checks setup files only; the full scan runs on request. Time it.
- Old files switch to clickable links only when they are rewritten.

#### Work packages

Each package is one commit on Amit's word; `git revert` undoes it cleanly only until the next package starts. Each names its effect on `harness/doc-check.sh` (CHECKED list, heading lists, PLANNED) and on `.gitignore` allow-lines (a new tracked file needs one, D37). `change-reviewer` runs on any package that deletes something or changes a rule file.

| WP | Scope | Gate | Checks |
|---|---|---|---|
| 1 Baseline + inventory (read-only) | Amit types `/context all` as the first message of two fresh Opus sessions (`~/.claude` and FinNode); saved as a dated record in `baselines/`. Inventory of every tracked setup file and the local-only list: size, loads every session?, inbound pointers, type, keep / ask Amit / remove, duplicates and contradictions with file:line. Greps for every copy of each key rule and every limit and waiver. Folds in `harness/status.md` § *Known contradictions*. `archive/` bundle and tarballs default **keep** (not recoverable from git). | Amit classifies the "ask" items and approves the remove list by name | Pointer counts by `grep` |
| 2a Rule fixes (deep) — split from WP2 by Amit, 25-11-2026 | Deletion rule, in every copy · bug-depth wording ("unclear cause", `STANDARDS.md:36`, `skills/planning/bug-fix.md:30`; tests 7–8) · "tiny-change route" (`skills/planning/SKILL.md`) vs "small approved change" (`STANDARDS.md`) · `doc-check.sh` duplicate warning (template ↔ backlog line, a by-design copy) + B34 · project-data wording, home `PROJECTS.md` § *Project data*, only on lines that do not name Packbly | Amit approves the exact text | `change-reviewer` · fresh-session routing tests 2, 7, 8 |
| 2b Packbly | Remove Packbly from active setup docs (`OLLAMA.md:7-8`, `skills/ollama/SKILL.md:62-63`, `ENVIRONMENT.md` Packbly lines and § *Sensitive data*, `PROJECTS.md` *Not projects*, `project-rules/README.md` § *Detached*); the `PROJECTS.md` § *Project data* line "Packbly is ignored and never opened." stays. The `settings.json` deny rules stay (Amit's recommendation); removing them would be its own permission change | Separate approval, after WP2a is committed | `change-reviewer` · searches |
| 3 Design | Document roles (Rules · Reference · State · List · Catalog = `DOCUMENT-MAP.md` · History = git + pointer) · style guide with one before/after sample page · link model (standard markdown links; no `[[wikilinks]]`) · `DECISIONS.md` shape · contents lists only in long docs · the old 30-day format review folded in · names the WP9 prompt file | Amit approves the design and sample page | None (design only) |
| 3b Link-and-sync check | As in *Link and sync* above | Amit approves the change | Runs on the current repo; warnings listed, not fixed here |
| 4 Remove approved tracked files | Only the files Amit approved **by name** — never a whole folder. `baselines/global-open-tests.md` (live list), `baselines/phase9-context-24-11-2026.md` and the WP1 baseline stay. Pointer lines as the deletion rule says | Item-by-item; deletion in a separate message | Two-method target check · `change-reviewer` |
| 5 `SETUP-PLAN.md` split | Build `DECISIONS.md`: live decisions with the text each needs; one index row per closed or replaced D-number so "D46"-style references still work. Rebuild steps to a rebuild guide (`README.md` if short enough, else `harness/rebuild.md`). Fix setup-side pointers, incl. `harness/agent-brief.md:59`. After `DECISIONS.md` holds D50–D53, move closed Phases 1–9 out of this file, one pointer per phase; fix `harness/agent-brief.md:8` (D53). **`SETUP-PLAN.md` stays permanently** as a very short pointer file: to `DECISIONS.md`, the rebuild guide, and git history (original file name, date, commit title). C11: UUIDs and emails leave the working files | Amit approves | D-number references counted before and after · `change-reviewer` |
| 6a–e Rewrite, one per session | 6a `ENVIRONMENT.md` (398 lines) · 6b `DOCUMENTATION-STANDARD.md` + `DOCUMENT-MAP.md` · 6c harness files + backlog (value bar for entries; done rows out; B24, B25 decided) · 6d `PROJECTS.md` + `project-rules/README.md` (wrong on AtWorkpe; omits AtWorkpe and VT; wrong that Voice-Flow keeps `CLAUDE.md` untracked; add a VOS Dashboard row "not set up") + re-copy Voice-Flow `CLAUDE.md` file by file (never `sync.sh --pull`: Emp portal and VT must not be synced) · 6e `STANDARDS.md` last: rarely-used rules move to skills; `agent-brief.md` rule lines and the registered rule list updated | Design per document approved first | List of every rule, limit and waiver kept · `change-reviewer` · restart test after 6e |
| 7 Setup memory | Notes in `projects/-Users-amitjangra--claude/memory/` that only restate `STANDARDS.md` become a pointer or are removed. Same package removes the `DOCUMENTATION-STANDARD.md` § *Allowed copies* row that allows memory copies. Other projects' memory → project clean-up list | Amit approves | `MEMORY.md` links resolve |
| 8 Final test | See *Final checks* | Amit approves the final verification report | As listed |
| 9 Global project clean-up prompt | See *WP9* below | See *WP9* | See *WP9* |

**WP2a result (25-11-2026):** sections A–E applied as approved, with the review fixes below. Success searches 1–2 passed (remaining hits only in history, this plan, "admin or super-admin users" lines, Voice-Flow memory). `doc-check.sh` 2 → 1 warning (ENVIRONMENT.md size, 6a). Reviews: `plan-reviewer` Opus, concerns, 8 findings, all taken in (71,316 measured) · `change-reviewer` Opus round 1, concerns, 5 findings (33,768 measured): 1, 2, 4 fixed, 5 kept, 3 → WP2b · round 2, concerns, 3 findings (11,494 measured): 2 fixed, 1 (FinNode missing from `ENVIRONMENT.md` § *Sensitive data*) → WP2b, 3 skipped (Amit). Routing tests 2, 7, 8 (25-11-2026, fresh session; self-reported, checked against the saved pass criteria):
- Test 2: PASS — small approved change; no planning files; no trigger.
- Test 7: PASS — bug fix, light; reads SKILL.md and bug-fix.md; deep only if the cause remains unknown after a first look; no UI check.
- Test 8: PASS — bug fix, light; reads SKILL.md and bug-fix.md; deep only if the cause remains unknown after a first look; includes a UI check at about 360px.

Phase 10 WP2a committed 56c9fbd and pushed 25-11-2026.

**WP2b result (25-11-2026):** Packbly removed from active setup docs, as approved by Amit.
- Files: `OLLAMA.md` · `skills/ollama/SKILL.md` · `PROJECTS.md` (*Not projects*) · `ENVIRONMENT.md` (§ *Duplicate trees*, § *Project-tree decisions*, § *Sensitive data*, *Full project descriptions*) · `project-rules/README.md` (§ *Detached*).
- Kept: `PROJECTS.md:12` "Packbly is ignored and never opened." (no second line) · `ENVIRONMENT.md:145` unchanged — it describes the live deny rules. The existing Packbly deny rules in `settings.json` remain; not touched. Packbly folders and GitHub repo not touched. No file deleted.
- Emp Portal and sensitive data: `OLLAMA.md`, `skills/ollama/SKILL.md` and `ENVIRONMENT.md` § *Sensitive data* now point to `PROJECTS.md` § *Project data* (closes WP2a review findings on Emp Portal and FinNode).
- Packbly search (the five files): only `PROJECTS.md:12` and `ENVIRONMENT.md:145`, both kept on purpose.
- Emp Portal search: no active doc says Emp Portal holds real data now; remaining hits are general "never send" rules and "real personal data once live" table notes.
- `doc-check.sh`: 1 warning before and after (ENVIRONMENT.md size, 6a; 398 → 390 lines), none new.
- Review: `change-reviewer` Opus, verdict no concerns, 3 low findings (24,440 measured). Amit: 1 applied (`OLLAMA.md:7` now also forbids "any real or private project data") · 2 skipped · 3 accepted.

Phase 10 WP2b committed a3846d4 and pushed 25-11-2026.

**WP3b result (25-11-2026), link check only:** Amit split WP3b. Catalog coverage, the *Local-only* section in `DOCUMENT-MAP.md`, the registered-duplicates check, the "what links here" report and session-start timing move to WP3b part 2, in a fresh session.
- `harness/doc-check.sh` now checks clickable links in the files it already checks. It resolves each link from its own file's folder and checks section anchors against the target's headings (GitHub style). It skips website links, inline code and code blocks; `project-rules/` files are not on its list. A section anchor that points at a folder is reported as a missing section, without an error (O4).
- D53 amended (Amit): `MEMORY.md` index lines may use `[Title](file.md)`, because Claude Code's memory system requires that format. Recorded in *WP3 design* → *Link model* and in `SETUP-PLAN.md` D53.
- The four sample-page links in *WP3 design* stay clickable, marked illustrative: they are written as they will sit in `ENVIRONMENT.md` at the root.
- Findings: no must-fix. S1 applied: `baselines/global-open-tests.md` TC3 now names `ENVIRONMENT.md` § *How numbers are measured*. O4 applied. Accepted or deferred: O1 (old section names in `baselines/README.md` record where content came from) · O2 (repeated and accented headings, known limits) · O3 (link forms the model does not use) · O5 (clickable links in always-loaded files are not flagged; WP3b part 2 or WP6b) · O6 (the dated `PROJECTS.md` heading, WP6d) · O7 (backtick § section names are not checked by the script; 47 checked by hand, 45 match, the other 2 were S1 and O1).
- Not checked: `backups/` — access was denied, not retried.
- Test, in a scratch clone: the old check missed a broken clickable link; the new check caught exactly that link and nothing else. Seven valid link forms gave no warning; links in code were skipped.
- `doc-check.sh` on the real repo: 1 warning before and after (`ENVIRONMENT.md` size, WP6a). Run time 0.98s → 1.08s (`time`, one run each).
- Review: `change-reviewer` Opus, verdict no concerns, 4 low findings and 1 note (17,358 measured). Finding 4 became O4; the rest are O2, O3 and O5.

Phase 10 WP3b (link check) committed 2f40fd8 and pushed 25-11-2026.

**WP3b part 2 result (25-11-2026):** applied as approved by Amit, with all seven `plan-reviewer` findings taken in (Opus, verdict concerns, 7 findings: 1 must-fix, 4 should-fix, 2 optional; about 41k measured).
- **Catalog coverage** (`harness/doc-check.sh`, every run incl. session start): each `git ls-files` path needs its own path in the first cell of a `DOCUMENT-MAP.md` row in § *Global documents* or § *Not documents*, or must sit in one of four group folders whose row is there: `archive/` · `baselines/` · `projects/*/memory/` · `project-rules/*/`. First run: 139 tracked files without a row, because the group rows had not counted. The cause: the script first named its group list `GROUPS`, a reserved Bash variable that silently ignores assignment; it was renamed to `MAP_GROUPS`. After the map fixes: 0.
- **`DOCUMENT-MAP.md`:** new rows for `project-rules/README.md` · `.gitignore` · `statusline/context.py` · `skills/ollama/SKILL.md` · `project-rules/manifest.tsv`, `drift.sh`, `sync.sh`; the `templates/`, `skills/`, `agents/`, settings and `project-rules/` rows now name each file; `.claude/current-task.md` moved to the new § *Local-only (not in git)*. "Files not yet in the new format": 4 → 5 (`project-rules/README.md` added to the map).
- **Local-only list:** from the WP1 inventory (`git status --short --ignored`), each item confirmed on disk. Finding 5 (re-list with `git ls-files --others --ignored`) not done: that command was denied and not retried, so completeness rests on the WP1 list.
- **Registered rules** (full run only, Amit): 8 phrases, home file and key phrase, in `REGISTERED`. Project descriptions have no single key phrase, so they are not registered. Not scanned: `archive/`, `baselines/` except the live list and index, `SETUP-PLAN.md`, this plan, the script, other projects' files and memory. A phrase missing from its home also warns. Real repo: 3 copies listed, not fixed here — `ENVIRONMENT.md` (Debugger v2 status, WP6a) · memory `claude-setup-status.md` ("start setup sessions from", WP7) · `templates/handoff.md` (80-line limit, WP6b).
- **"What links here":** `harness/doc-check.sh --links-to <file>[#section]`. Reads every tracked text file. Backtick paths from the repo root (and `~/.claude/…`); with a section, only "`file` § *Section*". Clickable links resolved from their own file. Known limits: a § given by number only matches when the heading is numbered; a section name broken across two lines matches by its first word, so it can over-report.
- **Tests (scratch clone `/tmp/wp3b2-scratch`, base 24 warnings from missing local-only files):** unmapped file and unmapped skill → exactly 2 new warnings · a record in `baselines/` and a new `project-rules/<project>/` copy → none · a new top-level `project-rules/` file → 1 · a planted copy of a registered phrase → 1, its home none; `--quiet` → 0 registered lines · the phrase reworded in its home → 1 · `--links-to`: 7 of 7 planted links found (root, same folder with anchor, two folders up, a file name with a space, `~/.claude/` form, a backtick § form, an unchecked file); a fenced link and a website link skipped; with a section, 2 of 2 · no argument → usage line.
- **Run times** (`/usr/bin/time -p`, 3 runs each, median, 25-11-2026): `session-check.sh` 1.38s → 1.36s (no change) · `doc-check.sh` full 1.09s → 1.17s · `--links-to` 0.09s.
- **Real repo after:** `doc-check.sh` full 4 warnings (`ENVIRONMENT.md` size, WP6a, and the 3 registered copies above); `--quiet` (session start) 1 warning, the same as before.
- Not done: O5 (WP6b).
- Review: `change-reviewer` Opus, verdict concerns, 6 findings (1 medium, 5 low; 43,898 measured). Finding 1 confirmed by test: an empty map (missing file or renamed heading) makes the coverage check pass silently. Findings 1–4 and 6 wait for Amit's decision; finding 5 (this line was missing) fixed.
- **Review fixes (Amit, 25-11-2026; no further reviewer round, about 6 lines):** 1, 2 and 4 applied; 3 and 6 accepted. (1) An empty map (missing file, renamed headings, emptied tables) now warns "no map entries found … catalog coverage not checked", at session start too. (2) The three file lists for coverage and registered rules use `git -c core.quotepath=off ls-files`. (4) `--links-to` strips `./`, `~/.claude/` and the expanded home path before matching.
- **Fix tests (scratch clone, the pre-fix script kept beside the fixed one):** emptied map tables → old 0 warnings, new 1 (full and `--quiet`) · a mapped file named `harness/café.md` → old 1 false "no row" warning plus 8 `grep` errors, new 0 · `--links-to` with `STANDARDS.md`, `./STANDARDS.md`, `~/.claude/STANDARDS.md` (expanded and literal) → 407 each, same lines; old script with `./` → 0. With the map file deleted, older checks that read the map also print "can't open" errors; known, not changed here.
- **Final real repo:** `--quiet` (session start) 1 warning (`ENVIRONMENT.md` size, WP6a) · full run 4 (that plus the 3 registered copies) · `session-check.sh` 1.35s median of 3.

Phase 10 WP3b part 2 committed f4513c0 and pushed 25-11-2026.

#### WP3 design (approved 25-11-2026, Amit; D53)

Design only. Nothing here changes another file until the package named on each line applies it. Cross-check: `plan-reviewer`, Opus, verdict concerns, 9 findings (2 must-fix, 6 should-fix, 1 optional group), all taken in with Amit's approval (55,880 measured).

**Document types (seven).** Home from WP6b: `DOCUMENTATION-STANDARD.md` § *Five file types*, renamed. WP6b also sets the headers and sections for Plan, Catalog and History, and renames the `record` header in `harness/doc-check.sh`.

| Type | Holds | Rule |
|---|---|---|
| **Rules** | How to work | Short, testable lines. No history, no dates except where a rule needs one. |
| **Reference** | How things are now | Per topic: what it is · current setting · how to check · how to change · known gaps. |
| **State** | Where work stands now | Overwritten, never added to. |
| **Plan** | The active phase's plan and results | Added to while the phase runs. When a phase closes, its detail moves out: decisions to `DECISIONS.md`, the rest to git with a one-line pointer. |
| **List** | Items with IDs | One row per ID, with `Next ID`. |
| **Catalog** | Where every file is and what it is for | `DOCUMENT-MAP.md`, plus a folder index where a folder has one. |
| **History** | How things were | Git is the history. A dated record is kept only as evidence that something live still cites; otherwise a one-line pointer (file name, date, commit title). Items git cannot recover (the `archive/` bundle and tarballs) are kept; removed only under `DOCUMENTATION-STANDARD.md` § *Moving and archiving*. |

**Role of each major document.** Each is the one home for the facts in *Home for*; elsewhere those facts are a link.

| Document | Type | Loads | Home for | Must not hold |
|---|---|---|---|---|
| `CLAUDE.md` | Rules | every turn | the three imports | anything else |
| `STANDARDS.md` | Rules | every turn | how to work: gates, risk check, approval, evidence, session limits, model rule | procedures, measurements, history |
| `RTK.md` · `OLLAMA.md` | Rules | every turn | how to use rtk · when to use the local model | measurements (`ENVIRONMENT.md`) |
| `.claude/CLAUDE.md` | Rules | setup sessions | setup-only rules | status |
| `DOCUMENTATION-STANDARD.md` | Rules | on need | document types, headers, IDs, naming, growth, size limits (300-line document, 80-line task file), deletion rule, writing style, link model | which file is where |
| `DOCUMENT-MAP.md` | Catalog | on need | one row per tracked setup file or folder group, plus the local-only list | rules or detail |
| `README.md` | Reference | on need | what this repo is; start setup sessions from `~/.claude`; rebuild steps if they stay short (WP5) | status |
| `ENVIRONMENT.md` | Reference | on need | machine and tool facts: rtk, status line, permissions, effort, `skillOverrides` facts, loading figures, how numbers are measured | project descriptions (`PROJECTS.md`), rules |
| `PROJECTS.md` | Reference | on need | each project's path and status; project data (VT, FinNode, Emp Portal, Packbly); the VT git rule | machine facts |
| `REPOS.md` | Reference | on need | repo shortlist | — |
| `project-rules/README.md` | Reference | on need | how the rule-file backup works (`manifest.tsv`, `drift.sh`, `sync.sh`) | project status |
| `DECISIONS.md` (new in WP5) | List | on need | every D-number | rebuild steps, history narrative |
| `SETUP-PLAN.md` (after WP5) | History | on need | a short pointer page only | anything live |
| `harness/status.md` | State | setup start | where setup work stands; open items; next gate | finished narrative (git holds it) |
| `harness/backlog.md` | List | on need | setup items not yet built | done rows beyond one *Completed* line |
| `harness/doc-structure-plan.md` | Plan | on need | the active phase's plan, gates and results | closed phases' detail, once moved out (WP5) |
| `harness/cross-check.md` · `models.md` · `agent-brief.md` | Reference | on need | review procedure · model detail · reviewer brief | the model rule itself (`STANDARDS.md`; fixes WP1 duplicate 4) |
| `harness/overview.md` | Reference | on need | how a session works; the "finished" checklist | status |
| `harness/project-cleanup-list.md` | List (temporary, no IDs) | on need | project-side findings | secrets, personal data |
| `baselines/global-open-tests.md` | List | on need | open tests | — |
| `baselines/README.md` · `archive/README.md` | Catalog (folder index) | on need | one line per file in that folder | — |
| `templates/` | Forms (Reference) | when a step needs one | blank forms for each document type | rules (they live in `DOCUMENTATION-STANDARD.md`) |
| `baselines/*` dated · `archive/*` | History | via pointer | evidence | anything live |
| `.claude/current-task.md` | State | setup start | the one task in progress | the plan itself |

Scripts such as `statusline/context.py` are not documents; WP3b's catalog check covers them.

Homes for known duplicates (WP1 baseline § 6): model rule → `STANDARDS.md` · VT git rule → `PROJECTS.md` · session limits → `STANDARDS.md` · project descriptions → `PROJECTS.md` · Debugger v2 status → `PROJECTS.md` · "start from `~/.claude`" → `README.md` · 300-line and 80-line limits → `DOCUMENTATION-STANDARD.md` · `skillOverrides` facts → `ENVIRONMENT.md` (the memory note links to it, WP7).

**Writing style.** Moved word for word to `WRITING-GUIDE.md` § *Writing style* on 26-11-2026 (Phase 12 WP1), then adapted there. The home moves from `DOCUMENTATION-STANDARD.md` § *Writing style* (planned for WP6b, never built) to the guide; confirmed by Amit 26-11-2026 (WP1 clash 1), recorded in D55.

**Contents lists.** A `## Contents` list goes in any document over about 150 lines, right after the header: one linked line per `##` section, with a few words on what it holds. None in shorter files, in always-loaded files (they cost tokens every turn), or in History records. In `DECISIONS.md`, the Index is the contents list.

**30-day format review — folded in.** In WP6b, `DOCUMENTATION-STANDARD.md:226` becomes: "Formats change only from a real case: a backlog item, then a D-number. There is no calendar review." The WP8 final review is the one format review for Phase 10.

**Sample page — `ENVIRONMENT.md` § 2 *Status line*, after** (approved as the style sample; applied to `ENVIRONMENT.md` only in WP6a; *Known gaps* unchanged):

The sample's links are illustrative: they are written as they will sit in `ENVIRONMENT.md` at the repository root, so they do not resolve from this file.

> ## 2. Status line
>
> The status line shows how big the session's context is, so you know when to clear.
>
> ### What it is
>
> `statusline/context.py` reads the real token counts from the session transcript and prints the current context size. It never estimates. The terminal shows its output, but the output never enters Claude's context, so it costs nothing in tokens and can be changed freely.
>
> **Why size matters.** Claude re-reads the whole conversation on every step, so a long session pays for all its history on every small action. Sessions start at about 48K tokens and grow by about 1,200 per turn. The largest seen was 588K. (Measured 15-09-2026 over 50 sessions and 12,623 turns; the data is at the top of [statusline/context.py](statusline/context.py).)
>
> **What to do.** Run `/clear` when one task ends and an unrelated one starts, not in the middle of a task. In the measured sessions, clearing between separate tasks saved 45–54%, and clearing during one long task saved about 3% (measured; no date or method recorded here or at the top of `context.py`). The task boundary saves tokens, not the number on screen. The warning is a nudge to clear there, not a sign of running out of room.
>
> ### Current setting
>
> - Under 200K: grey.
> - 200K to 300K: amber. This starts before the 220K checkpoint in [STANDARDS.md § Plan before building](STANDARDS.md#plan-before-building); weigh the 80% rule there.
> - 300K to 400K: red. Act at the next task boundary.
> - Past 400K: it suggests `/compact`.
>
> **Why these values.** Amit lowered them to 200K / 300K / 400K on 11-10-2026 to save tokens. Past 250K, each turn costs more and uses more of the usage limit, so the nudge should come sooner. 150K was considered and judged too early. Checked against `STANDARDS.md` on 06-11-2026 and kept; the 220K checkpoint was added there later, on 24-11-2026.
>
> ### How to check
>
> The constants at the top of [statusline/context.py](statusline/context.py) are the live values.
>
> ### How to change
>
> Edit those constants. Earlier values, and why they changed, are at the top of that file. Older notes are in [baselines/environment-history-01-11-2026.md](baselines/environment-history-01-11-2026.md) § D and § E.

**`DECISIONS.md` shape (built in WP5).** Follows `templates/decisions.md`; WP6b gives the template's status line the same words.
- Full header, then `Next ID:` the last D-number + 1 at WP5.
- `## Index`: one row for every D-number, closed and superseded ones included, so every "D46"-style reference still resolves. Columns `ID · Title · Date · Status`. It is also the contents list.
- Status words: `in force` · `in force · closed DD-MM-YYYY` (every affected file checked) · `open` · `partly superseded by D#` or `partly superseded DD-MM-YYYY (which part, what replaced it)` · `superseded by D#` or `superseded DD-MM-YYYY (what replaced it)`. Fixes C13 ("All 45" against D1–D52).
- `## Active decisions`: one entry per decision in force or open — `### D<n> — <title> (DD-MM-YYYY)` with Status · Decision · Reason · Rejected · Affected files · Linked task. A field the old text lacks says "not recorded" (Linked task: "none"); nothing is made up.
- `## Completed`: one line per superseded decision, saying what replaced it.
- `## Older records`: "Original wording: `SETUP-PLAN.md` § *Decisions already made*, last present in commit '<title>', removed in commit '<WP5 title>' (DD-MM-YYYY)."
- No emails or account IDs (this plan's C11: UUIDs and emails, WP5 row above).
- D-numbers in other files are plain text, found by search, not anchor links.

**Link model.** Home from WP6b: `DOCUMENTATION-STANDARD.md` § *Links*. WP3b's check enforces it.
- Standard markdown links: `[STANDARDS.md § Plan before building](STANDARDS.md#plan-before-building)`. The link text names the file and section in words.
- Clickable links are relative to the file that holds them (from `harness/`: `../STANDARDS.md`). Backtick paths are written from the repo root. WP3b checks each form its own way.
- Anchors follow GitHub's style: lowercase, spaces become hyphens, punctuation dropped (`## 3. Permissions` → `#3-permissions`).
- Backtick paths with § and the section name, not links: in every always-loaded file (`DOCUMENTATION-STANDARD.md` § *Always loaded*: the global rule files, both setup `CLAUDE.md` files, each project's `CLAUDE.md`, each `MEMORY.md`), because they load every turn and Claude does not click (links would add about 400 tokens per session, estimate); and for references across folders such as `~/.claude/…`, which is not a valid relative link.
- IDs (D46, B34, TC3, T30) stay plain text. Commands, code and file names mentioned in passing stay in backticks.
- Memory has two exceptions. Memory notes use `[[name]]` links, because Claude Code's memory system uses them (14 uses in 10 setup notes, counted by `grep -o` 25-11-2026), so those stay. No `[[wiki-links]]` anywhere else. `MEMORY.md` index lines may use `[Title](file.md)` because Claude Code's memory system requires that format (D53 amendment, Amit, 25-11-2026).
- Old files switch to links only when they are rewritten.

**WP9 prompt file:** `harness/project-cleanup-prompt.md` — type Reference. When created in WP9: an allow-line `!harness/project-cleanup-prompt.md` after `.gitignore:139`, a `DOCUMENT-MAP.md` row, and an entry in the `harness/doc-check.sh` CHECKED list. If it becomes a skill later, it moves to `skills/`.

Model: Opus for WP1–3b, 5, 6e and 9; Sonnet is enough for WP4 and pointer fixes (Amit picks at session start).

#### WP9 — Global project clean-up prompt

| | |
|---|---|
| **Scope** | Write the prompt and test it. Nothing else. It does **not** clean any project. |
| **Output** | A prompt file in `~/.claude` (name set in WP3, added to the catalog). It uses `harness/project-cleanup-list.md`. |
| **What the prompt must say** | 1. Start read-only. 2. Follow that project's own rules. 3. Report findings and a proposed plan, then **stop before any change** and wait for Amit's approval. 4. Never copy secrets, tokens, passwords, private keys, environment values, customer data, employee data or other personal data into the project clean-up list, the prompt output, or any setup file. 5. Never delete admin or super-admin users (Amit, 25-11-2026). |
| **First test project** | **AtWorkpe** (dummy data only, Amit 14-11-2026; chosen by Amit 25-11-2026). Never first: Emp Portal, VT, or any project known to hold customer, employee or other sensitive data. |
| **Test** | One read-only run in AtWorkpe, in a fresh session Amit starts. |
| **Gates** | 1. Amit approves the prompt text. 2. Amit starts the test run. 3. Amit approves the test result. 4. Commit only on Amit's word; push separately on Amit's word. |
| **Checks** | **No tracked project file changed:** `git status --short` and `git diff --stat` in AtWorkpe, run before and after, show the same result · **stopped at the approval gate:** the output ends with findings and a plan, with no edit, command or write after it · it used the project clean-up list · no secret or personal data in the prompt file, the test output, or anything added to the list · `doc-check.sh` shows no new warning |
| **After Phase 10** | Amit runs the prompt in each project, one by one. It may become a skill after 2–3 projects. |

#### Temporary project clean-up list

- **File:** `harness/project-cleanup-list.md` — temporary, tracked in git, one catalog row. Created in WP1 (25-11-2026) with the WP1 project findings and the rule "Never delete admin or super-admin users."
- **Holds** project-specific findings only. Each row: project · exact issue · evidence · recommended action · status.
- **Never holds** secrets, tokens, passwords, private keys, environment values, or personal data.
- **Deleted** only after the matching project clean-up work is complete, under the deletion rule (Amit approves by name).
- **Git tracking — checked 25-11-2026, not assumed:**
  - Blocked today by `.gitignore:22` (`*`). `!harness/` (line 129) only lets git look inside the folder.
  - `git check-ignore -v --no-index harness/project-cleanup-list.md` → `.gitignore:22:*	harness/project-cleanup-list.md`
  - Add, after `.gitignore:138`, in the same commit that creates the file: `!harness/project-cleanup-list.md`
  - Verify: (1) the same `check-ignore` command must print the `!harness/project-cleanup-list.md` line, not `:22:*` — judge by the line, not the exit code (exit is 0 in both cases; checked against `harness/agent-brief.md`) · (2) `git status --short harness/project-cleanup-list.md` → `?? harness/project-cleanup-list.md` · (3) after the approved commit, `git ls-files harness/project-cleanup-list.md` prints the path.
- **Known entries for it** (25-11-2026 discovery): FinNode memory points to `SETUP-PLAN.md` sections that will move (`MEMORY.md:1`, `setup-review-project-by-project.md:10,19,33`, `rtk-proxy-suppresses-dry-run-output.md:26`) · Voice-Flow memory notes that restate setup rules · Emp portal local folder still on `fix/dead-code-cleanup-and-test-fix` · VOS Dashboard not set up.

#### Loading baseline

- The old figure (9.2k → ≤6.5k, −30%) is not a requirement.
- WP1 measures fresh: `/context all` as the first message, Opus 5.5, one session in `~/.claude` and one in FinNode. Recorded per memory file, plus skills, custom agents and system prompt.
- Between measurements: `wc -w` of always-loaded files, labelled an estimate.
- A token target only if Amit sets one after WP1.

#### Final checks (WP8)

Yes/no each:
- Every tracked setup file has a keep / ask Amit / remove decision.
- No document was shortened just to meet a line target.
- Every active safety rule, limit, waiver and recovery instruction is still available, each in its home. Every limit and waiver found by the WP1 grep is carried over (incl. R3, R5, I2, I3).
- Every removed file's live content is mapped to a new home, reviewer-checked.
- A final review covers broken links, orphan files, registered duplicate rules and contradictions, plus a grep across skills, agents and memory for moved rule sentences. A clean review is evidence, not proof.
- `doc-check.sh`: 0 warnings, or each remaining one accepted by name.
- The 10 routing scenarios, rebuilt from the WP5 table (exact prompts were never saved — a stated limit), and a restart test pass. Bug tests 7–8 go light unless the cause is still unknown after a first look.
- `session-check.sh` and `drift.sh` run; results reported.
- Loading measured against the WP1 baseline and reported.
- **Phase 10 is complete only after Amit approves the final verification report.**

#### Item dispositions (Amit, 25-11-2026)

- **In Phase 10:** rarely-used rules out of `STANDARDS.md` (6e) · backlog value bar (6c) · contents lists only in long docs (3) · clickable links, during rewrites · write-like-a-human style (3) · `harness/status.md` § *Known contradictions* (1) · every file listed in its one home (3b) · removing the memory-copies allowance (7) · bug-depth wording, doc-check warnings, backlog clean-up, memory duplication, C11.
- **Dropped:** archive only for five named files (git is the archive) · a separate 30-day review file (folded into 3) · old T32 word-for-word history file and T33 signpost design (replaced by WP5).
- **Unchanged:** B15 only if a real case is seen.
- **Phase 11:** installing Obsidian itself (new-tool check first).
- **Open, before the repo goes public (C11):** git history still holds the UUIDs and emails. A fresh repo or a history rewrite would both affect commit-based pointers; decide then.
- **WP1 decisions (Amit, 25-11-2026; full text and evidence: `baselines/phase10-wp1-25-11-2026.md` § 7–8):**
  - Removal approved by name for WP4, not deleted now: `baselines/baselines-readme-old-11-11-2026.md` · `always-loaded-old-11-11-2026.md` · `standards-old-12-11-2026.md` · `projects-old-11-11-2026.md` · `open-tests-old-11-11-2026.md` · `old-document-maps-11-11-2026.md` · `environment-old-12-11-2026.md`. Each deletion waits for its own approval message in WP4, after its pointer lines are in place.
  - Project-data wording for the active setup files in WP2/WP6 (history records not edited): "Projects are new and not live. No project holds live personal data, except the Vthru Customer app (VT), which is the company's app with real data: treat it as confidential. FinNode has some private documents. Emp Portal uses dummy data. Packbly is ignored and never opened. Do not delete admin or super-admin users." **Applied in WP2a (25-11-2026):** home `PROJECTS.md` § *Project data*, word for word; lines that also name Packbly wait for WP2b.
  - VT: Claude reads, diagnoses, reproduces and makes requested changes on a separate branch only; never commits (even locally), merges, pushes, opens a pull or merge request, or takes any other git action — Amit does all git actions. Update memory `mobile-vt-nothing-to-gitlab.md`, `PROJECTS.md` and `ENVIRONMENT.md` in the rewrite steps; VT's own `CLAUDE.md` via the project clean-up list.
  - Packbly: removed from active setup documents in WP2/WP6, keeping one line "Packbly: ignored; do not open." The project folder and GitHub repository are not touched. Permission locks stay; `VS Code/Packbly_web` is not fully locked (no Read deny) — the missing lock waits for Amit's approval of the exact text and a fresh-session test. **Superseded (Amit, 25-11-2026):** no new lock; the existing `settings.json` deny rules stay; removal from active docs is WP2b; the one line kept is "Packbly is ignored and never opened." in `PROJECTS.md` § *Project data*.

#### Starting facts (discovery, 25-11-2026)

- Tracked: 163 files, about 262k words (corrected in WP1 from 169, which was miscounted: `git ls-files | wc -l` → 163, the same at every commit from `37fc42b` to `010becb`; `baselines/phase10-wp1-25-11-2026.md` § 2). Biggest: `SETUP-PLAN.md` 3,824 lines · `harness/doc-structure-plan.md` 1,057 · about 40 records in `baselines/`.
- Always-loaded in a setup session: memory files 9.2k (24-11 and 25-11), `STANDARDS.md` 7.4k of it.
- `SETUP-PLAN.md` has its own old "PHASE 1–11"; its "PHASE 10" is the September project review — a naming clash.
- `project-rules/` (hand-made backup of rule files, driven by `manifest.tsv`) and `projects/` (made by Claude Code; only `memory/*.md` tracked) do different jobs and are not meant to match. Every memory note on disk is tracked.
- Drift: Voice-Flow `CLAUDE.md` changed in its PR #95 (18-11) after the 13-11 copy · Emp portal expected (folder on an old branch).
- `sync.sh --pull` cannot skip one project; "never sync Emp portal or VT" lives only in `harness/status.md` § *Open*. Guarding it: P3 candidate for Phase 11.
- Not checked: the Packbly trees (deny rule) · whether POS-Dashboard was renamed to VOS Dashboard.
- Wording to fix in 6c: `harness/status.md` "Removed 13-11-2026: Debugger v2" means removed from the **Phase 7 list** (commit `2a6c889`), not from the setup — `PROJECTS.md` still lists Debugger v2 as "Next up".

**Project consistency table (25-11-2026).** Tracked: 19 files in `project-rules/`; 46 memory files in 5 `projects/*/memory/` folders (corrected in WP1 from 57: `git ls-files projects/ | wc -l` → 46; on disk `find projects -path "*/memory/*" -type f | wc -l` → 46; `baselines/phase10-wp1-25-11-2026.md` § 2). On disk: 18 folders under `projects/`, 13 with no memory notes, plus transcripts (local only).

| Project | Registered path | Rules backup | Memory path(s) | Tracked or local-only | Intentional or issue | Action |
|---|---|---|---|---|---|---|
| FinNode | `VS Code/FinNode` | 3 files, current | `…-FinNode` (5 notes) | Tracked | Intentional: copy mirrors `phase3/sms`, not `main` | Re-copy after the merge (existing item) |
| Voice-Flow | `VS Code/Voice-Flow` | 3 files; `CLAUDE.md` drifted | `…-Voice-Flow` (20 notes) | Tracked | Issue: live file changed in PR #95 (18-11) after the 13-11 copy | Re-copy that one file in 6d, never `sync.sh --pull` |
| Emp portal | `…/Vthru_Emp_v2.1_jun26` | 3 files; `CLAUDE.md` drifted | `…-jun26` (no notes) + leftover `…-jun26-phase7` | Rules tracked; leftover local | Intentional: folder on `fix/dead-code-cleanup-and-test-fix` (checked 25-11) | Leave; don't sync; leftover is Claude-managed |
| vthrudebugger_v1 | `VS Code/vthrudebugger_v1` | `CLAUDE.md` + `settings.local.json`, current | `…-vthrudebugger-v1` (5) | Tracked | Intentional | None |
| Debugger v2 | `VS Code/Debugger v2` | `settings.json` only (no live `CLAUDE.md`, checked) | `…-Debugger-v2` (4) | Tracked | Intentional; status wording unclear (above) | Fix wording in 6c |
| AtWorkpe | `VS Code/AtWorkpe` | `CLAUDE.md` only (no live settings files, checked) | `…-AtWorkpe` (no notes) | Tracked | Doc issue: `project-rules/README.md` wrong | Fix README in 6d |
| VT (`mobile`) | `VS Code/mobile` | Sanitized `CLAUDE.md`, matches live | `…-mobile`, `…-mobile-src-debugger` (no notes) | Copy tracked; memory local | Intentional; README omits VT; sync guard only in `status.md` | Fix README in 6d; sync guard → Phase 11 |
| SecondBrain schema | "Not projects" in `PROJECTS.md` | `CLAUDE.md`, current | None | Tracked | Intentional, documented | None |
| VOS Dashboard | Not registered | None | `…-VOS-Dashboard` (no notes) | Local | Gap: has `CLAUDE.md`, `.claude/`, git (`.env` present, not opened) | Add `PROJECTS.md` row "not set up" in 6d |
| POS-Dashboard | None | None | `…-POS-Dashboard` (1 transcript) | Local | Folder gone from `VS Code/`; cause not confirmed | Leave (Claude-managed) |
| Not projects | — | — | `~`, `~/Documents`, `/private/tmp…`, `~/.local/bin`, a scratch workspace | Local | Claude-managed session folders | Leave |

#### Reviews

- Round 1, 25-11-2026: `plan-reviewer`, Opus, verdict concerns, 9 findings (more deletion-rule copies; git-show pointers vs C11; FinNode memory pointers; `doc-check.sh` and `.gitignore` dependencies; old agreed items; limits list; partial duplicate check; baseline home; revert order) — all taken in. 48.9k measured.
- Round 2, 25-11-2026: `plan-reviewer`, Opus, verdict concerns, 8 findings (live files in `baselines/`; pointer format vs C11; two link styles; `DOCUMENTATION-STANDARD.md:161`; memory-allowance timing; `agent-brief.md`; session-start speed; rule list in 6e) — all taken in with Amit's approval. 23.8k measured.

#### Estimate

P3 · deep (rule files, deleting, more than one session) · about 9–11 sessions · about 1.2–1.5M tokens in total including reviewers (estimate).

### Phase 11 — Further checks (agreed 20-11-2026, D50)

> **Merged into Phases 12–21, 26-11-2026 (Amit, D54).** Every item below now has a home in *Phases 12–21* — the phase list or the *Programme checklist*: candidate agents → Phase 14 · candidate skills → Phase 15 · backlog items and the `sync.sh --pull` guard → Phase 16 · installing Obsidian → Phase 21. The heading stays so old "Phase 11" references still resolve.

- Recheck coding, testing and other parts; build more agents or skills only for a real repeated need.
- Approved, not started: B21, B14, B9, then B11. Also B12; the parked auto-compact question.
- Future candidates (Amit's list, 20-11-2026), revisited here: agents `root-cause-finder` · `data-safety-reviewer` · `test-reviewer` · `security-reviewer` · `documentation-reviewer` · `release-readiness-reviewer` · `project-onboarding-reviewer`; skills `testing` · `feature-brief` · `debugging-method` · `documentation-update` · `project-onboarding` · `release-checklist` · `agent-quality-review`. Overlaps flagged: Q6 — approved 24-11-2026: mark each as "potentially covered by …" (`feature-brief` → feature guide · `debugging-method` → bug-fix guide · `documentation-update` → `documents` skill · `project-onboarding` → new-project guide + `harness/cross-check.md` § *Claude Setup cross-check* · `documentation-reviewer`, `project-onboarding-reviewer` → `plan-reviewer` + `harness/cross-check.md` § *Claude Setup cross-check*); verify before declaring any fully covered.

- From Phase 10 (25-11-2026): installing Obsidian itself, after the new-tool check · guarding `sync.sh --pull` so it can skip one project (P3 candidate).

Old T30–T33 (`SETUP-PLAN.md` split) and the old 30-day review were replaced by Phase 10 WP5 and WP3 (25-11-2026). Their earlier text, including the re-home list for `SETUP-PLAN.md` sections, is in git history (commit `a09c0a3`, "Record deletion of the Phase 9 recovery copy") — WP5 reuses that re-home list as its starting point.

### Phases 12–21 — Expert rewrite programme (agreed 26-11-2026, Amit, D54)

The brief for the whole programme. Each phase is re-planned and re-discussed with Amit when it starts; this section is the context it starts from. Agreed in one long setup session on 26-11-2026; nothing here is built yet except the plan reviewer (`5645c5f`).

#### Why we are doing this (Amit's intent)

- Amit built Claude Setup over 5–6 months by trial and error: rules, then skills and repos, then rewrites, then the document map and links, then sub-agents, planning and independent reviewers (Phases 8–10). After Phase 10 WP3 he judged the result "not good enough": the writing reads "intermediate".
- A friend's Claude Code kit for the V-Thru backend — `~/Documents/VS Code/Vthru backend-claude-main` (a downloaded copy, no `.git`) — reads "like a very nice AI engineer expert" wrote it. Amit's words: "every document is written very well. It feels like it's written by a human."
- Amit's estimate: today he uses about 10% of what the setup could give; copying the kit's writing style and structure could take that to about 50% "in one jump". He calls this a critical task.
- The target feel: a **library** where everything is arranged; **Wikipedia**, where a short summary has clickable links to the full page; **Obsidian**, where everything is connected and in sync. "If I have to update one document, it should automatically update on others" — met by one home per fact, links everywhere else, and `doc-check.sh` catching copies (plain files cannot sync text on their own).

#### Goal and final checks

**Goal:** rewrite Claude Setup on its current base so every file follows one expert writing standard (from the backend kit, fitted to our rules), every fact lives in one place and is linked from everywhere else, phases and history line up on one timeline, nothing contradicts anything else, nothing is deleted (archived instead), and daily loading stays light — done in P1 → P2 → P3 order without breaking daily work, for every tool Amit uses.

**Final checks (judged at the end of Phase 19):**
1. `doc-check.sh`: 0 copy and contradiction warnings.
2. Every agent and skill passes a review against the writing standard.
3. Every backlog item, to-do and open test is **closed** — fixed, or concluded with a reason.
4. One phase timeline exists; no phase number is used twice.
5. What loads every session is no bigger than today's baseline (measured with `/context` at the start of Phase 12 and again here). Every-session load baseline, 26-11-2026, Claude Code v2.1.332: 27.6k total; our part 10.7k (memory 9.3k · skills 1.0k · agents 0.4k). Final check 5 judges our part.
6. **Blind comparison:** a fresh reviewer compares 5 of our files with 5 matching kit files without being told which is which; ours are judged equal or better.

#### How we work in this programme (Amit's rules, 26-11-2026)

- **Our setup is the base.** Take the kit's **writing style and structure by default**; change only where it clashes with our rules, and ask Amit each time. Take the kit's **ideas one by one**, when they fit solo work across several projects. Our safety rules (approvals, read-only reviewers, success measures, no commit without Amit's word) stay and are never weakened. Do not blindly copy; do not blindly drop ours.
- **Two levels.** Files that load every session (`STANDARDS.md`, `CLAUDE.md`) are bullets and one-liners, so daily tokens stay low. Files that load on need (agents, skills, guides) get the full teaching style. Bullets where they fit, but never cut a fact to make a line short (the Phase 10 rule still holds).
- **Rule plus case.** A rule is one line; its story (a case study) lives in a separate file and is linked, with the hook that enforces it if one exists.
- **The ladder.** When Claude gets something wrong: an instruction; if that keeps breaking, a rule; if the rule keeps breaking, a hook.
- **Nothing is deleted.** Old material moves to an archive, arranged like a library, kept out of what Claude loads and searches. The deletion rule stays only for true junk (temp and scratch files). Old Phase 10 WP4 ("remove approved files") becomes "move to archive".
- **Close everything.** Every to-do, backlog item and bug is either fixed or concluded with a reason. Old pending tests are mostly irrelevant after a full rewrite: each is closed as "superseded by the rewrite", unless a phase finds it still matters.
- **Small useful fixes are done on the spot;** anything bigger goes to the backlog.
- **New documents are created when needed,** in the new style and registered in the document map.
- **Light sub-agents** with as little context as possible, but inside our environment: project facts (stack, words to use — React vs Flutter) live in small separate files the agent reads, not in the agent.
- **Every tool Amit uses** is covered: VS Code, Antigravity, Android Studio and others — not one IDE.
- **Any kind of work.** The writing guide, templates and skills serve coding and Claude Setup first, but must also fit business and other work. Subject-specific detail goes in an optional block. Skills add to agents, never replace them (Amit, 26-11-2026).
- **`~/.claude` first**, then each project in its own session.
- **Cross-check, discuss and plan** before every change; contradictions are cleared with Amit first.

#### Phase list (in order)

| # | Phase | Covers | Done when |
|---|---|---|---|
| 12 | Writing standard | Full kit inventory first (every kit file: take, adapt or skip, reason, phase). Then one writing guide: two levels, rule plus case, a shape per file type (agent, skill, rule file, guide, case study) as templates, a glossary with words to avoid, an `examples/` idea. Builds on D53's writing style (home `DOCUMENTATION-STANDARD.md` § *Writing style*) | Blind test passes; Amit approves |
| 13 | Planning | Planning skill and its five guides (new project, feature, bug fix, documentation, Claude Setup change) in the new style, with kit ideas: start-cold plan format, evidence for every claim, deferrals check, the diagnosis rule (bug-fix guide), the kit's planning flow (Matt Pocock skills: grill, spec, tickets, implement, retro — new-tool check first). Claude Setup planning also covers documentation planning (Amit). Re-check together with the plan reviewer. B37 | A test plan of each kind passes the reviewer; Amit approves |
| 14 | Sub-agents | Light agents with project facts in separate files (`agents-config/` idea). Rewrite `change-reviewer`. Consider: challenger agent, specialist reviewers, **worker agents** (task executor, bug fixer, test writer — we have reviewers only), parallel work in separate repo copies (worktrees), delegation rules plus a gate hook, the old Phase 11 candidate agents (security, test, data-safety, release, onboarding reviewers). Each only if it earns its place | Each agent passes its own test |
| 15 | Skills and hooks | Rewrite and add skills in the new style. The ladder in practice. An end-of-session wrap-up (the kit's `/retro` + `/archive-session`) that turns each session's mistakes into proposed rules. Hooks that block unproven excuses ("flaky", "pre-existing" without evidence). A hook test script. Helper scripts. The old Phase 11 candidate skills (testing, feature-brief, debugging-method, documentation-update, project-onboarding, release-checklist, agent-quality-review), each only if it earns its place. B12, B15, B21 | Hooks proven by tests; skills discovered |
| 16 | Full audit and priorities | Every file, rule, contradiction, backlog item, test and phase. Every tool Amit uses. The **phase timeline** page (the September series labelled "Early", e.g. "Early Phase 10, Sept 2026"; history text kept, linked to the timeline). The three layers (personal, shared rules, knowledge vault — kit's `CLAUDE.local.example.md`). Old Phase 10 WP4–WP9 and old Phase 11 items folded in. One finish line (`harness/overview.md` § *What "finished" means* merged with the final checks above). Ends with a P1 / P2 / P3 list | Amit approves the list |
| 17 | Rewrite: P1 | Most important files first — likely `STANDARDS.md`, the decision-log split (`SETUP-PLAN.md` → `DECISIONS.md`, old WP5, C11), `ENVIRONMENT.md` (too long, B38), the document map, a one-command rebuild guide (kit's `setup.sh` + `README.md` idea). Archive, never delete | All P1 items done; nothing broken |
| 18 | Rewrite: P2 | The next layer | All P2 items done |
| 19 | Rewrite: P3 | The rest; every backlog item gets its verdict; the final checks | All P3 done; final checks yes |
| 20 | Projects | Each project's `CLAUDE.md` and rules, one per session (old WP9 prompt idea) | Each project passes its check |
| 21 | Obsidian | **Amit gives his Obsidian prompt when this phase starts** (Claude asks for it then and cross-checks it). Two sections: Personal (Claude Setup, personal projects, personal content) and Professional (work projects, connected to V-Thru's Obsidian vault, and that vault connected to Claude). Keep company knowledge in its own vault and link to it, never copy it in. Ignore `.obsidian/` in git. New-tool check first. Obsidian is already installed but not set up. Can move to right after Phase 16 if Amit wants to view the library in Obsidian during the rewrite | Amit's prompt goals met |

#### Phase 12 plan (approved 26-11-2026, Amit; revised 26-11-2026 after the plan cross-check, Amit)

- **Kind:** Claude Setup change · **depth:** deep (changes a rule file) · **priority:** P2 (blocks Phase 13) · **model:** Opus for the main session.
- **Goal (Amit's words):** "whatever you write next … as similar as possible as backend cloud setup … written like a very expert engineer", keeping our setup as the base. Writing comes first because "if your writing skills are not good, then planning will never be good".
- **Success measure (all yes):** (1) the writing guide and one template per file type exist — agent, skill, rule file, guide, case study (5); (2) **go/no-go gate** — Amit reads the blind-test rewrite of `change-reviewer` side by side with the kit's `plan-reviewer` and judges it "expert, like the kit" (yes/no; Amit decides, Claude does not); (3) every-session load, **our part only** (memory files + skills + agents in `/context`), is 10.7k or less, measured in a fresh session — the full 27.6k total is not judged, because Claude Code's own system prompt and tools are outside our control; (4) `doc-check.sh` no new warnings, with the new guide and all 5 templates on its checked list; (5) every clash between the guide and our existing rules listed, with every source checked named, and decided by Amit.
- **Known clash to decide:** D53 says "now, not how we got here — change history stays in git"; the kit puts real failure stories in its files. Proposed answer: stories live in linked case-study files, rules stay one line.
- **Kit content rule:** copy the kit's **shape and writing style only**. Never copy company facts, private data or V-Thru-specific content into this repo.
- **Files:** new `WRITING-GUIDE.md` (the writing guide; the D53 writing-style text in § *WP3 design* → **Writing style** moved in word for word first, then adapted; words to avoid live here) · `DOCUMENTATION-STANDARD.md` (one pointer line to the guide) · 5 new templates in `templates/` (agent, skill, rule file, guide, case study) · `.gitignore` (allow-lines for the guide, the 5 templates and `harness/drafts/`) · `harness/doc-check.sh` (`CHECKED` rows for the guide and the 5 templates) · `harness/drafts/change-reviewer-phase12.md` (blind-test draft, kept until Phase 14) · `DOCUMENT-MAP.md` rows · `SETUP-PLAN.md` (**D55, required**, citing D54) · `harness/status.md` · `.claude/current-task.md` · this section.
- **Not changed:** `STANDARDS.md`, any `CLAUDE.md`, `agents/` (the draft never goes there: it would load every session and clash with the real reviewer's name), settings, hooks, permissions, other projects.
- **Approach option for WP1 (Amit's suggestion):** "maybe copy the whole context over there and then fit our things … reverse engineer in my style" — start from the kit's own files and reshape them to our rules, rather than writing from zero. WP1 weighs this against writing fresh and recommends one.
- **Packages:**
  - **Step 0 — plan cross-check:** done 26-11-2026, `plan-reviewer` Opus, verdict concerns, 9 findings and 4 deferrals, all taken into this plan (44,487 measured).
  - **WP0 — kit inventory:** one Sonnet helper lists **all 79 kit files** (51 `.md` plus 28 others: hooks, scripts, settings, setup files; screenshots and `.DS_Store` excluded) — take, adapt or skip, reason, target phase; team-only parts each get a verdict; also how the kit links its documents and uses its skills. Outside repos and skills the kit uses or links to: listed separately, each marked "discuss with Amit", never "take"; new-tool check before any is used. Done when Amit approves the table. About 95K helper + 10K main (estimate).
  - **WP1 — guide and templates:** move the D53 text into `WRITING-GUIDE.md`, then write the guide (two levels; one-line rule plus linked case study; words to avoid), the 5 templates, the `.gitignore` and `doc-check.sh` lines, and decide the `examples/` idea (built in Phase 14–15 if kept). **Skill template (Amit, 26-11-2026):** fits any subject, coding detail in an optional block, one non-coding example; description 2–3 short lines (it loads every session); a small example inside `SKILL.md`, larger ones in `examples/` inside the same skill folder, made-up data only (each new folder needs its `.gitignore` allow-line); full self-check for important skills (anything risky — secrets, deleting, money, data, permissions — or used most days), a short check for the rest; before creating a skill Claude may ask Amit up to 5 short questions (an exception to `STANDARDS.md`'s two or three, recorded in D55; `STANDARDS.md` unchanged). Lists every source checked (D53, `STANDARDS.md` § *Communicate*, `DOCUMENTATION-STANDARD.md` § *Five file types*, *Principles* and *Update* rules, memory notes on writing here and in other projects) and every clash. **Amit decides every clash before WP2.** About 70–90K main (estimate).
  - **WP2 — blind test:** a fresh Sonnet helper gets only the guide, the agent template and today's `agents/change-reviewer.md`, and writes the rewrite to `harness/drafts/change-reviewer-phase12.md`. About 30–40K helper (estimate).
  - **Gate:** Amit compares the draft with the kit's `plan-reviewer`. At most two tries; after two "no" results, stop and re-plan with Amit.
  - **WP3 — cross-check:** `change-reviewer` (Opus) on the finished guide, templates and lines; Amit decides each finding. Step 0 was this phase's `plan-reviewer` check. About 30–50K helper (estimate).
  - **WP4 — record:** D55, `DOCUMENT-MAP.md`, `harness/status.md`, this section, the task record; Amit types `/context` as the first message of a fresh session and our part is recorded against 10.7k or less. Commit only on Amit's word. About 10K main (estimate).
- **Sessions and cost:** this session — step 0 and WP0, then a handoff; next fresh session — WP1 → clash decisions → WP2 → gate → WP3 → WP4. About 290–360K including helpers, about 120K main (estimate; was 200–300K before the cross-check added the 28 files, the new guide file and the checker lines).
- **Open (not blocking):** where case-study files live (a new `cases/` folder or inside the library) — decided in Phase 16, which re-checks the case-study template against that decision.
- **Undo:** `git revert` of the Phase 12 commit (works because the `.gitignore` allow-lines put the new files under git).

#### Phase 12 WP0 result — kit inventory (done 26-11-2026; approved by Amit)

- **Count:** 79 files confirmed with `find` (51 `.md`, 28 others; `screenshots/` and `.DS_Store` excluded). **2 take · 36 adapt · 41 skip.** One Sonnet helper; it read the head of every file and sampled outlines, not every word. Cost 52,015 measured (estimate was about 95K).
- **Outside repos and tools:** all marked "discuss with Amit"; none taken. New-tool check before any is used.
- **Decisions (Amit, 26-11-2026):** (1) WP1 reads 5 kit files in full: `CLAUDE.md`, `agents/plan-reviewer.md`, `rules/diagnosis.md`, `GLOSSARY.md`, `skills/gitlab-wiki/references/page-templates.md` (about 15K, estimate). (2) The diagnosis rule does not load every session; it goes in the Phase 13 bug-fix guide. (3) The kit has no case-study files (they live in a separate notes vault outside the kit), so WP1 designs the case-study template from how the kit's rules point to their stories.
- **Kit content rule applies:** shape and style only; the reasons below describe what a file does, never its contents.

| # | File (kit-relative) | Kind | Verdict | Reason | Phase |
|---|---|---|---|---|---|
| 1 | .githooks/pre-commit | hook | adapt | Pre-commit secret and personal-data scan; fit to our files | 15 |
| 2 | .gitignore | other | adapt | Ignore-by-default: new top-level folders ignored until added on purpose | 16 |
| 3 | .gitleaks.toml | other | adapt | Secret-pattern config; keep the idea, write our own patterns | 15 |
| 4 | agents-config/coding-standards.md | doc | skip | PHP review sources and tooling; project-specific | — |
| 5 | agents-config/domain.md | doc | adapt | Says where glossary, decision records and deep notes live | 16 |
| 6 | agents-config/issue-tracker.md | doc | skip | Ticket-file layout tied to ClickUp and third-party skills | — |
| 7 | agents/architecture-reviewer.md | agent | adapt | Design and risk review lens with ranked findings | 14 |
| 8 | agents/bug-fixer.md | agent | adapt | Reproduce with a test, then minimal fix; fits cause-first rule | 14 |
| 9 | agents/conventions-reviewer.md | agent | skip | PHP convention checks | — |
| 10 | agents/doctrine-expert.md | agent | skip | Doctrine/SQL advisor; PHP-specific | — |
| 11 | agents/domain-reviewer.md | agent | skip | Business-correctness review of their product | — |
| 12 | agents/plan-reviewer.md | agent | adapt | Plan audit against source of truth; compare with ours | 14 |
| 13 | agents/readability-reviewer.md | agent | adapt | Clarity-only reviewer; narrow scope per reviewer | 14 |
| 14 | agents/researcher.md | agent | adapt | Read-only exploration worker | 14 |
| 15 | agents/task-executor.md | agent | adapt | Bounded task doer; fit to our approval gates | 14 |
| 16 | agents/test-writer.md | agent | skip | PHP test conventions | — |
| 17 | CLAUDE.local.example.md | doc | adapt | Personal-notes template kept out of git; structure only | 16 |
| 18 | CLAUDE.md | rule | adapt | Layout, knowledge-placement rules, flow map; no company content | 16 |
| 19 | env.sh | other | skip | Shell aliases for Docker | — |
| 20 | examples/code.md | doc | skip | PHP code examples | — |
| 21 | examples/commands.md | doc | skip | Docker/make command table | — |
| 22 | examples/database.md | doc | skip | Their database patterns | — |
| 23 | examples/delegation.md | doc | adapt | Request-to-agent routing table; examples-file pattern | 14 |
| 24 | examples/faker-usage.md | doc | skip | PHP test factory guide | — |
| 25 | examples/firebase-testing.md | doc | skip | Firebase emulator guide | — |
| 26 | examples/planning-gates.md | doc | adapt | "Plans execute cold", source-verification gate, pilot slice | 13 |
| 27 | examples/references/em-mocking.md | doc | skip | Doctrine mock patterns | — |
| 28 | examples/references/faker-api-reference.md | doc | skip | Faker method list | — |
| 29 | examples/testing.md | doc | skip | PHP testing patterns | — |
| 30 | GLOSSARY.md | doc | take | Term, meaning, *Avoid* layout; style only, not their terms | 12 |
| 31 | hooks/ask-main-checkout-switch.sh | hook | adapt | Asks before a branch switch in the main checkout | 15 |
| 32 | hooks/check-php-conventions.sh | hook | skip | PHP linter; note its "hook, not agent" reasoning | — |
| 33 | hooks/gate-delegation-rules.sh | hook | adapt | Forces reading the delegation rule before the first helper | 14 |
| 34 | hooks/guard-destructive-git.sh | hook | adapt | Blocks destructive git; compare with ours | 15 |
| 35 | hooks/guard-secrets-and-writes.sh | hook | adapt | Guard added where docs alone failed; stack parts removed | 15 |
| 36 | hooks/guard-subagent-push.sh | hook | adapt | Helpers never push; fits our git rule | 14 |
| 37 | hooks/on-worktree-created.sh | hook | adapt | Worktree setup; Docker parts removed | 14 |
| 38 | hooks/on-worktree-removed.sh | hook | skip | Docker cleanup | — |
| 39 | hooks/test-hooks.sh | hook | adapt | Tests hooks with made-up input in a temp folder | 15 |
| 40 | README.md | doc | adapt | Numbered setup, verify step, troubleshooting; rebuild-guide model | 17 |
| 41 | rules/database.md | rule | skip | Doctrine/migration rules | — |
| 42 | rules/delegation.md | rule | adapt | Orchestrator limits, helper prompt must-haves, review waves | 14 |
| 43 | rules/diagnosis.md | rule | take | "Silence is not disproof"; short and general (bug-fix guide, not every session) | 13 |
| 44 | rules/domain-reporting.md | rule | skip | Their product's reporting rules | — |
| 45 | rules/git.md | rule | adapt | Branch guards, check repo top before moving refs; compare with ours | 15 |
| 46 | rules/observability.md | rule | skip | New Relic | — |
| 47 | rules/php-code.md | rule | skip | PHP conventions | — |
| 48 | rules/planning.md | rule | adapt | Check files before ranking options; drop ClickUp/Figma parts | 13 |
| 49 | rules/testing.md | rule | skip | PHP test rules | — |
| 50 | scripts/dump-diff.sh | script | skip | Their database dump diff | — |
| 51 | scripts/stale-branches.sh | script | adapt | Finds local branches already merged upstream | 15 |
| 52 | scripts/wait-stack-ready.sh | script | skip | Docker health wait | — |
| 53 | settings.json | settings | adapt | Hook wiring by event; our hook rules apply; env block not copied | 15 |
| 54 | setup.sh | setup | adapt | Checks first, then changes; rebuild model | 17 |
| 55 | skills/code-review-and-quality/scripts/fetch-mr-discussions.py | script | skip | GitLab | — |
| 56 | skills/code-review-and-quality/scripts/parse-diff.py | script | skip | GitLab | — |
| 57 | skills/code-review-and-quality/SKILL.md | skill | adapt | Parallel reviewers by level, de-duplication; 1,228 lines, too long | 14 |
| 58 | skills/git-workflow-and-versioning/SKILL.md | skill | adapt | Commit, hook-failure and branching conventions; compare with ours | 15 |
| 59 | skills/gitlab-wiki/references/page-templates.md | doc | adapt | Guide, runbook and proposal page shapes for our templates | 12 |
| 60 | skills/gitlab-wiki/references/wiki-structure.md | doc | skip | GitLab wiki layout | — |
| 61 | skills/gitlab-wiki/scripts/publish-wiki.sh | script | skip | GitLab | — |
| 62 | skills/gitlab-wiki/SKILL.md | skill | skip | GitLab | — |
| 63 | skills/mr/references/glab-cli-reference.md | doc | skip | GitLab CLI | — |
| 64 | skills/mr/scripts/merge-checked.sh | script | skip | GitLab | — |
| 65 | skills/mr/scripts/push-branch.sh | script | skip | GitLab | — |
| 66 | skills/mr/SKILL.md | skill | skip | GitLab | — |
| 67 | skills/newrelic-cli/references/incident-investigation.md | doc | skip | New Relic | — |
| 68 | skills/newrelic-cli/references/nerdgraph-dashboard.md | doc | skip | New Relic | — |
| 69 | skills/newrelic-cli/SKILL.md | skill | skip | New Relic | — |
| 70 | skills/pipeline-monitor/scripts/watch-pipeline.sh | script | skip | GitLab CI; "fail loud" idea noted | — |
| 71 | skills/pipeline-monitor/SKILL.md | skill | skip | GitLab CI | — |
| 72 | skills/resolve-conflicts/SKILL.md | skill | adapt | Conflict help with approval per file | 15 |
| 73 | skills/review-plan/SKILL.md | skill | adapt | Five review lenses, ranked output, verdict; compare with ours | 13 |
| 74 | skills/triage-mr-comments/scripts/fetch-triage-comments.py | script | skip | GitLab | — |
| 75 | skills/triage-mr-comments/scripts/watch-mr-comments.sh | script | skip | GitLab | — |
| 76 | skills/triage-mr-comments/SKILL.md | skill | adapt | Fix, dismiss or discuss triage idea; no GitLab | 15 |
| 77 | skills/worktrees/SKILL.md | skill | adapt | Worktree mechanics apart from rules; Docker parts removed | 14 |
| 78 | worktree/worktree-env | other | skip | Docker env per worktree | — |
| 79 | worktreeinclude | other | adapt | Ignored files copied into new worktrees | 14 |

**How the kit links documents:** plain path links (not clickable), `file -> Section` pointers; no index file — `CLAUDE.md` holds always-on rules and the flow map, `README.md` a contents table; each rule keeps hard rules short and long examples in `examples/`, which point back; case studies sit in a separate notes vault, named from rules; hooks are cited from the rule they enforce and say which failure caused them; `paths:` frontmatter on 6 of 9 rules; a hook forces reading the delegation rule before the first helper; where personal versus shared knowledge goes is stated outright.

**How the kit uses skills:** one folder each, `SKILL.md` plus `references/` and `scripts/`; frontmatter `name`, `description`, `when_to_use`, `allowed-tools`, sometimes `argument-hint`; descriptions are trigger phrases; some third-party skills are user-only and the flow tells Claude to ask the user to type the next step; the feature flow chains skills by hand (ticket → grill → spec → tickets → implement in a fresh session); skills call agents (parallel reviewers); scripts do the fragile steps; skills point to rules for hard limits and keep only the "how".

**Outside repos and tools (all "discuss with Amit"):** Matt Pocock skills plugin (grill, spec, tickets, implement, retro, review) · an Obsidian notes plugin · their Obsidian vault (product knowledge, case studies) · ClickUp CLI · Figma MCP · GitLab and `glab` (likely irrelevant) · New Relic CLI (likely irrelevant) · Claude Code docs · Docker and other stack tools · Gitleaks (the one clearly relevant to us).

#### Phase 12 WP2 result — blind test (done 26-11-2026; Amit's go on WP2)

- **Run:** one fresh `general-purpose` Sonnet helper (not a fork), told to read only `WRITING-GUIDE.md`, `templates/agent.md` and `agents/change-reviewer.md` and to write only `harness/drafts/change-reviewer-phase12.md`. It made 4 tool calls (Read ×3, Write ×1); 31,007 measured.
- **Only the draft changed:** `git status` before and after differs by that one file; a file-time search from the start time found only the draft and Claude Code's own `sessions/` bookkeeping.
- **Partly blind, not fully blind (Amit, 26-11-2026).** Hypothesis, not verified: Claude Code may give every helper the global `CLAUDE.md` and the list of agent types, and the normal helper route may not be able to turn this off.
- **`plan-reviewer` mention (established):** the draft names `plan-reviewer` twice, but none of the three approved inputs does (checked with `grep`). So it came from outside those inputs; the exact source is not known. Amit's ruling: it counts neither for nor against the draft.
- **"Real case" placeholder:** the draft leaves this line unfilled because no case study exists and the three blind-test inputs held no case. The template does not allow a placeholder for it. `templates/agent.md` lines 33–34 are not marked optional, while *Subject detail (optional)* is. Line 20 says "Delete every comment and every unused optional block before saving". `WRITING-GUIDE.md` § *Agents* step 3 asks for "one real case in two to four sentences, with its date". Neither file said what to do when no dated case exists, and that gap was the cause. It was fixed at the source on 26-11-2026 (Amit): both files now say "If no dated case is logged yet, leave out the Real case lines; never use a placeholder." The missing case is B39. The draft itself is not edited.
- **Format check:** `harness/doc-check.sh` does not check the draft. Neither `harness/drafts/` nor `agents/` is in `CHECKED`; the draft path is only in `PLANNED` (line 68). The run showed the same 4 old warnings, none new. The script, `DOCUMENT-MAP.md` and registrations are not edited (Amit).
- **Gate:** the side-by-side yes/no against the kit's `plan-reviewer` is not recorded here. WP3 waits for Amit's next instruction.
  - Amit's gate decision: no — the draft is clean and focused, but not yet expert-like: no real case, thinner lenses and lessons, and a less actionable report format than the kit's plan-reviewer. The missing real case is B39. Do not start WP3.
  - Feedback for try 2 (Amit, 26-11-2026): gate = no; the draft is clean and focused but not yet expert-like. Improve: concrete lenses, practical lessons with reasons, a more actionable report format. Keep the safety boundaries and a scope right for a change reviewer; copy no kit-specific content. Applied as general rules in `WRITING-GUIDE.md` § *Agents* steps 5–7 and `templates/agent.md`; try 2 keeps the same three inputs, so it stays blind.
  - Amit's gate decision: yes — try 2 is expert-like for a lightweight read-only change reviewer. It has concrete lenses with evidence and finding rules, practical lessons with reasons, a clear actionable report, correct safety boundaries, and an appropriate scope. No real case yet; that remains B39 for the Phase 14 rewrite. The plan-reviewer mention is likely ambient-context contamination (source not verified) and counts neither for nor against the draft.

#### Phase 12 WP3 result — cross-check (done 26-11-2026; Amit: WP3 complete)

- **Run:** one fresh `change-reviewer` on Opus (not a fork; tools Read, Grep, Glob only), with a neutral packet: goal, the 8 changed files or line sets, what they touch, the brief `harness/agent-brief.md`. Drafts in `harness/drafts/` were out of scope and never opened. 19 tool calls, 40,000 measured. Verdict **concerns**, 6 findings.
- **Nothing else changed by the review:** `git status` was the same before and after; a file-time search found only Claude Code's own `sessions/` bookkeeping.
- **Findings and outcomes (Amit decided each):**
  1. No `DOCUMENT-MAP.md` rows for the guide, the 5 templates and both drafts → **deferred to WP4**.
  2. "Each new folder needs its own allow-line" left the files inside untracked → **fixed**: `WRITING-GUIDE.md` § *Skills* and `templates/skill.md` now say the folder and each file inside it need an allow-line.
  3. "recorded in D55" stated before D55 exists → **fixed**: "to be recorded in D55".
  4. "type" in the guide clashed with `DOCUMENTATION-STANDARD.md` § *Five file types* → **fixed**: renamed to "file kind" (not "form", which already means a template); one line says the five types still apply. Round 2 renamed the heading to *Shapes by file kind* and updated all three pointers (the guide's contents list, `DOCUMENTATION-STANDARD.md:116`, the `doc-check.sh` `CHECKED` row).
  5. Stale `PLANNED` entries for the drafts → **fixed**: removed after confirming the dead-link check uses `[ -e ]`, which sees untracked files; the line is back to its committed form. The try-2 path is not added; no checked document links it.
  6. Shapes table left out the optional *Subject detail* block → **fixed** in the Agent and Guide rows.
- **Rounds:** both review-and-fix rounds are used. No re-review.
- **Checks:** `doc-check.sh` after each round: the same 4 old warnings, none new. Both drafts unchanged (same `shasum` before and after).
- **WP4 must:** create D55 in `SETUP-PLAN.md` and land it **in the same commit** as the Phase 12 files, so the "(D55)" reference at `DOCUMENTATION-STANDARD.md:116` and the "to be recorded in D55" line in the guide are true when committed; and add the `DOCUMENT-MAP.md` rows (finding 1) in that commit.

#### Phase 12 WP4 result — record and measure (done 26-11-2026)

- **Recorded:** D55 (`SETUP-PLAN.md`, full list below), 8 `DOCUMENT-MAP.md` rows (finding 1), `harness/status.md`.
- **Measure (3):** missed by about 0.05k (10.75k against 10.7k). Cause: two memory-index lines added on Amit's request during Phase 12; no Phase 12 file loads every session. Accepted by Amit. Measured with `/context` as the first message of a fresh session, 26-11-2026, Claude Code v2.1.332: memory 9.4k · skills 992 · agents 362; total 27.7k.
- **Measure (4):** `doc-check.sh` the same 4 old warnings, none new; the 8 new files have map rows (checked with the script's own map parsing, as they are not tracked until the commit).

#### Phase 12 decisions and rule changes (D55)

Decided by Amit, 26-11-2026. Index row: `SETUP-PLAN.md` D55.

- **Decisions (WP1 clashes):**
  1. The writing-style home is `WRITING-GUIDE.md`; `DOCUMENTATION-STANDARD.md` keeps one pointer to it. Amends D53, whose writing-style text moved there word for word first.
  2. The same pointer covers the shapes of the five file kinds: agent, skill, rule file, guide, case study.
  3. Agents and skills may tell one case inline in 2–4 sentences; anything longer becomes a linked case study.
  4. The glossary word is "sub-agent"; `STANDARDS.md` is aligned in Phase 17, not now.
  5. No repo-wide `examples/` folder: a skill keeps larger examples in its own `examples/` folder, an agent keeps one short example inline; built in Phases 14–15.
  6. Before creating a skill, Claude may ask Amit up to five short questions, each with a recommended answer — an exception to `STANDARDS.md` § *Communicate*; `STANDARDS.md` unchanged.
  7. Accepted as they stand: case studies as a record type (re-checked in Phase 16); the agent description limit (Phase 14); the memory-note overlap (Phase 16 audit); D55 cited before it existed.
- **Rule changes from WP2 (after gate try 1):** an agent's *Why this exists* leaves out the real-case lines when no dated case is logged, never a placeholder (B39); lenses say what to check, what evidence to cite and what counts as a finding; lessons carry their reason; the report is ranked and actionable, with verified facts kept apart from assumptions. Gate passed on try 2.
- **Rule changes from WP3:** "file kind" names the five shapes, so "type" keeps its `DOCUMENTATION-STANDARD.md` meaning; a new folder and each file inside it need their own `.gitignore` allow-line; drafts live in `harness/drafts/`, never in `agents/` or `skills/`, so they never load.

#### What the kit offers (found 26-11-2026)

From reading the kit (two Sonnet helpers, 42,865 and 66,612 measured) and its 17 screenshots in `Vthru backend-claude-main/screenshots/` (one Sonnet helper, 71,700 measured; most are slides from the author's talk "We are all engineering managers now"):

- **Writing:** every file teaches — a "why this exists" section with a real failure, concrete examples, numbered "how to apply" steps, awkward cases covered, use-when and not-for lines, `<example>` blocks in agent descriptions, trigger phrases in skill descriptions. Downsides not to copy: shouting capitals ("VIOLATION = IMMEDIATE STOP"), very long files (one skill is 1,228 lines), the same rules repeated in many files.
- **Structure:** rule files that load only for matching paths (`paths:` frontmatter); rules naming the hook that enforces them; `examples/`; `GLOSSARY.md` with "Avoid" terms; `agents-config/` for project facts; a knowledge vault for product facts only (searched first, written back to); four one-line rule files plus 82 case studies.
- **Agents (10):** five specialist reviewers run in parallel (conventions and readability on Haiku; architecture, domain, ORM on Sonnet), a plan reviewer, a researcher, and three workers (task executor, bug fixer, test writer). Reviews are checked against the code, de-duplicated, and passed to a **challenger** whose default verdict is "kill" (referenced but not in the folder).
- **Hooks (about 20 in the talk; 8 in the folder):** destructive git, secrets and writes, delegation gate, sub-agent push, main-checkout switch, code conventions, worktree setup, plus a hook test script. A hook matched on text alone (it fired on a file that only contained "git reset --hard").
- **Workflow:** ticket → spec → tickets → implement, each in a fresh session; 2–3 in parallel via worktrees; `/retro` then `/archive-session` at the end; "ready" means every review saw the latest commit.
- **Tips from the talk:** ask for one real example; scripted status checks (a hand-written poll once failed silently); a lint hook caught what reviewers missed.
- **Where our setup is already stronger:** success measures, risk-based depth, approval gates, read-only reviewers that never approve, a neutral review packet, token and context limits, workload markers, short consistent writing.
- **Team-only parts (likely skip, still given a verdict in WP0):** GitLab, ClickUp, New Relic, PHP and Docker specifics.

#### Programme checklist (tick as done; archived when every box is ticked — Amit, 26-11-2026)

Every point the programme must cover: phase work, the 9 kit items (marked *kit*), and every open backlog item, to-do and test (about 30, checked 26-11-2026). Tick `[x]` with the date when done or concluded. Token figures are estimates including helpers; each phase is re-estimated when planned. Total about 3.5–5M tokens over about 30–40 sessions.

**Side task, 05-12-2026 (~15–25K, 1 short session)**
- [ ] B7 write-block trial: keep or remove
- [ ] B7 + B16 combined review (project map trial; overdue since 20-11-2026)

**Phase 12 — Writing standard (~200–300K, 2 sessions)**
- [x] Full kit inventory: every file take / adapt / skip, reason, phase; team-only parts (GitLab, ClickUp, PHP, New Relic) each get a written verdict — 26-11-2026, WP0 result above
- [x] How the kit links documents and uses skills — 26-11-2026, WP0 result above
- [x] Every-session load baseline (`/context`, for final check 5) — 26-11-2026: Every-session load baseline, 26-11-2026, Claude Code v2.1.332: 27.6k total; our part 10.7k (memory 9.3k · skills 1.0k · agents 0.4k). Final check 5 judges our part.
- [ ] Writing guide: two levels; rule plus case study; D53 history-vs-stories clash decided
- [ ] Templates: agent, skill, rule file, guide, case study
- [ ] Glossary with words to avoid
- [ ] *kit* `examples/` folder idea
- [ ] Amit's option weighed: copy the kit and reshape it into our style
- [ ] Blind test on `change-reviewer`; cross-check with the new `plan-reviewer`
- [ ] Go/no-go gate: after the Phase 12 blind test, Amit decides whether the rewritten change-reviewer reads expert and matches the intended style. If not, fix the writing guide before Phase 13 starts. Amit's decision is required; Claude does not decide.

**Phase 13 — Planning (~250–350K, 2–3 sessions)**
- [ ] Review sizes: small = self-check, no reviewer, only for low-risk one-file changes; medium = short review, Sonnet, about 300 words; big, new project, or any risk trigger = full review, Opus, about 500 words. One plan-reviewer; review size is set by the plan's depth. Small must never include permissions, hooks, settings, secrets, destructive actions, or rule-file changes. A specialist reviewer is added only if Phase 14 testing shows a real gap.
- [ ] Planning skill and five guides in the new style (Claude Setup planning also covers documentation planning)
- [ ] A "research and business" planning kind — today's kinds are all coding-shaped (Amit, 26-11-2026)
- [ ] Start-cold plan format · evidence for every claim · deferrals check
- [ ] *kit* Diagnosis rule (bug-fix guide)
- [ ] *kit* Planning flow (grill → spec → tickets → implement → retro; new-tool check first)
- [ ] Re-check with the plan reviewer; "blocked vs weak measure" lesson
- [ ] B37 reviewer report over its word limit

**Phase 14 — Sub-agents (~300–400K, 3 sessions)**
- [ ] Light agents; project facts in separate files (React vs Flutter)
- [ ] Rewrite `change-reviewer`
- [ ] Start the change-reviewer rewrite from the Phase 12 blind-test version, if it passed the go/no-go gate.
- [ ] B24: review the separate checker-helper idea.
- [ ] Challenger agent · specialist reviewers
- [ ] *kit* Worker agents (task executor, bug fixer, test writer)
- [ ] *kit* Parallel work in separate repo copies (worktrees)
- [ ] *kit* Delegation rules plus a gate hook
- [ ] Old Phase 11 candidate agents, each only if it earns its place

**Phase 15 — Skills and hooks (~350–450K, 3–4 sessions)**
- [ ] Skills rewritten and added in the new style; old Phase 11 candidate skills judged
- [ ] Instruction → rule → hook ladder
- [ ] End-of-session wrap-up (retro → archive) turning mistakes into rules
- [ ] Hook that blocks unproven excuses · hook test script
- [ ] *kit* Helper scripts
- [ ] B12 post-edit checker · B15 acting without approval · B21 git alias reads secrets
- [ ] B25: review the engineering skills that were not copied.

**Phase 16 — Full audit and priorities (~300–400K, 2–3 sessions)**
- [ ] Every file, rule, contradiction, backlog item, test and phase audited
- [ ] Every tool Amit uses (VS Code, Antigravity, Android Studio, others)
- [ ] Phase timeline (September series labelled "Early")
- [ ] *kit* Three layers (personal, shared rules, knowledge vault)
- [ ] One finish line (`harness/overview.md` merged with the final checks)
- [ ] Old Phase 10 WP4–WP9 folded in
- [ ] B9 telemetry · B11 markitdown · B14 Ollama network · C13 rtk log · `sync.sh --pull` guard
- [ ] The 3 *Known contradictions* in `harness/status.md`
- [ ] Archive `harness/planning-research.md`
- [ ] Tests TC3, TC6, TC8, TC12 closed (superseded unless still relevant)
- [ ] B4 (TypeScript helper) and B18 (rtk update): give each a verdict, or record a reasoned still-waiting decision with its recheck date.
- [ ] Audit all memory notes: keep, merge into a rule, or archive. Include the skill-overrides contradiction.
- [ ] Decide whether Phase 21 (Obsidian) moves earlier.
- [ ] P1 / P2 / P3 list approved; where case-study files live decided
- [ ] Re-check the Phase 12 case-study template against where case-study files live

**Phase 17 — Rewrite P1 (~500–700K, 4–6 sessions)**
- [ ] `STANDARDS.md`
- [ ] Decision-log split (`SETUP-PLAN.md` → `DECISIONS.md`) · C11 IDs and emails out
- [ ] `ENVIRONMENT.md` (B38, too long)
- [ ] Document map
- [ ] *kit* One-command rebuild guide — also usable to set up Claude for another person (Amit, 26-11-2026)
- [ ] Old material archived, never deleted

**Phase 18 — Rewrite P2 (~400–600K, 3–5 sessions)**
- [ ] Every P2 item from the audit list

**Phase 19 — Rewrite P3 (~400–500K, 3–4 sessions)**
- [ ] Every P3 item from the audit list
- [ ] Every backlog item has a verdict
- [ ] The 6 final checks, including the blind comparison with the kit

**Phase 20 — Projects (~100–150K per project, 1 session each)**
- [ ] Each project's `CLAUDE.md` and rules, one per session
- [ ] B38 drift (Voice-Flow, Emp portal) · B33 · A6, A7, A9
- [ ] FinNode copy after `phase3/sms` reaches `main`
- [ ] VT and Emp Portal sync rules checked (stay as standing rules)
- [ ] Tests TC9, TC10

**Phase 21 — Obsidian (~150–250K, 1–2 sessions)**
- [ ] Ask Amit for his Obsidian prompt; cross-check it
- [ ] Personal and Professional sections; the V-Thru vault connected, and connected to Claude
- [ ] Company knowledge linked, never copied · `.obsidian/` hidden from git · new-tool check

## 4. Format of every file

**T1 `DOCUMENTATION-STANDARD.md`** (full header)
```
## Principles · ## Five file types · ## Headers · ## Always loaded
## IDs and progress · ## Naming (+ old → new table) · ## Structure per file
## When to read, when to update (links to STANDARDS, no copies)
## Allowed copies (project-map guards · memory copies of STANDARDS · Voice-Flow claim/evidence D24)
## Growth and rollover · ## Task file rules (~80 lines, move results home first, session/branch, one per worktree)
## Empty files ("None yet") · ## Data and security (+ redaction) · ## Decisions and affected files
## Moving and archiving · ## Format check
```

**T2 `DOCUMENT-MAP.md`** (full header)
```
## Global documents     | Document | Type | Purpose | Read when | Update when | Owner | Depends on |
## Project documents    | Document | Where | In git | Purpose | Read when | Update when |
## Other project files  | File | Project | Document or not | Home |
## Not documents        project-rules/ (drift.sh/sync.sh) · memory/ · settings.json · skills · acceptance sheets · launch.json
```

**T34 `harness/doc-check.sh`**
```
# Purpose · Runs from: session-check.sh and each project's commit check · Warn-only, no AI cost
Checks: header · section order · IDs + Next ID · dead links · duplicates · size limits · "None yet" ·
        task file ignored by git · secret patterns in project docs · files affected by a decision
Output: WARN <file>: <rule broken> … then "n warnings"
```

**T4 `README.md`** (short): What this repo is · Why it stays private · Start here → `DOCUMENT-MAP.md`

**T5 `harness/status.md`** (full)
```
Last verified · ## Current phase (≤3 lines) · ## In progress | ID | Item | State | Next step | Link |
## Open | ID | Item | Decision | Link | · ## Blocked · ## Known contradictions
## Decisions in force (link) · ## Next gate · ## Older records
```

**T6 backlog** (`harness/backlog.md` and project `BACKLOG.md`; full + Next ID)
```
Raise at once if an item blocks the task or risks safety, security or data.
## To build | ID | Item | Why | Worth doing | Blocks current task | Priority | Size | Tokens | Status | Next action |
## In full   ### B<n> — <title>: Found in · Decision · Detail
## Deferred | ID | Item | Recheck date | · ## Known and accepted | ID | Item | Reason | · ## Older records
```
**T6b `BACKLOG-DONE.md`** (short): | ID | Item | Closed | How: → T#, fixed, or dropped (why) |

**T7 `harness/cross-check.md`** (full): Levels · Deletion · The reviewer · Recording · Claude Setup cross-check · Markers

**T8 `harness/models.md`** (full): Model table · When to pick and switch · The 27k test · Cost rule · When a model is struggling · Helpers in plans

**T9 `harness/overview.md`** (short): What "finished" means — checklist, yes/no per line

**T10 `PROJECTS.md`** (short): Projects | Code | Name | Path | Status | Has CLAUDE.md | What it is | Data warning | · Not projects · Names and renames (Phase 8)

**T11 `REPOS.md`** (short): | Area | Repo | What for | Free | Telemetry checked |

**T12 `baselines/global-open-tests.md`** (full + Next ID): Global tests | TC | What it tests | How to run | Expected | Last result + date | Status | · Project tests (pointers)

**T13 `archive/README.md`, `baselines/README.md`** (short): | File | Date | What it records |

**T14 record files:** `# <Name> — DD-MM-YYYY` · Purpose · Date · Status: record · From · content word for word

**T15 setup task file:** same as T24

**T16 global `CLAUDE.md`:** `@STANDARDS.md` `@RTK.md` `@OLLAMA.md` + one non-loading comment, D48

**T17 `.claude/CLAUDE.md`:** At session start · While changing setup · Reaching into a project (approval, then /add-dir) · Git for ~/.claude

**T18 `RTK.md`, T19 `OLLAMA.md`:** one-line purpose · rules as bullets · Detail link

**T20 `STANDARDS.md`:** Communicate · Choose the project · Run a task · Safety and approval · Quality · Documents · IDs and progress · Git · Models

**T21 `ENVIRONMENT.md`** (full): Contents · The two kinds of rule · one numbered section per tool — 1. RTK · 2. Status line · 3. Permissions · 4. Effort on Opus 5.5 — each with What it is · Current setting · How to check · How to change · Known gaps · What every session loads · How numbers are measured · The project trees on this machine · Older records (approved 12-11-2026, § 3 *Phase 5 plan*)

**Pilot records:** Test questions | # | Question | Answer | File + section | Correct | · Sample updates | # | Change | File updated | Right file | · Cost: files read, tokens

**T22 project `CLAUDE.md`:** Commands · Hard rules · Past defects · Documents

**T23 `PROJECT-MAP.md`** (full): Main folders · Entry points · Key flows · Not here · the seven guards

**T24 `.claude/current-task.md`**
```
# Current task — <Project>
Status · Updated · Session/branch
## Live: Goal / success measure · Latest result · Approved scope (date) · Not in scope · Progress (T#) · Blockers · Next action
   After compaction or a new session: confirm the scope still applies.
## Resume (overwrite at each pause; move results and decisions home first):
   Done · Changed files · Tests and checks (not verified) · Errors and fixes · Decisions (IDs) · Map updated yes/no · Exact next steps
```

**T25 `docs/ROADMAP.md`** (full + Next ID)
```
Progress line · ## Summary
## Phase n — <name> · planned | active | done — Goal · Done when
| ID | Task | Acceptance | Status | Priority | Size | Decision | Next action |
moved: T# → Phase m (date, why) · At phase end: still on goal?
## Completed (one line each → ROADMAP-DONE.md) · ## Older records
```
**T25b `ROADMAP-DONE.md`** (short): | ID | Task | Phase | Done | Decision | Result / testing pending |

**T27 `DECISIONS.md`** (project and global; full + Next ID)
```
## Index | ID | Title | Date | Status |  (includes IDs moved to DECISIONS-OLD)
## Active decisions — ### D<n> — <title> (DD-MM-YYYY): Status · Decision · Reason · Rejected · Affected files · Linked task
## Older records
```
**T27b `DECISIONS-OLD.md`** (short): D<n> · Status: superseded | partly superseded by D# · Reason · original text

**T28 other reference docs** (full): Summary · one section per question · Related

**T29 `templates/new-project.md`** (short): Goal · Users · In scope · Not doing · Constraints · Success looks like · Risks · Key decisions → DECISIONS.md · Design · Licences · Go-live · First roadmap → ROADMAP.md · Key tests · Needed next

**T31 `harness/rebuild.md`** (full): Before you start · Steps (each with its check) · Never commit · Git identity (C11) · Still-live checks (D23 sweep)

**T32 history:** record format · **T33 `SETUP-PLAN.md`:** | Old section name | Moved to | Date |

**Phase 9 review record:** | Format | Problem seen (real case) | Change | D# |

## 5. Where the 14 cross-check additions landed

| Addition | Where |
|---|---|
| A1 task files ignored by git | T1 · T34 · Phase 7 |
| A2 redaction exception | T1 · T14 |
| A3 secret scan on project docs | T1 · T34 |
| A4 no personal data in memory | T1 |
| A5 non-`.md` records saved | T1 · T14 |
| B1 results home first, size limit, history files | T1 · T15 · T24 · Phase 6 |
| B2 session/branch field | T1 · T24 |
| B3 format check runs automatically | T1 · T34 |
| B4 "None yet" | T1 · T3 · T34 |
| C1 one naming style | T1 · Phase 6 |
| C2 rollover triggers, topic splits | T1 · T28 |
| C3 ID families, Next ID | T1 · every list file |
| D1 decision's affected files checked | T1 · T12 · T27 · T34 |
| D2 Voice-Flow map decision, allowed copies | T1 · Phase 6 |
| E1 files with no home | T2 · Phase 7 |
| E2 memory notes sorted | Phase 6 |

## 6. Where this differs from Amit's original plan

1. `CURRENT.md` + `HANDOFF.md` → one `current-task.md` (Live + Resume).
2. Decision IDs `D<n>`, not `D001_DD-MM-YYYY`.
3. Global `CLAUDE.md` stays imports only + one non-loading comment, D48 — no "Read first", no copied hard rules.
4. Memory = preferences and corrections only.
5. No header on always-loaded files.
6. `DOCUMENT-MAP.md` replaces 3 existing maps instead of adding one.
7. `STANDARDS.md` and `SETUP-PLAN.md` included (SETUP-PLAN split very last).
8. Backlog as one table, with detail sections only where needed.
9. Deferred = `[-]`, not `[ ]`.
10. Order: all Claude Setup files first, then Voice-Flow, then other projects (Amit's call).

## 7. Decisions made in this session

- D46 read everywhere, write only here — done, tested, pushed (`a615de6`). Known limits accepted: shell writes not covered (auto mode may approve them); Write tool blocked from `/private/tmp` in Voice-Flow.
- All project files created at setup even if empty (Amit).
- Old record files are never edited (Amit).
- `SETUP-PLAN.md` split last (Amit).
- The project map (Graphify idea, item 16) stays a separate per-project file; it is one of the documents in this structure.

## 8. Open items

- **FinNode, Emp Portal, vthrudebugger_v1 `.gitignore`** — task file not ignored (FinNode confirmed). Recommended now, in each project's own session; otherwise Phase 7.
- **Seven project-map guards** — suggested moving them once into `DOCUMENTATION-STANDARD.md` now that projects can read `~/.claude`; not yet decided.
- **Voice-Flow `docs/README.md`** — becomes its map or is replaced; decided in Phase 6.
- **Session-start drift warning (10-11-2026):** Voice-Flow and vthrudebugger_v1 `CLAUDE.md` differ from their `project-rules/` copies; uncommitted files from before this session stay out of commits.

## 9. Cost so far

Cross-checks (Opus): structure 106.6k · read/write plan 66.3k · gap check 90.7k.
