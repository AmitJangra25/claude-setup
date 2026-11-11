# Documentation structure plan

Purpose: Everything agreed with Amit on 10-11-2026 for the documentation structure — goal, global rules, numbering, every file's format, phases and open items — so the work can resume in any session.
Audience: Claude and Amit.
Read when: Starting or resuming any phase of the documentation structure work.
Owner: Claude (decisions are Amit's).
Update rule: Update when a phase starts or ends, or Amit changes a decision. Replace superseded text; history goes to a record.
Related: `harness/status.md` · `harness/backlog.md` (B16) · `SETUP-PLAN.md` (D46, D47) · `DOCUMENTATION-STANDARD.md` · `DOCUMENT-MAP.md` · Amit's original: `~/Documents/Claude setup doc plan.txt`
Status: Phase 1 done 10-11-2026; Phase 2 Pass 2A committed 11-11-2026; Pass 2B built 11-11-2026, in review
Last reviewed: 11-11-2026

---

## 0. Where this stands

- **Agreed:** the goal, global rules, numbering, all formats (Part 4), the phase order and the 14 cross-check additions.
- **Done already:** read everywhere, write only here — D46, commit `a615de6`, pushed 10-11-2026.
- **Phase 1 done 10-11-2026, not pushed:** T1 `DOCUMENTATION-STANDARD.md`, T2 `DOCUMENT-MAP.md` (in force, D47), T3 12 templates + D47, T34 `harness/doc-check.sh` with the session-start link. Commits `14e5cd1`, `e9bd951`, `c67673d`. Sonnet fact-checks: T1–T2 46.6k, T3 59.1k, fixes taken.
- **Done early:** the outdated D46 line in `templates/project-map.md` (was Phase 2); `templates/new-project.md` changes (T29).
- **Phase 2, Pass 2A (T4–T9) committed locally as `4f468e6` (11-11-2026); not pushed. D47 closed 11-11-2026.**
- **Phase 2, Pass 2B (T10–T14) built 11-11-2026, awaiting Amit's review** — plan approved 11-11-2026, § 3 *Pass 2B plan*, with Amit's build-time decisions there. T15 comes after it. Phase 2 is pushed as a whole when it ends.
- **Phases 3–9:** not started.

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
| T16 | Global `CLAUDE.md` (no change) | P4 |
| T17 | `.claude/CLAUDE.md` | P3 |
| T18 | `RTK.md` | P4 |
| T19 | `OLLAMA.md` | P4 |

### Phase 4 — `STANDARDS.md`
| ID | File | Priority |
|---|---|---|
| T20 | `STANDARDS.md` — regroup; replace "a project with its own roadmap or backlog keeps it"; word count must not rise (3,391 on 10-11-2026) | P2 |

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
| T30 | `DECISIONS.md` (new, global) — every D-number plus "no sixth tool" | P3 |
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

**T16 global `CLAUDE.md`:** `@STANDARDS.md` `@RTK.md` `@OLLAMA.md`

**T17 `.claude/CLAUDE.md`:** At session start · While changing setup · Reaching into a project (approval, then /add-dir) · Git for ~/.claude

**T18 `RTK.md`, T19 `OLLAMA.md`:** one-line purpose · rules as bullets · Detail link

**T20 `STANDARDS.md`:** Communicate · Choose the project · Run a task · Safety and approval · Quality · Documents · Git · Models

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
3. Global `CLAUDE.md` stays imports only — no "Read first", no copied hard rules.
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
