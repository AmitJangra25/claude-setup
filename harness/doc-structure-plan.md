# Documentation structure plan

Purpose: Everything agreed with Amit on 10-11-2026 for the documentation structure — goal, global rules, numbering, every file's format, phases and open items — so the work can resume in any session.
Audience: Claude and Amit.
Read when: Starting or resuming any phase of the documentation structure work.
Owner: Claude (decisions are Amit's).
Update rule: Update when a phase starts or ends, or Amit changes a decision. Replace superseded text; history goes to a record.
Related: `harness/status.md` · `harness/backlog.md` (B16) · `SETUP-PLAN.md` (D46, D47) · `DOCUMENTATION-STANDARD.md` · `DOCUMENT-MAP.md` · Amit's original: `~/Documents/Claude setup doc plan.txt`
Status: Phase 1 done 10-11-2026; Phase 2 done 11-11-2026; Phase 3 done 11-11-2026; Phase 4 done 12-11-2026; Phase 5 planned 12-11-2026
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
- **Phase 5 planned 12-11-2026 (Go 1):** T21 plan, final text and decisions approved by Amit — § 3 *Phase 5 plan*.
- **Next step:** Phase 5 Go 2 — build T21 from § 3 *Phase 5 plan* in a fresh Opus session, on Amit's word.
- **Phases 6–9:** not started.

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

#### Phase 5 plan — T21 (approved by Amit 12-11-2026; build in Go 2)

**Goal (Amit's words):** every document follows one clear, predictable structure — here `ENVIRONMENT.md`: easier to use without losing information. Documentation only: no permission, setting, hook, invariant, project file, memory file or behaviour changes.

**Success checks (yes/no each):**
1. Sections in this order: Contents · The two kinds of rule · 1. RTK · 2. Status line · 3. Permissions · 4. Effort on Opus 5.5 · What every session loads · How numbers are measured · The project trees on this machine · Older records. Each tool section has What it is · Current setting · How to check · How to change · Known gaps, in that order. `doc-check.sh` finds them.
2. A fresh read-only "no content lost" check finds no rule, warning, limitation or safety note lost.
3. The old-text record is `cmp`-identical to the old file (below its header).
4. Every figure carries its date and method, or says "not recorded".
5. `ENVIRONMENT.md` ≤ 400 lines and ≤ 7,300 words (`wc -lw`; Go 1 estimates ~400 / ~7,200 — the draft could not be counted in Go 1, see *Errors*).
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

**Final text** — Go 2 replaces every `<Go 2 date>` with the build date (DD-MM-YYYY), then writes the file:

````markdown
# This machine

Purpose: How Claude Code is set up on this machine, and why each choice was made — each tool's current setting, how to check it, how to change it, and its known gaps.
Audience: Claude and Amit.
Read when: About to change settings, permissions, hooks or thresholds — the relevant section only, not on every session.
Owner: Setup sessions (changes are Amit's decision).
Update rule: When a setting or tool changes. Replace superseded text; history goes to a dated record in `baselines/`. Every figure states its date and method. Split by topic at about 300 lines.
Related: `settings.json` · `.claude/settings.json` · `RTK.md` · `statusline/context.py` · `PROJECTS.md` · `SETUP-PLAN.md` (D-numbers) · `baselines/global-open-tests.md`
Status: current
Last reviewed: <Go 2 date>

---

## Contents

Everything below lives in `~/.claude/` and applies to every project automatically — existing ones, new ones, VS Code, Android Studio, and cloud sessions alike.

- § *The two kinds of rule* — enforced settings against guidance.
- § *1. RTK* — the hook that rewrites commands; telemetry; version policy.
- § *2. Status line* — live context size and its thresholds.
- § *3. Permissions* — what stops and asks, the local settings files, the pre-commit secret check.
- § *4. Effort on Opus 5.5* — which effort keys are known to apply.
- § *What every session loads* — startup cost, and what was switched off to get there.
- § *How numbers are measured* — the commands behind every figure here.
- § *The project trees on this machine* — the branch-state sweep, duplicate trees, project descriptions.
- § *Older records* — history moved out of this file.

Figures below include measurements, estimates and projections. Each states its date and method — the commands are in § *How numbers are measured*. Where a date or method was never recorded, the figure says so.

**Backups** — git is the backup; this folder's history holds every committed state. Pre-repo copies are in `archive/`.

## The two kinds of rule

This matters more than anything else in this file.

| | Where | What it does |
|---|---|---|
| **Enforced** | `settings.json` | Claude Code blocks or prompts before the tool runs. Cannot be talked out of. |
| **Guidance** | `CLAUDE.md`, `STANDARDS.md` | Shapes what Claude tries. Not a boundary. |

From the Claude Code docs, on putting rules in `CLAUDE.md`: *"This shapes what Claude tries but doesn't enforce a boundary."*

So anything that must hold goes in `settings.json`. Anything about how to work well goes in `STANDARDS.md`. Writing an enforcement rule as prose is the most common way to end up with a protection that was never actually on.

## 1. RTK

### What it is

Token compression. `settings.json` → `hooks.PreToolUse` runs `rtk hook claude`, which rewrites commands before they run: `git status` → `rtk git status`. This is where the token saving comes from. Rules for using it: `RTK.md`. Full command list: `rtk --help`.

It is **not fully separate from permissions.** rtk 0.48.0's hook returns `"permissionDecision": "allow"` on some rewrites — seen on `rtk gh run list` and `rtk tree` (**D35**, `baselines/t6-removals.md` entry 3). `ask` and `deny` rules still apply whatever the hook returns — the docs: *"Deny and ask rules are still evaluated regardless of what the hook returns."* (`baselines/global-open-tests.md` TC11).

### Current setting

- **Version and policy (Amit, 05-11-2026).** Keep rtk (no better free replacement found, 05-11-2026). Stay on the latest **stable, free** version, and move only when a newer one is shown to be better than the installed 0.48.0. Recheck around 05-01-2027: `harness/backlog.md` B18.
- **rtk telemetry is off (31-10-2026, Amit's approval, audit C2).** `rtk telemetry status` reports consent no, enabled no (`~/Library/Application Support/rtk/config.toml`). Past data was not erased: `rtk telemetry forget` was not requested. This is rtk's own configuration, outside `~/.claude` and outside git.
- **Hook auditing is off again from 01-11-2026 (audit C13, D45).** `RTK_HOOK_AUDIT=1` was removed from `settings.json` → `env`; the 6.7 MB log is kept.
- **Savings — 09-10-2026:** `rtk gain` reports **60.9% over 12,104 commands, 8.5M tokens saved** (59.0% over 11,496 on 03-10-2026). The overall percentage drifts with the mix of work — it fell from 59.6% to 59.0% during a single docs-heavy session, because grep and read save least. **Treat the overall number as "roughly 60%" and read the live value from `rtk gain`**; the per-command figures below are the stable and useful part. `RTK.md` deliberately copies no total.
- **Savings are lopsided by command**, measured 26-09-2026 over 10,017 commands (59.6% overall, historical): `ps aux` 98.3%, `eslint` 95.2%, `gradlew` 95.9%, `vitest` 89.4% — but `grep` 22.0% and `read` 10.9%. The low figures are correct. rtk saves by stripping redundancy, and a file read or a grep hit is signal, not boilerplate. `ps aux` saved 2.6M tokens in 49 runs; 2,694 greps saved 473K. **Do not read a low percentage as a fault.**
- **GitHub CLI telemetry set off ahead of time (06-11-2026, B8)** — gh, not rtk. `gh config set telemetry disabled`; installed gh 2.83.2 has no telemetry and warned "not a known configuration key", but saved it (`gh config get telemetry` → `disabled`). gh 2.91.0+ turns telemetry on by default; not verified that it reads this key.

### How to check

- Live savings: `rtk gain`. **Name collision:** if `rtk gain` fails, reachingforthejack/rtk (Rust Type Kit) may be installed instead.
- Whether one command is rewritten: `rtk hook check` (used 10-10-2026 — § *Known gaps* below).
- rtk telemetry: `rtk telemetry status`. **After any gh update,** run `gh config get telemetry` and check gh's own docs for the off switch.
- The hook log, when auditing is on: `rtk hook-audit` reads `~/.local/share/rtk/hook-audit.log`.
- **`git add --dry-run` through rtk.** Through rtk, `git add --dry-run` prints nothing. Preview with `rtk proxy git add -A --dry-run`; verify real staging with `git diff --cached --name-only`.

### How to change

- **Hook auditing:** restore `RTK_HOOK_AUDIT=1` in `settings.json` → `env` to switch it back on for a test (it takes effect at the next session start). `env` is read at session start, so it never covers the session that set it. It is there to catch the one observed case where the hook did **not** rewrite a command — see `SETUP-PLAN.md` § *Findings not acted on*.
- **Updating rtk:** before any update, check open issues #4644 and #3673, the licence (1.x changed the default binary's licence), that telemetry stays off, and run box tests before and after.
- **A new permission fence** needs every spelling the hook can produce: § *3. Permissions* → *How to change*.

### Known gaps

**What the hook actually rewrites, tested 26-09-2026.** It handles a plain command and the `&&` and `;` chain operators. Nearly every other shell construct makes the *whole line* run raw — redirects are the exception noted in the table:

| shape | result |
|---|---|
| `grep -rn foo .` · `cd /tmp && git log` · `cat a; cat b` | rewritten |
| `grep foo . \| head` — any pipe | **raw** |
| `cat a > /tmp/x` — a redirect | **usually raw** — not always: on 10-10-2026 `rtk hook check` rewrote `tree . > /tmp/x`, and the hook log holds one real redirect rewritten inside a chained line |
| `echo $(cat a)` — any subshell | **raw** |
| `for f in a b; do cat $f; done` · `f(){ cat $1; }` | **raw** |
| `python3 …` · `sed …` — not handled in any form | **raw** |

**This is why adoption was 26%**, not because rtk failed: `rtk session` reported 24–34% across four sessions on 26-09-2026, and `rtk discover` found ~36.3K tokens left on the table over 279 scanned commands — mostly `grep -B` (21), `gh api` (13) and `git log` (11). The habit that closes it is in `RTK.md`: prefer the plain form over piping into `head` when the output is small enough to read anyway.

**Treat 36.3K as a floor.** `rtk discover` said it scanned 279 commands over 30 days while `rtk session` counted 555 on 26-09-2026 alone, so the two disagree about their own window.

**The catch worth knowing.** Claude Code has a built-in list of commands that never prompt: `ls`, `cat`, `echo`, `pwd`, `head`, `tail`, `grep`, `find`, `wc`, `which`, `diff`, `stat`, `du`, `cd`, and read-only `git`. RTK renames them to `rtk ls`, `rtk grep` and so on, and the built-in list no longer recognises them — so they start prompting.

That is why 615 permission entries had accumulated across the projects: safe commands were being approved by hand, one project at a time. The global `allow` list now covers the read-only `rtk` wrappers, so this stops happening.

## 2. Status line

### What it is

Live context size. `statusline/context.py` reads the real token counts from the session transcript and prints the current context size. It never estimates. Thresholds and the data behind them are documented at the top of that file.

**It costs nothing in tokens.** The status line is a shell command the terminal renders; its output never enters the model's context. Changing it is free, so tune it freely.

**What it's for.** Claude re-reads the whole conversation on every step, so a long session pays for its entire history on every small action. Sessions start around 48K and grow ~1,200 tokens per turn; the deepest recorded is 588K (50 sessions, 12,623 turns, measured 15-09-2026 — top of `statusline/context.py`).

**What to do about it:** `/clear` when you finish one task and start an unrelated one. Not mid-task — clearing during a long single task saved only 3% in the measured sessions, versus 45–54% for sessions with several distinct tasks (date and method not recorded here). The boundary is what saves tokens, not the number.

### Current setting

Grey under 200K, amber to 300K, red to 400K, then suggests `/compact`. These fit the 250K plan limit in `STANDARDS.md` § *Plan before building* (checked 06-11-2026, kept): amber is "near 250K" — weigh the 80% rule; 300K is act at the next task boundary.

**Lowered to 200K/300K/400K on 11-10-2026** at Amit's request, to save tokens: a session past 250K costs more per turn and uses more of the usage limit, so the nudge now comes sooner; 150K was considered and judged too early. The warning exists to nudge a clear at a **task boundary**, where it saves 45–54%, rather than mid-task, where it saves about 3% — it was never about running out of room.

### How to check

The constants at the top of `statusline/context.py` are the live values.

### How to change

Edit those constants. Earlier values and why they changed: the top of `statusline/context.py`; this file's old notes are in `baselines/environment-history-01-11-2026.md` § D and § E.

### Known gaps

None yet

## 3. Permissions

What stops and asks.

### What it is

- **`allow`** — stops a prompt. Purely additive: permission lists merge across files, so a global allow entry can only ever remove a prompt, never add one.
- **`ask`** — An `ask` rule prompts in **every** permission mode, including auto mode, and it overrides any `allow` rule that also matches. That is why the session can stay in auto mode without losing control of the dangerous commands.
- **`deny`** — refused. Note the **two** leading slashes in `Read(//**/.env)`. A single slash in user settings anchors at `~/.claude/`, not at your projects — `Read(/secrets/**)` in this file would protect `~/.claude/secrets`, which is almost certainly not what was wanted. Deny was chosen over ask because only a deny rule stops the IDE from passing an open `.env` tab to Claude as context; an ask rule can't intercept something Claude never requested.

### Current setting

    allow   36 rules    read-only things stop prompting
    ask    191 rules    all on things that change something, plus gist and Ollama cloud
    deny    74 rules    .env (34), private stores (34), project private data (6); not airtight

Counted with `jq` on `settings.json`; re-checked 12-11-2026.

**Read everywhere, write only here (D46, 10-11-2026).** `blockReadsOutsideWorkingDirectories` is **false** and `blockWritesOutsideWorkingDirectories` is **true**, globally. Any session reads `~/Documents/VS Code/**` and `~/.claude/**` with no box (other folders ask); Claude's Edit and Write tools cannot write outside the working folder — `/add-dir` a folder to change it. Denied for every session, Read and Bash: FinNode `private/`, Emp Portal `vthru.db*`, the Packbly folder.

**`allow`** — read-only `rtk` wrappers (`rtk tree` among them), `gh run list`, `WebSearch`, and docs domains. `tree *` and `xxd *` were removed on 30-10-2026 (**D41**): the hook turns `tree` into `rtk tree`, so the bare rule never fired, and `xxd in out` writes a file. Global `allow` also reads rtk's tee directory, because that folder sits outside every project: before it was made global (18-09-2026), rtk could write overflow logs everywhere but read them back only in Voice-Flow. A rule that can never fire is a file claiming a permission it does not grant — remove it (22-09-2026).

**`git branch` is allowed only as a listing.** The hook turns every `git branch …` into `rtk git branch …`, so this file's rule decides for every project. It allows only `--show-current`, `--list *` and `-a --list *`. **Narrowed 06-11-2026 (B20):** rtk reads an exact allow rule as a prefix (rtk issue #3673), so `rtk git branch`, `-a` and `-vv` were removed — on a scratch clone `git branch -a -m main x` renamed a branch and `-a -u` / `-a --unset-upstream` changed tracking, and plain `git branch x` creates one. `--show-current` refuses or ignores every changing flag (tested the same day). Box tests in default mode: `git branch -a -m zz-none zz-other` → "This command requires approval"; `git branch --list` → no box. To list, use `git branch --list` or `git branch -a --list`. The wide `rtk git branch *` it replaced let `git branch -vv -D x` delete a branch and `git branch -vv -f x` move one with no prompt: git accepts a verbose flag beside a changing one, and the `*git branch -D*` ask rule only matches the flag in first place. `--list` takes a trailing wildcard safely because git refuses or ignores every changing flag beside it (`-c -C -m -M -d -D -u --edit-description --unset-upstream` give a usage error; `-f`, `-t` and `--create-reflog` only list). `-vv` must stay exact. Tested on a scratch clone, 15-10-2026.

**`ask`** — git operations that publish or discard work (`push`, `reset`, `rebase`, `clean`, `rm`, `merge`, `checkout`, `restore`, `stash drop`, `stash clear`), `git commit` (`*git commit*` and `*git * commit*`), dependency installs including brew's `install`, `uninstall`, `upgrade` and `reinstall`, `npx --yes`, `rm`, `curl`, `wget`, `pkill`, `kill`. Since the 20-09-2026 merge most are one pattern with a leading `*`, which covers the bare, `rtk` and `rtk proxy` spellings at once; `rm`, `kill`, `killall`, `pkill` and `open` keep explicit spellings, because they sit inside ordinary words (`SETUP-PLAN.md`'s **`ask` list merged** row). **Added 23-10-2026:** `git cherry-pick`, `revert`, `filter-branch`, `filter-repo`, `update-ref`, `reflog expire|delete`, `tag -d|-f` and `remote add|set-url` — each as `*git X*` and `*git * X*`, so an option before the subcommand (`git -C path revert`) still matches — plus `npm publish`, and `ssh`, `scp`, `rsync` in bare, `rtk` and `rtk proxy` spellings (explicit, like `rm`). Plain `git stash`, `git tag` and `git remote` (listing) stay out — see `SETUP-PLAN.md` § *FinNode — open, not acted on*. **Closed 30-10-2026 (D41):** the older git patterns (`push`, `reset`, `rebase`, `merge`, `checkout`, `clean`, …) had only the `*git X*` form, so `git -C path push` was not matched; each now also has a `*git -* X*` form (live test: `git -C … merge --abort` boxed). `git remote remove|rm|rename|set-head` are now fenced too.

**Re-measured 30-10-2026 (S4, D41)** (`jq`): `allow` **39 → 37** (`tree *`, `xxd *` out) and `ask` **96 → 188**. Read forms of `gh pr|repo|auth|api`, `git merge-base`, `security` and words inside grep or echo text no longer ask; the writing forms of those commands do, and so do the `git -<opt> …` spellings of dangerous git commands (`git -C dir push` matched no rule before), `git … --output`, `--upload-pack`, forced or discarding `switch` and `pull --rebase|--force`. Replayed against past Bash history: boxed calls 2,241 → 1,722. Record and the full rule list: `baselines/s4-permissions-30-10-2026.md`.

**Asks added 01-11-2026 (audit C4, C5):** `*gh gist create*`, `*gh gist edit*`, `*ollama run *cloud*`. The `gist` token scope stays: the GitHub CLI cannot remove it (D45).

**Setup-only `ask` rules.** Sessions started in `~/.claude` also load six setup-only `ask` rules from `.claude/settings.json`: `git stash pop` and `git stash apply` (**D36**; four until S4 removed the blanket `git pull` and `git switch`, **D41**), and `git add`, `git -* add`, `git stage`, `git -* stage` (**D44**, 01-11-2026); they are not in the counts above.

**`git add` asks in setup sessions (01-11-2026, D44, audit C3).** The 30-10-2026 note here said `Bash(git add *)` in both local files "never matches anything". That was wrong: rtk's hook returned `"permissionDecision": "allow"` for `git add …`, `-f` and `-A` included, taking it from those rules (dry runs 31-10-2026), so a forced add of an ignored private file was staged with no box. Both rules are removed (backups in `~/.local/share/claude-setup-backups/01-11-2026/`), and the dry run now returns no `allow`. `.claude/settings.json` asks for `*git add*`, `*git -* add*`, `*git stage*` and `*git -* stage*`, so `git add` boxes in every `~/.claude` session — every setup commit is two boxes. Commit and push still ask everywhere. The docs say ask and deny rules apply whatever a hook returns (`baselines/global-open-tests.md` TC11); default mode is covered by the Stage C test report. Projects are unchanged.

**`deny`** — `.env` (34, Bash and Read, including `Read(//**/.env)` and `Read(//**/.env.*)`), private stores (34, D44) and project private data (6, D46 — the three folders above). The `.env` rules also block `.env.example`, which is harmless but occasionally inconvenient.

**Private stores blocked, 01-11-2026 (audit C1, D44).** Deny rules match the path wherever it appears in a command, so one rule covers `cat`, `rtk read`, `rtk grep`, `rtk find` and `rtk proxy …` before and after the hook rewrite: `.ssh`, `.ollama` and `.config/gh` (folder, contents and quoted forms), `history.jsonl`, `.claude.json*`, `paste-cache`, `projects/*.jsonl` transcripts, `~/.claude/backups`, `.netrc`, `.git-credentials`, `.npmrc`, plus a `Read(...)` rule for each. Tested on made-up paths: 19/19 Bash spellings and 3/3 Read-tool reads denied; memory files and normal reads still work.

**Bypass mode is off (01-11-2026, D45).** `permissions.disableBypassPermissionsMode: "disable"` — no Claude Code session can enter bypass mode or use `--dangerously-skip-permissions`. Claude Desktop has its own "Allow bypass permissions mode" toggle, left unchanged (Amit, Team plan, 01-11-2026); the key is not documented to cover it. `env` → `DISABLE_ERROR_REPORTING=1`; telemetry stays on because `DISABLE_TELEMETRY` also stops feature-flag fetching, which claude.ai skill sync and Remote Control need, and automatic updates stay on.

**Deliberately left out of `ask`.** These look risky but were measured and excluded. Prompting on them would produce ~24 interruptions a session instead of ~4.5 (both measured 18-09-2026 against the 87-rule `ask` list; not re-measured since), and a prompt you see twenty times a session is one you stop reading — which is worse than not having it.

| Command | Per session | Why it's out |
|---|---|---|
| `npx vite` / `npx vitest` | 11.3 | Routine build and test. `npx --yes`, the form that installs an arbitrary package, *is* in `ask` and costs 0.2/session. |
| `./gradlew` | 6.3 | The project's own build. FinNode's own rules require running it before every change. |
| `adb` | 3.9 | Your own emulator. |

**`rtk proxy`.** `Bash(rtk proxy *)` should exist nowhere, but it keeps coming back in `settings.local.json` files, which git ignores — so sweep those, not just the tracked files. What re-adds it is unproven (`baselines/global-open-tests.md` TC2). Global `allow` carries only the four read-only inner forms — `rtk proxy cat`, `find`, `grep`, `ls` — and a project adds a named spelling when it genuinely needs one, as `rtk proxy cmp *` was added for backup verification. The dangerous inner forms stay named individually in `ask`: `rtk proxy rm`, `rtk proxy git push`, `rtk proxy git reset`, `rtk proxy npm install`, and the rest.

**Pre-commit secret check (D45, 01-11-2026).** `~/.claude/.git/hooks/pre-commit` runs `project-rules/drift.sh` and blocks a commit if its secret scan prints a `SECRET PATTERN` line, or if the scan did not run. Mirror drift alone does not block. Git does not track hooks, so a fresh clone lacks it — recreate it from the copy below and `chmod +x` it. It covers this repo only, not projects; `git commit --no-verify` skips it (and `git commit` already asks).

```bash
#!/bin/bash
# Pre-commit secret check (audit C7, D45, 01-11-2026). Runs drift.sh's secret scan and
# blocks the commit if it finds a pattern, or if the scan did not run (fail closed).
# Mirror drift alone does not block. Untracked by git: documented in ENVIRONMENT.md § 3.
out=$(bash "$(git rev-parse --show-toplevel)/project-rules/drift.sh" 2>&1)
if printf '%s\n' "$out" | grep -q '^SECRET PATTERN'; then
  printf '%s\n' "$out" | grep '^SECRET PATTERN'
  echo "pre-commit: secret pattern found, commit blocked."
  exit 1
fi
if ! printf '%s\n' "$out" | grep -q '^secret scan: '; then
  echo "pre-commit: secret scan did not run (drift.sh failed), commit blocked."
  exit 1
fi
exit 0
```

**The mirror has two scripts, because of auto mode's self-modification classifier.** `project-rules/sync.sh` once held both a read-only drift report and a `--pull` that copies. Auto mode classified the combined script as self-modification and blocked it, so the mirror's only guard could not be run at all. A permission rule would not have fixed that honestly — `--pull` is just an argument, and argument-constrained `Bash(...)` patterns do not hold. The report path was split out into `project-rules/drift.sh`, which has no `cp`, `rm`, `mkdir` or output redirect and can therefore be granted safely; `sync.sh` keeps `--pull`, now required, and stays behind a prompt. Split 29-09-2026, and the first run of the separated reporter found real drift. **No new permission rule was added.**

**Current state — 03-10-2026: the two local settings files.** Two files named `settings.local.json` exist under `~/.claude`. Both are **ignored by git**, so neither is in this repo and **GitHub cannot show their contents**. Their rules **do not travel** to another machine or account. Counts change whenever Amit clicks allow on a prompt, so treat the numbers below as of this date only.

| File | allow / ask / deny | Status |
|---|---|---|
| `~/.claude/.claude/settings.local.json` | 14 / 0 / 0 (01-11-2026, `git add *` removed; 15 on 30-10-2026; 13 on 29-10-2026; 9 on 03-10-2026) | **Active** — confirmed |
| `~/.claude/settings.local.json` | 0 / 0 / 0 (01-11-2026, `git add *` removed; 1 before) | Present; **undocumented location**. `/skills` is recorded writing here; whether Claude Code reads it is **unverified** |

The nested file is the project-level overlay for `~/.claude` itself, because the setup repo lives at the path Claude Code also uses for its config. It is confirmed active: rules that exist **only** in it — `Bash(git ls-remote *)`, `Bash(git check-ignore *)`, `Bash(git fetch *)` among them — appear in the live `/permissions` allow list. `Bash(git ls-remote *)` was narrowed on 30-10-2026 to its three `origin` forms (**D41**).

The top-level file carried a single rule, `Bash(git add *)`, and an empty `skillOverrides` block; since 01-11-2026 its `allow` list is empty. **That rule was also present in the nested file**, so nothing observable proved the top-level file is read. It is recorded here as present, with its contents as read, and nothing more. Do not state that it is loaded without evidence that separates the two. **Undocumented, 10-10-2026:** a docs lookup, from search summaries rather than quoted text, found `settings.local.json` documented only inside a project's `.claude/` — for this folder, the nested file. Left in place by Amit's decision (T6). On 30-10-2026 `/permissions` listed `Bash(git add *)` once, sourced "Local settings"; that still does not separate the two files.

### How to check

- `/permissions` inside a session shows every rule and which file it came from.
- Counts: `jq` on the `permissions` lists in `settings.json`.
- What would prompt, against real history rather than a guess: § *How numbers are measured* → *Prompt volume*.
- `Bash(rtk proxy *)` coming back: `harness/session-check.sh` looks for it at every setup session start (TC2).

### How to change

- `/permissions` edits apply from the next tool call. Or edit `settings.json` directly. Read this section first (`STANDARDS.md` § *Explaining a permission request*).
- **Prompt volume feels wrong** — measure before changing. The replay (§ *How numbers are measured* → *Prompt volume*) tells you exactly what would prompt, against real history rather than a guess.
- **Why the `rtk ` spellings exist — and the hole that proved it.** The rtk hook rewrites a command *before* the permission check, so fencing `wget *` alone fences nothing: the engine only ever sees `rtk wget …`. `curl` carried all three spellings; `wget` carried the bare and `rtk proxy` forms but **not** `rtk `, so downloads ran unprompted until 20-09-2026. Probed live rather than reasoned — `wget …` → `rtk wget …`, and `pip3 install …` → `rtk pip install …`. **Any new fence needs every spelling the hook can produce.**

### Known gaps

- **An organisation policy is loaded remotely** (`claude doctor` shows it, from `api.anthropic.com`). It currently disables Remote Control. Its full contents aren't readable locally. If it ever sets `allowManagedPermissionRulesOnly`, the personal `allow` list stops applying — `ask` and `deny` would survive, because those only restrict.
- **Bash rules are not a security boundary.** They match the command text Claude writes. `/bin/rm`, `sh -c 'rm ...'`, and similar forms are not matched. The rules are there to catch the ordinary case and make you stop and look, not to contain an adversary.
- **`curl` and `rm` are the noisiest ask rules**, ~1.1 and ~1.2 prompts a session (date and method not recorded here). Most `curl` calls are the local Ollama health check on `127.0.0.1`, and most `rm` calls are scratchpad cleanup. Both were kept because narrowing a rule by argument is fragile — the docs are explicit that argument-constrained Bash patterns don't hold.
- **Write-only-here limits (D46):** shell commands can still write anywhere — default mode boxes them ("sensitive file" for `~/.claude`), auto mode may approve them silently; the Write tool is blocked from `/private/tmp` in Voice-Flow despite its `additionalDirectories` (cause not found; shell use of `/tmp` works). A recursive search can still walk into personal data not named here.
- **Private-store limits (D44):** a recursive search from a parent folder (`grep -rn x .` inside `~/.claude`, `grep -r x ~`) walks these files without naming them — in `~/.claude` use `git grep` or the Grep tool; globs and variables (`.ss?`, `${d}`); folder *names* via `|`, `;` or `$(…)` (contents still need a `/` and are denied); relative `backups/…` from `~/.claude`; other projects' personal data is not covered. Side effects: any command containing these words is refused — a commit message or doc grep must avoid them or use the Grep tool; a project command naming `.npmrc` is refused. Grep and Glob tools were not tested (not available in the testing session).
- **`git add`:** `git -c alias.x=add` is not fenced (F1).
- **`git remote`:** still untested whether `git remote -v add` matches.

## 4. Effort on Opus 5.5

### What it is

The effort level Claude runs at. The docs (`code.claude.com/docs/en/model-config`, fetched 10-10-2026): *"Opus 5.5 starts at `medium` unless one of the sources above sets a level for it, and a top-level `effortLevel` in your user settings file doesn't count for Opus 5.5."*

### Current setting

`settings.json` sets `"effortLevel": "high"` and `"modelSettings": {"claude-opus-5": {"effortLevel": "high"}}`. Both keys stay; Amit sets Opus 5.5 effort himself with `/effort` (T6, 10-10-2026).

### How to check

None yet

### How to change

`/effort` in the session (Amit).

### Known gaps

The old keys are not known to apply: whether the `claude-opus-5` key also covers `claude-opus-5-5` is **not documented**.

## What every session loads

**Not imported by `CLAUDE.md` on purpose.** The three files that *are* imported cost **about 7.6k tokens** on every turn of every session (last measured 01-11-2026; not re-measured since `STANDARDS.md` changed (12-11-2026)) — `/context all` in a fresh session from `~/.claude`, 01-11-2026, Opus 5.5, Claude Code version not recorded, run by Amit. `STANDARDS.md` 6.7k + `RTK.md` 641 + `OLLAMA.md` 214; the 7.6k is the sum of those three, and the 6.7k is rounded by `/context`. `CLAUDE.md` itself is a further 34 and is **not** one of the three — it is the file doing the importing.

A file explaining why a threshold is 200K doesn't change how work gets done, so it stays out of that budget. `PROJECTS.md` and `REPOS.md` joined this file and `SETUP-PLAN.md` outside the import list on 22-09-2026, for the same reason — reference, not rules.

**Startup: 25.2k (last measured 01-11-2026; not re-measured since `STANDARDS.md` changed (12-11-2026)).** `/context all` in a fresh session from `~/.claude`, run by Amit, **Opus 5.5**, Claude Code 2.1.316, `Messages` 10 tokens, after `aca6d86`. **Measured, not estimated.**

| Bucket | 01-11-2026 (earlier) | 01-11-2026 (now) |
|---|---|---|
| System prompt | 2.5k | 2.5k |
| System tools | 14.3k | 14.3k |
| Memory files | 7.8k | 8.2k |
| Skills | 261 | 261 |
| **Total** | **24.8k** | **25.2k / 1m** |

The earlier column is after the token pass (`c808989`) and three skills name-only (`3fa82b8`), down from 25.5k that morning; the rise to 25.2k is the rules added in `2657315` and `aca6d86`. Memory files by file now: `STANDARDS.md` 6.7k, `RTK.md` 404, `.claude/CLAUDE.md` 547, `MEMORY.md` 324, `OLLAMA.md` 214, `CLAUDE.md` 34. **The 8.2k is a setup-session figure:** it includes `.claude/CLAUDE.md`, which loads only in sessions started in `~/.claude`, so a project session carries about 7.7k. Always-loaded words, the everyday files without `.claude/CLAUDE.md`: **3,874**.

**No fixed target (Amit, 01-11-2026).** 23k was a past baseline, not a target. The goal is fewer tokens for the whole task; keep lowering where it helps.

**Current state — 03-10-2026: project-work token cost.** **149,112 tokens per assistant turn** — 1,018,735,369 tokens over 6,832 turns. Method: sum `input_tokens + cache_creation_input_tokens + cache_read_input_tokens + output_tokens` across every session transcript under `projects/*/`, dated after 17-09-2026, with `~/.claude` sessions excluded so only real project work counts. The comparable figure for the same work before that date is **215,251** over 9,680 turns. **Measured and reproducible** — re-running the sum returned the identical figure.

Two limits, both real. It is cost per **turn**, not per finished task: nothing in the transcripts marks task boundaries, so it does not show whether a task now takes more turns than it used to. And the work differed between the two periods, so the drop is **not** proof the setup caused it.

### What is switched off to get there

Five changes, each reversible. Four are lines in `settings.json`; the fifth was written by the `/plugin` menu.

| Change | What it did | Undo |
|---|---|---|
| `enableArtifact: false` | The single largest cut. Removes the Artifact tool, and with it the three `artifact-*` skills | delete the line |
| `disableClaudeAiConnectors: true` | Turned the claude.ai connectors off wholesale — no per-connector setting exists | delete the line |
| `browser-use@synced` disabled | Its cost was MCP **server instructions**, which `skillOverrides` cannot reach | re-enable in `/plugin` |
| `engineering@synced` disabled | −0.9k of skill catalogue, and its 16 MCP auth tools cost nothing either way. An upgrade took the same amount back the same hour (history table: `baselines/environment-old-<Go 2 date>.md` § *How the numbers moved*). Causation is inferred, not proven | re-enable in `/plugin` |
| `skillOverrides: name-only`, 33 entries | Keeps a skill working and suggestable at under 20 tokens instead of its full cost | delete an entry |

**Plugins now: `swift-lsp` enabled, `pdf-viewer` turned off by Amit in `/plugin` (01-11-2026, audit C6 — it ran an unpinned `npx` package at every session start; verified off at the next session start: no `pdf-viewer` tools or skills in `/context all`, no `server-pdf` process), 12 disabled in `settings.json`.**

**What the 33 `skillOverrides` entries are.** 30 bare keys. **18 were confirmed working by measurement on 26-09-2026.** The 12 added on 30-09-2026 are the heaviest remaining skills, ~2.1k between them. `claude-api` was deliberately left at full cost: its description is an auto-trigger, and `name-only` would delete it. The 5 `pdf-viewer` skills cannot be reached at all.

**Current state — 03-10-2026: the 12 are verified.** The first-turn `/context` reads Skills **1.1k**, against ~3.0k before the keys were added and a prediction of ~1.1k. Skills is reported on its own `/context` line, so this check does not depend on the total and is untouched by the deferred-tools caveat (in `baselines/environment-history-01-11-2026.md` § C). 3 `artifact-*` keys naming skills that no longer load at all since `enableArtifact: false` — harmless, kept at Amit's direction. There were 36: the other 15 were plugin keys, removed on 26-09-2026 once `/skills` confirmed they never could work. `user-invocable-only` was confirmed working too, on a separate skill: the skill count went 49 → 48 and the skill left the list entirely, still typable as `/doc-coauthoring`.

**`/skills` writes to `~/.claude/settings.local.json`, which is gitignored** (memory note `skill-overrides-name-only`). Its `skillOverrides` block **merges** with the one in `settings.json` rather than replacing it — verified 26-09-2026. **Which file held the entries during that check is not recorded**, so it does not prove the top-level file is read — see the local-settings table in § *3. Permissions*. And because the file is gitignored it is **not in this repo and does not travel to a second account.**

### What holds, whatever the numbers do

- **Caching changes what a number means.** Across 14,048 model calls, 98.3% of input tokens were cache reads, billed at 0.1× (date not recorded here). Effective input cost is about **12% of raw**. The saving is real but compounds slowly — worth doing once, not worth chasing in 200-token increments.
- **The rule files were never the load.** The savings came from turning off plugins and connectors, not from editing prose — and `STANDARDS.md` is the part that decides how work gets done.
- **A plugin's catalogue cost is not its skill bodies.** `claude plugin details <name>` splits them: `engineering` cost 871 tokens always-on for 10 skills, while each body — `code-review` 1,200, `debug` 1,200, `incident-response` 1,700 — loaded only when that skill fired. A skill you keep is already lazy; disabling it does not make it lazier, it makes it undiscoverable.
- **`skillOverrides` cannot reach plugin skills at all.** `/skills` shows them as *"locked by plugin · Plugin skills are managed via /plugin"*, and saved twice without writing an entry. Bare names are reliable; a plugin key is a silent no-op in any format. The only lever is `/plugin`, whole-plugin on or off. **D28.**
- **Ask the menu, never guess the key.** `/skills` and `/plugin` write the correct key by definition. `/skills` produced `anthropic-skills:doc-coauthoring`, a prefix `/context` never prints, so a key cannot be derived from what `/context` shows. `/plugin` produced `engineering@synced`, where the suffix was otherwise a coin-flip. **D29.**
- **A rule file's token cost can be estimated from its character count**, good to about 1% at this size: `RTK.md` at 915 → 1,190 chars was predicted at ~486 and measured 491. Confirm with `/context` anyway when the change is large.
- **Hold the conditions fixed before comparing anything** — version, model, effort, mode, folder and prompt. The system prompt alone moved 2.2k → 3.2k on the change from Opus 5.5 to Opus 5.
- **The session that makes a change cannot measure it.** Settings load at session start. Always open a new one.

`SETUP-PLAN.md`'s decision table holds the full history behind **D28** and **D29**.

### What was deliberately not cut

- **Memory files** — most of it `STANDARDS.md`; sizes in the 01-11-2026 table above. Per **D26**, a rule file is not trimmed.
- **The system prompt** — 2.4k on Opus 5.5 (10-10-2026). Not settable.
- **FinNode's `CLAUDE.md`** — 3,748 tokens (date not recorded here). Splitting its rule claims from their evidence looked like a 41% win on paper. Reading it showed most of that prose is operative: which of `observeById` / `getById` fails which way, that moving the device clock does *not* fire a pending sweep. Only ~600 tokens are genuinely historical, in one project, at 0.1× — about 70 effective tokens a turn. **The Voice-Flow 110 KB diagnosis has now failed to transfer to FinNode twice.** Measure the sections before proposing the fix.

## How numbers are measured

All from the session transcripts in `~/.claude/projects/*/*.jsonl`, which record the real `usage` counts and every tool call:

- **Context size** — sum `input_tokens` + `cache_creation_input_tokens` + `cache_read_input_tokens` from the last assistant message.
- **Prompt volume** — replay every historical `Bash` tool call against the `ask` rules, splitting compound commands on `&& || ; | &` and stripping the documented wrappers. Measured 4.5 per session across 5,188 commands in 49 sessions (18-09-2026, against the 87-rule `ask` list; S4's 30-10-2026 replay in § *3. Permissions* is the newer method).
- **Command frequency** — count matches per tool call, divided by distinct sessions.
- **Startup breakdown — use this one.** `/context all` in a fresh session, nothing typed: it itemises every tool, skill and rule file with its own size, so a change can be attributed rather than guessed. Settings load at startup, so **the session that makes a change cannot measure it** — always open a new one. Record model and folder with the figure; the system prompt alone moved 1k between Opus 5.5 and Opus 5.
- **Startup baseline** — the older first-reply method, kept because the 22-09-2026 and 25-09-2026 figures use it. Fresh sessions only: new Terminal window, `cd ~`, bare `claude`, the prompt `Reply with the single word: ok`, then `/exit`. Sum the three fields above on that session's **first** assistant reply. A log counts only if it is new and its first user message is that prompt — an attached or resumed session fails this. Record version, model, effort, mode and folder with the figure.

**The two startup methods are not directly comparable.** The first-reply sum adds the `usage` fields on a session's first assistant reply, which includes the first user message and the system reminders around it. `/context` is read with nothing typed. On the same day, before any change, the two differed by about 10k. Which is the better proxy for a real session is **not settled**. `/context` is used from here on, because it itemises and repeats.

Re-run these before changing a threshold or a rule. Every measured number in this file came from them, and a guess that replaces a measurement is how the 150K threshold and the "122 prompts per session" figure both turned out wrong the first time.

**Retention.** `cleanupPeriodDays` is 60, set 22-09-2026. Transcripts are not junk: every first-reply figure in this file came from them. Nothing was deleted when it was set — the oldest transcript was 21 days old.

## The project trees on this machine

Surveyed 15-09-2026. `PROJECTS.md` is the index; this is the state behind it, kept here so the index doesn't have to carry it into every turn's context. Verify against the filesystem rather than against the previous version of the file.

### Branch state — read it from git, not from here

This section used to hold a table of each project's branch and last commit date. It was accurate on the day it was written and wrong within weeks, which is the same defect `SETUP-PLAN.md` § *Git state is not recorded here* exists to prevent. One command answers it properly, and is never out of date. This is the one copy of the sweep; anywhere else that needs it points here:

```bash
for r in ~/.claude ~/Documents/VS\ Code/{Voice-Flow,FinNode,vthrudebugger_v1,Debugger\ v2} \
         ~/Documents/VS\ Code/Emp\ portal/Vthru_Emp_v2.1_jun26; do
  printf '%-22s %-46s %s\n' "$(basename "$r")" \
    "$(git -C "$r" status -sb | head -1)" "$(git -C "$r" log -1 --format=%ad --date=short)"
done
```

**What is worth knowing, and does not rot:** a project parked on a feature branch for months is worth a question before starting anything new in it — was that work finished, merged, or abandoned? Which projects those are changes; that it is worth asking does not.

### Duplicate trees

**One Voice Flow tree remains:** `~/Documents/VS Code/Voice-Flow`. The older copies `Voice Flow_v1` and `Voice-Flow-main` are deleted, confirmed absent 31-10-2026; their names in older records and `~/.claude.json` are history.

**Two Packbly trees exist**, `~/Documents/VS Code/Packbly_web/v1.1-Packbly` and an older copy at `~/Documents/extra/v1.1-Packbly`. Both are detached from Claude Setup (30-10-2026); the folders and their data stay on disk.

**Two Debugger trees exist.** Amit chose `~/Documents/VS Code/vthrudebugger_v1` as the tree to work on, 27-09-2026; `Debugger v2` is next up and may become an npm package (30-10-2026). A further copy under `~/Debugger` is gone, and whether `vthrudebugger_v1` holds its work is unknown — see § *Project-tree decisions*.

### Project-tree decisions

**Both are answered**, each dated below. They were settled by Amit's decisions and by one folder disappearing — not by opening the projects — so where something is still unknown, the entry says so rather than rounding it up.

- ~~**Which Debugger tree is current?**~~ **Settled by decision on 27-09-2026, not by a check.** Amit is working on `~/Documents/VS Code/vthrudebugger_v1`; `Debugger v2` is parked. *State on 30-10-2026 (audit CL3):* `Debugger v2` is no longer parked — it is next up (§ *Two Debugger trees exist* above; `PROJECTS.md`). Neither replaced the other — both were seeded from V-Thru's `DebugProvider.tsx` and then kept deliberately independent, so "successor" was never right. **Unknown, and not investigated:** whether `vthrudebugger_v1` is the newest or most complete Debugger tree. The 03-08-2026 memory `project-debugger-repo-fresh-start` says `~/Debugger/vthrudebugger_v1` was the furthest-ahead clone — mocks, storage, filter, InfoPanel, report — and `~/Debugger` is gone. Amit deleted a tree and does not recall which; whatever survives is either in `~/Documents/VS Code/vthrudebugger_v1` or on GitHub. No tree was opened to find out, and whether that work survived is not known.
- ~~**Is `Packbly v2` a real project?**~~ **Amit's decision, 27-09-2026.** Yes, it is. He is not working on it and the entry stays exactly as it is; someone else may pick it up. *State on 30-10-2026 (audit CL3):* Packbly v2 is detached from Claude Setup, with Packbly Web and Voice Flow v1 (`harness/status.md` § *Open*).

### Sensitive data

Two projects hold real personal records, and `OLLAMA.md` has the standing rule about what may be sent to a local model:

- **Emp Portal** — employee records
- **Packbly Web** — customer and courier records. Detached from Claude Setup 30-10-2026; the data is still on disk, so the `OLLAMA.md` rule still applies.

### Full project descriptions

`PROJECTS.md` carries a one-line version of each of these so it stays cheap to load. The detail lives here.

- **FinNode** — `~/Documents/VS Code/FinNode` — offline-first personal Android finance tracker for Indian users. Kotlin + Compose, Room + SQLCipher, **regex bank-SMS parsing**, **diary linked to transactions**. Progress lives in its own `docs/ROADMAP.md`, not here. Has `CLAUDE.md` and a `docs/` set indexed from `README.md`.
- **Voice Flow** — `~/Documents/VS Code/Voice-Flow` — personal macOS dictation app: floating mic widget callable from anywhere, global hotkey, real speech-to-text, an AI cleanup pass, and auto-paste **into whatever app is focused**. Electron + React + Vite. Also runs as a plain web app (`npm run dev`) for development, but the desktop build is the real product.
- **Debugger** (vthrudebugger) — `~/Documents/VS Code/vthrudebugger_v1` — drop-in in-app debugger library for React Native. **TypeScript + RN peer deps, RN Gesture Handler/Reanimated**. **Auto-captures network, console and errors**; **QA-facing alert toasts**, network inspector, **client-side mocks**. **The Debugger tree Amit is working on** — his decision, 27-09-2026, not a check of which tree is furthest ahead.
- **SecondBrain schema** — `~/Documents/SecondBrain Obsidian/schema` — schema for an Obsidian vault. **The vault itself is the parent directory**, which holds `raw`, `wiki` and `schema`.
- **Emp Portal** (Vthru-Emp) — `~/Documents/VS Code/Emp portal/Vthru_Emp_v2.1_jun26` — multi-tenant HR portal. React 18 + Vite **frontend**, Express 5 + better-sqlite3 **backend**, role-based dashboards. Holds real employee records.
- **Debugger v2** — `~/Documents/VS Code/Debugger v2` — in-app debug overlay for React Native, built so **a developer can drop it into an app**. GitHub: `github.com/AmitJangra25/vthrudebugger_v2`. **A separate project from `vthrudebugger_v1`, not a successor**; parked 27-09-2026, **next up and may become an npm package** (Amit, 30-10-2026) — the history is in § *Project-tree decisions*. **Carries its own** `ARCHITECTURE.md`, `INTEGRATION.md`, `PLAN.md`, `DEPENDENCIES.md`.
- **AtWorkpe** — `github.com/AmitJangra25/AtWorkpe`, **on GitHub only, not cloned** — multi-tenant company portal: leave management, attendance tracking, goals, documents, salary slips, onboarding and role-based dashboards (Admin, HR, Manager, Team lead, Employee). Production-ready multi-tenant HRMS SaaS, React + Vite client and Express + SQLite server.
- `~/Documents/extra/v1.1-Packbly` — a Next.js tree, apparently an older copy of Packbly Web. Last commit 23-06-2026.
- `~/Documents/Skils/PM-skills-Amit` — **a clone of the public `phuryn/pm-skills` repository. Reference material, not your code.**

## Older records

Read one only when a pointer here sends you there.

- `baselines/environment-old-<Go 2 date>.md` — the whole of this file before T21, word for word. Everything moved out in T21 is there, by its old section: earlier import readings and the last full reviews (top of file); rtk's monthly savings, the 20-09-2026 hook-audit note and its "recurs or closes itself" line, and the "Moved from `RTK.md`" notes of 01-11-2026 and 05-11-2026 (§ *1. RTK*); the permission changes of 18-09-2026 and 22-09-2026 (§ *3. Permissions*, *Changed 18-09-2026*); the original `rtk proxy` decision, its 30-09-2026 sweep and the `git commit` row (§ *Deliberately left out of `ask`*); the 11-10-2026 startup readings and 23k baseline, the 30-09-2026 note on the 12 unverified keys, the "Block 4's runbook needs this" note and the failed `skillOverrides` prediction (§ *What every session loads*); the 22-09-2026 to 26-09-2026 startup table (§ *How the numbers moved*); the 15-09-2026 `PROJECTS.md` corrections (§ *Corrections made on 15-09-2026*).
- `baselines/environment-history-01-11-2026.md` — moved out 01-11-2026: permission count changes to 29-10-2026 (§ A), startup readings of 26-09-2026 (§ B), notes on the 03-10-2026 column (§ C), status-line threshold changes (§ D, § E).
- `baselines/s4-permissions-30-10-2026.md` — the S4 permission pass and its full rule list.
- `baselines/t6-removals.md` — the T6 removals, with their original text.
- `SETUP-PLAN.md` — the decisions (D-numbers), incl. the 18-09-2026 phases 1.2 and 1.3.
````

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
