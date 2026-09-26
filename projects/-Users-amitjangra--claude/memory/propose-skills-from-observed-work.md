---
name: propose-skills-from-observed-work
description: Amit wants skills proposed from what he actually does repeatedly, not kept because they exist — say so when a pattern repeats, and name what a tailored skill would hold
metadata:
  type: feedback
---

Do not treat the installed skill list as the set of skills that should exist. When the
same shape of task comes up three or four times across sessions, say so and propose a
skill written for it. Said 2026-09-26, deciding to drop the ten `engineering:` skills:
"you can understand how I'm working, and then, based on that, you can suggest to me
which skills are required or which we need to create as a new skill."

**Why:** the generic ones lost on merit, not on cost. `debug`, `code-review`,
`testing-strategy`, `documentation` and `tech-debt` restate rules `STANDARDS.md`
already states more sharply and in Amit's own words, and `standup`,
`incident-response` and `deploy-checklist` assume a team, an on-call rotation and a
release train that a solo developer on private repos does not have. A skill earns its
tokens by knowing something this setup does not already know.

`skills/ollama/` is the shape that works: hand-written, specific to one real habit,
~130 tokens, loaded only when the task needs it. See [[skill-overrides-name-only]] for
what a skill costs and which states can be set.

**How to apply:** propose, never install. Name the repeating pattern, what the skill
would contain that `STANDARDS.md` and the project's `CLAUDE.md` do not already cover,
and its rough token cost. One or two sentences, in the "noting, not acting on" list —
not a pitch. Amit decides. The same test retires one: a skill that stops matching how
he works is a candidate for removal, and removal is reversible.

**This note only loads in sessions started from `~/.claude`**, because memory is stored
per starting folder. Project work in Voice-Flow or FinNode will not see it unless the
habit is also written into that project's own memory or `CLAUDE.md`.
