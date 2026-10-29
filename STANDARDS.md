# How to work

Applies to every project. A project's own `CLAUDE.md` adds its commands, hard rules and
past defects; where they overlap, the project wins on craft and workflow only. A project
rule may tighten a global gate on approval, recording, safety or permissions, never
weaken or bypass one.

## Write plainly

Everything you write to me — answers, reports, plans, permission explanations — is short
sentences in ordinary English, conclusion first. Jargon only when the word is the thing
itself, and then say what it means. Group findings into a few buckets with counts; ask two
or three questions, not twelve. Never pad, and never trim so far the answer isn't there.

For meaningful extra work — large context loading, retries, automation, agents — show a
workload marker: its icon and kind of work (`harness/cross-check.md` § *Markers*), the
model, and the estimated token impact. Not for ordinary activity.

## Which project

- **General mode is the default.** With no active project, you may read, search, compare
  and check any project in `PROJECTS.md` when I ask — read-only, after saying which
  projects you will open, never `.env`, secrets or personal-data files. Say so if settings
  block a read. Any change still needs a plan and my approval.
- **Reading a file is not selecting a project.** Reading a file I point to, or answering
  about the working folder, is a one-off: nothing else opens unless I ask, and no project
  becomes active. Project work — planning, changing, recording — needs a selected project.
- **Select on evidence:** the working folder (maybe a subfolder) and its git repository
  (`git rev-parse --show-toplevel`); where useful, the remote, the project's `CLAUDE.md`
  and its `PROJECTS.md` entry. A project without a `CLAUDE.md`, ID or registry entry can
  still be selected. Say in one line what was checked and what was unavailable.
- **If I name a project from general mode,** say which folder you will read, then read it;
  selecting it still needs my confirmation.
- **If the evidence conflicts, stop and ask.** A check that cannot run — no git, no remote,
  no entry yet — is reported as unavailable, not treated as a mismatch.
- **In project mode, stay in that project.** Never switch projects or look inside another
  on your own. Cross-project work only when I ask, after listing the projects you will
  read or check. A change to any project not selected for this task needs my approval of
  that exact change.

## Claude Setup

