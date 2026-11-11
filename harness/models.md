# Which model — detail

Purpose: Which model for which job, and when to switch or use a helper.
Audience: Claude and Amit.
Read when: Choosing a model for a session or a helper.
Owner: Setup sessions (changes are Amit's decision).
Update rule: When the model rule changes. Replace superseded text; history goes to a record.
Related: `STANDARDS.md` § *Which model* · `harness/cross-check.md` · `OLLAMA.md`
Status: in force
Last reviewed: 11-11-2026

---

## Summary

The detail behind `STANDARDS.md` § *Which model*, which keeps the short rule. Read this
when choosing a model for a session or a helper. Table agreed with Amit 05-11-2026
(B1; original text: `baselines/backlog-log-11-11-2026.md` § *Item 1 in full*).

I pick the session's model with `/model` when a task starts; it does not change mid-task
unless I ask. When you recommend one, or choose a helper's, pick the model that can do the
task reliably at the quality it needs — not the cheapest, and not the strongest by habit.

## Model table

| Model | Use for | Never for |
|---|---|---|
| **Opus** | Setup changes (rules, global standards, settings, permissions, hooks), secrets, security; data-loss or hard-to-undo work; an unclear goal, cause or bug; an open design or architecture; new projects and big plans; an approved plan whose build is still uncertain or broad; consequential changes across more than one project; review of security-sensitive or hard-to-undo changes | — |
| **Sonnet** | Clear, bounded work with a known approach: reads, comparisons, explanations; building approved plans, long ones too if not complex; clear bugs (a reproduced failure with a clear message); tests; code review; small specified edits; doc and status updates, including docs that need judgement; commit and PR text; search helpers that judge code. A read-only comparison across projects is bounded work and does not by itself need Opus. Large codebase reading and impact analysis: Sonnet first, Opus if unclear or risky | When the task turns unclear, risky or security-related: stop and suggest Opus |
| **Haiku** | Only if cost-effective, as a helper or a fresh tiny session — a very small, low-risk, single-step task with a clear answer: status checks, finding files, counts, summaries, formatting, commit *messages* (not the commit itself), find-only search helpers | Permissions, security, global rules, settings, hooks, secrets, data-loss risk, multi-step work |
| **Haiku or a local command** (no model switch) | Simple document conversion and reading prep | — |

Other models (such as Fable) only with a stated reason and a checked fit for the job.

## When to pick and switch

**When to pick and when to switch.** Choose the model at session start, by the task. When
the task ends, update the handoff note. Prefer switching models between sessions using
that note; with `/model` mid-chat only under ~27k (a switch re-reads the whole chat
uncached).

## The 27k test

**Switch or helper — the 27k test** (Amit, 05-11-2026): a helper costs ~27k to start; a
`/model` switch costs about the whole chat so far. Switch only if the chat is under ~27k;
otherwise use an independent helper (e.g. Opus finds the root cause, the session applies
the fix). The helper's brief must include the exact failure.

## Cost rule

**Cost rule:** before suggesting a switch or helper, compare start-up plus remaining work
against continuing here, say the numbers, and don't suggest it if it costs more than it
saves.

## When a model is struggling

Start on Opus when the task calls for it, not on Sonnet to prove it. If the model is
struggling — the cause still unknown after a focused attempt, or the task harder or
riskier than expected — stop, say why, and recommend a different one; do not repeat
attempts that are not converging. If the session is on the wrong model, say so before
starting and wait; never switch it yourself.

## Helpers in plans

A plan names the model and why, for this session and any helper agent. A helper's model
is stated in one line and fits its job: a lighter one for a narrow lookup or bounded
check, the stronger one for independent review of sensitive or design-level work. A
trivial lookup needs no separate plan. Local models: `OLLAMA.md`.

## Related

- `STANDARDS.md` § *Which model* — the short rule, loaded every turn.
- `harness/cross-check.md` § *The reviewer* — which model reviews.
