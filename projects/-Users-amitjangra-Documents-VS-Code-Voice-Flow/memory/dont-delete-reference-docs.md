---
name: dont-delete-reference-docs
description: Amit pushes back on deleting design/spec docs — relocate and mark stale instead of removing
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 6362b720-61ae-44f2-aa9a-9de4491bb711
  modified: 2026-08-13T11:42:09.638Z
---

When a cleanup turns up a stale reference document (a product spec, a design
doc), Amit's instinct is to keep it. He challenged deleting
`voiceflow-product-spec.md` with "what is the harm in keeping it, we still have
a long way to complete this project."

**Why:** the project is unfinished, and a spec's design system, flows and
microcopy stay useful long after its architecture section goes wrong. Deleting
the whole file to remove the wrong half loses the good half too.

**How to apply:** don't propose deletion for a doc with salvageable content.
Propose (1) moving it out of `src/` into `docs/`, and (2) prepending a status
header splitting "still authoritative" from "superseded", with evidence for
each. Reserve deletion for files with genuinely no project content — the
scaffold's blank `Guidelines.md` template was a fair delete and he did not
object. Distinguish dead *code* (delete freely once proven unreferenced) from
stale *docs* (relocate and annotate). See [[verify-shipped-bundle-not-source]].
