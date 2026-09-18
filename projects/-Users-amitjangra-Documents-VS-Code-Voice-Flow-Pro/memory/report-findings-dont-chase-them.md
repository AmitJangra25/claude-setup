---
name: report-findings-dont-chase-them
description: Amit sets the pace — list incidental findings at the end instead of acting on each one
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 6362b720-61ae-44f2-aa9a-9de4491bb711
  modified: 2026-08-13T13:19:15.995Z
---

Amit pushed back with "you always find 1 things" after a chain where each fix
surfaced the next (version number → no tsconfig → deprecated baseUrl). The
findings were real, but acting on each one in turn meant I was setting the pace
instead of him.

**Why:** a genuine finding still costs him attention and review time. Choosing
what is worth doing is his call, not a side effect of me noticing something.

**How to apply:** finish exactly what was asked, then list anything else noticed
in a short "noting, not acting on" section at the end. Wait to be told before
starting on it. Exception: say so immediately if something is actually broken or
if a claim I previously made turns out to be wrong — see
[[verify-shipped-bundle-not-source]] and [[dont-delete-reference-docs]].
