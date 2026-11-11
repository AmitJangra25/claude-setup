# Old document maps — 11-11-2026

Purpose: The three document maps that `DOCUMENT-MAP.md` replaced (D47), kept word for word.
Date: 11-11-2026
Status: record
From: `README.md` § *What is in here* and § *Where to start* · `harness/overview.md` first paragraph · `harness/status.md` § *Source of truth* — all as of commit b39241b

---

## From `README.md` (lines 9–45)

## What is in here

| Path | What it is |
|---|---|
| `CLAUDE.md` | The three `@`-imports that load on every turn, in every project, and a comment block naming the reference files that deliberately do not. Nothing else. |
| `STANDARDS.md` | How to work — the rulebook. The largest of the imported files, and the one to think twice before growing. |
| `RTK.md` · `OLLAMA.md` | The other two imports: the rtk proxy and the local-model chores. Both are short triggers: rtk's detail sits in `ENVIRONMENT.md`, Ollama's in `skills/ollama/`, and neither is loaded until needed. |
| `REPOS.md` · `PROJECTS.md` | Reference, not rules, so they are **not** imported: go-to repos (read when starting an integration) and the project index (read when a project has to be located by name). |
| `ENVIRONMENT.md` | Reference on this machine and these projects. **Deliberately not imported** — it explains decisions rather than driving work, so it stays out of the per-turn budget. |
| `SETUP-PLAN.md` | The specification, the repair record, and the rebuild runbook. ~33,000 words: **start at its *Contents and decisions index* block at the top** (the `► START HERE` block below it is history since 29-09-2026). |
| `settings.json` | Permissions, hooks, model. The `ask` list is the real safety net. Projects add mostly `allow` rules; a few add their own `ask` rules — FinNode, Voice-Flow, and this repo's `.claude/settings.json`. |
| `.gitignore` | Blocks everything by default and names each allowed path, anchored to the repo root (**D37**). |
| `project-rules/` | A mirror of every project's `CLAUDE.md` and `.claude/settings*.json`. Some projects track those files and some do not — either way the copy here travels, and for the untracked ones it is their only history. `drift.sh` reports drift, read-only; `sync.sh --pull` copies. |
| `templates/` | The new-project, roadmap, backlog (`deferred-improvements.md`) and handoff forms. The handoff form doubles as the live `.claude/current-task.md` task record (**D31**). **Not** imported — `STANDARDS.md` points at them and one is read only when a step needs it. |
| `skills/ollama/` | The one hand-written global skill. Everything else under `skills/` is account-keyed and gitignored. |
| `projects/*/memory/` | Memory notes only — the session transcripts beside them are gitignored. Memory is stored per starting folder and there is no global memory, so a note is only read by sessions started in that folder. Setup notes live under `-Users-amitjangra--claude`, which means **start setup sessions from `~/.claude`**. |
| `archive/` | Things that cannot be recreated. See `archive/README.md`. |
| `baselines/` | Dated behaviour baselines — what the setup actually did, kept so a later run has something to be compared against. `global-open-tests.md` is the index of what is still unproven, global and per-project; it is an index, not a dated run. Reference, **not** imported. See `baselines/README.md`. |
| `statusline/` | The context-usage status line. |
| `harness/` | The control desk (**D33**, **D34**): `status.md`, the one current setup status; `cross-check.md`, when a second agent reviews and how it is shown; `overview.md`, how the pieces fit and what "finished" means; `session-check.sh`, the setup-session start check, run by the `SessionStart` hook in `.claude/settings.json`. Not imported. |
| `.claude/CLAUDE.md` · `.claude/settings.json` | Setup-only rules and settings — load only in sessions started in `~/.claude`, never in a project. The settings file holds the `SessionStart` hook and six `ask` rules: `git stash pop` and `git stash apply` (**D36**; the other two of D36's four removed by **D41**), and `git add` and `git stage` in four spellings (**D44**). |

Everything else in `~/.claude` — sessions, caches, plugins, skills synced from the
account — is gitignored. The ignore file blocks everything by default and names what is
allowed, so **adding a file here means adding an allow-line**.

## Where to start

- **Changing a rule, a permission or a hook?** Read `SETUP-PLAN.md`'s *Contents
  and decisions index* first, then the decision you need. That file carries the decisions
  and the reasons, including several claims that turned out to be wrong when they were
  finally checked.
- **Rebuilding on a new machine or account?** `SETUP-PLAN.md` § *Rebuilding on another
  account*, which lists what travels, what regenerates, and what is stranded.
- **Wondering what state a repo is in?** Ask git. This repo deliberately does not record
  branches, sync state or what is committed — that rots within minutes. The one-command
  sweep is in `ENVIRONMENT.md` § *Branch state*.

## From `harness/overview.md` (lines 3–5)

A map, not a manual. What each file is: `README.md` § *What is in here*. Who owns
which fact: `harness/status.md` § *Source of truth*. How a task runs:
`STANDARDS.md` § *How a task runs*. This file copies none of them (D34).

## From `harness/status.md` (lines 184–197)

## Source of truth

| Question | Owner |
|---|---|
| Global rules | `STANDARDS.md` |
| Setup-only rules | `.claude/CLAUDE.md` |
| Current setup status | this file |
| The task in progress — scope, progress, next step; never setup status | `.claude/current-task.md` (gitignored; *Status: none* between tasks) |
| Decisions and history | `SETUP-PLAN.md` |
| Setup tests | `baselines/global-open-tests.md` |
| Machine facts, measurement method | `ENVIRONMENT.md` |
| Cross-check procedure | `harness/cross-check.md` |
| Project status and tests | the project's own files, read in its own session |
| Git and recovery | git; `archive/README.md`; `SETUP-PLAN.md` § *Rebuilding on another account* |
