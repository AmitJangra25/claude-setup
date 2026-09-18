---
name: history-must-be-unlimited
description: Uncapped dictation history is the goal; 5000 is the agreed interim, and truly unlimited is deferred work
metadata:
  type: project
---

Amit's position, stated 2026-08-18: dictation history should not be capped —
the data lives in the app's own folder on his Mac, so no server, quota or cost
justifies a ceiling, and losing old entries destroys the raw transcripts that
diagnosis depends on.

**What was agreed, after weighing it:** raise the cap to **5000** now
(`USER_HISTORY_LIMIT`, was 50) and make Settings honest about it. **Truly
uncapped is deferred, not rejected** — he wants it as its own piece of work so
the privacy question gets weighed properly (every transcript ever dictated,
sitting on disk in plain JSON) and the storage change isn't rushed.

**Why:** the 50 came from the initial commit as a scaffold default and silently
contradicted the retention setting, which offers "Forever" and defaults to it.

**How to apply:** don't treat 5000 as a tuning knob to lower when something gets
slow — fix the slowness. Two traps already hit: spreading the entry list into
`Math.max(...)` throws once it's large, and the History page staggered every
row's animation by `i * 0.05`s. Before proposing uncapped, have an answer for
`preload.cjs` parsing `history.json` synchronously at startup. He also has
retention set to 90 days, so a cap change alone does not stop age-pruning.
See [[verify-shipped-bundle-not-source]] — verify in the installed .app.
