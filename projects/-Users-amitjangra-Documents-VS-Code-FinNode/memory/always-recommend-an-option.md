---
name: always-recommend-an-option
description: When presenting options or asking the user to choose, always name a recommendation and say why, including why not the others.
metadata:
  type: feedback
---

> **Governed globally by `~/.claude/STANDARDS.md` § *When something is unclear*.** This
> copy is kept for its dated evidence, not as a second source of truth. Marked 2026-09-20
> during the FinNode pass.

When offering the user a choice, never present options neutrally. Say which one I recommend,
why it is right, and why each of the others is not.

**Why:** the user asked for this directly on 2026-09-15 — "always suggest which option and
why. why not others" — after being handed two balanced options with no recommendation. A
neutral menu pushes the reasoning work back onto them when I already did the reading.

**How to apply:** put the recommended option first and label it "(Recommended)", and put the
comparative reasoning in the reply text rather than only in the option descriptions. Applies
to AskUserQuestion prompts and to plain prose where I lay out alternatives.
