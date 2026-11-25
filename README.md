# claude-setup

Purpose: Front page — what this repo is, why it stays private, where to start.
Owner: Setup sessions (changes are Amit's decision).
Update when: The repo's purpose or the privacy reason changes.
Related: `DOCUMENT-MAP.md` · `DOCUMENTATION-STANDARD.md`

---

## What this repo is

Amit's Claude Code configuration, kept in git so it survives a machine or an account
switch. Private, and it needs to stay that way — see *Why it stays private* below.

Clone it into `~/.claude`. Nothing here is generated; every file is written by hand or
mirrored deliberately. `skills/ollama/` is the one hand-written global skill.

Everything else in `~/.claude` — sessions, caches, plugins, skills synced from the
account — is gitignored. The ignore file blocks everything by default and names what is
allowed (**D37**), so **adding a file here means adding an allow-line**.

Memory is stored per starting folder; setup notes live under `-Users-amitjangra--claude`,
so **start setup sessions from `~/.claude`**.

## Why it stays private

`project-rules/` holds every project's `CLAUDE.md` verbatim, and `archive/` holds
Voice-Flow's git history from before its rules file was stripped out of it. One mirrored
project, the Vthru Customer app (VT), is the company's app with real data (`PROJECTS.md`
§ *Project data*). None of it is secret material, but all of it is internal.

## Start here

- **`DOCUMENT-MAP.md` is the one document map** (D47): every document, what it is for,
  when to read it, when to update it. How documents are written:
  `DOCUMENTATION-STANDARD.md`.
- **Changing a rule, a permission or a hook?** Read `SETUP-PLAN.md`'s *Contents and
  decisions index* first, then the decision you need.
- **Rebuilding on a new machine or account?** `SETUP-PLAN.md` § *Rebuilding on another
  account*.
- **Repo state** (branches, sync, what is committed) is never recorded here — ask git.
  The one-command sweep is in `ENVIRONMENT.md` § *Branch state*.

## Older records

- `baselines/old-document-maps-11-11-2026.md` — the document table and "where to start"
  list this file held until 11-11-2026.
