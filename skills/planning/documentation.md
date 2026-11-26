# Documentation

Purpose: How to plan writing or updating a document so every fact has a source and a check.
Audience: Claude and helpers that plan documentation work.
Read when: The planning skill picks the kind "documentation".
Owner: Claude (rules are Amit's decisions).
Update rule: When the job's steps change. Replace superseded text; history stays in git. The testing lines are also in `setup-change.md`; change both together.
Related: `skills/planning/SKILL.md` · `DOCUMENTATION-STANDARD.md` · `skills/planning/setup-change.md`
Status: current
Last reviewed: 26-11-2026

## Summary

Read [SKILL.md](SKILL.md) first; this guide adds only what is special here. How docs are
shaped — file types, headers, sections, naming, dates — is in
[DOCUMENTATION-STANDARD.md](../../DOCUMENTATION-STANDARD.md); follow it, do not restate
it in the plan. The result is a plan that names the reader, the purpose, where each fact
comes from, and how each fact will be checked.

## When to use

- **Use when:** you are writing or updating docs in a project.
- **Not for:** docs in `~/.claude` (`setup-change.md` — it carries the lines it needs
  from here), or a doc that is really a proposal or comparison (`research-business.md`).

## Before you start

- Who will read it, and one real question they need it to answer ([SKILL.md](SKILL.md) step 4).
- Read access to the sources: the code, commands, decisions or people the facts come from.

## Write the plan

**Minimum plan:**

- **Reader:** who reads it, and when.
- **Purpose:** what the reader must be able to do or know afterwards.
- **Source of truth:** where each fact comes from — code, a command's output, a decision
  (D-number), Amit. One fact, one home; other docs point to it.
- **Sections affected:** which files and sections change.
- **Fact check:** how each fact will be checked before it is written.

It worked when every fact in the plan has a source and a check.

## Write the doc

- Plain, simple, everyday English, the way a person would explain it. Short where that
  helps; never cut a fact to make it shorter.
- Write about the thing, not the work that produced it.
- Remove a document only under [DOCUMENTATION-STANDARD.md § Moving and archiving](../../DOCUMENTATION-STANDARD.md#moving-and-archiving);
  otherwise move it and mark what is superseded.

It worked when a cold reader can act on the first lines.

## Testing

- **Plain prose:** check the facts, the links and the format (`harness/doc-check.sh` in
  `~/.claude`, or the project's own check). No build, no UI test.
- **Runbooks, safety instructions, and commands that must run:** real verification. Run
  each command, or each step, and show the output. If a step cannot safely be run, say
  so and mark the result partly verified.

It worked when every command in the doc was run, or is marked partly verified.

## Common mistakes

- Don't write a fact without its source — name where it comes from.
- Don't copy a fact that has a home — point to the home.
- Don't call a runbook checked because it reads well — run each step.
- Don't delete a superseded doc — move it and mark it, unless the deletion rule applies.

## Quick reference

| Task | How |
|---|---|
| Plan | Reader · purpose · source of truth · sections · fact check |
| Shape | `DOCUMENTATION-STANDARD.md` |
| Prose | Check facts, links, format |
| Runbook or commands | Run each step; show the output |
| Old doc | Move and mark superseded |

## Related

- [DOCUMENTATION-STANDARD.md](../../DOCUMENTATION-STANDARD.md) — types, headers, naming, moving and archiving.
- [setup-change.md](setup-change.md) — holds a copy of the testing lines; change both together.
