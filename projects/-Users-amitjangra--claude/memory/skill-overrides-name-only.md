---
name: skill-overrides-name-only
description: skillOverrides has four states, not two — name-only keeps a skill usable and suggestable for ~15 tokens instead of its full description; plugin skills need the prefixed key
metadata:
  type: reference
---

`skillOverrides` in `settings.json` sets each skill to one of four states:
`on` (name and description), `name-only` (name only), `user-invocable-only`
(hidden from Claude, still typable as `/name`), `off` (hidden everywhere).

**`name-only` is the useful one.** It drops the description but keeps the skill
working and keeps Claude able to suggest it for a task. About 15 tokens instead of
100–350. Nothing is deleted, and removing the line restores the skill.

**The key format is what to remember.** Bare names match claude.ai-synced and
built-in skills. **Plugin skills need the prefix `/context` prints** —
`engineering:debug`, `pdf-viewer:view-pdf`. Measured 2026-09-26: 35 bare keys were
written, the 19 synced and the built-in ones took effect, and all 15 plugin entries
silently did nothing. A wrong key is a no-op, not an error, so it fails quietly.
The prefix also disambiguates: `engineering:code-review` can be shortened without
touching the built-in `code-review` of the same name.

**What `skillOverrides` cannot reach.** A plugin whose cost is MCP *server
instructions* rather than skill descriptions — `browser-use` — is only removed by
disabling the plugin in `enabledPlugins`. Connectors are the same: whole-account
`disableClaudeAiConnectors`, no per-connector setting. And a built-in **tool** is
not a skill: `enableArtifact: false` was the single biggest cut, system tools
17.1k → 9.7k.

**How to apply:** prefer `name-only` over disabling. Capability is kept, the cost is
not. Verify with `/context all` in a **fresh** session — settings load at startup,
so the session that made the change cannot see it. Related: [[claude-setup-status]].
