# Project clean-up list

Purpose: Project-specific findings from Claude Setup work, waiting for each project's own session. Temporary.
Owner: Setup sessions (changes are Amit's decision).
Update when: A setup session finds a project-side issue, or a project session closes one.
Related: `harness/doc-structure-plan.md` § 3 *Phase 10* → *Temporary project clean-up list* and *WP9* · `baselines/phase10-wp1-25-11-2026.md` (WP1 findings)

---

## Safety rules for every project clean-up

- **Never delete admin or super-admin users** (Amit, 25-11-2026).
- Never put secrets, tokens, passwords, private keys, environment values or personal data in this list.
- Each item is acted on only in that project's own session, with Amit's approval.
- Deleted only after the matching project work is complete, under the deletion rule (Amit approves by name).

## Findings

| Project | Issue | Evidence | Recommended action | Status |
|---|---|---|---|---|
| VT (Vthru Customer app) | Its `CLAUDE.md` does not yet state Amit's 25-11-2026 rule: Claude never commits (even locally), merges, pushes, opens a pull or merge request, or takes any other git action; changes only on a separate branch; Amit does all git actions | `project-rules/VT/CLAUDE.md:15` lists push, pull, fetch, reset, merge, rebase, tag, merge request — not commit | Add the rule in VT's own session; re-copy the sanitized backup afterwards | [ ] |
| FinNode | Memory points to `SETUP-PLAN.md` sections that Phase 10 WP5 moves | `MEMORY.md:1` · `setup-review-project-by-project.md:10`, `:19`, `:33` · `rtk-proxy-suppresses-dry-run-output.md:26` | Update the pointers after WP5 | [ ] |
| FinNode | A6, A7, A9 from the 29-10-2026 audit still open (NV whether still true) | `baselines/project-handoffs-29-10-2026.md:29-33` | Check and settle in FinNode's own session | [ ] |
| Voice-Flow | Memory note repeats the old "never delete reference docs" rule, which WP2 changes | `dont-delete-reference-docs.md` · `MEMORY.md:2` | Update or remove after WP2 | [ ] |
| Voice-Flow | Memory notes that look, by name, like copies of setup rules (not opened, NV) | e.g. `cannot-see-permission-prompts.md`, `docs-are-products-not-logs.md`, `fix-root-cause-flag-workarounds.md`, `stop-at-earliest-gate.md` | Review in Voice-Flow's own session | [ ] |
| Voice-Flow | Live `CLAUDE.md` changed in PR #95 (18-11-2026) after the 13-11-2026 backup copy | Session-start drift warning, 25-11-2026 | Re-copy that one file in WP6d; never `sync.sh --pull` | [ ] |
| vthrudebugger_v1 | Memory restates `STANDARDS.md` § *Git* | `vthru_debugger_workflow_preferences.md:23` | Replace with a pointer in its own session | [ ] |
| Emp portal | Local folder on `fix/dead-code-cleanup-and-test-fix`, not `main`, so its `CLAUDE.md` shows as drifted | `harness/status.md` § *Open* | Move the folder to `main` in its own session; until then never `sync.sh --pull` | [ ] |
| VOS Dashboard | Has `CLAUDE.md`, `.claude/` and git, but no `PROJECTS.md` row | `harness/doc-structure-plan.md` § *Project consistency table* | Add a "not set up" row in WP6d | [ ] |
| Debugger v2 | `ENVIRONMENT.md:364` names memory `project-debugger-repo-fresh-start`; the file is `project_debugger_repo_fresh_start.md` | `git ls-files projects/` | Fix the name in WP6a | [ ] |
