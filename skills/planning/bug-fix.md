# Bug fix

Read `SKILL.md` first; this file adds only what is special here. A simple bug stays a
short plan.

## Minimum plan

- **Actual vs expected:** what happens, and what should happen.
- **Reproduction:** exact steps, or the best evidence you have (log line, screenshot,
  failing test). Never invent steps or file paths. If you do not know them, write
  `Open: …`.
- **Cause:** the confirmed cause, or a guess clearly labelled **guess**, with how sure
  you are (high, medium or low) and why.
- **Fix:** what changes, and the files it touches.
- **Check:** what will prove the fix — see *Testing* below.

## Finding the cause before fixing

- Look first, change second. Reading code and logs, and re-running the problem, are
  reads; a fix is a change and needs approval.
- A labelled guess is fine while you investigate. It never justifies a real fix.
  Confirm the cause with evidence, or report the limit and ask Amit.
- If the report turns out not to be a bug, or cannot be understood, stop and say so.
  Do not fix something that has not been shown to be broken.
- Root-cause fix or workaround: say which, in those words (`STANDARDS.md` § *Fix the
  cause, not the symptom*).

## Add when needed

- **Root-cause investigation:** when the cause is still unknown after a first look
  (reading the code and logs, re-running the problem). That is a risk trigger, so the
  plan becomes deep. A bug whose cause the first look finds stays light.
- **Regression risks:** what else uses the code you change, and how you will know it
  still works.
- **A test that locks the fix in,** when the bug could come back and a test is practical.

## Keep the fix inside the plan

Change only the files the plan names. If the fix needs more, stop and tell Amit what and
why before going further.

## Testing

- Use whatever proves the fix: an existing test, a command, re-running the reproduction
  by hand, or a new test.
- **Re-run the original reproduction.** A passing test suite alone is not enough if the
  original problem was never re-run. If it could not be re-run, the result is
  **partly verified**, not done.
- Add a UI check if the bug is visible in the UI.
- Run the checks that matter for the fix plus the project's major tests
  (`STANDARDS.md` § *Before calling anything done*) — not the full suite by default.
- Skip a spec and a design doc.
- Never change the code under test just to make a failing check pass.

## Result

Report it with the labels in `STANDARDS.md` § *Before calling anything done*. Say what
was re-run and what was not.
