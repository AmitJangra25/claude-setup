# Documentation

Read `SKILL.md` first; this file adds only what is special here. How docs are shaped —
file types, headers, sections, naming, dates — is in `DOCUMENTATION-STANDARD.md`; follow
it, do not restate it in the plan.

## Minimum plan

- **Reader:** who reads it, and when.
- **Purpose:** what the reader must be able to do or know afterwards.
- **Source of truth:** where each fact comes from — code, a command's output, a decision
  (D-number), Amit. One fact, one home; other docs point to it.
- **Sections affected:** which files and sections change.
- **Fact check:** how each fact will be checked before it is written.

## Writing

- Plain, simple, everyday English, the way a person would explain it. Short where that
  helps; never cut a fact to make it shorter.
- Write about the thing, not the work that produced it.
- Never delete reference or spec docs; move them and mark what is superseded
  (`STANDARDS.md` § *Docs are products*).

## Testing

- **Plain prose:** check the facts, the links and the format (`harness/doc-check.sh` in
  `~/.claude`, or the project's own check). No build, no UI test.
- **Runbooks, safety instructions, and commands that must run:** real verification. Run
  each command, or each step, and show the output. If a step cannot safely be run, say
  so and mark the result partly verified.
