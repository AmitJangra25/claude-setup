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
  Nothing else in that project — no code, docs, settings or memory. The project-side edit is
  left uncommitted; it goes in with that project's next PR, under its own git rules. The
  `project-rules/` copy is committed here as usual. Report the project-side uncommitted edit
  in the final result, including its exact file path, and include it in the handoff/status
  record so it is not lost.
- **`~/.claude` is the exception:** no reviewer and no PR flow, so its commits land on `main`
  directly. Everything else branches.
