---
name: <agent-name>
description: >
  <What it does, in one line.> <When to use it.> <What it is not for, and which
  agent or skill to use instead.> Example: <what Amit says> → <what the agent is handed>.
tools: <the fewest that do the job, e.g. Read, Grep, Glob>
model: <haiku | sonnet | opus — the cheapest that does the job (harness/models.md)>
omitClaudeMd: <true for a fresh reviewer; leave out otherwise>
---

<!-- Form for an agent file in agents/. Shape and style: WRITING-GUIDE.md § Agents.
     The description loads every session: two or three short lines, one short example line at most,
     in the "Example: … → …" form, never an <example> block; it does not name the agent itself.
     The full example goes in ## Example, with the context and why this agent; it does not repeat the
     description's sentence. More in agent-examples/<name>/ (outside agents/, so it never loads).
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

Copy the skeleton exactly and fill only the <…> slots. Write nothing outside it. Delete
unused "Other" lines, and the "More" line if nothing remains; write "none" in any other
slot with nothing to report. Each slot is one short clause. The report stays at or under
the packet's word limit, or <n> words if none is given; the requesting session checks it
(`harness/cross-check.md` § *The reviewer*).

    Verdict: <verdict word>. <Does it meet its goal: yes | no | unclear> — <why>.
    1. <where>: <what is wrong> — <why it matters>. Fix: <smallest fix>. Tag: <tag>.
    2. <where>: <what is wrong> — <why it matters>. Fix: <smallest fix>. Tag: <tag>.
    Other: <where> · <what is wrong> · <tag>
    More: <n> minor findings, not listed.
    Facts checked: <what was read and matched>; assumptions and files read beyond the packet: <…>; scope: <one item | first of n reviewed>.

<!-- Set the number of numbered and "Other" lines to the job; agents/change-reviewer.md and
     agents/plan-reviewer.md are worked examples. Name the tags and what each means. -->

<Ranking, most serious first.> <What "nothing found" looks like — said plainly, never
padded with invented findings.> <The words the verdict may use, and the words it never
uses (for a reviewer: never "approved").>
