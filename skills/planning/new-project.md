# New project

Purpose: How to plan a new project — what must be settled before any code, and what can wait.
Audience: Claude and helpers that plan a new project.
Read when: The planning skill picks the kind "new project".
Owner: Claude (rules are Amit's decisions).
Update rule: When the job's steps change. Replace superseded text; history stays in git.
Related: `skills/planning/SKILL.md` · `templates/new-project.md` · `STANDARDS.md` § *Choose the project* · `harness/cross-check.md`
Status: current
Last reviewed: 26-11-2026

## Summary

Read [SKILL.md](SKILL.md) first; this guide adds only what is special here. The fill-in
form is [templates/new-project.md](../../templates/new-project.md) (the project's
discovery file). Use it; do not make a second form. This guide says what must be settled
first and what can wait. The result is a deep plan with the first usable milestone
planned in full and the rest in a line each.

## When to use

- **Use when:** nothing exists yet and you are planning its first version.
- **Not for:** adding to a project that exists (`feature.md`), or wiring a project into
  Claude Setup (`setup-change.md`).

## Before you start

- The problem and who has it, in Amit's words, and one real example ([SKILL.md](SKILL.md) step 4).
- The form, [templates/new-project.md](../../templates/new-project.md).

## Set the depth

A new project almost always meets a risk trigger — it needs more than one session, and
it brings new tools or libraries. So plan it **deep**, and cross-check the plan before
any code ([STANDARDS.md § How a task runs](../../STANDARDS.md#how-a-task-runs) step 4),
as a full review ([cross-check.md § Review sizes](../../harness/cross-check.md#review-sizes)).

It worked when the plan says deep and names the trigger.

## Settle the minimum plan

Settle these first. Each maps to a line in the template.

- **Problem** and **users** — template: Goal, Users.
- **Success measure** — template: Success looks like.
- **First-version limits:** what is in and what is not — template: In scope, Not doing.
- **Stack and why:** each main tool or library, why it was chosen, and that it is free to
  use — template: Key decisions, Licences.
- **Data and privacy:** what personal or sensitive data it holds, where, and who can see
  it — template: Constraints, Risks.
- **First usable milestone:** the smallest version someone can actually use — template:
  First roadmap.

**Add when needed:**

- **Architecture:** main parts, data each holds, how they talk — template: Design.
- **Integrations:** outside services, accounts, keys (never the keys themselves in the
  plan).
- **Deployment and recovery:** how it goes live and how to roll back — template:
  Go-live.
- **Accessibility,** when people will use a screen.

**Skip:** detailed plans for distant milestones. Plan the first milestone fully; list
the rest in a line each.

It worked when every minimum line has an answer or an `Open:` item in the template.

## Plan the testing

- A test approach for each milestone, and how each milestone is accepted.
- The important or unusual cases to prove before major work — template: Key tests.

It worked when the first milestone has its acceptance check named.

## Set it up

Project selection, registry entry, and the project's own `CLAUDE.md` follow
[STANDARDS.md § Choose the project](../../STANDARDS.md#choose-the-project) and
[templates/project-claude.md](../../templates/project-claude.md). Wiring the project
into Claude Setup (`PROJECTS.md`, `project-rules/`) is a separate Setup change, planned
on its own.

It worked when the plan names how the project is selected and gets its `CLAUDE.md`, and
any Setup change is listed as a plan of its own.

## Common mistakes

- Don't plan it light — plan it deep instead, with a full review before any code.
- Don't make a second form — fill in `templates/new-project.md` instead.
- Don't plan distant milestones in detail — give each one line instead.
- Don't pick a tool before checking its licence and cost — check both first instead, and pick only free-to-use tools.
- Don't put keys or passwords in the plan — name the account instead.

## Quick reference

| Task | How |
|---|---|
| Depth | Deep; full review before any code |
| Minimum plan | Problem, users, measure, limits, stack, data, first milestone |
| Form | `templates/new-project.md` |
| Later milestones | One line each |
| Wiring into Claude Setup | A separate Setup change |

## Related

- [templates/new-project.md](../../templates/new-project.md) — the discovery form this plan fills in.
- [STANDARDS.md § Choose the project](../../STANDARDS.md#choose-the-project) — selecting and registering the project.
- [harness/cross-check.md](../../harness/cross-check.md) — review sizes.
