# Document map

Purpose: The one list of every document in Claude Setup and the standard set in every project — what each is for, when to read it, when to update it, who keeps it.
Audience: Claude and Amit.
Read when: Looking for where a fact lives, before creating a new document, or when a document is added, moved or retired.
Owner: Claude (every change is Amit's decision).
Update rule: Same change that adds, moves, renames or retires a document. One row per document; detail stays in the document.
Related: `DOCUMENTATION-STANDARD.md` (the rules) · `harness/doc-structure-plan.md` (the plan) · replaced three old maps, trimmed 11-11-2026 (D47; old text: `baselines/old-document-maps-11-11-2026.md`)
Status: in force (D47, closed 11-11-2026)
Last reviewed: 25-11-2026

---

Owner "Setup" = a session started in `~/.claude`; "Project" = that project's own session. Amit approves every change either way. "Planned (T#)" = does not exist yet.

## Global documents

| Document | Type | Header | Purpose | Read when | Update when | Owner | Depends on |
|---|---|---|---|---|---|---|---|
| `CLAUDE.md` | Rules | None | Imports the three always-loaded rule files, plus one non-loading HTML comment pointing here (D48) | Loaded every turn | An import is added or removed | Setup | `STANDARDS.md` · `RTK.md` · `OLLAMA.md` |
| `STANDARDS.md` | Rules | None | How to work, in every project | Loaded every turn | Amit approves a rule change | Setup | `templates/` · `harness/models.md` · `harness/cross-check.md` · `DOCUMENTATION-STANDARD.md` |
| `RTK.md` | Rules | None | Rules for the rtk command proxy | Loaded every turn | rtk behaviour or its rules change | Setup | `ENVIRONMENT.md` § 1 |
| `OLLAMA.md` | Rules | None | When chores may go to a local model | Loaded every turn | Local-model rules change | Setup | `skills/ollama/SKILL.md` |
| `.claude/CLAUDE.md` | Rules | None | Setup-only rules | Loaded in every setup session | A setup-only rule changes | Setup | `harness/status.md` · `harness/session-check.sh` |
| `DOCUMENTATION-STANDARD.md` | Rules | Full | How every document is written, numbered, grown and archived | Writing or restructuring a document | A real case changes a format (backlog item + D-number) | Setup | `templates/` · this map |
| `WRITING-GUIDE.md` | Rules | Full | How every Claude Setup file is written: style, two levels, rule plus case, one form per file kind, words to use and avoid (D55) | Writing or rewriting a document, agent, skill, rule file, guide or case study | A real case changes a writing rule (backlog item + D-number) | Setup | `DOCUMENTATION-STANDARD.md` · `templates/` |
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
| `harness/agent-brief.md` | Reference | Full | Short brief for fresh reviewers and helpers: purpose, stack, features, entry points, critical rules, where to look next | Starting a review or helper task on Claude Setup (D52) | A rule, entry point or feature it names changes | Setup | `STANDARDS.md` · `DOCUMENTATION-STANDARD.md` § *Allowed copies* · this map |
| `harness/project-cleanup-list.md` | List | Short | Temporary: project-side findings from setup work, and the safety rules for any project clean-up | Before a project clean-up, or when a setup session finds a project-side issue | A finding is added or closed; deleted when every row is done (Amit approves by name) | Setup | `harness/doc-structure-plan.md` § 3 *Phase 10* |
| `PROJECTS.md` | Reference | Short | Each project: path, what it is, has a `CLAUDE.md` or not | Locating a project by name | A project is added, moved or renamed | Setup | `project-rules/manifest.tsv` |
| `project-rules/README.md` | Reference | None | How the rule-file backup works: `manifest.tsv`, `drift.sh`, `sync.sh` | Backing up or restoring a project's rule files | The backup method or the list of projects changes | Setup | `project-rules/manifest.tsv` |
| `REPOS.md` | Reference | Short | Shortlist of useful GitHub repos | Starting an integration | A repo is added or dropped | Setup | — |
| `baselines/global-open-tests.md` | List | Full + Next ID | What is still unproven, and how closed tests closed | Deciding what to test next | A test is opened, closed or deferred | Setup | `harness/overview.md` |
| `baselines/README.md` | Reference | Short | Index of the dated baseline files | Looking for a past test or audit | A baseline file is added | Setup | `baselines/` (dated files) |
| `baselines/` (dated files) | Record | Record | Dated test and audit reports | A pointer sends you to one | Never edited; a new run adds a file; removed only under `DOCUMENTATION-STANDARD.md` § *Moving and archiving* | Setup | `baselines/README.md` |
| `archive/README.md` | Reference | Short | Index of the archive | Recovery, or a pointer sends you there | An archive item is added | Setup | `archive/` (items) |
| `archive/` (items) | Record | Record | Things that cannot be recreated | Recovery, or a pointer sends you there | Never edited; new items only; removed only under `DOCUMENTATION-STANDARD.md` § *Moving and archiving* | Setup | `archive/README.md` |
| `templates/`: `templates/new-project.md` · `templates/roadmap.md` · `templates/roadmap-done.md` · `templates/deferred-improvements.md` · `templates/backlog-done.md` · `templates/decisions.md` · `templates/decisions-old.md` · `templates/handoff.md` · `templates/project-map.md` · `templates/project-claude.md` · `templates/reference-doc.md` · `templates/record.md` | Reference | Each form carries the header its document needs (*Structure per file*) | Blank forms for project documents | A step needs that form | A format in `DOCUMENTATION-STANDARD.md` changes | Setup | `DOCUMENTATION-STANDARD.md` |
| `templates/agent.md` · `templates/skill.md` · `templates/rule-file.md` · `templates/guide.md` · `templates/case-study.md` | Reference | As `WRITING-GUIDE.md` § *Shapes by file kind* gives for each | Blank forms for the five file kinds (D55) | Writing a new file of that kind | The guide changes a shape | Setup | `WRITING-GUIDE.md` |
| `DECISIONS.md` — planned (T30) | List | Full + Next ID | Every global D-number in one list | Checking or adding a decision | A decision is made or superseded | Setup | `SETUP-PLAN.md` |
| `harness/rebuild.md` — planned (T31) | Reference | Full | Steps to rebuild the setup on a new machine or account | Rebuilding | A rebuild step changes | Setup | `SETUP-PLAN.md` |

## Project documents

Created in each project's own session: Voice-Flow in Phase 6 (T22–T28), the others in Phase 7. Until then a project's existing files stand. `ROADMAP.md`, `BACKLOG.md` and `DECISIONS.md` are created at setup, even if empty (`None yet`); the `-DONE` and `-OLD` files only at a split (`DOCUMENTATION-STANDARD.md` § *Growth and rollover*).

| Document | Where | In git | Purpose | Read when | Update when |
|---|---|---|---|---|---|
| `CLAUDE.md` | Project root | Yes, while the repo is private | Commands, hard rules, past defects, list of documents | Loaded every turn in that project | A rule, command or past defect changes |
| `PROJECT-MAP.md` | Project root | Yes | Which folder holds what; entry points; key flows | Before searching code | Files added, moved, renamed or deleted — same commit |
| `.claude/current-task.md` | `.claude/` | **No** — ignored | The one task in progress: Live + Resume | Session start (Orient) | As the task runs, and at each pause |
| `docs/ROADMAP.md` | `docs/` | Yes | Phases and tasks, with the progress line | Planning or checking progress | A task starts, finishes or moves |
| `docs/ROADMAP-DONE.md` | `docs/` | Yes | Finished tasks moved out of the roadmap | A one-line pointer sends you there | Only at a split (see the standard) |
| `docs/BACKLOG.md` | `docs/` | Yes | Found work not yet planned | Planning, or when a finding comes up | An item is found, planned or closed |
| `docs/BACKLOG-DONE.md` | `docs/` | Yes | Closed backlog items | A one-line pointer sends you there | Only at a split (see the standard) |
| `docs/DECISIONS.md` | `docs/` | Yes | The project's decisions, D1 onwards | Before changing anything a decision covers | A decision is made or superseded |
| `docs/DECISIONS-OLD.md` | `docs/` | Yes | Superseded decisions | A one-line pointer sends you there | Only at a split (see the standard) |
| `docs/archive/` | `docs/` | Yes | Dated records of finished work's old detail | A pointer sends you there | Finished work's detail moves out |

## Other project files

| File | Project | Document or not | Home |
|---|---|---|---|
| `PLAN.md` | DB1 | Document | Archived word for word to `docs/archive/plan-16-11-2026.md` (Phase 7, 16-11-2026); not a live document |
| `INTEGRATION.md` | DB1 | Document | Live consumer guide at the project root; ships in the npm package (`package.json` `files`), so no Claude Setup header |
| `MOBILE-CONTEXT.md` | DB1 | Not a live project document | Local-only and git-ignored; not in the project's document list |
| `DEPENDENCIES.md` | None found in Phase 7 | Document | Decided in Phase 7 |
| `docs/README.md` | VF | Document | Becomes VF's map or is replaced — decided in Phase 6 |
| Other reference documents (e.g. VF `manual-testing.md`, VF `roadmap.md`) | VF; FN (`docs/SPEC.md`, `ARCHITECTURE.md`, `DATA_MODEL.md`, `DESIGN_SYSTEM.md`, `RISKS.md`, `SCREENS.md`, `SETUP.md`, `TECH_STACK.md`, `Design/README.md`; indexed from `README.md`); others found in Phase 7 survey | Document | Split by topic in T28 |
| Skills | FN (three project skills: `device-walk`, `live-data`, `money-math`); others: None found in Phase 7 | Not a document | *Not documents* |
| Acceptance sheets | None found in Phase 7 | Not a document | *Not documents* |
| `launch.json` | AW, EP (each in its own `.claude/` folder). VT has no `launch.json`; its `.claude/` folder contains only its local-only roadmap, backlog, decisions, and current-task files | Not a document | *Not documents* |
| `client/README.md` | EP (whole-repo README kept inside `client/`) | Document | The project's front page, like a root `README.md`; indexed from its `CLAUDE.md` |

**VT (Vthru Customer app) keeps every Claude file local.** Its repo is the company's GitLab, so nothing Claude-related is committed there:

| File | Where | Hidden from GitLab | Backed up |
|---|---|---|---|
| `CLAUDE.md` | Project root | Yes, `.git/info/exclude` | Yes — sanitized copy in `project-rules/VT/` |
| `PROJECT-MAP.md` | Project root | Yes, `.git/info/exclude` | No |
| ROADMAP.md, BACKLOG.md, DECISIONS.md, current-task.md | Its own `.claude/` folder | Yes, `.git/info/exclude` | No |

**Shipped documents get no Claude Setup header.** A document that ships inside a published package (npm `files`) is read by the package's users, so it keeps no Claude Setup header, `## Summary` or `## Related`. Today: DB1 `README.md` and `INTEGRATION.md` (Amit, 16-11-2026).

## Not documents

These make things work; they are not read as documents and follow no document format.

| Item | Role |
|---|---|
| `settings.json` · `.claude/settings.json` (global · setup sessions; each project has its own) | Permissions, hooks and model: what Claude may do and what needs Amit's OK. The setup file runs `harness/session-check.sh` at session start |
| `.gitignore` | Which files git tracks: everything is ignored except named allow-lines, so a new tracked file needs its own line (D37) |
| `project-rules/*/` (one folder per project) · `project-rules/manifest.tsv` · `project-rules/drift.sh` · `project-rules/sync.sh` | Backup copies of each project's `CLAUDE.md` and settings; `manifest.tsv` lists the projects, `drift.sh` reports differences, `sync.sh` copies. How it works: `project-rules/README.md` |
| `statusline/context.py` | Prints the session's context size on the status line; its constants are the live thresholds (`ENVIRONMENT.md` § *2. Status line*) |
| `projects/*/memory/` | Claude's notes on Amit's preferences and corrections — never task state, goals or decisions |
| Skills (`skills/`, project skills) | Instructions loaded only when a task calls for them |
| `skills/planning/SKILL.md` · `skills/planning/new-project.md` · `skills/planning/feature.md` · `skills/planning/bug-fix.md` · `skills/planning/documentation.md` · `skills/planning/setup-change.md` · `skills/planning/research-business.md` | What a plan holds: kind of work (seven, D56), depth, review size, and one guide per kind. When to plan, the risk check and every gate stay in `STANDARDS.md` § *How a task runs* |
| `skills/handoff/SKILL.md` · `skills/send-for-review/SKILL.md` · `skills/documents/SKILL.md` | Handoff note on the `templates/handoff.md` shape · Amit's "send it for review" flow, started only when he types it · a checklist pointing to `DOCUMENTATION-STANDARD.md`. Gates stay in `STANDARDS.md` |
| `skills/ollama/SKILL.md` | When and how a chore goes to the local model: task list, security rules, setup facts. `OLLAMA.md` points here |
| `skills/wrap-up/SKILL.md` | End-of-session wrap-up, started only when Amit asks: the session's mistakes placed on the ladder as proposed backlog rows, and scratch files sorted (keep or archive, never delete). Gates stay in `STANDARDS.md` |
| `agents/change-reviewer.md` · `agents/plan-reviewer.md` | Fresh, read-only reviewers for cross-checks; they report and never approve. When to use them: `harness/cross-check.md` § *The reviewer* |
| `harness/drafts/change-reviewer-phase12.md` · `harness/drafts/change-reviewer-phase12-try2.md` | Blind-test rewrites of `change-reviewer` (Phase 12 WP2, gate try 1 and try 2). Kept outside `agents/` so they never load; try 2 was the input to the Phase 14 rewrite, completed 27-11-2026 (D55, D57) |
| Acceptance sheets | Checklists used to test a project's work |
| `launch.json` | Editor settings for starting and debugging an app |
| `harness/session-check.sh` | Script run at setup session start; warns about drift and risky rules, and prints the current next gate from `harness/status.md` |
| `harness/doc-check.sh` | Warn-only format check (`DOCUMENTATION-STANDARD.md` § *Format check*): format, links, catalog coverage; registered rules in the full run; `--links-to <file>[#section]` lists what links there |

## Local-only (not in git)

Setup files that live only on this Mac; name and purpose only, not checked for coverage. List from the Phase 10 WP1 inventory (`baselines/phase10-wp1-25-11-2026.md`, built with `git status --short --ignored`); each item confirmed on disk 25-11-2026.

| Item | Purpose |
|---|---|
| `.claude/current-task.md` | The one setup task in progress, task-file shape (`DOCUMENTATION-STANDARD.md` § *Task file rules*); read at setup session start; never setup status |
| `settings.local.json` · `.claude/settings.local.json` | Settings for this Mac only; `/skills` writes `skillOverrides` to the root file (`ENVIRONMENT.md` § *What every session loads*). Not opened in Phase 10 |
| `harness/planning-research.md` | Phase 8 research notes; temporary; deleting it waits on Amit |
| `harness/phase9-scratch/` | Disposable test fixtures from Phase 9; kept until WP8 |
| `baselines/s4-proposal-30-10-2026.json` · `baselines/s4-replay-30-10-2026.py` | Data and script behind `baselines/s4-permissions-30-10-2026.md`, which embeds their content; kept until WP8 |
| `skills/.trash/` | Purpose not recorded; kept unchanged until WP8, not opened (Amit) |

Never catalogued: Claude-managed transcripts, caches and logs — `projects/*/*.jsonl`, `file-history/`, `paste-cache/`, `sessions/`, `plugins/`, `skills/synced/`, `history.jsonl` and similar.
