---
name: handoff
description: Write a handoff note on the templates/handoff.md shape.
  Use when work is unfinished, at a fresh-start point, or when Amit asks for a handoff.
  Not for a finished task (just report the result).
---

# Handoff

Writes the note a fresh session needs to carry on, on the `templates/handoff.md` shape. When
and where it is due: `STANDARDS.md` § *How a task runs* step 9 and § *Plan before building*.
Who may record: § *IDs and progress* (*Recording*). This skill is only how.

## When to use

- **Use when:** work is unfinished, at a fresh-start point, or Amit asks (step 9).
- **Not for:** a task that is done and verified — report the result and stop.

## Steps

1. **Read the shape.** Read `templates/handoff.md` and use it. If it cannot be read, say so
   and ask Amit for it — never guess the shape.
2. **Pick the place.** `.claude/current-task.md` when recording is allowed; otherwise in
   chat, same shape.
3. **Move finished work home.** Before overwriting *Resume*, move finished results and
   decisions to their home (`DOCUMENTATION-STANDARD.md` § *Task file rules*). If recording is
   not allowed, list them in chat instead.
4. **Fill *Live*.** Goal and measure in the owner's words · plan as a link, not a copy ·
   latest measured result and whether it meets the measure · approved scope with its date ·
   not in scope · progress · blockers · next action.
5. **Fill *Resume*.**
   - **Done** and **Changed files** — exact paths; say what is uncommitted.
   - **Tests and checks** — what ran and the result; what was not verified, plainly.
   - **Errors and fixes** — what failed, why, the fix; a workaround is named as one.
   - **Decisions** — IDs only.
   - **Map updated** — yes or no.
   - **Exact next step** — one action a fresh session can start, and the gate it waits on.
6. **Check the figures.** Each is measured or labelled estimate (`STANDARDS.md` § *Evidence,
   not assumption*, § *Plan before building*). Size limit: § *Task file rules*.
7. **Stop** after writing it.

## Example

    Situation: a roadmap task is half done; the session is near its context limit.
    Step 3: the two finished results move to the roadmap; Resume is then overwritten.
    Step 5, Changed files: `docs/pricing.md` (uncommitted), `docs/index.md` (uncommitted).
    Step 5, Tests and checks: link check passed; the example table was not verified.
    Step 5, Exact next step: "Verify the example table against the price list; waits on
      Amit's yes to the plan."

## Self-check

**Short check:**
- The result matches the request: a cold reader can start from the next step alone.
- Say what was not checked.

## Related

- `templates/handoff.md` — the shape.
- `STANDARDS.md` § *How a task runs* step 9 — when a handoff is due.
- `DOCUMENTATION-STANDARD.md` § *Task file rules* — size limit and where finished results go.
