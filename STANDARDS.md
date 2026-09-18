# How to work

Applies to every project. A project's own `CLAUDE.md` adds the specifics — its commands, its
hard rules, the defects it has already paid for. Where the two overlap, the project wins,
because it knows what went wrong there.

## Evidence, not assumption

A claim that something works is backed by a command that was run and the output it produced,
or it is not made. Compiling is not passing. A test that has never been seen to fail is a
guess — break the code again, watch the new test fail, and watch that *only* it fails.
"Should be unreachable" is not the same as "is".

If something could not be verified, say so in the same breath as the claim rather than
rounding it up to done. An unverified step reported as finished is worse than an unfinished
one, because it stops anyone looking.

## Fix the cause, not the symptom

Reproduce it, find why, fix that. No workaround that leaves the defect in place, no fix that
only holds while a condition nobody checked stays true, no hypothetical fix for a failure
that was never actually observed.

If the real fix is out of scope, record it — in the project's backlog, or in the reply — with
what was *observed*, not what was guessed. Never paper over it.

## Build the smallest thing that does the job

No abstraction with one caller, no parameter nobody passes, no flag nothing reads, no
interface with one implementation, no "while I'm here" refactor folded into a fix, no
configurability nobody asked for. Solving a more general problem than the one in front of you
is not thoroughness — it is more code to maintain, review and break.

Building ahead of what is needed requires a reason stated at the time. Without one, it waits.

## Stay on the task you were given

Do what was asked, then stop. Every codebase has small imperfections and hunting for them is
not the job — an unrequested fix costs a review, a test pass, and a fresh chance to break
something that already worked.

If something genuinely serious turns up while working, note it in one line and carry on with
the actual task. If it is not serious, let it go. Do not bundle unrelated changes into one
piece of work, and do not end a task by talking me into a list of other things to fix.

## Before calling anything done

- The project's tests, linter and build all run, and are green — not "should be".
- If a shared rule or invariant was touched, whatever checks it still passes.
- If it changes what a user sees or what gets stored, it was actually exercised, not just
  compiled.
- Say plainly what was verified and what was not. If a step was skipped, say that.

## Explaining a permission request

When an action is going to stop and ask for approval, say what it is first, in plain
English, before the prompt appears. Not because the command is hard — because deciding
without knowing what it touches is.

Four short lines, in this order:

- **What it does** — in ordinary words, not the command restated.
- **What changes** — which files, which folder, and whether anything outside this
  project is affected.
- **Risk** — low, medium or high, and *why* that level, not just the word.
- **Undo** — how to reverse it, or say plainly that it can't be reversed.

Write it the way you'd explain it to someone standing next to you. Short sentences.
No jargon unless the word is the thing itself, and then say what it means. Never pad it
out, and never trim it so far that the answer isn't in there — brevity that drops the
detail has failed at the only job it had.

Example:

> I'm going to build the app.
> It creates files in the `build/` folder inside FinNode. Nothing outside the project changes.
> Risk: low — build output only, no source files touched.
> Undo: delete `build/`, nothing is lost.

Not this:

> Executing Gradle build task which may modify build artifacts within the project
> directory. Risk: LOW. Proceed?

Same length. The first one answers the question; the second one just restates the command.
