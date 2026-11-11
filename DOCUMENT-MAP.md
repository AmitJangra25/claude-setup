# Document map

Purpose: The one list of every document in Claude Setup and the standard set in every project — what each is for, when to read it, when to update it, who keeps it.
Audience: Claude and Amit.
Read when: Looking for where a fact lives, before creating a new document, or when a document is added, moved or retired.
Owner: Claude (every change is Amit's decision).
Update rule: Same change that adds, moves, renames or retires a document. One row per document; detail stays in the document.
Related: `DOCUMENTATION-STANDARD.md` (the rules) · `harness/doc-structure-plan.md` (the plan) · replaced three old maps, trimmed 11-11-2026 (D47; old text: `baselines/old-document-maps-11-11-2026.md`)
Status: in force (D47, closed 11-11-2026)
Last reviewed: 11-11-2026

---

Owner "Setup" = a session started in `~/.claude`; "Project" = that project's own session. Amit approves every change either way. "Planned (T#)" = does not exist yet.

## Global documents

| Document | Type | Header | Purpose | Read when | Update when | Owner | Depends on |
|---|---|---|---|---|---|---|---|
| `CLAUDE.md` | Rules | None | Imports the three always-loaded rule files, plus one non-loading HTML comment pointing here (D48) | Loaded every turn | An import is added or removed | Setup | `STANDARDS.md` · `RTK.md` · `OLLAMA.md` |
| `STANDARDS.md` | Rules | None | How to work, in every project | Loaded every turn | Amit approves a rule change | Setup | `templates/` · `harness/models.md` · `harness/cross-check.md` |
| `RTK.md` | Rules | None | Rules for the rtk command proxy | Loaded every turn | rtk behaviour or its rules change | Setup | `ENVIRONMENT.md` § 1 |
| `OLLAMA.md` | Rules | None | When chores may go to a local model | Loaded every turn | Local-model rules change | Setup | `skills/ollama/SKILL.md` |
| `.claude/CLAUDE.md` | Rules | None | Setup-only rules | Loaded in every setup session | A setup-only rule changes | Setup | `harness/status.md` · `harness/session-check.sh` |
| `.claude/current-task.md` | State | None — task-file shape (`DOCUMENTATION-STANDARD.md` § *Task file rules*) | The one setup task in progress; never setup status | Setup session start, for setup work | As the task runs, and at each pause | Setup | `harness/status.md` |
| `DOCUMENTATION-STANDARD.md` | Rules | Full | How every document is written, numbered, grown and archived | Writing or restructuring a document | A real case changes a format (backlog item + D-number) | Setup | `templates/` · this map |
| `DOCUMENT-MAP.md` | Reference | Full | This list | See header | See header | Setup | `DOCUMENTATION-STANDARD.md` |
| `README.md` | Reference | Short | Front page: what this repo is, why it stays private | First time in the repo | Repo purpose or privacy reason changes | Setup | this map |
| `ENVIRONMENT.md` | Reference | Full | Facts about this machine and its tools: permissions, rtk, status line, measurements | Before changing settings, permissions, hooks or thresholds — the relevant section only | A setting or tool changes | Setup | `settings.json` · `RTK.md` |
| `SETUP-PLAN.md` | Record | None until T33 | Setup history and rebuild runbook; also holds the decision list (D1 onwards) until T30; becomes a pointer page in T33 | Changing a rule, permission or hook — search by D-number or section, never whole | A new decision, until T30 | Setup | `DECISIONS.md` (planned) · `harness/rebuild.md` (planned) |
| `harness/status.md` | State | Full | Where the setup work stands now | Setup session start, for setup work | Every changing setup plan | Setup | `harness/backlog.md` · `harness/overview.md` |
| `harness/backlog.md` | List | Full + Next ID | Setup improvements and open items not yet built | Planning setup work | An item is found, planned or closed | Setup | `harness/status.md` |
| `harness/cross-check.md` | Reference | Full | When a second agent reviews, and how it is shown | A cross-check or a large workload is about to run | The procedure changes | Setup | `STANDARDS.md` § *How a task runs* |
| `harness/models.md` | Reference | Full | Which model for which job, and when to switch | Choosing a model for a session or helper | The model rule changes | Setup | `STANDARDS.md` § *Which model* |
| `harness/overview.md` | Reference | Short | How the setup's pieces fit; the "finished" checklist | Judging whether the setup is finished | A finish line is met or changes | Setup | `harness/status.md` · `baselines/global-open-tests.md` |
| `harness/doc-structure-plan.md` | State | Full | The agreed documentation-structure plan, phases and tasks | Starting or resuming a documentation phase | A phase starts or ends, or Amit changes a decision | Setup | `DOCUMENTATION-STANDARD.md` · this map |
| `PROJECTS.md` | Reference | Short | Each project: path, what it is, has a `CLAUDE.md` or not | Locating a project by name | A project is added, moved or renamed | Setup | `project-rules/manifest.tsv` |
| `REPOS.md` | Reference | Short | Shortlist of useful GitHub repos | Starting an integration | A repo is added or dropped | Setup | — |
| `baselines/global-open-tests.md` | List | Full + Next ID | What is still unproven, and how closed tests closed | Deciding what to test next | A test is opened, closed or deferred | Setup | `harness/overview.md` |
| `baselines/README.md` | Reference | Short | Index of the dated baseline files | Looking for a past test or audit | A baseline file is added | Setup | `baselines/` (dated files) |
| `baselines/` (dated files) | Record | Record | Dated test and audit reports | A pointer sends you to one | Never edited; a new run adds a file | Setup | `baselines/README.md` |
| `archive/README.md` | Reference | Short | Index of the archive | Recovery, or a pointer sends you there | An archive item is added | Setup | `archive/` (items) |
| `archive/` (items) | Record | Record | Things that cannot be recreated | Recovery, or a pointer sends you there | Never edited; new items only | Setup | `archive/README.md` |
| `templates/` | Reference | Each form carries the header its document needs (*Structure per file*) | Blank forms for project documents | A step needs that form | A format in `DOCUMENTATION-STANDARD.md` changes | Setup | `DOCUMENTATION-STANDARD.md` |
| `DECISIONS.md` — planned (T30) | List | Full + Next ID | Every global D-number in one list | Checking or adding a decision | A decision is made or superseded | Setup | `SETUP-PLAN.md` |
| `harness/rebuild.md` — planned (T31) | Reference | Full | Steps to rebuild the setup on a new machine or account | Rebuilding | A rebuild step changes | Setup | `SETUP-PLAN.md` |

## Project documents

Created in each project's own session: Voice-Flow in Phase 6 (T22–T28), the others in Phase 7. Until then a project's existing files stand. All created at setup, even if empty (`None yet`).

| Document | Where | In git | Purpose | Read when | Update when |
|---|---|---|---|---|---|
| `CLAUDE.md` | Project root | Yes, while the repo is private | Commands, hard rules, past defects, list of documents | Loaded every turn in that project | A rule, command or past defect changes |
| `PROJECT-MAP.md` | Project root | Yes | Which folder holds what; entry points; key flows | Before searching code | Files added, moved, renamed or deleted — same commit |
| `.claude/current-task.md` | `.claude/` | **No** — ignored | The one task in progress: Live + Resume | Session start (Orient) | As the task runs, and at each pause |
| `docs/ROADMAP.md` | `docs/` | Yes | Phases and tasks, with the progress line | Planning or checking progress | A task starts, finishes or moves |
| `docs/ROADMAP-DONE.md` | `docs/` | Yes | Finished tasks moved out of the roadmap | A one-line pointer sends you there | Rollover |
| `docs/BACKLOG.md` | `docs/` | Yes | Found work not yet planned | Planning, or when a finding comes up | An item is found, planned or closed |
| `docs/BACKLOG-DONE.md` | `docs/` | Yes | Closed backlog items | A one-line pointer sends you there | Rollover |
| `docs/DECISIONS.md` | `docs/` | Yes | The project's decisions, D1 onwards | Before changing anything a decision covers | A decision is made or superseded |
| `docs/DECISIONS-OLD.md` | `docs/` | Yes | Superseded decisions, original text | A one-line pointer sends you there | Rollover |

## Other project files

| File | Project | Document or not | Home |
|---|---|---|---|
| `PLAN.md` | DB1 (named in its `CLAUDE.md` copy) | Document | Decided in Phase 7 |
| `INTEGRATION.md` | Found in Phase 7 survey | Document | Decided in Phase 7 |
| `MOBILE-CONTEXT.md` | Found in Phase 7 survey | Document | Decided in Phase 7 |
| `DEPENDENCIES.md` | Found in Phase 7 survey | Document | Decided in Phase 7 |
| `docs/README.md` | VF | Document | Becomes VF's map or is replaced — decided in Phase 6 |
| Other reference documents (e.g. VF `manual-testing.md`, VF `roadmap.md`) | VF; others found in Phase 7 survey | Document | Split by topic in T28 |
| Skills | Found in Phase 7 survey | Not a document | *Not documents* |
| Acceptance sheets | Found in Phase 7 survey | Not a document | *Not documents* |
| `launch.json` | Found in Phase 7 survey | Not a document | *Not documents* |

## Not documents

These make things work; they are not read as documents and follow no document format.

| Item | Role |
|---|---|
| `settings.json` (global and per project) | Permissions, hooks and model: what Claude may do and what needs Amit's OK |
| `project-rules/` | Backup copies of each project's `CLAUDE.md` and settings; `drift.sh` reports differences, `sync.sh` copies |
| `projects/*/memory/` | Claude's notes on Amit's preferences and corrections — never task state, goals or decisions |
| Skills (`skills/`, project skills) | Instructions loaded only when a task calls for them |
| Acceptance sheets | Checklists used to test a project's work |
| `launch.json` | Editor settings for starting and debugging an app |
| `harness/session-check.sh` | Script run at setup session start; warns about drift and risky rules |
| `harness/doc-check.sh` | Warn-only format check (`DOCUMENTATION-STANDARD.md` § *Format check*) |
