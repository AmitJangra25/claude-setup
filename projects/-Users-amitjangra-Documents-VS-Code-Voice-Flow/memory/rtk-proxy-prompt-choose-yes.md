---
name: rtk-proxy-prompt-choose-yes
description: "When an rtk proxy command may prompt, tell Amit to choose \"Yes\", never \"Don't ask again\" — that click offers to save the blanket Bash(rtk proxy *) rule"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 8b0b7a3d-6fb6-457d-a137-36ebe49da902
  modified: 2026-10-11T11:09:27.061Z
---

Whenever a command starting with `rtk proxy` might bring up a permission box, the
explanation before it says: **choose "Yes", never "Don't ask again".**

**Why:** "Don't ask again" on any `rtk proxy …` prompt offers to save `Bash(rtk proxy *)`
into `.claude/settings.local.json`, which lets almost any command run unprompted.
That rule was removed on 2026-09-20, came back and was removed on 09-10-2026, and was
back again and removed on 11-10-2026 (Amit's approval). Whether a click is what re-adds
it is still unproven (`~/.claude/baselines/global-open-tests.md` item 2); this is
the cheap guard while it stays unproven.

**How to apply:** add that one sentence to the permission explanation for any
`rtk proxy` command not already allowed globally (`cat`, `find`, `grep`, `ls` are). Never
re-add the rule or propose it. If it is found back, report it, don't remove it silently.
See [[cannot-see-permission-prompts]].
