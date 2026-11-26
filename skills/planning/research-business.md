# Research or business

Purpose: How to plan research that answers a question, or a business choice between options, so the answer rests on searched evidence and ends in a clear recommendation.
Audience: Claude and helpers that plan research or a business choice, coding or not.
Read when: The planning skill picks the kind "research or business".
Owner: Claude (rules are Amit's decisions).
Update rule: When the job's steps change. Replace superseded text; history stays in git.
Related: `skills/planning/SKILL.md` · `STANDARDS.md` § *How a task runs* · `STANDARDS.md` § *Evidence, not assumption*
Status: current
Last reviewed: 26-11-2026

## Contents

- [Summary](#summary) — two jobs, one method
- [When to use](#when-to-use) — and when idea assessment fits instead
- [Before you start](#before-you-start)
- [Set the questions first](#set-the-questions-first)
- [Plan the search](#plan-the-search) — two methods, outside requests, money
- [Check the answers](#check-the-answers) — sources, searched and not found, negatives
- [Write the result](#write-the-result) — findings report or proposal, with an example
- [Common mistakes](#common-mistakes) · [Quick reference](#quick-reference) · [Related](#related)

## Summary

Read [SKILL.md](SKILL.md) first; this guide adds only what is special here. It covers two
jobs that share one method: **research** (find out what is true — "which parts of the app
read the settings file?") and a **business or design choice** (pick one option — "which
supplier for the café's new menu?"). The result is a short report that answers each
question with its source, says what was searched and not found, and — for a choice —
recommends one option with its alternatives, risks and success criteria.

## When to use

- **Use when:** the result is an answer or a recommendation, not a built change: compare
  options, find facts, pick a supplier, a tool or an approach.
- **Not for:** whether to do something at all (idea assessment, [SKILL.md](SKILL.md)
  step 9), or building the chosen option — that is a new plan of its own kind once Amit
  picks.

## Before you start

- The decision the answer feeds, in Amit's words: who decides, and by when.
- One real example of the need ([SKILL.md](SKILL.md) step 4): the slow screen, the menu
  that needs a supplier, the quote already received.
- Read access to the sources: files, code, documents, quotes, people to ask.

## Set the questions first

1. **List the questions before any search.** Number them. For each, write what would
   answer it: a file, a figure, a quote, a person. Work through them in that order.
2. **Answer before widening.** Finish each question before following a side path. Side
   paths are optional; the questions are not.
3. **Keep to the scope.** A question nobody asked does not go in, however interesting.

It worked when every question has a number and a named source that could answer it.

## Plan the search

1. **Two methods for every important question.** One search finding nothing proves
   little. Use a second method of a different kind:

   | Work | First method | Second method |
   |---|---|---|
   | Code | A text search for the name | A file listing by naming pattern, then reading the likely files |
   | Documents | Search for the term | Read the contents list and index of the likely documents |
   | Business | The supplier's own price list | An independent source: a second quote, a review, a past invoice |

2. **Outside searches go in the plan.** A web search or a message to a supplier is an
   outside request, so it waits for plan approval like any other
   ([STANDARDS.md § How a task runs](../../STANDARDS.md#how-a-task-runs) step 4). List
   each one and the words it will send. Never put private or project data in a search
   or a message.
3. **Open only what the sources cannot answer.** A question the files or documents can
   answer is answered, not listed as open. `Open:` is for what needs a person, a test
   or an outside source the plan has not reached.
4. **Money:** see [SKILL.md](SKILL.md) step 2.

**Minimum plan:**

- **Decision:** what the answer feeds, and who decides.
- **Questions:** numbered, each with its likely source.
- **Methods:** two per important question; the outside requests listed.
- **Result shape:** a findings report (research) or a proposal (choice), below.
- **Success measure:** for example "each question answered with a source, or marked
  `Open:` with the reason".

It worked when each important question has two methods and every outside request is listed.

## Check the answers

1. **Every answer names its source:** the file and the symbol or heading, the document,
   the quote and its date, the person. An answer with no source is an `Open:` item.
2. **Report what was searched and not found:** what you looked for, where, and how. "I
   searched the code for `settings.json` and for `load_settings`, and listed every file
   named `*config*`; none outside `app/config.py` reads it." Negative results stop the
   next person repeating the search.
3. **Prove a negative twice.** "No other caller", "no supplier delivers on Sundays", "not
   used anywhere" — confirm with a second check done a different way. If the second
   check cannot be done, report the claim as a risk and say what you could not rule out.
4. **List what you checked and dropped,** each with the evidence that cleared it. A
   concern dropped without evidence comes back later as a surprise.

It worked when every claim has a source and every negative has two checks or is a risk.

## Write the result

**Findings report** (research):

- **Summary:** the answer to each question in a line or two.
- **Findings:** each with its source.
- **Search coverage:** what was searched, where, how, and what was not found.
- **Checked and dropped:** concerns cleared, with the evidence.
- **Open questions:** what the sources could not answer, and what would answer it.

**Proposal** (choice):

- **Problem:** the pain or need, who has it, and what it costs today.
- **Recommendation:** the chosen option, its pros and cons, in a few sentences.
- **Alternatives:** each option not chosen, and why not.
- **Slices:** how to bring it in, in steps that each show a result on their own — a trial
  before a full order, a pilot before a rollout.
- **Risks:** a table — risk, impact (high, medium, low), likelihood (high, medium, low),
  and the mitigation, placed in a slice.
- **Success criteria:** how Amit will know the choice worked — a number or a yes/no.
- **Open questions:** what still needs an answer before or after deciding.
- **Search coverage** and **checked and dropped,** as in the findings report.

A recommendation is not approval. Building or buying the chosen option still needs its
own plan and Amit's yes.

It worked when the report answers the decision it was planned for, in the shape above.

### Example (made-up data)

    Problem: the café's new lunch menu needs a bread supplier; the current one
      stops deliveries on 01-02.
    Recommendation: Supplier B — ₹42 a loaf, daily delivery by 7:00.
    Alternatives: A — ₹38, but delivers Monday to Friday only; the café opens Saturday.
      C — ₹55, no gain over B for this need.
    Slices: 1. two-week trial order; 2. full contract if the trial meets the criteria.
    Risks: B misses a 7:00 delivery | impact high | likelihood low | trial records
      every delivery time (slice 1).
    Success criteria: no missed morning delivery in the trial; cost at or under ₹45.
    Search coverage: price lists from A, B, C; a second quote from B; asked A about
      Saturday delivery — "no Saturday" confirmed in writing (second check).
    Open: B's price after the first year.

### Subject detail (optional)

For code research:

- Quote the lines that answer the question; do not paraphrase code.
- Cite a path plus a symbol or heading ([SKILL.md](SKILL.md) step 8).
- Check whether a claim describes what is live or the branch.

## Common mistakes

- Don't start searching before the questions are written — list them first.
- Don't trust one search that found nothing — try a second, different method.
- Don't report only what you found — say what you searched and did not find.
- Don't list as open what a file could answer — answer it.
- Don't send private data in a web search — keep search words general.
- Don't recommend without alternatives — say why each was not chosen.

## Quick reference

| Task | How |
|---|---|
| Start | Numbered questions, each with a likely source |
| Search | Two different methods per important question |
| Outside requests | Listed in the plan; no private data |
| Negative claim | A second check done a different way, or report it as a risk |
| Research result | Summary · findings · search coverage · checked and dropped · open |
| Choice result | Problem · recommendation · alternatives · slices · risks · success criteria · open |

## Related

- [SKILL.md](SKILL.md) — the planning skill; read it first; step 9 is idea assessment.
- [STANDARDS.md § How a task runs](../../STANDARDS.md#how-a-task-runs) — approval before anything goes online.
- [STANDARDS.md § Evidence, not assumption](../../STANDARDS.md#evidence-not-assumption) — why every answer needs a source.
