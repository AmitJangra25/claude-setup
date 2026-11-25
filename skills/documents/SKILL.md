---
name: documents
description: Checklist before writing, restructuring, splitting, moving or archiving any document (roadmap, backlog, decisions, reference, record, project map). Points to DOCUMENTATION-STANDARD.md, which holds every rule.
---

# Documents

Every rule is in `DOCUMENTATION-STANDARD.md`; this list only says which section to check.
If they disagree, the standard wins. Read only the sections the change needs.

- [ ] **Home** — does the fact already live somewhere? Point, don't copy (§ *Principles*;
      exceptions only in § *Allowed copies*). Where things live: `DOCUMENT-MAP.md`.
- [ ] **Type** — § *Five file types*.
- [ ] **Header** — § *Headers*; always-loaded files have none (§ *Always loaded*).
- [ ] **Sections** — § *Structure per file*; fill-in forms in `templates/`.
- [ ] **IDs, status marks, dates** — § *IDs and progress*.
- [ ] **Name** — § *Naming*.
- [ ] **Size** — over the limits in § *Growth and rollover*: propose a rollover.
- [ ] **Moving, archiving or removing** — § *Moving and archiving*; a document is removed only under its deletion rule.
- [ ] **Data** — § *Data and security*.
- [ ] **Decision touched** — § *Decisions and affected files*.
- [ ] **Map** — a document added, moved or retired: § *When to read and update*.
- [ ] **Check** — in Claude Setup, run `harness/doc-check.sh`; report new warnings apart
      from old ones (`STANDARDS.md` § *Evidence, not assumption*).

The change itself still follows `STANDARDS.md` § *How a task runs*: plan and approval first.
