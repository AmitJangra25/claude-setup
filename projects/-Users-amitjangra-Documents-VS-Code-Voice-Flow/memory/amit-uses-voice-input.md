---
name: amit-uses-voice-input
description: "Amit often dictates prompts, so read through transcription errors instead of asking what he meant"
metadata: 
  node_type: memory
  type: user
  originSessionId: b8ccd4ee-2a77-4546-b1c9-35482823cafc
  modified: 2026-10-11T09:18:58.094Z
---


> **Now global** — `STANDARDS.md` § When something is unclear. The global copy governs; this file is kept for the evidence behind the rule.
Amit frequently uses voice input for prompts (he dictates into the terminal —
fitting, given [[dictation-is-the-primary-product]] and that this project *is* a
dictation app). Expect homophone and near-miss transcription errors in his
messages, and read through them rather than querying them.

Real examples from 2026-08-16: "entropic" = Anthropic, "miners"/"majors" =
minors/majors, "modals" = models, "pachages" = packages, "respactive" =
respective. He confirmed this explicitly: *"ignore typo im using voice mode for
input."*

**Why:** asking "did you mean X?" on an obvious transcription slip wastes a turn
on something he already knows is a typo, and he works in short, fast
instructions where that friction is disproportionate.

**How to apply:** interpret the intent and carry on without commenting on the
error. Only ask when the ambiguity genuinely changes the work — e.g. "ok" alone
after a two-option question, where the answer determines whether you act or
wait. Note that a later typed message overrides an earlier picker selection: he
answered a question with "wait" and then immediately typed "do it", and "do it"
was what he meant. See [[report-findings-dont-chase-them]] for the related
preference toward terse output.
