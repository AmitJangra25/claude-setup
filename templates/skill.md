---
name: <skill-name>
description: <What it does, in one short line.> Use when <the phrases or moments that
  should start it>. Not for <what it should not start on>.
---

<!-- Form for skills/<name>/SKILL.md. Shape and style: WRITING-GUIDE.md § Skills.
     The description loads every session: two or three short lines.
     Larger examples go in skills/<name>/examples/, made-up data only; each new folder
     and each file inside it needs its own .gitignore allow-line. Delete every comment before saving. -->

# <Skill title>

<What this skill helps you do, and the result, in one or two sentences.> <Which rule
file holds the hard limits; this skill keeps only the how.> <Which agent it may start,
if any — a skill adds to agents, never replaces them.>

## When to use

- **Use when:** <the situation, in one line>.
- **Not for:** <the nearest wrong situation, and what to use instead>.

## Steps

1. **<Step name>.** <What to do, and how to tell it worked.>
2. **<Step name>.** <What to do, and how to tell it worked.>
3. **<Step name>.** <What to do, and how to tell it worked.>

## Example

<One small worked example, made-up data only. Larger ones: `examples/<name>.md` in this
skill's folder.>

The shape of a non-coding example, for a made-up skill that compares supplier quotes:

    Request: "Compare the three chair quotes and pick one."
    Step 1, gather: Quote A 12 chairs at 85 each, delivery 2 weeks; Quote B 12 at 79,
      delivery 6 weeks; Quote C 12 at 92, delivery 1 week, 5-year warranty.
    Step 2, compare against the need: chairs are needed within 3 weeks.
    Step 3, recommend: A — B misses the date; C costs 84 more for a warranty not asked for.
    Self-check: totals re-added from the quotes; date need taken from the request.

## Subject detail (optional)

<Only what fits one kind of work: commands, code, a stack, a tool. Delete this section
when the skill fits any subject without it.>

## Self-check

<Keep one of the two and delete the other.>

**Full check** (risky — secrets, deleting, money, data, permissions — or used most days):
- Each step's result matches the request.
- Every file, number and claim is checked against its source.
- No gate was skipped: approval, cross-check, two-method check before deleting.
- Say what was not checked.

**Short check** (every other skill):
- The result matches the request.
- Say what was not checked.

## Related

- <The rule file that holds the hard limits.>
- <The agent this skill may start, if any.>
