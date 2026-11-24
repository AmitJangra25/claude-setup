# Cross-check

Purpose: When a second agent reviews a plan or a diff, and how that work is shown.
Audience: Claude and Amit.
Read when: A cross-check or a significant workload is about to run.
Owner: Setup sessions (changes are Amit's decision).
Update rule: When the procedure changes. Replace superseded text; history goes to a record.
Related: `STANDARDS.md` § *How a task runs* · `harness/status.md` · `harness/models.md`
Status: in force
Last reviewed: 11-11-2026

---

## Summary

When a second agent reviews a plan or a diff, and how that is shown. Read only when a
cross-check or a significant workload is happening. The one-line rules are in
`STANDARDS.md`; this is the procedure behind them.

## Levels — the smallest that is enough

0. **No check** — typo, formatting, a path or Git check, an obvious one-file edit.
1. **Self-check** — normal work: read the target and what references it, check the diff.
2. **Agent cross-check** — only for: a global rule or setting; harness or structure;
   cross-project work; deletion, migration or broad cleanup; conflicting documents; an
   unclear source of truth; a high-risk or ambiguous call; likely context or
   maintenance growth; an unresolved disagreement with Amit; a wrong guess that would
   be expensive to undo. **One agent.** A second only if the first leaves a serious
   conflict unresolved.
3. **Human approval** — destructive, global, sensitive-data, commit or push, unclear
   intent, possible data loss. An agent's "looks right" never replaces it.

## Deletion

The rule is `STANDARDS.md` step 4. Applying it: the two methods are independent ways of
confirming the target — for example a set comparison and a literal search, re-run
through `rtk proxy`. The agent review is extra; it does not count as one of the two.
Cross-check triggers in full are under *Levels*, Level 2.

## The reviewer

A fresh named reviewer, not a fork, so it does not inherit the author's reasoning:
`change-reviewer` for a diff or finished change (Sonnet; the requesting session passes
Opus for security or data), `plan-reviewer` for a plan (Opus). Both are in `agents/`.
Opus for design and structure; a smaller model only for narrow fact checks.
It inspects the proposal and the real files, and reports:

- facts verified, with file and line; assumptions made;
- what already covers this, and any duplication;
- source-of-truth conflicts; stale statements;
- context and maintenance cost; a smaller or safer alternative;
- project-boundary problems; missing tests or gates;
- keep / change / defer / reject.

It must not edit, commit, push, approve, or open a project folder from a setup session.
**Read-only is enforced by its instructions, not by a lock** — the agent still has a
shell. Give it a word limit and tell it which facts are already verified, so it does not
re-check them.

## Recording

One line next to the item in `harness/status.md`: date, model, verdict, issues found,
measured cost. No separate report file unless Amit asks for one.

## Claude Setup cross-check

Moved word for word from `STANDARDS.md` § *Claude Setup* (05-11-2026). "It" in "departs
from it" is Claude Setup; "step 4" is `STANDARDS.md` § *How a task runs*; "I" is Amit.

A **Claude Setup cross-check** (not the agent cross-check
in step 4) reports, in chat only, where the current project departs from it: structure,
docs, backlog, handoff, task tracking, process, configuration, rules. It never covers cloud
providers, API keys or app cloud setup, and writes nothing unless I approve. A file it
can't read is reported as unavailable.

## Markers

Shown by the main session. Not for ordinary reads and commands.

- ⚪ NO CROSS-CHECK — low-risk task.
- 🔵 SELF-CHECK — no second agent.
- 🟡 CROSS-CHECK STARTED — reason; model; estimated cost.
- 🟢 CROSS-CHECK DONE — result; measured cost if available.
- 🔴 APPROVAL REQUIRED — reason.
- ⚠️ TOKEN WARNING — extra activity; expected cost; alternative.

Numbers are **Measured** (`/context all`, or the agent-finished figure), **Estimated**
(before the work), or **Unknown** (the main session's own use between measurements).
Never invent one. No ANSI colours; the icons carry the meaning.

## Related

- `STANDARDS.md` § *How a task runs*, step 4 — the one-line rule this procedure serves.
- `harness/status.md` — where each cross-check result is recorded (*Recording*).
