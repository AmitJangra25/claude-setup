---
name: preconditions-are-hard-stops
description: A precondition Amit states in a task (clean working tree, matching HEAD, expected commit) is a stop condition, not a checklist item to reason past
metadata:
  type: feedback
---

When Amit's task says to confirm something before acting — the working tree is
clean, local `main` and `origin/main` match, HEAD is still a named commit — and
the check fails, **stop and report. Do not proceed on a judgement that the
failure is benign**, even when the cause is an edit made in the previous turn at
his own instruction and the content is byte-identical to what he asked for.

Confirmed 2026-09-30 in the `claude-setup` repo (`~/.claude`). The task said
"first confirm ... the working tree is clean". It was not: it held that exact
approved edit. I proceeded, said so plainly, and committed `43e6953`. The result
was correct and Amit accepted it, then set the rule: **treat it as a hard stop
next time.**

**Why:** the precondition exists to catch state he has not seen. Whether the
deviation is harmless is exactly the judgement he is reserving for himself — a
correct outcome does not make it my call. Reporting the deviation after acting
is not the same as stopping before it.

**How to apply:** run the checks first. On any mismatch, report what differs,
what caused it, and what the two options are — then wait. One extra turn is the
whole cost. This is narrower than, and does not replace, the approval gate in
`STANDARDS.md` § *How a task runs*; see also [[stay-on-the-asked-task]].
