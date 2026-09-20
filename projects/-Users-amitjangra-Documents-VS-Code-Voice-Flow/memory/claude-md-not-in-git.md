---
name: claude-md-not-in-git
description: "SUPERSEDED 2026-09-20 — CLAUDE.md now stays tracked while a repo is private and solo; see STANDARDS.md section Git"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: d52f35b7-283f-42f3-9d1d-95217fb0aa3d
  modified: 2026-08-11T09:40:14.359Z
---


> **SUPERSEDED 2026-09-20.** Amit reversed this. `CLAUDE.md` and `.claude/settings.json`
> now **stay tracked** while a repo is private and solo; untracking is *raised* before the
> repo goes public, never done silently. `~/.claude/STANDARDS.md` § *Git* governs — read it,
> not the instruction below. Nothing is at risk either way: `~/.claude/project-rules/`
> mirrors every project's copies inside a private repo, and switching a Claude account does
> not touch GitHub. Voice-Flow was left untracked and was **not** reverted; FinNode is
> tracked. The record below is kept as the evidence for why the rule existed in 2026-08.
When setting up or pushing a repo, keep `CLAUDE.md` out of git: `git rm --cached CLAUDE.md` and add it to `.gitignore`. Stated as a standing preference ("from now onwards") on 2026-08-11 while pushing Voice Flow Pro.

**Why:** Claude Code reads `CLAUDE.md` from disk, so tracking it gains nothing, and it documents internal/in-progress state (advisory reasoning, known-stale copy, placeholder controls) the user doesn't want shipping with the repo.

**How to apply (superseded — do NOT follow):** Do it as part of initial repo setup rather than waiting to be asked. Note that the global `~/.claude/CLAUDE.md` describes project `CLAUDE.md` as "checked into the codebase" — that framing is outdated; this preference wins. If the file already landed in an earlier commit, mention that it survives in history and offer a history rewrite before the repo goes public.
