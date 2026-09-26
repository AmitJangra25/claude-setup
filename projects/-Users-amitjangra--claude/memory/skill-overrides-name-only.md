---
name: skill-overrides-name-only
description: skillOverrides has four states, not two — name-only keeps a skill usable and suggestable for ~15 tokens instead of its full description; bare keys work, plugin skills are not reachable by either key format
metadata:
  type: reference
---

`skillOverrides` in `settings.json` sets each skill to one of four states:
`on` (name and description), `name-only` (name only), `user-invocable-only`
(hidden from Claude, still typable as `/name`), `off` (hidden everywhere).

**`name-only` is the useful one.** It drops the description but keeps the skill
working and keeps Claude able to suggest it for a task. About 15 tokens instead of
100–350. Nothing is deleted, and removing the line restores the skill.

**Plugin skills are what to remember.** Bare names work: measured 2026-09-26, all 18
bare keys took effect — 15 claude.ai-synced skills and 3 built-in — each dropping to
<20 tokens in `/context all`. **The 15 plugin skills did not.** They failed as bare
names, and failed again when rewritten with the prefix `/context` prints
(`engineering:debug`, `pdf-viewer:view-pdf`). A wrong key is a no-op, not an error, so
both attempts looked like success until a fresh session was measured.

**Whether plugin skills can be overridden at all is unresolved.** Do not guess a third
key format. The `/skills` menu writes `skillOverrides` itself — set one plugin skill
there with Space, press Esc, and read what it wrote. Whatever key appears is correct by
definition. If the menu refuses, the answer is that plugin skills are on or the plugin
is off, and there is no middle state.

**What `skillOverrides` cannot reach.** A plugin whose cost is MCP *server
instructions* rather than skill descriptions — `browser-use` — is only removed by
disabling the plugin in `enabledPlugins`. Connectors are the same: whole-account
`disableClaudeAiConnectors`, no per-connector setting. And a built-in **tool** is
not a skill: `enableArtifact: false` was the single biggest cut, system tools
17.1k → 9.7k.

**How to apply:** prefer `name-only` over disabling. Capability is kept, the cost is
not. Verify with `/context all` in a **fresh** session — settings load at startup,
so the session that made the change cannot see it. Related: [[claude-setup-status]].
