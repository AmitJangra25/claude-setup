# Claude Setup — agent brief

Purpose: The short brief a fresh reviewer or helper reads to understand Claude Setup. One-liners and links; the linked file is the authority.
Audience: Reviewer agents and helpers started with `omitClaudeMd: true`; Amit.
Read when: Starting a review or helper task on Claude Setup.
Owner: Setup sessions (changes are Amit's decision).
Update rule: Same change that alters a rule, entry point or feature named here. Lines stay one-liners; detail stays in the source.
Related: `DOCUMENT-MAP.md` · `DOCUMENTATION-STANDARD.md` § *Allowed copies* · `harness/doc-structure-plan.md` § 3 *Phase 9*
Status: active
Last reviewed: 24-11-2026

---

## Summary

Claude Setup is Amit's Claude Code configuration in `~/.claude`: the global working rules for every project, plus the scripts and records that keep them true. A private git repo, so it survives a machine or account switch (`README.md`). If a line here disagrees with its source, the source wins — report the mismatch.

## Tech stack

- Markdown rule and reference documents; the format rules are in `DOCUMENTATION-STANDARD.md`.
- Claude Code settings (JSON): global `settings.json`, setup-only `.claude/settings.json`.
- Bash scripts: `harness/session-check.sh`, `harness/doc-check.sh`, `project-rules/drift.sh`, `project-rules/sync.sh`.
- Python status line: `statusline/context.py`.
- rtk command proxy, run as a PreToolUse hook (`RTK.md`); local Ollama models for small chores (`OLLAMA.md`).
- Git with a block-everything `.gitignore`: only named files are tracked (D37).

## Main features

- Global working rules for every project: `STANDARDS.md`.
- Planning system: `skills/planning/` (D51).
- Cross-check by a fresh read-only reviewer: `harness/cross-check.md`.
- Mirrors of each project's `CLAUDE.md` and settings: `project-rules/` (`drift.sh` reports, `sync.sh` copies).
- Session-start warnings for drift and risky rules: `harness/session-check.sh`.
- Warn-only document format check: `harness/doc-check.sh`.

## Entry points

- `CLAUDE.md` imports `STANDARDS.md`, `RTK.md`, `OLLAMA.md` — loaded every turn in every project.
- `.claude/CLAUDE.md` — setup-only rules, loaded in sessions started in `~/.claude`.
- `.claude/settings.json` — the SessionStart hook that runs `harness/session-check.sh`.
- `harness/status.md` — where setup work stands now.
- `DOCUMENT-MAP.md` — every document, what it is for, when to read it.

## Critical rules

- Nothing is changed, installed, sent out, committed or pushed without Amit's approval (`STANDARDS.md` § *Safety and approval*, § *Git*).
- A reviewer reports and never approves (`harness/cross-check.md` § *The reviewer*); its verdict is `no concerns`, `concerns` or `blocked` (D52).
- `~/.claude` commits land on `main` directly; every other repo branches (`.claude/CLAUDE.md` § *Git for ~/.claude*).
- A new tracked file needs its own allow-line in `.gitignore` (`README.md`, D37).
- Claude's file tools write only inside the working folder (D46).
- Deleting needs Amit's approval and the target confirmed two different ways (`STANDARDS.md` § *How a task runs*, step 4).
- No secrets or personal data in documents or memory (`DOCUMENTATION-STANDARD.md` § *Data and security*).
- A copied rule is a defect unless listed in `DOCUMENTATION-STANDARD.md` § *Allowed copies*.
- Dates are DD-MM-YYYY (`STANDARDS.md` § *Documents*).

## Where to look next

- A document's purpose or owner: `DOCUMENT-MAP.md`.
- A past decision: search `SETUP-PLAN.md` by D-number; never read it whole.
- Tools, permissions, measurements: `ENVIRONMENT.md` — the relevant section only.
- Current phase and plan: `harness/status.md`, then `harness/doc-structure-plan.md`.
- Open items: `harness/backlog.md`.

## Related

- `README.md` — front page and why the repo stays private.
- `harness/overview.md` — how the pieces fit in a session.
