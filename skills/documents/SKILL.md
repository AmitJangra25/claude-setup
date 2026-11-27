---
name: documents
description: Checklist before writing, restructuring, splitting, moving or archiving a document.
  Use when a roadmap, backlog, decisions file, reference, record or project map is about to change.
  Not for ordinary code or chat answers.
---

# Documents

A checklist that says which section of `DOCUMENTATION-STANDARD.md` to read before a document
changes. Every rule is in the standard; this skill only points. If they disagree, the standard
wins. Read only the sections the change needs.

## When to use

- **Use when:** writing, restructuring, splitting, moving or archiving a roadmap, backlog,
  decisions file, reference, record or project map.
- **Not for:** the change itself — that follows `STANDARDS.md` § *How a task runs* (plan and
  approval first). This skill only checks the document side.

## Steps

1. **Home.** Does the fact already live somewhere? Point, don't copy (§ *Principles*; exceptions
   only in § *Allowed copies*). Where things live: `DOCUMENT-MAP.md`.
2. **Type, header, sections.** § *Five file types*; § *Headers* (always-loaded files have none,
   § *Always loaded*); § *Structure per file*. Fill-in forms are in `templates/`.
3. **IDs, status marks, dates, name.** § *IDs and progress*; § *Naming*.
4. **Size.** Over the limits in § *Growth and rollover*: propose a rollover.
5. **Moving, archiving or removing.** § *Moving and archiving*; a document is removed only
   under its deletion rule.
6. **Data.** § *Data and security*.
7. **Decision touched.** § *Decisions and affected files*.
8. **Map.** A document added, moved or retired: § *When to read and update*.
9. **Check.** In Claude Setup, run `harness/doc-check.sh`; report new warnings apart from old
   ones (`STANDARDS.md` § *Evidence, not assumption*).

## Example

    Request: "Split the backlog, it has grown too long."
    Step 1, home: the facts live in the backlog; a split must keep one home per fact.
    Step 4, size: 410 lines against a 300-line limit, so a rollover is proposed.
    Step 5, moving: the old rows move to an archive file; nothing is removed.
    Step 8, map: the archive is a new document, so `DOCUMENT-MAP.md` gets a line.
    Step 9, check: `doc-check.sh` shows 0 new warnings (1 old, unchanged).

## Self-check

**Full check** (deleting and moving documents are risky):
- Each step's result matches the request.
- Every path, count and claim is checked against the file it names.
- No gate was skipped: approval, cross-check, two-method check before deleting.
- Say what was not checked.

## Related

- `DOCUMENTATION-STANDARD.md` — every rule this checklist points to.
- `DOCUMENT-MAP.md` — where each document lives.
- `STANDARDS.md` § *How a task runs* — plan and approval for the change itself.
