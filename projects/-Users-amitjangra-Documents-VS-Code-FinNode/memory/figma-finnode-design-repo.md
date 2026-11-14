---
name: figma-finnode-design-repo
description: "The FinNode Figma Make design lives in a private GitHub repo, AmitJangra25/Figma_FinNode"
metadata:
  node_type: memory
  type: reference
  originSessionId: bb4feb18-88a7-4c27-9799-c07407dfd487
  modified: 2026-11-13T09:36:00.434Z
---

The Figma Make design for FinNode is pushed to a **private** GitHub repo:
https://github.com/AmitJangra25/Figma_FinNode

It is React + TypeScript + Tailwind, the same shape as the older export already
committed at `docs/Design/src/` in the FinNode repo. Nothing in it compiles into the
Android app — it is read for layout, spacing, colour, copy and interaction, then
rebuilt in Compose.

`gh` on this machine is authenticated as AmitJangra25 with `repo` scope, so the
private repo can be cloned directly. **Do not make it public.** Clone it to a scratch
folder outside FinNode — cloning inside puts a second repo in the working tree.

As of 2026-10-06 it had not been cloned or read. See `docs/ROADMAP.md` T3.
