---
name: fix-root-cause-flag-workarounds
description: Always label a fix as workaround vs root-cause fix; Amit rejects patchwork and wants the underlying gap closed
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 0ee319d9-cef0-4692-89e3-f4915777babe
  modified: 2026-09-09T12:17:31.733Z
---


> **Now global** — `STANDARDS.md` § Fix the cause, not the symptom. The global copy governs; this file is kept for the evidence behind the rule.
Say explicitly whether a proposed fix is a **workaround** or a **root-cause
fix**. Amit will reject patchwork once he spots it, and he spots it. Prefer
closing the underlying gap even when it is more work.

Also: one fix must not create three new issues or break three working things.
Verify the blast radius before proposing, and say what the change cannot affect.

**Why:** On 9 Sep 2026 I proposed three fixes for his Test 23 output — add words
to the Dictionary, build an Agent, change model. He pushed back that all three
were patchwork, and he was right on two. The Dictionary has a hard character
budget so it cannot scale past a few product names; the Agent was a workaround
for a missing capability. The real gap was that `StructureShape` had only
`'prose' | 'list'` and the shape he wanted did not exist. Suggesting the
workarounds first cost trust and two rounds of conversation.

**How to apply:** Before proposing, ask "does this close the gap or route around
it?" If routing around, say so in those words and name what the root fix would
be, so he can choose. Never present a workaround as the fix.

Related: [[report-findings-dont-chase-them]],
[[verify-shipped-bundle-not-source]]
