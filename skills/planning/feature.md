# Feature or small enhancement

One guide, two depths. Read `SKILL.md` first; this file adds only what is special here.

## Which depth

- **Small enhancement:** a focused addition in a few files.
- **Feature:** new behaviour across several files or screens.

If unsure, start as a small enhancement and move up when the reading shows more files or
screens than expected. Say so when you move it.

## Small enhancement — minimum plan

- **Behaviour:** what will be different, in a sentence or two.
- **Files:** the files that change.
- **Acceptance checks:** how we will know it works.

Skip a separate design doc or task list. If a risk trigger applies, add the feature
lines below that the risk calls for — it stays a small enhancement.

## Feature — minimum plan

- **Need:** why it is wanted, in Amit's words.
- **Expected behaviour.**
- **Acceptance scenarios** in plain words: "When …, then …". One per behaviour that
  matters, including the main error case.
- **Affected areas:** files, screens, services.
- **Reuse:** existing helpers, patterns or components to build on
  (`STANDARDS.md` § *Reuse what is already there*).
- **Ordered steps,** each one checkable. Split into work packages if it will not fit in
  one session (`SKILL.md` § 7).

Skip restating the whole app design.

## Add when needed

- **Data or schema changes:** what changes, migration, backup. A data migration is
  always deep.
- **Compatibility:** old data, old clients, other callers.
- **Rollout and undo:** how it goes live and how to take it back.
- **Technical design:** when `SKILL.md` § 5 says so.

## Refactoring

Use this guide with one extra line: **behaviour must not change.** Run the same checks
before and after, and compare the results.

## Testing

- One check per acceptance scenario.
- UI checks only if the UI is touched.
- Small enhancement: one focused check.
- Either depth: plus the project's major tests (`STANDARDS.md` § *Before calling
  anything done*).
