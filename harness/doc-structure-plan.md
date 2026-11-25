# Documentation structure plan

Purpose: Everything agreed with Amit on 10-11-2026 for the documentation structure — goal, global rules, numbering, every file's format, phases and open items — so the work can resume in any session.
Audience: Claude and Amit.
Read when: Starting or resuming any phase of the documentation structure work.
Owner: Claude (decisions are Amit's).
Update rule: Update when a phase starts or ends, or Amit changes a decision. Replace superseded text; history goes to a record.
Related: `harness/status.md` · `harness/backlog.md` (B16) · `SETUP-PLAN.md` (D46, D47) · `DOCUMENTATION-STANDARD.md` · `DOCUMENT-MAP.md` · Amit's original: `~/Documents/Claude setup doc plan.txt`
Status: Phases 1–9 done; Phase 8 (D51) and Phase 9 (D52) complete 25-11-2026 (Amit) — phase order changed 20-11-2026 (D50)
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
| I2 recovery | **Passed in a local copy** | `git clone` into `harness/phase9-scratch/recovery/`; `git revert --no-commit` of `37fc42b`, `cbd7307`, `34a5e9f`, `8f98442`, `a80a494` (Amit approved adding `cbd7307` and `8f98442`: they hold the reviewer migration in `harness/cross-check.md` and the brief). Conflicts only in `SETUP-PLAN.md`, `harness/status.md`, `harness/doc-structure-plan.md` (expected). Grep of the copy: no active instruction points to a removed skill, agent or brief; the one mention left is backlog row B24, a record. Limit (Amit's wording): "Recovery verification passed in a local copy: no broken active pointers after undoing the relevant commits. It does not prove how a live session behaves after an undo." Copy kept until Amit decides on deletion |
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

### Phase 10 — Clean-up and rewrite (agreed 20-11-2026, D50)

**Goal (Amit):** Claude Setup clean, simple, scalable, easy to maintain — reuse and pointers, not copies; one update in one place.
- Recheck every file and folder; find duplication, contradictions, needless complexity; keep / move / remove-candidate list; wait for Amit.
- Move sometimes-used rules out of `STANDARDS.md` into skills, agents or project docs, leaving a pointer.
- Rewrite only files that became too complex; old decisions B24, B25 and similar reviewed.
- Agreed changes to discuss here (Amit, 20-11-2026): backlog takes only findings past the value bar · contents list only in long docs (~150+ lines), checked by `doc-check.sh` · revisit "do not delete reference docs" (git keeps history; leave a pointer) · clickable links, converted file by file during rewrites · archive only for `harness/status.md`, `harness/backlog.md`, `harness/doc-structure-plan.md`, `ENVIRONMENT.md`, `SETUP-PLAN.md` · communication additions ("full detail only when asked"; write like a human, simple Indian English, docs and code) · `doc-check.sh` checks every new skill, agent, repo or project is listed in its one home · tidy the backlog (done rows out, fewer columns).
- Also here: old Phase 8 tasks T30–T33 (below) · old Phase 9 30-day review (below; B34) · `baselines/` and `archive/` review · C11 (UUIDs and emails before going public) · `harness/status.md` § *Known contradictions* · B15 only if a real case is seen.
- Cleanup rules: never drop facts, decisions, safety rules, limits or important history; nothing removed just for age or size; check what references a file first; no giant word-for-word history files; not in the same task as Phase 9.

### Phase 11 — Further checks (agreed 20-11-2026, D50)

- Recheck coding, testing and other parts; build more agents or skills only for a real repeated need.
- Approved, not started: B21, B14, B9, then B11. Also B12; the parked auto-compact question.
- Future candidates (Amit's list, 20-11-2026), revisited here: agents `root-cause-finder` · `data-safety-reviewer` · `test-reviewer` · `security-reviewer` · `documentation-reviewer` · `release-readiness-reviewer` · `project-onboarding-reviewer`; skills `testing` · `feature-brief` · `debugging-method` · `documentation-update` · `project-onboarding` · `release-checklist` · `agent-quality-review`. Overlaps flagged: Q6 — approved 24-11-2026: mark each as "potentially covered by …" (`feature-brief` → feature guide · `debugging-method` → bug-fix guide · `documentation-update` → `documents` skill · `project-onboarding` → new-project guide + `harness/cross-check.md` § *Claude Setup cross-check* · `documentation-reviewer`, `project-onboarding-reviewer` → `plan-reviewer` + `harness/cross-check.md` § *Claude Setup cross-check*); verify before declaring any fully covered.

#### Old Phase 8 — `SETUP-PLAN.md` split (now inside Phase 10)
| ID | File | Priority |
|---|---|---|
| T30 | `DECISIONS.md` (new, global) — every D-number plus "no sixth tool". Same change (trigger: T30 build): `STANDARDS.md` step 8 drops "(Claude Setup: `SETUP-PLAN.md` until T30)" and the Recording list in § *IDs and progress* drops `SETUP-PLAN.md` | P3 |
| T31 | `harness/rebuild.md` (new) | P3 |
| T32 | `archive/setup-history-to-<date>.md` (new) — word for word | P3 |
| T33 | `SETUP-PLAN.md` → signpost | P3 |

Re-homed: "Project rules are separate" → `project-rules/README.md`; names, renames and "Renames are Amit's" → `PROJECTS.md`; how a pass is run + "The method" → `harness/overview.md`; why permissions can't be airtight + precedence rule → `ENVIRONMENT.md` § Permissions; "Never commit" + Git identity (C11) → `harness/rebuild.md`; "The five systems" → archive; open items (Phases 2, 3, 10) checked one by one → backlog. Decisions get "partly superseded" where needed (D17, D33, D36).
Safety: word-for-word moves, D-numbers counted before and after, about 25 links in 8 files fixed, signpost keeps old heading names (incl. "► START HERE"), line-by-line check by a fresh agent.

#### Old Phase 9 — 30-day review (now inside Phase 10)
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
