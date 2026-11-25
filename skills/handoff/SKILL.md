---
name: handoff
description: Write a handoff note on the templates/handoff.md shape — when work is unfinished, at a fresh-start point, or when Amit asks (STANDARDS.md step 9).
---

# Handoff

When and where: `STANDARDS.md` § *How a task runs* step 9 and § *Plan before building*.
Who may record: § *IDs and progress* (*Recording*). This file is only how.

1. Read `templates/handoff.md` and use its shape. If it cannot be read, say so and ask
   Amit for it — never guess the shape.
2. Where: `.claude/current-task.md` when recording is allowed; otherwise in chat, same shape.
3. Before overwriting *Resume*, move finished results and decisions home
   (`DOCUMENTATION-STANDARD.md` § *Task file rules*). If recording is not allowed, list
   them in chat instead.
4. *Live*: goal and measure in the owner's words · plan as a link, not a copy · latest
   measured result and whether it meets the measure · approved scope with its date · not in
   scope · progress · blockers · next action.
5. *Resume*:
   - **Done** and **Changed files** — exact paths; say what is uncommitted.
   - **Tests and checks** — what ran and the result; what was not verified, plainly.
   - **Errors and fixes** — what failed, why, the fix; a workaround is named as one.
   - **Decisions** — IDs only.
   - **Map updated** — yes or no.
   - **Exact next step** — one action a fresh session can start, and the gate it waits on.
6. Figures as `STANDARDS.md` § *Evidence, not assumption* and § *Plan before building* say:
   measured or labelled estimate. Size limit: § *Task file rules*.
7. Stop after writing it.