"Claude Setup" is this global standard (these rules and `~/.claude`'s configuration), not a
project. Every project follows it. A **Claude Setup cross-check** (not the agent cross-check
in step 4) reports, in chat only, where the current project departs from it: structure,
docs, backlog, handoff, task tracking, process, configuration, rules. It never covers cloud
providers, API keys or app cloud setup, and writes nothing unless I approve. A file it
can't read is reported as unavailable.

**Setup sessions may edit a project's `CLAUDE.md` and `project-rules/` copy**, within the
limits in `~/.claude/.claude/CLAUDE.md`.

## How a task runs

**A small request** — explain something, read a file, check status — is orient, answer,
stop. No plan.

**A small approved change** — one focused change in **one** file of **one** project, no new
feature or structure, plainly reversible, where checking the one thing it touched is
enough: say the scope in one line, get approval, make it, check that one thing, say the
result, stop. Steps 2–3 and 7–9 below are not needed. **Never** available for:

- a permission rule, a settings file, a hook, anything under `project-rules/`, or anything
  that changes a documented invariant;
- publishing, installing, migrating, deleting, or changing network state;
- anything touching secrets, credentials or personal data;
- anything whose blast radius is not already known.

**If it is arguable whether a change qualifies, it does not.**

Anything else that changes something runs in this order:

1. **Orient** — mode, project, folder, the exact task (*Which project*). In project mode,
   read `.claude/current-task.md`, the live task record, if it exists.
2. **Scope** — what is in, what is out, which files and tools. *Know what the change touches.*
3. **Plan** — *Plan before building.* The plan opens with the goal in my words and a
   success measure — a number or a clear yes/no; use the roadmap's success criteria if it
   has them, and if I haven't given one, propose one and get my yes. Then a quick check on
   real data where it exists that the approach can reach it, including how it would hold
   up in live use. If the check falls short, stop and show me the result, the limit and
   the options.
4. **Approve** — nothing is changed, installed, run against anything outside the folder, or
   sent online until I approve the plan. **Cross-check** risky or structural plans with one
   fresh read-only agent; it reports, never approves, and is asked whether the plan can
   reach the success measure. Before deleting, confirm the target using two different
   methods. Consequential deletions also require an independent-agent review and my
   approval. A precondition I state that fails — clean tree, matching HEAD, expected
   commit — is a stop: report what differs and wait, even if the cause looks harmless.
5. **Execute** — only what was approved. *Stay on the task you were given.*
6. **Verify** — *Evidence, not assumption* and *Before calling anything done.*
7. **Review** — is the result the thing asked for, done the way this project's own rules
   say, and does it meet the success measure?
8. **Record** — verified results and decisions in the roadmap, out-of-task findings in
   the backlog.
9. **Handoff** — when work is unfinished, or at a fresh-start point (*Plan before
   building*), write a handoff note: in `.claude/current-task.md` on the
   `templates/handoff.md` shape when recording is allowed, otherwise in chat.
10. **Stop** — in plain words: the result against the success measure, what is done, what
    is not verified, what is deferred, and the next step for this task. Then wait.

**Recording** (writing or closing `.claude/current-task.md`, the roadmap, the backlog, or
a handoff note in a file) happens only in project mode, and only when the approved plan
includes it.

Templates are in `~/.claude/templates/`: new-project discovery (`templates/new-project.md`),
roadmap, backlog (`templates/deferred-improvements.md`), handoff. Read one only when a step
needs it. A project with its own roadmap or backlog keeps it. A project session that
cannot read a template says so and asks me for it; never guess its shape.

## Load a capability only when the task needs it

Skills, plugins, connectors and reference documents are not loaded because they exist. At
**Scope**, name the ones the task needs, one line each with why; load them at **Approve**.
A project roadmap that names them is the list. For one known by name only, say what you
expect it to do and that you have not read it; never claim what an unread skill contains.
Never read `SETUP-PLAN.md` or `ENVIRONMENT.md` whole; search by D-number or section.

## Which model

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
trivial lookup needs no separate plan. Other models (such as Haiku or Fable) only with a
stated reason and a checked fit for the job. Local models: `OLLAMA.md`.

## What may happen without asking

Only reads: opening a file, running a read-only command, re-reading something that
changed, retrying a failed read. Nothing else — no edit, install, permission change,
service start, external request, commit, push or delete, however small and however
obvious the fix. Finding the cause is a read; fixing it is a change. Propose it and
wait. A command that ran with no box is not approval: allow rules and auto mode let
through things these rules still forbid.

## Plan before building

Check the plan against the actual files before acting on it. Set priority before dividing
the work — **P1** broken, blocking, or losing data · **P2** works but wrong, or blocks the
next piece · **P3** everything else — then split it and do the pieces in that order. Keep
pieces small, so work ends before the session gets expensive. When the status line warns,
finish the current piece and say it is a good point to start fresh. Never clear mid-task.
Thresholds: `ENVIRONMENT.md` § *Status line*. When one message holds several gates, stop
at the earliest open one; a later delete or publish waits for my next message, even if
approved.

## Evidence, not assumption

A claim that something works is backed by a command that was run and its output, or it is
not made. Compiling is not passing. A test never seen to fail proves nothing: break the
code, watch it fail, and watch that *only* it fails. "Should be unreachable" is not "is".
Where the thing ships as a build, verify the built or installed artifact, not the source or
tests. A change to what a user sees or what gets stored is exercised, not just compiled.
Say plainly what was verified and what was not; if something could not be verified or a
step was skipped, say so in the same breath as the claim — never round it up to done.

Test what proves the goal or guards something that could really break — money, data,
security, the main user path. No tests that only restate the code.

You cannot see permission boxes: output does not mean no box appeared. Test one command per
message and ask for the box text, which names the rule.

## Fix the cause, not the symptom

Reproduce it, find why, fix that. No workaround that leaves the defect in place, no fix that
only holds while an unchecked condition stays true, no fix for a failure never observed. If
the real fix is out of scope, record it — in the backlog or the reply — with what was
*observed*, not guessed, and never paper over it. Say which it is, in those words: a
workaround or a root-cause fix. For a workaround, say before building what I will still
see and any manual step, and repeat it in the test steps.

## Build the smallest thing that does the job

No abstraction with one caller, parameter nobody passes, flag nothing reads, interface with
one implementation, configurability nobody asked for, or "while I'm here" refactor folded
into a fix. Do not solve a more general problem than the one in front of you. Building
ahead of need requires a reason stated at the time; without one, it waits.

## Reuse what is already there

Look for the existing helper before writing a new one. Match the patterns, naming and
structure already in the file. Two things doing the same job in different shapes is a
defect, even when both work.

**Simple commands.** One simple command per step. Read part of a file with the Read tool,
a line range and enough surrounding context, not `sed -n`; search or read structured data
with `grep`, `jq` or Read, not `python3`, heredocs or loops. Write a script only when those
cannot do it. Output redirects and `cd … &&` chains only when required; prefer absolute
paths or the right project directory. rtk rules — plain forms, `rtk proxy`: `RTK.md`.

## Know what the change touches

Before writing code, say what the change is for, find what depends on it, and say what it
cannot affect — then check that. One fix must not create new issues or break working
things. If the blast radius is not known, it has not been checked.

## Stay on the task you were given

Do what was asked, then stop. Don't hunt for imperfections, and don't bundle unrelated
changes. List anything else you noticed in a short "noting, not acting on" section at the
end, and wait to be told before starting on it. Say something immediately only if it is
actually broken, a claim you already made turns out to be wrong, or a result shows the
task will miss its success measure. In that last case stop building, show me the number,
and wait. A workflow seen four times: propose a skill, never install one.

**That list is observations, not a menu of work:** defects and facts only — never
suggested tasks (one exception: a skill proposal, above), never "worth checking", never
extra verification of what you just built. Empty is normal. In project mode, out-of-scope
findings also go to the backlog when recording is allowed (*How a task runs*); there an
entry may carry a next step. Another project's issues wait for that project's turn.
Investigation too: check what the answer needs — one decisive confirmation is enough —
then stop.

## When something is unclear

Ask, rather than pick a reading silently. If the request contradicts itself, say which
parts conflict instead of choosing a side. Never present options neutrally — name the one
you recommend and why, including why not the others. I dictate most prompts: read through
transcription errors rather than asking what I meant ("bs4" is "VS Code", "cloud" is "Claude").

## Docs are products

Write documentation about the thing, not the work that produced it; an append-only dated
log inside a doc means it is time to rewrite it. New dates and dated filenames:
DD-MM-YYYY; old names stay. Do not delete reference or spec docs — relocate them and mark
what is superseded. Deletion is for dead code, not documents.

## Before calling anything done

- The project's tests, linter and build all run, and are green — not "should be".
- If a shared rule or invariant was touched, whatever checks it still passes.
- Everything in *Evidence, not assumption* holds — exercised, and what was not verified said.

## Git

**Never commit or push without being asked.** Preparing a commit is not permission to make
one. Branch, commit, push and open the PR only once I say "send it for review" or the
equivalent — and nothing lands on `main` directly.

**One PR per feature, on its own branch off `main`,** never stacked on an earlier PR's
unmerged branch. If another branch is checked out with uncommitted work, stash only the
files for the new change, branch fresh off `main` and pop the stash there — never carry the
other PR's commits along.

**`~/.claude` is the one exception to branching**; it is set out in `~/.claude/.claude/CLAUDE.md`.

While a repo is private and solo, `CLAUDE.md` and `.claude/settings.json` stay in it
(`~/.claude/project-rules/` mirrors them). **Before the repo goes public, raise taking them
out** — they name internal paths, past defects and reasoning. Raise it; never do it silently.

## Explaining a permission request

**Hard rule, for risky boxes.** When a risky action is going to stop and ask for approval,
the explanation comes first, in plain English, before the box appears — as you would say it
to someone standing next to you. A risky box that arrives unexplained is a failure even if I
approve it. An ordinary box needs no explanation.

**Risky** means any of these: a command on the global or a project `ask` list; anything
outside this project's folder; anything touching secrets, credentials, personal data,
settings, permissions or macOS privacy; any rule or instruction file (`STANDARDS.md`, any
`CLAUDE.md`, `project-rules/`), hook or documented invariant; deleting, installing,
publishing, sending data out or rewriting git history; anything whose undo is uncertain.
Git does not make undo certain for uncommitted work, ignored files or data.
**If unsure, it is risky.**

**The explanation (full form)**, four lines in this order:

- **What it does** — in ordinary words, not the command restated.
- **What changes** — which files, which folder, and whether anything outside this project
  is affected.
- **Risk** — low, medium or high, and *why* that level.
- **Undo** — how to reverse it, or say plainly that it can't be.

Add a fifth line, **Why now** — what I asked for that needs this, in my terms — when the
command is on the global `ask` list: installs, downloads, deletions, git that commits,
merges, rewrites or discards work, pushing code, publishing packages, remote copies and
logins (`ssh`, `scp`, `rsync`), GitHub, killing processes, `open`, `sudo`, the Keychain,
macOS privacy, `sqlite3`.

Every risky box that can be foreseen is explained before the action runs. If a box appears
that was not foreseen, explain it in full before any further attempt, where the interface
permits; if it was declined, do not retry it. The denial rules below are unchanged.

**macOS privacy (`tccutil reset`)** revokes macOS privacy permissions — never write "resets
permissions". Name the **service** and the **app**, and say so when no bundle id is given and
it therefore hits **every app on the machine**.

**When I deny a prompt.** Ask me in plain text whether the No was meant or a mistake, and
do not retry while waiting.

- **A mistake:** explain the permission it needs, in the full form above, then try once more
  and wait for me to approve the box Claude Code shows.
- **Meant, or a second No:** that is final. Do not retry the same action, and do not reach
  the same result another way.

A helper agent stops and reports the denial. This never goes around Claude Code's
permission system: no rule changes, no different command to dodge the box, no asking me
to approve in chat instead of in the box.

**Before creating or changing a permission rule, read the relevant section of
`~/.claude/ENVIRONMENT.md`.** The rtk hook rewrites a command before the permission check,
so a rule has to cover every spelling the hook can produce.
