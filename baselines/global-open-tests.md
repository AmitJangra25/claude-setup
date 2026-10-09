# Open tests — global index

What is still unproven about this setup, one line each. **An index, not a dated
run**: the detail stays where it already lives, and this file only says what is
open and where to look.

Not imported. Read when deciding what to test next.

**Scope.** Global items are setup-wide — permissions, hooks, rtk, the mirror, the
account switch. Project items belong in that project's own test record and appear
here as pointers only, because these rules forbid opening another project to
settle a question.

**Pointers are section names, never line numbers.** Line numbers rot: the pointer
this file replaced was 44 lines out of date when it was checked on 2026-10-03.

**Durability.** Items 1–3 and 7 point at `baselines/03-10-2026.md`, a tracked copy
of the record that used to live only in the untracked `.claude/current-task.md`.

Last reviewed 09-10-2026.

## Global — setup-wide

1. **Check 2 — an unmatched command with auto mode off.** Partly answered
   09-10-2026: in accept edits mode, an unmatched read-only command ran without a
   box. Still open: whether accept edits mode, built-in read-only handling or the
   organisation policy let it through, plain default mode, and a command that
   changes something. Switching modes needs no settings change — Shift+Tab.
   Detail: `baselines/09-10-2026.md`; the original design is in
   `baselines/03-10-2026.md` § *Check 2*.

2. **Did removing `Bash(rtk proxy *)` close anything?** Not proven either way.
   The rule had come back by 03-10-2026 and was removed again 09-10-2026 —
   `baselines/09-10-2026.md` § *Finding — the blanket rule had come back*.
   Detail: `baselines/03-10-2026.md` § *What the 2026-10-03 run established*.
   Found 09-10-2026 in the project `allow` lists of FinNode and Voice-Flow
   (`settings.local.json`), which the global removal does not reach — item 4.
   How or when it was added there was not checked.

3. **The 59-destructive-command review, re-run with auto mode in scope.** The
   original run measured rule coverage, not real exposure — 3 prompted, 56 did
   not. Do not add a rule without first replaying it against real Bash history.
   Detail: `baselines/03-10-2026.md` § *Known gaps*. Method:
   `ENVIRONMENT.md` § *How the numbers were measured*; the last such measurement
   (0.069 prompts per session over 6,662 calls) is in `SETUP-PLAN.md`
   § *FinNode — open, not acted on*.

4. **Mirror drift — run 09-10-2026: 16 current, 2 drifted, 0 stale.** Both drifted
   files are `.claude/settings.local.json` (FinNode, Voice-Flow), and both differ by
   one added `allow` rule: `Bash(rtk proxy *)` — see item 2. Deliberately not
   synced, so the copies here stay clean. Still open: remove the rule in each
   project's own session, then re-run `drift.sh` to confirm 0 drifted.
   Detail: `project-rules/drift.sh`.

5. **56 of the 58 global `ask` rules have never been probed.** Two were seen to
   fire in a manual-mode probe on 2026-09-21. Counts verified 2026-10-03:
   33 `allow`, 58 `ask`, 2 `deny`.
   Detail: `SETUP-PLAN.md` § *Status at handoff (2026-09-18)* — the **`ask` rules
   proven** row and the runtime probe recorded after it.

6. **The account switch has never been tested.** Block 4 — a second Claude account
   used by Amit on this same Mac, not another macOS user.
   Detail: `SETUP-PLAN.md` § *Rebuilding on another account*.

7. **Unexplained, not actioned.** `wc -l ~/.claude/RTK.md` run without `rtk proxy`
   printed a bare `28` with no filename, and the UI labelled the call "Read 1
   file". What rewrote it was never determined. Do not write it up as a hook
   rewrite without checking `hook-audit.log` for that call.
   Detail: `baselines/03-10-2026.md` § *Known gaps*.

## Project-specific — pointers only

These belong in each project's own test record (`tests/` or `qa/`), created when
that project is next worked on. Nothing here is actioned from `~/.claude`, because
these rules forbid opening another project to settle a question.

8. **A real project-task test.** The 2026-09-29 file-changing probe used synthetic
   markers, not real work, so Block 3's "test a project task" intent is only
   partly met. **Project: FinNode.**
   Detail: `SETUP-PLAN.md` § *Where this stands*, item 4;
   `baselines/2026-09-29-run2.md`.

9. **Voice-Flow's real npm scripts have never been seen to prompt** —
   `install:app`, `compile:vault`, `reset:permissions`. Deliberate: they act on
   the machine and the installed app, and running one to prove a prompt appears is
   a bad trade. Only harmless greps containing those names have been observed.
   **Project: Voice-Flow.**
   Detail: `SETUP-PLAN.md` § *Where this stands*, item 4;
   `baselines/2026-09-29-run4.md`.
