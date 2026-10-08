# claude-setup

Amit's Claude Code configuration, kept in git so it survives a machine or an account
switch. Private, and it needs to stay that way — see *Why this stays private* below.

Clone it into `~/.claude`. Nothing here is generated; every file is written by hand or
mirrored deliberately.

## What is in here

| Path | What it is |
|---|---|
| `CLAUDE.md` | The three `@`-imports that load on every turn, in every project, and a comment block naming the reference files that deliberately do not. Nothing else. |
| `STANDARDS.md` | How to work — the rulebook. The largest of the imported files, and the one to think twice before growing. |
| `RTK.md` · `OLLAMA.md` | The other two imports: the rtk proxy and the local-model chores. Both are short triggers: rtk's detail sits in `ENVIRONMENT.md`, Ollama's in `skills/ollama/`, and neither is loaded until needed. |
| `REPOS.md` · `PROJECTS.md` | Reference, not rules, so they are **not** imported: go-to repos, and the project index. Read when a project has to be located by name. |
| `ENVIRONMENT.md` | Reference on this machine and these projects. **Deliberately not imported** — it explains decisions rather than driving work, so it stays out of the per-turn budget. |
| `SETUP-PLAN.md` | The specification, the repair record, and the rebuild runbook. ~29,000 words: **start at its `► START HERE` block, not the top.** |
| `settings.json` | Permissions, hooks, model. The `ask` list is the real safety net; projects hold only `allow` rules. |
| `project-rules/` | A mirror of every project's `CLAUDE.md` and `.claude/settings*.json`. Some projects track those files and some do not — either way the copy here travels, and for the untracked ones it is their only history. `drift.sh` reports drift, read-only; `sync.sh --pull` copies. |
| `templates/` | The new-project, roadmap, backlog (`deferred-improvements.md`) and handoff forms. The handoff form doubles as the live `.claude/current-task.md` task record (**D31**). **Not** imported — `STANDARDS.md` points at them and one is read only when a step needs it. |
| `skills/ollama/` | The one hand-written global skill. Everything else under `skills/` is account-keyed and gitignored. |
| `projects/*/memory/` | Memory notes only — the session transcripts beside them are gitignored. Memory is stored per starting folder and there is no global memory, so a note is only read by sessions started in that folder. Setup notes live under `-Users-amitjangra--claude`, which means **start setup sessions from `~/.claude`**. |
| `archive/` | Things that cannot be recreated. See `archive/README.md`. |
| `baselines/` | Dated behaviour baselines — what the setup actually did, kept so a later run has something to be compared against. `global-open-tests.md` is the index of what is still unproven, global and per-project; it is an index, not a dated run. Reference, **not** imported. See `baselines/README.md`. |
| `statusline/` | The context-usage status line. |
| `harness/` | The control desk (**D33**): `status.md`, the one current setup status, and `cross-check.md`, when a second agent reviews and how it is shown. Not imported. |
| `.claude/CLAUDE.md` | Setup-only rules — loads only in sessions started in `~/.claude`, never in a project. |

Everything else in `~/.claude` — sessions, caches, plugins, skills synced from the
account — is gitignored. The ignore file blocks everything by default and names what is
allowed, so **adding a file here means adding an allow-line**.

## Where to start

- **Changing a rule, a permission or a hook?** Read `SETUP-PLAN.md`'s START HERE block
  first. It carries the decisions and the reasons, including several claims that turned
  out to be wrong when they were finally checked.
- **Rebuilding on a new machine or account?** `SETUP-PLAN.md` § *Rebuilding on another
  account*, which lists what travels, what regenerates, and what is stranded.
- **Wondering what state a repo is in?** Ask git. This repo deliberately does not record
  branches, sync state or what is committed — that rots within minutes. The one-command
  sweep is in `SETUP-PLAN.md` § *Git state is not recorded here*.

## Why this stays private

`project-rules/` holds every project's `CLAUDE.md` verbatim, and `archive/` holds
Voice-Flow's git history from before its rules file was stripped out of it. Two of the
mirrored projects are ones with real customer and employee records, and their rules
describe that. None of it is secret material, but all of it is internal.
