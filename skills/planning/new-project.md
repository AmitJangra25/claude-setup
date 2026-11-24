# New project

Read `SKILL.md` first; this file adds only what is special here.

The fill-in form is `templates/new-project.md` (the project's discovery file). Use it;
do not make a second form. This guide says what must be settled first and what can wait.

## Depth

A new project almost always meets a risk trigger — it needs more than one session, and
it brings new tools or libraries. So plan it **deep**, and cross-check the plan before
any code (`STANDARDS.md` step 4, `harness/cross-check.md`).

## Minimum plan

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

## Add when needed

- **Architecture:** main parts, data each holds, how they talk — template: Design.
- **Integrations:** outside services, accounts, keys (never the keys themselves in the
  plan).
- **Deployment and recovery:** how it goes live and how to roll back — template:
  Go-live.
- **Accessibility,** when people will use a screen.

## Testing

- A test approach for each milestone, and how each milestone is accepted.
- The important or unusual cases to prove before major work — template: Key tests.

## Skip

Detailed plans for distant milestones. Plan the first milestone fully; list the rest
in a line each.

## Setting it up

Project selection, registry entry, and the project's own `CLAUDE.md` follow
`STANDARDS.md` § *Choose the project* and `templates/project-claude.md`. Wiring the
project into Claude Setup (`PROJECTS.md`, `project-rules/`) is a separate Setup change,
planned on its own.
