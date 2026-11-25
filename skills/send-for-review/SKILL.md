---
name: send-for-review
description: Amit's "send it for review" — branch off main, commit, push to GitHub, open a pull request, then stop. Amit reviews and merges by hand; Claude never merges. Manual only — Amit types /send-for-review.
disable-model-invocation: true
---

# Send for review

Typing `/send-for-review` is Amit saying "send it for review" (`STANDARDS.md` § *Git*).
The gates live there and in § *Safety and approval*; this file is only the order of steps
and never overrides them.

## Before starting — stop and report if any fails

- The project is the selected one and this folder is its git repository
  (`STANDARDS.md` § *Which project*).
- Follow the project's applicable branching and no-push rules; stop if push is not
  permitted. A stricter project `CLAUDE.md` wins.
- The work is checked as `STANDARDS.md` § *Before calling anything done* says, or Amit has
  said what state it is in.
- Which files belong to this change is clear. Everything else stays out; ask if unsure.

## Steps

1. **Branch** as the project's rules say. In `~/.claude`, commits land directly on `main` (`.claude/CLAUDE.md`);
   in other projects, follow `STANDARDS.md` § *Git* unless a stricter project rule applies.
2. **Commit** only this change's files. Check what is staged first (`ENVIRONMENT.md` § 1).
   Short message: what changed and why.
3. **Push** the new branch to GitHub.
4. **Open the pull request** against `main` with `gh pr create`: short title; body says what
   changed, why, how it was checked, and what was not verified.
5. **Stop.** Report the PR link, the branch and what was not verified. No CI watching,
   self-review, fixes or merging.

Commit, push and `gh` each raise a box: explain it first, full form with **Why now**
(`STANDARDS.md` § *Explaining a permission request*).

## After the pull request

- Amit reviews and merges by hand. Claude never merges, approves or closes it, and never
  pushes again outside this flow; a fix after review is a new instruction.
- If the repository does not delete merged branches itself, suggest GitHub's
  "Automatically delete head branches" once. No `dev` branch.

## Removing the local branch — only after Amit confirms the merge

1. First verify the pull request state is `MERGED` (`gh pr view <number> --json state`).
2. Use `git branch --merged main` only as supporting evidence, when it applies. If the
   local check is inconclusive after a squash or rebase merge, stop and ask.
3. Delete **only the local branch**, with Amit's approval and the confirmation
   `STANDARDS.md` step 4 requires: `git branch -d <branch>`. Never `git branch -D`.
4. The remote branch follows the repository setting, or a separate instruction from Amit.
