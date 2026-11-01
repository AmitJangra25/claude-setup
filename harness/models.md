# Which model — detail

Moved word for word from `STANDARDS.md` § *Which model* on 01-11-2026 to lower the
starting token count. The short rule stays in `STANDARDS.md`; read this when choosing a
model for a session or a helper. Haiku line added 01-11-2026.

I pick the session's model with `/model` when a task starts; it does not change mid-task
unless I ask. When you recommend one, or choose a helper's, pick the model that can do the
task reliably at the quality it needs — not the cheapest, and not the strongest by habit.

- **Sonnet**: clear, bounded work with a known approach — reads, comparisons,
  explanations, summaries, small specified edits, doc and status updates, a reproduced
  failure with a clear message, an approved plan whose implementation is bounded and well
  understood.
- **Opus**: an unclear goal or cause, an open design, an approved plan whose implementation
  is still uncertain or broad, or a mistake that would be costly or hard to undo — changes
  to permissions, hooks, global rules, settings or secrets; data-loss or security risk;
  consequential changes across more than one project. A read-only comparison across
  projects is bounded work and does not by itself need Opus.

Start on Opus when the task calls for it, not on Sonnet to prove it. If the model is
struggling — the cause still unknown after a focused attempt, or the task harder or
riskier than expected — stop, say why, and recommend a different one; do not repeat
attempts that are not converging. If the session is on the wrong model, say so before
starting and wait; never switch it yourself.

A plan names the model and why, for this session and any helper agent. A helper's model
is stated in one line and fits its job: a lighter one for a narrow lookup or bounded
check, the stronger one for independent review of sensitive or design-level work. A
trivial lookup needs no separate plan. Local models: `OLLAMA.md`.

- **Haiku**: a very small, low-risk, single-step helper task with a clear answer — a
  lookup, a count, finding a file. Never permissions, security, global rules, settings,
  secrets, data-loss risk or multi-step work.

Other models (such as Fable) only with a stated reason and a checked fit for the job.
