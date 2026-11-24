# Phase 9 context loading — 24-11-2026

Purpose: I3 loading observation at the start of Phase 9 WP2, for comparison after WP4 (`harness/doc-structure-plan.md` § 3 *Phase 9*, I3).
Date: 24-11-2026
Status: record
From: Phase 9 WP2 setup session, `/context all` run by Amit

---

**Session-start observation, not an empty-session baseline.**

- **Model:** `claude-opus-5-5` (Opus 5.5).
- **Command:** `/context all`, typed by Amit early in the session.
- **Total:** 68k / 1m (7%).

| Category | Tokens | Share |
|---|---|---|
| System prompt | 2.8k | 0.3% |
| System tools | 14.4k | 1.4% |
| MCP server instructions | 39 | 0.0% |
| MCP tools (deferred) | 1.2k | 0.1% |
| System tools (deferred) | 18.4k | 1.8% |
| Memory files | 9.2k | 0.9% |
| Skills | 698 | 0.1% |
| Messages | 40.9k | 4.1% |
| Free space | 899k | 89.9% |
| Autocompact buffer | 33k | 3.3% |

Memory files: `STANDARDS.md` 7.3k · `.claude/CLAUDE.md` 591 · `MEMORY.md` 591 · `RTK.md` 363 · `OLLAMA.md` 243 · `CLAUDE.md` 34.

Skills: `planning` ~170 · `ship` ~140 · `steward` ~120 · `security-review` ~30 · `init` ~20 · five claude.ai-synced skills under 20 each · 24 more ~150 in all.

MCP: `easel`, 1 tool, 1.2k if loaded.

## For later comparison

Compare only these categories after WP4: **memory files, skills, tools (system and deferred), system prompt.** Messages and free space depend on the session's work and are not comparable.

## Limitations

- Includes initial session work and hook output: precondition reads (`.claude/current-task.md`, `harness/status.md`, the Phase 9 plan section, git status and log) and the session-start hook warnings are inside *Messages*.
- One run only; Claude Code's own estimates.
- Phase 8 was already active (the `planning` skill and its `STANDARDS.md` wording are in the numbers), so Phase 8's own share is not measured here — it stays estimated, as I3 says.
