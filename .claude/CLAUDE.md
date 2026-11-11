# Setup-only rules — loaded only in sessions started in ~/.claude

`~/.claude` is the home of Claude Setup, the global standard, not a product project.
Setup sessions still run in project mode (task record, recording, `harness/status.md`).

## At session start

- If a *Session-start check* warning is in context, tell Amit before anything else.
- At Orient, read `harness/status.md` for setup work. Not for unrelated simple tasks.

## While changing setup

- Every changing setup plan includes: the `harness/status.md` update, the cross-check
  result if one ran, and the next gate. Cross-check procedure: `harness/cross-check.md`.

## Reaching into a project

- **Edits:** you may edit a project's `CLAUDE.md` and its `project-rules/` copy when Amit
  approves that exact change. Open that project's folder with `/add-dir` first; the write
  lock (D46) blocks it otherwise. Nothing else in that project — no code, docs, settings
  or memory.
- The project-side edit stays uncommitted; it goes in with that project's next PR, under
  its own git rules. The `project-rules/` copy is committed here as usual.
- Report the project-side uncommitted edit, with its exact file path, in the final result
  and in the handoff or status record, so it is not lost.
- **Read exception (approved by Amit, 29-10-2026):** `harness/session-check.sh` reads each
  manifest project's live `.claude/settings.json` and `settings.local.json`, read-only, for
  bypass rules; nothing else in a project.

## Git for ~/.claude

- `~/.claude` is the exception: no reviewer and no PR flow, so its commits land on `main`
  directly. Everything else branches.
