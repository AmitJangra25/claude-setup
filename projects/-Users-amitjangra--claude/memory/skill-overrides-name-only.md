---
name: skill-overrides-name-only
description: "skillOverrides has four states, not two — name-only keeps a skill usable and suggestable for ~15 tokens instead of its full description; built-in skills are not in /skills, so they are set by hand in settings.json under their real internal name; plugin skills are locked and only /plugin reaches them"
metadata:
  node_type: memory
  type: reference
  originSessionId: 42a18e81-f0ae-4b86-9292-2e939ca73c2f
  modified: 2026-11-27T08:47:28.725Z
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

**Plugin skills cannot be overridden at all — settled 2026-09-26.** `/skills` shows
`engineering:debug` as **"locked by plugin · Plugin skills are managed via /plugin"**,
and saved twice without writing an entry for it. There is no middle state for a plugin
skill: it is on, or the whole plugin is off via `/plugin`.

**Ask the menu before editing a key by hand.** `/skills` writes the correct key by
definition, and it is not the name `/context` prints — `/context` shows
`doc-coauthoring` under "claude.ai sync", while the menu wrote
`anthropic-skills:doc-coauthoring`. Three key formats were guessed here before the menu
was asked, and every one was a silent no-op.

**Built-in skills are not in the `/skills` menu — found 27-11-2026.** Amit opened `/skills`
to set `ship` and `steward`; neither was listed ("No changes"). They are set by hand in
`settings.json` → `skillOverrides`, using the **real internal name**, not the one `/context`
shows: `/ship` is an alias of the built-in `ship-local` (the name list inside Claude Code
2.1.332 reads `Q_e="ship-local"`, `XA="steward"`, next to `loop` and `schedule`). Find the
real name before anyone edits; verify with `/context` in a **fresh** session.

**`/skills` writes to `~/.claude/settings.local.json`, which is gitignored.** Its
`skillOverrides` **merges** with the block in `settings.json` rather than replacing it
— recorded, but whether Claude Code reads this file at all is unverified
(`ENVIRONMENT.md` § *3. Permissions — what stops and asks*). But it is not in the repo, so skill state set through the menu does **not**
travel to a second account. See [[claude-setup-status]] for Block 4.

**What `skillOverrides` cannot reach.** A plugin whose cost is MCP *server
instructions* rather than skill descriptions — `browser-use` — is only removed by
disabling the plugin in `enabledPlugins`. Connectors are the same: whole-account
`disableClaudeAiConnectors`, no per-connector setting. And a built-in **tool** is
not a skill: `enableArtifact: false` was the single biggest cut, system tools
17.1k → 9.7k.

**How to apply:** prefer `name-only` over disabling. Capability is kept, the cost is
not. Verify with `/context all` in a **fresh** session — settings load at startup,
so the session that made the change cannot see it. Related: [[claude-setup-status]].
