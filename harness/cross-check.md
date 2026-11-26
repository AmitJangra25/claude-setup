# Cross-check

Purpose: When a second agent reviews a plan or a diff, and how that work is shown.
Audience: Claude and Amit.
Read when: A cross-check or a significant workload is about to run.
Owner: Setup sessions (changes are Amit's decision).
Update rule: When the procedure changes. Replace superseded text; history goes to a record.
Related: `STANDARDS.md` § *How a task runs* · `harness/status.md` · `harness/models.md`
Status: in force
Last reviewed: 26-11-2026

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
   be expensive to undo; a feature-depth plan with no risk trigger (short review, below).
   **One agent.** A second only if the first leaves a serious conflict unresolved.
3. **Human approval** — destructive, global, sensitive-data, commit or push, unclear
   intent, possible data loss. An agent's "looks right" never replaces it.

## Review sizes

Every plan gets one of three review sizes, set by its depth. The planning skill names the
size in the plan; the request to the reviewer names it again.

| Size | Which plans | Level | Reviewer | Report limit |
|---|---|---|---|---|
| Self-check | Light plan, no risk trigger, not feature depth | 1 | None; the author checks | — |
| Short review | Feature-depth plan, no risk trigger | 2 | `plan-reviewer` on Sonnet, passed in the agent call | About 300 words |
| Full review | Any risk trigger, any other level-2 reason above, or a new project | 2 | `plan-reviewer` on Opus | About 500 words |

- **A self-check can never cover** permissions, hooks, settings, secrets, deleting or
  other destructive actions, or a rule file. Each of those is a risk trigger, so it is a
  full review.
- **Every request names its size.** If it does not, the reviewer uses the full-review
  limit and says so.
- **When unsure between two sizes, take the bigger one.**
- Sizes apply to plans. A finished change is reviewed by `change-reviewer` (see *The
  reviewer*).

## Deletion

The rule is `STANDARDS.md` step 4. Applying it: the two methods are independent ways of
confirming the target — for example a set comparison and a literal search, re-run
through `rtk proxy`. The agent review is extra; it does not count as one of the two.
Cross-check triggers in full are under *Levels*, Level 2.

## The reviewer

A fresh named reviewer, not a fork, so it does not inherit the author's reasoning. Both
are in `agents/`:

- **`plan-reviewer`** for a plan, at the plan's review size (*Review sizes*): Sonnet
  for a short review, Opus for a full review. The request gives the size, the goal, the
  success measure and the plan.
- **`change-reviewer`** for a diff or finished change: Sonnet; the requesting session
  passes Opus for security or data. It keeps its own word limit until its Phase 14
  rewrite.

It inspects the proposal and the real files. `plan-reviewer` reports only in its
skeleton (`agents/plan-reviewer.md` § *Report*); `change-reviewer` reports:

- facts verified, with file and line; assumptions made;
- what already covers this, and any duplication;
- source-of-truth conflicts; stale statements;
- context and maintenance cost; a smaller or safer alternative;
- project-boundary problems; missing tests or gates;
- keep / change / defer / reject.

**Checking a `plan-reviewer` report** (this agent only). The requesting session saves
a working copy of the report and runs `wc -w` on it: Claude Setup uses `harness/drafts/`;
a project uses its git-ignored scratch path. The copy is kept until the check ends; it is
not a record. The session checks the report against the review size named in the
request: the word limit in *Review sizes* (the stated 300 or 500 is the limit for this
check), and the skeleton in `agents/plan-reviewer.md` § *Report* — only skeleton lines, in order, no more
numbered findings or "Other" lines than the skeleton has, each slot one short clause. If
either fails, it sends the same report back once to the same reviewer, with the word
count against the limit and each shape break, and asks for the report cut to fit: same
verdict, no new findings. If the retry passes, use it. If it still fails, or the reviewer
can no longer be reached, accept the report, record the overrun, and stop; there is no
second retry.

The reviewer must not edit, commit, push, approve, or open a project folder from a setup session.
The named reviewers have no write, edit, shell or agent-starting tool (tested 24-11-2026,
R1–R2): that limits what they can change, not what they can read. That they start without
the author’s context is supported by test R3, not proven. Give it its review size (or,
for `change-reviewer`, a word limit) and tell it which facts are already verified, so it
does not re-check them.

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
