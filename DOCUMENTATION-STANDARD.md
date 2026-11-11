# Documentation standard

Purpose: The rules every document follows, in Claude Setup and in every project — types, headers, IDs, naming, structure, growth and safety.
Audience: Claude and Amit.
Read when: Writing, restructuring, splitting or archiving any document; adding a new document type; setting up a project's documents.
Owner: Claude (rules are Amit's decisions).
Update rule: Only from a real case logged in the backlog, recorded as a D-number. Replace superseded text; no history here.
Related: `DOCUMENT-MAP.md` (which document is where) · `STANDARDS.md` (how to work) · `harness/doc-structure-plan.md` (the agreed plan) · `templates/`
Status: in force from 10-11-2026 (Phase 1, T1); templates aligned (T3, 10-11-2026); format check built (T34)
Last reviewed: 10-11-2026

---

## Principles

1. One fact has one home. Other files point to it by ID or link.
2. Current state is kept apart from history.
3. Links, not copies.
4. Predictable headings: the same file type has the same sections in the same order.
5. Rules are short and testable.
6. Every document has one owner.
7. The always-loaded layer stays minimal.

## Five file types

| Type | Holds | Rule |
|---|---|---|
| Rules | How to work | Short lines, no history |
| Reference | Facts as they are now | Each topic: what it is, current setting, how to check, how to change |
| State | Where things stand now | Overwritten, never added to |
| List | Tasks, decisions, backlog, tests | One row per ID |
| Record | History | Dated, never edited (one exception: *Data and security*) |

Every document has exactly one type. `DOCUMENT-MAP.md` names it for global documents; project document types follow from *Structure per file*.

## Headers

| Header | Fields, in this order | Used by |
|---|---|---|
| Full | Purpose · Audience · Read when · Owner · Update rule · Related · Status · Last reviewed | Files marked "full" in *Structure per file* and `DOCUMENT-MAP.md` |
| Short | Purpose · Owner · Update when · Related | Files marked "short" there |
| None | — | Always-loaded files (*Always loaded*) |

- List files also show `Next ID: <ID>`.
- Record files use the record header: `# <Name> — DD-MM-YYYY` · Purpose · Date · Status: record · From.

## Always loaded

These load on every turn, so they carry no header and no history, and grow only with a reason:

- Global `CLAUDE.md` — imports only, plus one non-loading HTML comment (`@STANDARDS.md` `@RTK.md` `@OLLAMA.md`; the comment points to `DOCUMENT-MAP.md`, D48); no "read first" line, no copied rules.
- `STANDARDS.md`, `RTK.md`, `OLLAMA.md`.
- `.claude/CLAUDE.md` (setup sessions only).
- Each project's `CLAUDE.md`.
- Each `MEMORY.md` index.

Detail lives in files read when needed; an always-loaded file holds a one-line pointer.

## IDs and progress

| ID | Means | Rule |
|---|---|---|
| Phase 1, 2… | A block of work | Replaces Step, Stage, Wave, Session |
| T1, T2… | A task | Never renumbered; keeps its number when moved to another phase |
| T12.1… | A step inside a task | Only inside that task's plan |
| B1, B2… | Backlog item | Once planned, its row says "→ T15" |
| D1, D2… | Decision | Lists the exact files it affects (*Decisions and affected files*) |
| TC1, TC2… | Test | Replaces the old tests numbered "T" |
| P1–P4 | Priority, not an ID | Scale in `STANDARDS.md` § *Plan before building* |
| S / M / L | Size, not an ID | Small, medium, large |

- **Decisions keep the existing D-number system.** Claude Setup's decisions continue the existing sequence (index today: `SETUP-PLAN.md`). Each project numbers its own from D1. No other scheme.
- **Cross-project references** add a project code: VF Voice-Flow · FN FinNode · EP Emp Portal · DB1 vthrudebugger_v1 · DB2 Debugger v2 · CS Claude Setup. Example: `VF-T12`, `CS-D46`.
- **Every list file shows `Next ID`.**
- **Old IDs stay as they are** in old records (C1, CL3, S4, item 16, the 09-10-2026 finish-plan T1–T6…). They are not renumbered.
- **Status marks:** `[ ]` to do · `[~]` in progress · `[x]` done · `[!]` blocked · `[-]` deferred.
- **Dates:** DD-MM-YYYY.

**Progress line**, at the top of every roadmap:

```
Progress: Phase 2 of 5 · Phase 2: 6/10 (60%) · Project: 23/48 (48%) · Backlog: 14 (2×P2) · Updated: DD-MM-YYYY
```

Counts tasks done / tasks planned. Backlog items are not counted.

**Phase rules:**
- A phase's scope is fixed when it starts.
- New issues found during the work go to the backlog.
- Only a blocking P1 or P2 joins the current phase, with Amit's OK.
- Moving a task to a later phase keeps its ID and adds one line: `moved: T# → Phase m (DD-MM-YYYY, why)`.
- A phase with more than about 12 tasks is reviewed.

## Naming

- Standard files in capitals: `ROADMAP.md`, `BACKLOG.md`, `DECISIONS.md`, `PROJECT-MAP.md`, and their `-DONE` / `-OLD` partners.
- Other documents: lowercase-with-dashes.
- Templates: lowercase.
- Dated filenames: DD-MM-YYYY. Old names stay.
- A case-only rename on macOS needs two `git mv` steps (via a temporary name).

**Old → new:**

| Old | New |
|---|---|
| Step, Stage, Wave, Session (as a block of work) | Phase |
| Tests numbered "T" | TC |
| Backlog "item n" | B |
| `CURRENT.md` + `HANDOFF.md` (Amit's original plan) | one `.claude/current-task.md` (Live + Resume) |
| `D001_DD-MM-YYYY` (Amit's original plan) | `D<n>` |
| Lowercase standard files (e.g. a project's `docs/roadmap.md`) | Capitals (`docs/ROADMAP.md`) — renamed in that project's Phase 6 or 7 session |

## Structure per file

Sections in this order. Templates (`templates/`) are the fill-in forms; this list is the rule.

| File | Header | Sections |
|---|---|---|
| Project `CLAUDE.md` | none | Commands · Hard rules · Past defects · Documents |
| `PROJECT-MAP.md` | full | Main folders · Entry points · Key flows · Not here · the seven guards |
| `.claude/current-task.md` | own (*Task file rules*) | Status · Updated · Session/branch · Live · Resume |
| `ROADMAP.md` | full + Next ID | Progress line · Summary · Phase n — name · planned / active / done (Goal · Done when · table `ID · Task · Acceptance · Status · Priority · Size · Decision · Next action` · moved lines · at phase end: still on goal?) · Completed · Older records |
| `ROADMAP-DONE.md` | short | Table `ID · Task · Phase · Done · Decision · Result / testing pending` |
| `BACKLOG.md` | full + Next ID | One line: raise at once if an item blocks the task or risks safety, security or data · To build (`ID · Item · Why · Worth doing · Blocks current task · Priority · Size · Tokens · Status · Next action`) · In full (`### B<n> — title`: Found in · Decision · Detail) · Deferred (`ID · Item · Recheck date`) · Known and accepted (`ID · Item · Reason`) · Older records |
| `BACKLOG-DONE.md` | short | Table `ID · Item · Closed · How: → T#, fixed, or dropped (why)` |
| `DECISIONS.md` | full + Next ID | Index (`ID · Title · Date · Status`, including IDs moved to `-OLD`) · Active decisions (`### D<n> — title (DD-MM-YYYY)`: Status · Decision · Reason · Rejected · Affected files · Linked task) · Older records |
| `DECISIONS-OLD.md` | short | Per decision: D<n> · Status: superseded / partly superseded by D# · Reason · original text |
| Reference document | full | Summary · one section per question · Related |
| Record | record | Content word for word |

## When to read and update

The working rules live in `STANDARDS.md`; this section only says which file they land in. No copies.

| Event | File updated | Rule lives in |
|---|---|---|
| A task starts, progresses or pauses | `.claude/current-task.md` | `STANDARDS.md` § *How a task runs* (Orient, Handoff) |
| A verified result or a decision | Roadmap, and `DECISIONS.md` for a decision | `STANDARDS.md` § *How a task runs* (Record) |
| An out-of-task finding | Backlog | `STANDARDS.md` § *Stay on the task you were given* |
| Files added, moved, renamed or deleted | `PROJECT-MAP.md`, same commit | Guard 1 in the project map |
| A document added, moved or retired | `DOCUMENT-MAP.md` | This file |
| Setup status changes | `harness/status.md` | `.claude/CLAUDE.md` |

Read a document when its "Read when" line matches; read an old file only when a one-line pointer sends you there.

## Allowed copies

A copy is a defect except in these cases. Each copy names its source.

| Copy | Source | Why allowed |
|---|---|---|
| The seven guards in each `PROJECT-MAP.md` | `templates/project-map.md` | Allowed for now; final home not decided (`harness/doc-structure-plan.md` § 8) |
| Memory notes that restate a `STANDARDS.md` rule | `STANDARDS.md` | Agreed (plan Part 4); the rule's home stays `STANDARDS.md` |
| Voice-Flow rule claims in `CLAUDE.md`, evidence in `docs/` | D24 | Agreed (plan Part 4) |

## Growth and rollover

- Done tasks → `ROADMAP-DONE.md`; closed backlog items → `BACKLOG-DONE.md`; superseded decisions → `DECISIONS-OLD.md`. One line is left behind for each.
- Done files split by year when they grow.
- Every live file ends with `## Older records`, one line per old file.
- **Triggers:** about 300 lines, or 10 done rows. Claude proposes, Amit approves, a line-count check confirms nothing was lost.
- Large reference documents split by topic.

## Task file rules

`.claude/current-task.md` holds the one task in progress — never setup or project status.

- **Ignored by git** in every project.
- **About 80 lines at most.** Past that, warn and move results home.
- **One per worktree**; the `Session/branch` field names which.
- **Move results and decisions home first** (roadmap, decisions, backlog), then overwrite *Resume*.
- **Shape:**
  ```
  # Current task — <Project>
  Status · Updated · Session/branch
  ## Live: Goal / success measure · Latest measured result · Approved scope (date) · Not in scope · Progress (T#) · Blockers · Next action
     After compaction or a new session: confirm the scope still applies.
  ## Resume (overwrite at each pause):
     Done · Changed files · Tests and checks (not verified) · Errors and fixes · Decisions (IDs) · Map updated yes/no · Exact next step
  ```
- Between tasks: `Status: none`.
- Old task-history files become records.

## Empty files

All standard project files are created at setup, even when empty. An empty file contains its header and then exactly `None yet`.

## Data and security

- No personal data in documents or memory — IDs or counts only.
- No secrets in documents or memory.
- Memory holds preferences and corrections only — never task state, goals or decisions.
- Records are never edited, except to redact a leaked secret or personal data: replace it with `[REDACTED DD-MM-YYYY, D<n>]`, record the D-number, then rotate the secret.
- Record files are `.md`, or are named in `.gitignore`.
- Project documents are committed to project repos: raise this before any repo goes public (`STANDARDS.md` § *Git*).

## Decisions and affected files

- Every decision lists the exact files it affects (*Affected files*).
- A decision is closed only when every affected file has been checked.
- The header's *Related* line and the map's *Depends on* column show which files to check when one changes.
- Markdown cannot sync itself; IDs and links do the job.

## Moving and archiving

- Move text word for word; check with a line count or `cmp`.
- One line is left behind where it was, pointing to the new place.
- Never delete a document — relocate it and mark what is superseded (`STANDARDS.md` § *Docs are products*).
- A signpost file keeps old heading names so old links still land.

## Format check

`harness/doc-check.sh`.

- Warn-only, never blocks; no AI cost.
- Checks: headers · section order · IDs and Next ID · dead links · duplicates · size limits · `None yet` in empty files · task file ignored by git · secret patterns in project docs · files affected by a decision.
- Output: `WARN <file>: <rule broken>` per problem, then `n warnings`.
- Runs at each setup session start (from `harness/session-check.sh`) and in each project's commit check.
- Formats change only after real use (Phase 9, 30-day review).
