# Bug fix

Purpose: How to plan a bug fix — find the cause, plan the smallest fix, and prove it.
Audience: Claude and helpers that plan a bug fix.
Read when: The planning skill picks the kind "bug fix".
Owner: Claude (rules are Amit's decisions).
Update rule: When the job's steps change. Replace superseded text; history stays in git.
Related: `skills/planning/SKILL.md` · `STANDARDS.md` § *Fix the cause, not the symptom* · `STANDARDS.md` § *Before calling anything done*
Status: current
Last reviewed: 26-11-2026

## Summary

Read [SKILL.md](SKILL.md) first; this guide adds only what is special to a bug fix. A
simple bug stays a short plan. The result is a plan with a confirmed cause (or a guess
clearly labelled as one), a fix limited to named files, and a check that fails before the
fix and passes after it.

## When to use

- **Use when:** something works wrongly — code, a script, a setting, a formula, a
  process — and the job is to make it work as expected.
- **Not for:** new behaviour (`feature.md`), anything in `~/.claude` (`setup-change.md`),
  or a report nobody has shown to be broken yet (find the cause first, below).

## Before you start

- The report: what was seen, where and when.
- One real failing case ([SKILL.md](SKILL.md) step 4): the input, record or steps that show it.
- Read access to the code, logs or data involved. Reading is free; any change needs approval.

## Find the cause

1. **Look first, change second.** Reading code and logs, and re-running the problem, are
   reads; a fix is a change and needs approval.
2. **Re-run the problem with the real failing case,** not a trimmed-down copy. A trimmed
   copy often loses the detail that causes the bug.
3. **Silence is not disproof.** No error and no log line does not rule out a cause the
   code points to. Before dropping that cause, explain why the path would be silent: an
   error caught and ignored, a retry, a log turned off, sampling. Let the code path drive
   the search; use logs to confirm or locate a cause, never to rule one out unexplained.
4. **Say what is live and what is the branch.** Each claim about behaviour says whether
   it describes what users have today or what the branch would do once shipped. Check the
   live version directly, not by reading the working copy. If live does it too, say so in
   the same sentence: that changes who needs to know and how fast.
5. **A labelled guess is fine while you investigate.** It never justifies a real fix.
   Confirm the cause with evidence, or report the limit and ask Amit.
6. **If the report turns out not to be a bug,** or cannot be understood, stop and say so.
   Do not fix something that has not been shown to be broken.

It worked when the cause is confirmed with evidence, or the limit is reported to Amit.

## Write the plan

**Minimum plan:**

- **Actual vs expected:** what happens, and what should happen.
- **Reproduction:** exact steps, or the best evidence you have (log line, screenshot,
  failing test), using the real failing case. Never invent steps or file paths. If you do
  not know them, write `Open: …`.
- **Cause:** the confirmed cause, or a guess clearly labelled **guess**, with how sure
  you are (high, medium or low) and why.
- **Fix:** what changes, and the files it touches.
- **Check:** what will prove the fix — see [Test the fix](#test-the-fix).

Root-cause fix or workaround: say which, in those words ([STANDARDS.md § Fix the cause, not the symptom](../../STANDARDS.md#fix-the-cause-not-the-symptom)).

**Add when needed:**

- **Root-cause investigation:** when the cause is still unknown after a first look
  (reading the code and logs, re-running the problem). That is a risk trigger, so the
  plan becomes deep. A bug whose cause the first look finds stays light.
- **Regression risks:** what else uses the code you change, and how you will know it
  still works.
- **A test that locks the fix in,** when the bug could come back and a test is practical.
- **Siblings of a new guard.** When the fix adds a check against a bad or empty value,
  search the same file and nearby code for the same unguarded pattern. List each one in
  the plan with its file, or say why it is left.
- **Where a let-through case goes next.** A guard that lets a once-failing case through
  moves it further along. Follow it through every later step, not only the line that failed.

It worked when actual vs expected, reproduction, cause, fix and check are each filled or
marked `Open:`.

## Keep the fix inside the plan

Change only the files the plan names. If the fix needs more, stop and tell Amit what and
why before going further.

It worked when every changed file is one the plan names, or Amit approved the extra one.

## Test the fix

1. **Fail first.** The check fails before the fix and passes after it, on the real
   failing case. A check never seen to fail proves nothing
   ([STANDARDS.md § Evidence, not assumption](../../STANDARDS.md#evidence-not-assumption)).
2. Use whatever proves the fix: an existing test, a command, re-running the reproduction
   by hand, or a new test.
3. **Re-run the original reproduction.** A passing test suite alone is not enough if the
   original problem was never re-run. If it could not be re-run, the result is
   **partly verified**, not done.
4. Add a UI check if the bug is visible in the UI.
5. Run the checks that matter for the fix plus the project's major tests
   ([STANDARDS.md § Before calling anything done](../../STANDARDS.md#before-calling-anything-done))
   — not the full suite by default.
6. Skip a spec and a design doc.
7. Never change the code under test just to make a failing check pass.

It worked when the check was seen failing, then passing, and the reproduction was re-run.

### Subject detail (optional)

For code:

- In a test, let the code under test produce the failure. A stub that throws the very
  error being reproduced makes the test fail for the wrong reason, so it proves nothing.
- To check what is live, read the main branch's copy of the file
  (`git show origin/main:<path>`), not the working tree.

## Report the result

Report it with the labels in [STANDARDS.md § Before calling anything done](../../STANDARDS.md#before-calling-anything-done).
Say what was re-run and what was not.

It worked when the result carries one of those labels and names what was not re-run.

## Common mistakes

- Don't fix on a guess — confirm the cause, or report the limit to Amit instead.
- Don't drop a cause because no log shows it — explain the silence first.
- Don't reproduce with a hand-trimmed case — use the real failing one.
- Don't call it done on a green suite — re-run the original reproduction too.
- Don't add a guard in one place — check its siblings and list them.
- Don't widen the fix past the named files — stop and tell Amit.

## Quick reference

| Task | How |
|---|---|
| Find the cause | Read and re-run first; explain any silence; label guesses |
| Plan | Actual vs expected · reproduction · cause · fix · check |
| Cause unknown after a first look | Plan becomes deep (risk trigger) |
| Prove the fix | Fails before, passes after, on the real case; re-run the reproduction |
| Fix needs more files | Stop and tell Amit |
| Report | Done and verified · partly verified · blocked |

## Related

- [STANDARDS.md § Fix the cause, not the symptom](../../STANDARDS.md#fix-the-cause-not-the-symptom) — root-cause fix or workaround, and the two-tries rule.
- [STANDARDS.md § Evidence, not assumption](../../STANDARDS.md#evidence-not-assumption) — why a check must be seen to fail before the fix.
- [STANDARDS.md § Before calling anything done](../../STANDARDS.md#before-calling-anything-done) — which checks run, and the result labels.
