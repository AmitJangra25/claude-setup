# Documentation structure plan

Purpose: Everything agreed with Amit on 10-11-2026 for the documentation structure — goal, global rules, numbering, every file's format, phases and open items — so the work can resume in any session.
Audience: Claude and Amit.
Read when: Starting or resuming any phase of the documentation structure work.
Owner: Claude (decisions are Amit's).
Update rule: Update when a phase starts or ends, or Amit changes a decision. Replace superseded text; history goes to a record.
Related: `harness/status.md` · `harness/backlog.md` (B16) · `SETUP-PLAN.md` (D46, D47) · `DOCUMENTATION-STANDARD.md` · `DOCUMENT-MAP.md` · Amit's original: `~/Documents/Claude setup doc plan.txt`
Status: Phase 1 done 10-11-2026; Phase 2 done 11-11-2026; Phase 3 done 11-11-2026; Phase 4 done 12-11-2026
Last reviewed: 12-11-2026

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
- **Next step:** Phase 5 Go 1 — plan T21 (`ENVIRONMENT.md`) in a fresh Opus session, on Amit's word.
- **Phases 5–9:** not started.

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

### Phase 8 — `SETUP-PLAN.md` split (very last)
| ID | File | Priority |
|---|---|---|
| T30 | `DECISIONS.md` (new, global) — every D-number plus "no sixth tool". Same change (trigger: T30 build): `STANDARDS.md` step 8 drops "(Claude Setup: `SETUP-PLAN.md` until T30)" and the Recording list in § *IDs and progress* drops `SETUP-PLAN.md` | P3 |
| T31 | `harness/rebuild.md` (new) | P3 |
| T32 | `archive/setup-history-to-<date>.md` (new) — word for word | P3 |
| T33 | `SETUP-PLAN.md` → signpost | P3 |

Re-homed: "Project rules are separate" → `project-rules/README.md`; names, renames and "Renames are Amit's" → `PROJECTS.md`; how a pass is run + "The method" → `harness/overview.md`; why permissions can't be airtight + precedence rule → `ENVIRONMENT.md` § Permissions; "Never commit" + Git identity (C11) → `harness/rebuild.md`; "The five systems" → archive; open items (Phases 2, 3, 10) checked one by one → backlog. Decisions get "partly superseded" where needed (D17, D33, D36).
Safety: word-for-word moves, D-numbers counted before and after, about 25 links in 8 files fixed, signpost keeps old heading names (incl. "► START HERE"), line-by-line check by a fresh agent.

### Phase 9 — 30-day review
Record: `baselines/doc-review-<date>.md` — | Format | Problem seen | Change | D# |. Size limits, unused fields, rollover triggers: keep or change.

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

**T21 `ENVIRONMENT.md`** (full): Contents · Two kinds of rule · one section per tool (What it is · Current setting · How to check · How to change · Known gaps) · What every session loads · How numbers are measured · Project trees · Older records

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
