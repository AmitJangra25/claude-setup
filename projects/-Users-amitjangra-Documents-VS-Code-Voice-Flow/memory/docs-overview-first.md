---
name: docs-overview-first
description: "Documents holding lists of rules/pitfalls/tests open with an overview table (name, one line, where), details below — so sessions load only what they need"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 622efdb9-9630-4f18-8309-818e9a636399
  modified: 2026-11-07T05:04:18.234Z
---

A document that lists rules, pitfalls or tests opens with an overview table — one row per
item: name, one line on what it does, where it lives (code file, test). Details follow, one
section per item, same fields each time. Plain complete sentences, no scattered fragments.
Applies to new docs and to existing ones at their next in-depth review, where length makes
it worth it — not forced everywhere. Amit wants it global across projects (07-11-2026).

**Why:** Amit works across many sessions; a session should read the overview, open only the
item it needs, and work fast and consistently. "If the document is good it can easily be
read in any session."

**How to apply:** Voice Flow holds it as `docs/README.md` rule 5, with one pointer line in
`CLAUDE.md` (not a copy). Keep `CLAUDE.md` to pointers rather than repeating rules. Related:
[[docs-are-products-not-logs]], [[dont-delete-reference-docs]].
