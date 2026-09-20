---
name: claude-md-not-in-git
description: "User wants CLAUDE.md untracked and gitignored in repos, not committed"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: d52f35b7-283f-42f3-9d1d-95217fb0aa3d
  modified: 2026-08-11T09:40:14.359Z
---


> **Now global** — `STANDARDS.md` § Git. The global copy governs; this file is kept for the evidence behind the rule.
When setting up or pushing a repo, keep `CLAUDE.md` out of git: `git rm --cached CLAUDE.md` and add it to `.gitignore`. Stated as a standing preference ("from now onwards") on 2026-08-11 while pushing Voice Flow Pro.

**Why:** Claude Code reads `CLAUDE.md` from disk, so tracking it gains nothing, and it documents internal/in-progress state (advisory reasoning, known-stale copy, placeholder controls) the user doesn't want shipping with the repo.

**How to apply:** Do it as part of initial repo setup rather than waiting to be asked. Note that the global `~/.claude/CLAUDE.md` describes project `CLAUDE.md` as "checked into the codebase" — that framing is outdated; this preference wins. If the file already landed in an earlier commit, mention that it survives in history and offer a history rewrite before the repo goes public.
