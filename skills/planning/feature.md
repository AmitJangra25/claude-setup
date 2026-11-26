# Feature or small enhancement

Purpose: How to plan new behaviour — a small enhancement or a full feature — and a refactor that must keep behaviour the same.
Audience: Claude and helpers that plan a feature, an enhancement or a refactor.
Read when: The planning skill picks the kind "new feature", "small enhancement", or a refactor.
Owner: Claude (rules are Amit's decisions).
Update rule: When the job's steps change. Replace superseded text; history stays in git.
Related: `skills/planning/SKILL.md` · `STANDARDS.md` § *Reuse what is already there* · `STANDARDS.md` § *Before calling anything done*
Status: current
Last reviewed: 26-11-2026

## Summary

One guide, two depths. Read [SKILL.md](SKILL.md) first; this guide adds only what is
special here. The result is a plan that says what will behave differently, which files
change, what it builds on, and one check per behaviour that matters.

## When to use

- **Use when:** you are adding or changing behaviour, or restructuring code that must
  keep behaving the same (a refactor).
- **Not for:** something that works wrongly (`bug-fix.md`), anything in `~/.claude`
  (`setup-change.md`), or a choice between options with no build yet (`research-business.md`).

## Before you start

- The need in Amit's words, and one real example of the wanted result ([SKILL.md](SKILL.md) step 4).
- Read access to the files and screens the change will touch.

## Pick the depth

- **Small enhancement:** a focused addition in a few files.
- **Feature:** new behaviour across several files or screens.

If unsure, start as a small enhancement and move up when the reading shows more files or
screens than expected. Say so when you move it.

It worked when the plan names its depth, and why.

## Write the plan

**Small enhancement — minimum plan:**

- **Behaviour:** what will be different, in a sentence or two.
- **Files:** the files that change.
- **Acceptance checks:** how we will know it works.

Skip a separate design doc or task list. If a risk trigger applies, add the feature
lines below that the risk calls for — it stays a small enhancement.

**Feature — minimum plan:**

- **Need:** why it is wanted, in Amit's words.
- **Expected behaviour.**
- **Acceptance scenarios** in plain words: "When …, then …". One per behaviour that
  matters, including the main error case.
- **Affected areas:** files, screens, services.
- **Reuse:** existing helpers, patterns or components to build on
  ([STANDARDS.md § Reuse what is already there](../../STANDARDS.md#reuse-what-is-already-there)).
  Read the one you name before telling anyone to copy it: it may not do what its name
  suggests, or may carry a defect the copy would spread.
- **Ordered steps,** each one checkable. Split into work packages if it will not fit in
  one session ([SKILL.md](SKILL.md) step 7).

Skip restating the whole app design.

**Either depth:** each claim about current behaviour says whether it describes what
users have today (live) or what the branch does. Check the live version directly, not by
reading the working copy.

**Add when needed:**

- **Data or schema changes:** what changes, migration, backup. A data migration is
  always deep.
- **Compatibility:** old data, old clients, other callers.
- **Rollout and undo:** how it goes live and how to take it back.
- **Technical design:** when [SKILL.md](SKILL.md) step 5 says so.
- **Existing-versus-new table** (deep coding plans): every function, field or setting
  the plan names is either existing — with where it lives — or new, declared in the
  package that creates it. A name that is neither is an open item. A package that uses
  a new one comes after the package that creates it.

It worked when every line of the chosen depth's minimum plan is filled or marked `Open:`.

## Refactoring

Use this guide with one extra line: **behaviour must not change.** Run the same checks
before and after, and compare the results.

- **Parity table** (refactors and migrations): one row per behaviour being replaced —
  old thing, what it does, new thing, what it does, how you know they match. Two things
  with similar names that do different things is the most common silent break; the
  table brings it out before code is written. If the old behaviour cannot be read from
  the source, the match is unproven: write `Open:`.
- **"Moved unchanged" is not "correct".** Code you move becomes yours; read it for
  defects as if new. Watch steps that run after a branch that was meant to stop early.
- **Fix comments that count or name what moved,** such as "the three handlers below",
  so they stay true.

It worked when the parity table has no unproven row, or each one is an `Open:` item.

## Testing

1. One check per acceptance scenario.
2. UI checks only if the UI is touched.
3. Small enhancement: one focused check.
4. Either depth: plus the project's major tests ([STANDARDS.md § Before calling anything done](../../STANDARDS.md#before-calling-anything-done)).
5. **A green snapshot proves stability, not correctness.** A saved output that matches
   forever can be wrong forever. Compare it with the expected behaviour yourself before
   counting it as proof.
6. Optional: write the test first, watch it fail, then build. Useful when the behaviour
   is easy to state as a check; not a default.

It worked when every acceptance scenario has a named check.

### Subject detail (optional)

For code, the existing-versus-new table, with made-up names:

    | Name                       | Used in | State    | Where                    |
    |----------------------------|---------|----------|--------------------------|
    | expenses.py  sum_by_month  | WP1     | existing | expenses.py              |
    | export.py    to_csv        | WP2     | new      | declared in WP1          |

## Common mistakes

- Don't tell anyone to copy a pattern you have not read — read it first.
- Don't call a moved block correct because it was moved unchanged — read it.
- Don't count a green snapshot as proof the output is right — compare it yourself.
- Don't claim how the system behaves without saying live or branch.
- Don't stay at small depth once the reading shows more files — move up and say so.

## Quick reference

| Task | How |
|---|---|
| Pick the depth | A few files: small enhancement · several files or screens: feature |
| Small plan | Behaviour · files · acceptance checks |
| Feature plan | Need · behaviour · scenarios · areas · reuse · ordered steps |
| Refactor | Behaviour must not change; parity table; same checks before and after |
| Deep coding plan | Existing-versus-new table |
| Test | One check per scenario, plus the project's major tests |

## Related

- [STANDARDS.md § Reuse what is already there](../../STANDARDS.md#reuse-what-is-already-there) — build on what exists.
- [STANDARDS.md § Before calling anything done](../../STANDARDS.md#before-calling-anything-done) — which checks run.
