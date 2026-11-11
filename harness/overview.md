# How the setup fits together

Purpose: How the setup's pieces work in a session, and the checklist for when the setup is finished.
Owner: Setup sessions (changes are Amit's decision).
Update when: A finish line is met or changes, or the session flow changes.
Related: `DOCUMENT-MAP.md` (every document — the one map, D47) · `harness/status.md` · `baselines/global-open-tests.md` · `STANDARDS.md` § *How a task runs*

---

## What happens in a session

1. **Start.** `CLAUDE.md` imports `STANDARDS.md`, `RTK.md` and `OLLAMA.md` — every turn,
   in every project. Everything else is reference, read when a step needs it.
2. **Setup sessions only** (started in `~/.claude`): `.claude/CLAUDE.md` loads, and the
   `SessionStart` hook in `.claude/settings.json` runs `harness/session-check.sh` at
   startup and after `/clear` (after `/clear`: proven 30-10-2026, open test 13). It runs
   `project-rules/drift.sh`, searches this repo and the copies for `Bash(rtk proxy *)`,
   and searches each manifest project's live `.claude/settings.json` and
   `settings.local.json` for `Bash(rtk proxy *)` and `Bash(rtk git *)`; silent when clean,
   warns and changes nothing otherwise.
3. **Each Bash command.** The `PreToolUse` hook (`rtk hook claude`) may rewrite it to an
   `rtk` form first; permission rules are then matched against what it produced
   (`ENVIRONMENT.md` § *Permissions — what stops and asks*).
4. **Permissions.** The global `ask` list in `settings.json` is the safety net; projects
   add mostly `allow` rules, and a few their own `ask` rules. Auto mode lets unmatched
   commands through, so `ask` is what stops it (`baselines/09-10-2026-run2.md`).
5. **Project rules travel** through `project-rules/`, a mirror of every project's rules
   files. `drift.sh` reports differences; `sync.sh --pull` copies, run in that project's
   own session.

## What "finished" means

The setup is finished when every line is true, each checked by a command or a read:

- [ ] `project-rules/drift.sh` reports 0 drifted; `bash harness/session-check.sh` prints nothing.
- [ ] Every item in `baselines/global-open-tests.md` is closed, accepted, or deferred with
      a dated decision; items 9 and 10 count as deferred to their project.
- [ ] `harness/status.md` § *Known contradictions* is empty (D23's was settled by D38, 10-10-2026).
- [ ] The per-project `SessionStart` idea (`harness/backlog.md` B31) is placed or rejected.
- [ ] `harness/status.md` *Last verified* is the finish date, and every pointer in it resolves.
- [x] Starting tokens tracked in `ENVIRONMENT.md`; no fixed target. The goal is fewer tokens per whole task (Amit, 01-11-2026).
- [ ] T6 is done: independent read-only check, then Amit's review.
- [ ] The working tree is clean and committed with Amit's approval; `.claude/current-task.md`
      is at *Status: none*.
