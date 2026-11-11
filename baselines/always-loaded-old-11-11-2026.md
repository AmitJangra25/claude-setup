# Always-loaded rule files, old text — 11-11-2026

Purpose: Old text of the four Phase 3 rule files and `DOCUMENTATION-STANDARD.md` line 51, saved before the T16–T19 edits, for the "no rule lost" check.
Date: 11-11-2026
Status: record
From: Go 2 step 3, `harness/doc-structure-plan.md` § 3 *Phase 3 plan*; live files at `dd76666`

<!-- Content below, word for word. Never edited, except to redact a leaked secret or
     personal data: [REDACTED DD-MM-YYYY, D<n>] (DOCUMENTATION-STANDARD.md § Data and security). -->

## `CLAUDE.md`

````
@STANDARDS.md
@RTK.md
@OLLAMA.md

<!-- NOT imported on purpose — reference, not rules; every @import is re-read every turn:
     ~/.claude/PROJECTS.md — each project's path, what it is, own CLAUDE.md or not; read to locate a project.
     ~/.claude/REPOS.md — GitHub repos worth considering; read at the start of building an integration.
     ~/.claude/ENVIRONMENT.md — permissions, RTK, status line, measurements; read the relevant section before changing settings.json or thresholds.
     ~/.claude/SETUP-PLAN.md — setup spec, decisions and why (D-rows), account-switch runbook; not status (harness/status.md).
     ~/.claude/harness/ — status.md (the one current setup status; when to read and update it: ~/.claude/.claude/CLAUDE.md), cross-check.md, overview.md, start check.
     ~/.claude/baselines/ — dated behaviour baselines; global-open-tests.md indexes what is unproven. -->
````

## `.claude/CLAUDE.md`

````
# Setup-only rules — loaded only in sessions started in ~/.claude

- `~/.claude` is the home of Claude Setup, the global standard, not a product project.
  Setup sessions still run in project mode (task record, recording, `harness/status.md`).
- At Orient, read `harness/status.md` for setup work. Not for unrelated simple tasks.
- Every changing setup plan includes: the `harness/status.md` update, the cross-check
  result if one ran, and the next gate. Cross-check procedure: `harness/cross-check.md`.
- If a *Session-start check* warning is in context, tell Amit before anything else.
- **Exception (approved by Amit, 29-10-2026):** `harness/session-check.sh` reads each
  manifest project's live `.claude/settings.json` and `settings.local.json`, read-only, for
  bypass rules; nothing else in a project.
- **Claude Setup edits may reach into a project.** From a `~/.claude` session, you may edit a
  project's `CLAUDE.md` and its `project-rules/` copy when I approve that exact change.
  Open that project's folder with `/add-dir` first; the write lock (D46) blocks it otherwise.
  Nothing else in that project — no code, docs, settings or memory. The project-side edit is
  left uncommitted; it goes in with that project's next PR, under its own git rules. The
  `project-rules/` copy is committed here as usual. Report the project-side uncommitted edit
  in the final result, including its exact file path, and include it in the handoff/status
  record so it is not lost.
- **`~/.claude` is the exception:** no reviewer and no PR flow, so its commits land on `main`
  directly. Everything else branches.
````

## `RTK.md`

````
# RTK - Rust Token Killer

Token-saving CLI proxy; live savings: `rtk gain`. The hook rewrites a recognised command in
place (`git status` → `rtk git status`). It handles plain commands, `&&` and `;` only —
one pipe, redirect, subshell, loop or function and the whole line runs raw; `python3` and
`sed` never rewrite. **So prefer the plain form** (`ls`, `grep`, `git status`) over piping
into `head`. Detail and measurements: `ENVIRONMENT.md` § 1.

## `rtk proxy` — raw output, no filtering

- **Before deleting, moving or overwriting a file** because of what a command printed,
  re-run that read through `rtk proxy` — rtk rewrites output.
- `rtk proxy` is for reads only. Never wrap a commit, push or other ask-list command in it.
- If a box for `rtk proxy …` offers "don't ask again", choose plain "Yes".
- `git add --dry-run` and checking what is staged: `ENVIRONMENT.md` § 1.
````

## `OLLAMA.md`

````
# Local models — offloading chores to Ollama

`ollama-do` (on PATH) runs small dev chores against a local Ollama model —
commit messages, summaries, log triage, test-case lists — when the input is
large, the **output is small**, and being slightly wrong is cheap and obvious.

**Never send it** secrets, `.env` files, key material, or customer or employee
records — Emp Portal and Packbly hold real personal data. **Never use it for**
code that ships, code review, or anything security-, auth-, payment- or
migration-related.

Load the `ollama` skill before using it: task list, security rules, setup facts.
````

## `DOCUMENTATION-STANDARD.md` line 51

````
- Global `CLAUDE.md` — imports only (`@STANDARDS.md` `@RTK.md` `@OLLAMA.md`); no "read first" line, no copied rules.
````
