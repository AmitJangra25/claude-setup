---
name: wrap-up
description: End-of-session wrap-up — turns the session's mistakes into proposed fixes and sorts scratch files.
  Use when Amit says "wrap up this session" or types /wrap-up at a session end.
  Not for a handoff note alone (handoff) or for committing (send-for-review).
---

# Wrap-up

Closes a session in two checks: which mistakes happened and how far up the ladder each one
goes, and what to do with the scratch files made along the way. It only proposes; recording
and moving files need Amit's yes. The ladder is in `WRITING-GUIDE.md` § *Rule plus case*; the
approval rules are in `STANDARDS.md` § *Safety and approval* and § *IDs and progress*. It
starts no agent.

## When to use

- **Use when:** Amit says "wrap up this session" or types `/wrap-up`. Claude never starts it
  on its own.
- **Not for:** writing a handoff note (`handoff` — run it too when work is unfinished) or
  committing (`send-for-review`).

## Steps

1. **List the mistakes.** From this session only: wrong answers, a rule missed, a gate
   skipped, work redone, a claim that turned out false. One line each, with what was
   *observed*. Include any "flaky" or "pre-existing" claim made without evidence. None is a
   fine answer.
2. **Place each on the ladder.** An instruction (a line in the skill, agent or guide where it
   happened) · a rule (one line in a rule file, with a case study) · a hook. Climb one step
   only when the step below has already failed. Look in the backlog for an earlier case of
   the same mistake: a first case stays at the lowest rung with the case logged; a second
   case reopens the item and proposes the next rung (the wording is in B44's last column,
   `harness/backlog.md`).
3. **Propose backlog rows.** For each mistake or finding that clears the value bar
   (`STANDARDS.md` § *IDs and progress*): the case, the rung, priority, size and rough
   tokens. Anything else is one line in "noting, not acting on". Write rows only after Amit's
   yes, and only in project mode.
4. **Sort scratch files.** List the scratch and draft files made this session (for example
   under `harness/drafts/`). For each, propose: keep, or move to the archive. Never delete;
   a delete needs the full deletion gate (`STANDARDS.md` step 4) and its own approval.
5. **Show the result and stop.** Counts first: mistakes, proposed rows, scratch files. Say
   what was not checked. Wait for Amit's decision.

## Example

    Session: a doc rewrite in a made-up project.
    Step 1: (a) edited a file before approval was given; (b) said a check was "flaky" with
      no run to show it.
    Step 2: (a) backlog already has the same mistake as a first case → second case, reopen
      and propose a one-line rule; (b) first case → instruction rung, case logged.
    Step 3: two proposed rows, P3, small, about 2k tokens each; waiting for yes.
    Step 4: `drafts/notes-a.md` keep; `drafts/old-diff.txt` move to the archive.
    Step 5: "2 mistakes, 2 rows proposed, 2 scratch files sorted. Not checked: older sessions."

## Self-check

**Full check** (used at every session end; it changes records and moves files):
- Each step's result matches the request; the mistakes are from this session and observed,
  not guessed.
- Every earlier-case claim was checked in the backlog, not recalled.
- No gate was skipped: no row written and no file moved without Amit's yes; nothing deleted.
- Say what was not checked.

## Related

- `WRITING-GUIDE.md` § *Rule plus case* — the ladder.
- `STANDARDS.md` § *IDs and progress* — value bar, priority and recording.
- `harness/backlog.md` — where proposed rows go and earlier cases are found.
- `handoff` — the note for unfinished work.
