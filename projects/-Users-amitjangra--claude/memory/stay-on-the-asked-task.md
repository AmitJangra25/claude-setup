---
name: stay-on-the-asked-task
description: "Amit wants the asked task only, reported short — no extra probes, no unasked analysis appended to reports"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 8ad1e2f3-189a-4903-850b-03e46534b1b9
  modified: 2026-11-27T06:53:47.295Z
---

Do the task that was asked and report it short. Said directly on 2026-09-21 after a
setup session: "stick to point ok? do not deviate from the task."

The concrete slips that prompted it, all in one session: running an extra confirmation
probe after the question was already answered; ending a report with an unasked paragraph
re-answering an earlier question; restating conclusions across several sections of the
same reply.

**Why:** `~/.claude/STANDARDS.md` already says this — "Do what was asked, then stop" and
"Never pad it out". He had to say it out loud anyway, so the standing rule was not being
followed in practice.

**How to apply:** Stop at the answer. One confirmation is enough when the result is
already decisive. Anything noticed but not asked about goes in the "noting, not acting on"
list, never in the body of the report. Do not re-answer an earlier question because new
evidence touches it — say it in one line if it changes a decision, otherwise leave it.
Also: don't present gaps nobody has hit as work (30-10-2026); see STANDARDS value bar.

Repeat case, 27-11-2026: mid-plan, Amit asked whether skills could be tiered to cut daily tokens, and said "we'll see in the rewriting phase". Claude judged the saving small and still proposed fitting it into Phase 15, and proposed dropping a step from the approved plan. Root cause: no written rule covered new ideas raised mid-task. Fixed in `STANDARDS.md` § *Stay on the task you were given*: P3/P4 ideas stay in the "noting" list, P2 is proposed as next, and a direct instruction is never parked.

Related: [[claude-setup-status]]
