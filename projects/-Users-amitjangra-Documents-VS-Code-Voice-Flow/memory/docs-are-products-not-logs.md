---
name: docs-are-products-not-logs
description: "Amit wants docs written as a person would write them — about the app, not about their own history; append-only dated logs are a rewrite trigger"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: a6fd75ba-fa22-47e4-9fd3-1ed64f81743b
  modified: 2026-08-19T12:01:56.208Z
---


> **Now global** — `STANDARDS.md` § Docs are products. The global copy governs; this file is kept for the evidence behind the rule.
Docs must read like a senior writer wrote them for *this application*: what it is,
what it does, what's next. Not "a corrected replacement for the original blueprint",
not a section correcting a document that no longer exists, and not a changelog with
"Revised 2026-08-14" stamped on every third paragraph.

**Why:** roadmap.md and backlog.md had grown by appending. Each decision appeared two
or three times, half the backlog was struck-through completed work, and six references
pointed at section numbers that no longer existed. Amit's words: *"It's really
unarranged, with zero human effort... I do not like the document."*

**How to apply:** when a planning doc grows by appending, propose a rewrite rather than
another append. Keep every live fact; move the dated narrative to `docs/archive/` and
link it — nothing is deleted, it's relocated (see [[dont-delete-reference-docs]]).
Prefer **named phases over numbered ones** so reordering never renumbers anything.
He also asks for a **worth-it verdict per item** and expects honest "no" answers —
and for plain-language one-liners before any technical detail.
