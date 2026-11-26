---
name: planning
description: Plan any change bigger than the small approved change — pick the kind (new
  project, feature, bug fix, documentation, Claude Setup change, research or business) and
  the depth, then read only that kind's guide. Use before writing any plan, judging an
  idea, or asking the first question on research or a choice that needs a
  recommendation. Not for a question answered from what is already known, or the small
  approved change.
---

# Planning

This skill says what a plan holds, for any kind of work: pick the kind and the depth,
then read one guide. When to plan, the risk triggers, every gate, verification, the
retry rule and session limits stay in [STANDARDS.md § How a task runs](../../STANDARDS.md#how-a-task-runs)
and the sections it names. This file never repeats them; it points to them. It may start
one agent, `plan-reviewer`, to cross-check a plan at the size the plan's depth sets; the
agent reports and never approves.

## When to use

- **Use when:** you are about to write any plan for work bigger than the small approved change, or before you ask the first question on research or a choice that needs a recommendation — those questions follow step 4.
- **Not for:** a question answered directly from what is already known, the small approved change ([STANDARDS.md § How a task runs](../../STANDARDS.md#how-a-task-runs)), or reviewing a finished change (`change-reviewer`).

## Steps

### 1. Pick the kind of work

Pick one main kind. Then read **only** that kind's guide.

| Kind | Use when | Guide |
|---|---|---|
| New project | Nothing exists yet | `new-project.md` |
| New feature | New behaviour across several files or screens | `feature.md` (feature depth) |
| Small enhancement | A focused addition in a few files | `feature.md` (small depth) |
| Bug fix | Something works wrongly | `bug-fix.md` |
| Documentation | Writing or updating docs | `documentation.md` |
| Claude Setup change | Any change to `~/.claude` | `setup-change.md` |
| Research or business | A question to answer or a choice to make — compare options, find facts, pick a supplier or an approach — where the result is a recommendation, not a built change | `research-business.md` |

- **Anything in `~/.claude`** is a Claude Setup change, even when it is only docs.
- **Work that mixes kinds:** pick the main kind and add only the lines another kind
  needs. Never write two plans.
- **Refactoring:** use the feature guide, add "behaviour must not change", and run the
  same checks before and after.
- **Data migration:** always deep — backup, dry run and undo are in the plan.
- **Dependency or config change inside a project:** that project's kind (usually small
  enhancement or bug fix) plus the risk check. Not the Setup guide.

You can tell this step worked when one guide is named and no other guide was opened.

### 2. Pick the depth

- Light or deep: [STANDARDS.md § How a task runs](../../STANDARDS.md#how-a-task-runs) (the risk check, and step 3).
- Risk changes the depth, never the kind. A risky small enhancement stays a small
  enhancement; it is just planned deeply.
- Depth follows the job, not the words used. "Plan this" does not by itself mean deep.
- **Money** is a risk trigger even when the work only calculates or shows amounts — a
  total, a split, a price. "Real currency" means a currency such as ₹ or $, not points,
  even in test data. Comparing prices, including working out totals to compare, is not
  money work until something is spent, signed or committed.
- **Money amounts are in INR (₹) unless Amit names another currency,** or the project's
  own rules set one.
- **The review size follows the depth:** self-check, short review or full review, as
  set in [cross-check.md § Review sizes](../../harness/cross-check.md#review-sizes).
  Name the size in the plan, and again in the request to the reviewer.

**Deep adds:** the guide's "add when needed" lines that apply · a technical design
section if step 5 says so · a full review ([cross-check.md § Review sizes](../../harness/cross-check.md#review-sizes))
· the risk table in step 7 · undo steps for anything hard to reverse.

You can tell this step worked when the plan names one depth and one review size.

### 3. Tell Amit before substantial work

What to tell Amit, and when, is in [STANDARDS.md § How a task runs](../../STANDARDS.md#how-a-task-runs),
step 3. Use the kind and depth picked in steps 1 and 2.

You can tell this step worked when Amit has that note before the substantial work starts.

### 4. Every plan, whatever the kind

Gather the need:

- **The common core** from [STANDARDS.md § How a task runs](../../STANDARDS.md#how-a-task-runs),
  step 3: the goal in Amit's words, a success measure, and a quick check on real data.
  Not repeated here.
- **One real example.** While gathering the need, ask for one real case that shows the
  problem or the wanted result: the input that fails, the record that looks wrong, the
  screen, the quote. It anchors the plan to something checkable. A saved plan uses
  made-up data in its place when the real case is private.
- **Answer from the files first.** Before asking Amit anything, answer what the files,
  code and records can. Ask only what they cannot — at most two or three questions, each
  with a recommendation ([STANDARDS.md § When something is unclear](../../STANDARDS.md#when-something-is-unclear)).

Write the plan:

- **The guide's minimum plan**, then only the "add when needed" lines that apply.
- **Evidence for every claim.** Each fact the plan rests on — a file, a function, a
  figure, how something behaves today — says where it was checked. A claim nobody
  checked is an `Open:` item, not a fact.
- **Open items.** Anything unknown is written as `Open: …`. Never guess a fact, a file
  path or a reproduction step to fill a gap. An open item that changes the approach
  blocks approval until it is answered.
- **Proving a negative.** "Nothing else uses it", "this cannot happen" and "no other
  caller" are the claims most often wrong. Confirm each with a second check done a
  different way — for example a text search and then reading the list of callers. If it
  cannot be confirmed twice, keep it as a risk, not a fact. List the concerns you checked
  and dropped, each with the evidence that cleared it.
- **Deferrals.** Anything the plan leaves for later ("decide during the build", "to be
  confirmed", "follow the existing one") names who fills it, when, and what checks the
  result against the goal. A deferral nothing re-checks is a gap in the plan.

Check it before showing it:

- **Rules check.** Check the plan against `STANDARDS.md` and the project's own
  `CLAUDE.md` and rules. Say if something conflicts. When the plan and a rule disagree,
  the rule wins; the plan says so and names the rule.
- **Self-check.** Read the plan once more: every scenario has a check, every step is in
  scope, and nothing contradicts the goal.
- **Final-state pass.** Remove thinking aloud ("actually", "on second thought"), checks
  pushed to whoever builds it ("verify before writing", "check whether it exists" — do
  them now, or write `Open:`), and hedges that hide an open question ("should be",
  "probably" — turn each into a checked fact or an `Open:` item). The reader gets the
  decision, not the journey.
- **Applying a reviewer's fix.** Re-check each fix against the real source before writing
  it into the plan. A reviewer can be wrong too, and an unchecked fix brings back the
  error the review was meant to catch.
- **No sensitive data in a plan** — [DOCUMENTATION-STANDARD.md § Data and security](../../DOCUMENTATION-STANDARD.md#data-and-security).
  Project data-safety rules stay in each project's rules; follow them.

You can tell this step worked when every claim has its source or an `Open:` line, and the
final-state pass found nothing left to remove.

### 5. Technical design (only when needed)

Add a short design section only if one of these applies: the change crosses several
parts or adds a new pattern · a new library, service or data model change · security,
performance or migration difficulty · a choice that is better made before coding.

Then write: the parts affected · interfaces and data · the approach · the main
alternatives and why not · the risks. Small, plain work needs no separate design.

- **Read before you rank.** Before calling an option "smallest", "cleanest" or "least
  risk", read the files each option touches and say what changes in each. A ranking you
  have not checked is a guess. If a file cannot be read, say so in that option's row.
- **Read the failure path of code outside the plan.** When the plan hands a value or a
  call to a library, framework or shared service, read what that code does on failure,
  to the end: what it does on error, what state it keeps, and for how long. Say how often
  the failure is expected and what it costs. A timeout set at the slowest normal request
  trips on normal traffic.

### 6. Test planning

- Base testing on risk and the acceptance checks, not on a fixed scale.
- Name each check and what it proves. Use only checks the project's rules allow.
- Which checks must run, and how to report a failed one: [STANDARDS.md § Before calling anything done](../../STANDARDS.md#before-calling-anything-done)
  and [§ Evidence, not assumption](../../STANDARDS.md#evidence-not-assumption).
- A UI check only when the change or the bug is visible in the UI.

### 7. Splitting into work packages

- Split large work into packages that can each be verified alone. Put the first usable
  result first.
- For each package: scope · rough main-context tokens · done when.
- **Order by dependency, then bring the risk forward.** When the riskiest package cannot
  move early, answer its question early instead: a short trial, a timing on real data, a
  check against the source. Write the answer into the plan so the later package starts
  with it settled.
- **Checkpoints where the plan's shape changes:** at the end of a phase, after a pilot
  and before copying it, and before anything hard to undo — not every few steps.
- **Deep plans: a risk table.** One row per thing that could make the plan wrong — an
  assumption, a limit, a dependency that could move — with its impact, how likely it is,
  and the mitigation, placed in a named package. A mitigation that sits in no package is
  not a mitigation.
- Session limits, and when not to start a package: [STANDARDS.md § Plan before building](../../STANDARDS.md#plan-before-building).

You can tell this step worked when every package has its scope, tokens and done-when
line, and every mitigation sits in a package.

### 8. Where the plan is saved

| Work | Plan lives in | Handoff |
|---|---|---|
| Claude Setup | A section in `harness/doc-structure-plan.md` | `.claude/current-task.md` points to it |
| Project work over more than one session | The project's existing plan or roadmap section, linked from the roadmap row — never crammed into one cell | The project's `.claude/current-task.md` points to it |
| Work finished in one session | Chat is enough | — |
| VT (Vthru Customer app) | Local only, hidden by `.git/info/exclude`; nothing goes to GitLab | Local |

- **A saved plan runs cold.** Write it for a fresh session that has none of this chat.
  It opens with a *Start cold* block: branch and commit, files to read first, decisions
  already taken, open items, blockers.
- **Cite so it survives:** a path plus a symbol or heading — `due.py` `is_overdue`,
  `STANDARDS.md` § *Git* — with a line number only as a hint. Lines move between
  sessions. Chat replies keep `path:line`.

`current-task.md` stays a short handoff with the open questions needed to continue. It
is never a copy of the plan.

You can tell this step worked when the plan sits in its home from the table and the
handoff points to it.

### 9. Idea assessment (only when Amit asks whether to do something)

A short section, not a plan:

- The idea, and the problem it solves
- What already exists that covers it, fully or partly
- For a new tool, repo, skill or plugin: network calls, telemetry, licence and cost
  ([STANDARDS.md § Load a capability only when the task needs it](../../STANDARDS.md#load-a-capability-only-when-the-task-needs-it))
- **Decision:** go · needs more information (name what is missing) · do not do (say why)

A "go" is a recommendation. Building it still needs a plan and Amit's approval.

## Example

Made-up data. A light bug-fix plan, from request to review size:

    Request: "Tasks due tomorrow show as overdue."
    Step 1, kind: bug fix (something works wrongly) → read bug-fix.md only.
    Step 2, depth: light — no risk trigger; a first look finds the cause. Review: self-check.
    Step 4, real example: "Renew passport", due 14-03, shown overdue on 13-03 at 23:30.
    Cause (confirmed by reading due.py is_overdue): it compares the due date with
      today's date in UTC, not local time.
    Fix: due.py only. Check: a test with that task fails before the fix and passes
      after; the list shows it as due tomorrow.
    Final-state pass: "should be a timezone thing" replaced by the confirmed cause.

## Self-check

**Full check** (used most days):
- Each step's result matches the request: one kind, one depth, one guide read, a review size named.
- Every file, number and claim in the plan is checked against its source, or marked `Open:`.
- No gate was skipped: telling Amit, approval, the cross-check its size calls for.
- Say what was not checked.

## Related

- [STANDARDS.md § How a task runs](../../STANDARDS.md#how-a-task-runs) — when to plan, the risk triggers, every gate.
- [harness/cross-check.md](../../harness/cross-check.md) — review sizes and the reviewer.
- [agents/plan-reviewer.md](../../agents/plan-reviewer.md) — the agent that cross-checks a plan.
- [DOCUMENTATION-STANDARD.md § Data and security](../../DOCUMENTATION-STANDARD.md#data-and-security) — what never goes in a plan.
- The guides, one per kind: `new-project.md` · `feature.md` · `bug-fix.md` · `documentation.md` · `setup-change.md` · `research-business.md`.
