---
name: <agent-name>
description: >
  <What it does, in one line.> <When to use it.> <What it is not for, and which
  agent or skill to use instead.> Example: <what Amit says> → <which agent is started,
  and what it is handed>.
tools: <the fewest that do the job, e.g. Read, Grep, Glob>
model: <haiku | sonnet | opus — the cheapest that does the job (harness/models.md)>
omitClaudeMd: <true for a fresh reviewer; leave out otherwise>
---

<!-- Form for an agent file in agents/. Shape and style: WRITING-GUIDE.md § Agents.
     The description loads every session: two or three short lines, one short example line at most.
     The full example goes in ## Example; more in agent-examples/<name>/ (outside agents/, so it never loads).
     Delete every comment and every unused optional block before saving. -->

# <Agent title>

<What you do, for whom, in one or two sentences.> <What you never do — for a reviewer:
approve, edit, commit, push or start another agent.> <What to do if handed more than
one job: do the first and say so.>

## Why this exists

<The gap this agent closes: what goes wrong without it, and why the session that starts
it cannot easily see that by itself.>

Real case (<DD-MM-YYYY>): <what happened, in two to four sentences, with the figure
and its source>. <Full story: Case: `<case-study path>`, once case studies have a home.>
<!-- If no dated case is logged yet, leave out the Real case lines; never use a placeholder. -->

## What you are given

1. This file.
2. <The brief or packet, and where its path comes from.>
3. <The thing under review or the job's inputs.>

<What to do when an input is missing or unreadable: read it yourself and say so, or
report it as unavailable. Never guess what it holds.> <The scope: what not to survey.>

## How to work

1. **<Step or lens name>.** <What to check, the evidence to cite, and what counts as a finding.>
2. **<Step or lens name>.** <What to check, the evidence to cite, and what counts as a finding.>
3. **<Step or lens name>.** <What to check, the evidence to cite, and what counts as a finding.>

### Subject detail (optional)

<Only for detail that fits one kind of work — a stack, a command, a file type. Project
facts do not go here; the agent reads them from the project's own small facts file.>

## Example

    Context: <the situation, in one line>
    user: "<what Amit says>"
    assistant: "<which agent is started, and what it is handed>"
    Why this agent: <why this agent and not another, in one line>

<Made-up data only. Additional examples: `agent-examples/<name>/`.>

## Lessons

- **<Lead phrase.>** <The mistake it prevents, and why it matters — or the case behind it.>
- **<Lead phrase.>** <The mistake it prevents, and why it matters — or the case behind it.>

## Report

Within the packet's word limit (<n> words if none is given):

    <The exact report shape, one field per line: findings ranked by severity (file:line ·
    what is wrong · why it matters · smallest fix), facts verified, assumptions.>

<Ranking, most serious first.> <What "nothing found" looks like — said plainly, never
padded with invented findings.> <The words the verdict may use, and the words it never
uses (for a reviewer: never "approved").>
