---
name: planning
description: How to plan any change that is more than the small approved change in STANDARDS.md — pick the kind of work (new project, feature or small enhancement, bug fix, documentation, Claude Setup change), pick the depth (light, or deep when a risk trigger applies), tell Amit the judgement, then read only the one guide for that kind. Also covers technical design, test planning, splitting work into packages, saved plans and idea assessment. Use before writing any plan; not for questions or the small approved change.
---

# Planning

This skill says what a plan holds. The rules about *when* to plan, the risk triggers,
every gate, verification, the retry rule and session limits stay in `STANDARDS.md`.
This file never repeats them; it points to them.

## 1. Pick the kind of work

Pick one main kind. Then read **only** that kind's guide.

| Kind | Use when | Guide |
|---|---|---|
| New project | Nothing exists yet | `new-project.md` |
| New feature | New behaviour across several files or screens | `feature.md` (feature depth) |
| Small enhancement | A focused addition in a few files | `feature.md` (small depth) |
| Bug fix | Something works wrongly | `bug-fix.md` |
| Documentation | Writing or updating docs | `documentation.md` |
| Claude Setup change | Any change to `~/.claude` | `setup-change.md` |

- **Anything in `~/.claude`** is a Claude Setup change, even when it is only docs.
- **Work that mixes kinds:** pick the main kind and add only the lines another kind
  needs. Never write two plans.
- **Refactoring:** use the feature guide, add "behaviour must not change", and run the
  same checks before and after.
- **Data migration:** always deep — backup, dry run and undo are in the plan.
- **Dependency or config change inside a project:** that project's kind (usually small
  enhancement or bug fix) plus the risk check. Not the Setup guide.

## 2. Pick the depth

- Light or deep: `STANDARDS.md` § *How a task runs* (the risk check, and step 3).
- Risk changes the depth, never the kind. A risky small enhancement stays a small
  enhancement; it is just planned deeply.
- Depth follows the job, not the words used. "Plan this" does not by itself mean deep.

**Deep adds:** the guide's "add when needed" lines that apply · a technical design
section if section 5 says so · a cross-check when `harness/cross-check.md` level 2 calls for one · undo
steps for anything hard to reverse.

## 3. Tell Amit before substantial work

What to tell Amit, and when, is in `STANDARDS.md` § *How a task runs*, step 3. Use the
kind and depth picked in sections 1 and 2.

## 4. Every plan, whatever the kind

- **The common core** from `STANDARDS.md` § *How a task runs*, step 3: the goal in
  Amit's words, a success measure, and a quick check on real data. Not repeated here.
- **The guide's minimum plan**, then only the "add when needed" lines that apply.
- **Open items.** Anything unknown is written as `Open: …`. Never guess a fact, a file
  path or a reproduction step to fill a gap. An open item that changes the approach
  blocks approval until it is answered. How to ask: `STANDARDS.md` § *When something
  is unclear*.
- **Rules check.** Before showing the plan, check it against `STANDARDS.md` and the
  project's own `CLAUDE.md` and rules. Say if something conflicts.
- **Self-check.** Read the plan once more: every scenario has a check, every step is in
  scope, and nothing contradicts the goal.
- **No sensitive data in a plan** — `DOCUMENTATION-STANDARD.md` § *Data and security*.
  Project data-safety rules stay in each project's rules; follow them.

## 5. Technical design (only when needed)

Add a short design section only if one of these applies: the change crosses several
parts or adds a new pattern · a new library, service or data model change · security,
performance or migration difficulty · a choice that is better made before coding.

Then write: the parts affected · interfaces and data · the approach · the main
alternatives and why not · the risks. Small, plain work needs no separate design.

## 6. Test planning

- Base testing on risk and the acceptance checks, not on a fixed scale.
- Name each check and what it proves. Use only checks the project's rules allow.
- Which checks must run, and how to report a failed one: `STANDARDS.md` § *Before
  calling anything done* and § *Evidence, not assumption*.
- A UI check only when the change or the bug is visible in the UI.

## 7. Splitting into work packages

- Split large work into packages that can each be verified alone. Put the first usable
  result first.
- For each package: scope · rough main-context tokens · done when.
- Session limits, and when not to start a package: `STANDARDS.md` § *Plan before
  building*.

## 8. Where the plan is saved

| Work | Plan lives in | Handoff |
|---|---|---|
| Claude Setup | A section in `harness/doc-structure-plan.md` | `.claude/current-task.md` points to it |
| Project work over more than one session | The project's existing plan or roadmap section, linked from the roadmap row — never crammed into one cell | The project's `.claude/current-task.md` points to it |
| Work finished in one session | Chat is enough | — |
| VT (Vthru Customer app) | Local only, hidden by `.git/info/exclude`; nothing goes to GitLab | Local |

`current-task.md` stays a short handoff with the open questions needed to continue. It
is never a copy of the plan.

## 9. Idea assessment (only when Amit asks whether to do something)

A short section, not a plan:

- The idea, and the problem it solves
- What already exists that covers it, fully or partly
- For a new tool, repo, skill or plugin: network calls, telemetry, licence and cost
  (`STANDARDS.md` § *Load a capability only when the task needs it*)
- **Decision:** go · needs more information (name what is missing) · do not do (say why)

A "go" is a recommendation. Building it still needs a plan and Amit's approval.
