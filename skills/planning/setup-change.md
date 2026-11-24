# Claude Setup change

Any change to `~/.claude`. Read `SKILL.md` first; this file adds only what is special
here. The setup-only rules in `~/.claude/.claude/CLAUDE.md` also apply: every changing
setup plan includes the `harness/status.md` update, the cross-check result if one ran,
and the next gate.

## Minimum plan

- **Goal and success measure.**
- **Files:** each file created, changed, moved or removed.
- **Loading impact:** does it change what loads every session (`STANDARDS.md`, any
  `CLAUDE.md`, `MEMORY.md`, skill descriptions)? Roughly how many tokens per session,
  up or down. Label it an estimate until measured.
- **Safety and permission impact:** does it touch permissions, settings, hooks, rule
  files, secrets or privacy? If yes, the plan is deep — except a wording fix that keeps
  the meaning in a rule file (`STANDARDS.md` § *How a task runs*).
- **Undo:** how to put it back.

## Add when needed

- **Migration and pointers:** when text moves, every file that points to it, and how the
  old place points to the new one. Count IDs before and after.
- **Cross-project effect:** which projects inherit the change, and any `project-rules/`
  copies to update.
- **Fresh-session test:** whenever what loads changes, and for any hook, permission or
  settings change. The session that made the change cannot judge it.
- **Permission rules:** read `ENVIRONMENT.md` § *3. Permissions* first; a rule must cover
  every spelling the rtk hook can produce.

## Testing

- The existing checks that cover the change: `harness/doc-check.sh`,
  `harness/session-check.sh`, `project-rules/drift.sh`.
- A fresh-session test when *Add when needed* calls for one.
- Docs in `~/.claude` follow `DOCUMENTATION-STANDARD.md`. Test them as
  `documentation.md` § *Testing* says — commands and runbook steps get really run.
- A wording fix that keeps the meaning: the format check is enough (`STANDARDS.md`
  § *How a task runs*).

## Recording

Where results, decisions and the task record go: `STANDARDS.md` step 8 and
`~/.claude/.claude/CLAUDE.md`. Commits: that file's § *Git for ~/.claude*, only when
Amit asks.
