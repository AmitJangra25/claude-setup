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
   **Found in three `settings.local.json` files** — this
   repo's `.claude/` (found 09-10-2026), FinNode's and Voice-Flow's (removed
   09-10-2026): the file Claude Code writes on "don't ask again". Ruled out
   09-10-2026: `sync.sh`, `drift.sh`, the one hook, `rtk init` (per its `--help`).
   Mechanism not proven. Test: in a fresh session run
   `rtk proxy wc -l ~/.claude/RTK.md`, read the prompt's "don't ask again" option,
   answer no.

3. **The 59-destructive-command review, re-run with auto mode in scope.** The
   original run measured rule coverage, not real exposure — 3 prompted, 56 did
   not. Do not add a rule without first replaying it against real Bash history.
   Detail: `baselines/03-10-2026.md` § *Known gaps*. Method:
   `ENVIRONMENT.md` § *How the numbers were measured*; the last such measurement
   (0.069 prompts per session over 6,662 calls) is in `SETUP-PLAN.md`
   § *FinNode — open, not acted on*.
   Decision 09-10-2026: run only if T4 (Check 2) shows something unexpected.

4. **Mirror drift — closed 09-10-2026.** First run: 2 drifted, both the
   `rtk proxy *` allow rule in FinNode's and Voice-Flow's `settings.local.json`.
   Removed in each project's own session; Voice-Flow's narrowed `settings.json`
   pulled with `sync.sh --pull`; `drift.sh` then 0 drifted. Ongoing detection is T3.
   Detail: `project-rules/drift.sh`.

5. **56 of the 58 global `ask` rules have never been probed.** Two were seen to
   fire in a manual-mode probe on 2026-09-21. Counts re-verified 09-10-2026,
   unchanged: 33 `allow`, 58 `ask`, 2 `deny`. Decision 09-10-2026: probe about 5
   high-risk rules in T4; accept the rest untested.
   Detail: `SETUP-PLAN.md` § *Status at handoff (2026-09-18)* — the **`ask` rules
   proven** row and the runtime probe recorded after it.

6. **The account switch has never been tested.** Block 4 — a second Claude account
   used by Amit on this same Mac, not another macOS user.
   **Deferred 09-10-2026 until Amit asks** — not part of the current plan.
   Detail: `SETUP-PLAN.md` § *Rebuilding on another account*.

7. **Closed 09-10-2026 — it was the hook.** `hook-audit.log` records
   `2026-10-03T16:03:28 | rewrite | wc -l ~/.claude/RTK.md | rtk wc -l ~/.claude/RTK.md`;
   rtk's `wc` filter prints the bare count. Why the UI labelled the call "Read 1
   file" was not determined and changes nothing.
   Detail: `baselines/03-10-2026.md` § *Known gaps*.

8. **The global `ask` list has no rule for `git pull`, `git stash pop`, `git stash
   apply` or `git switch`.** Found 09-10-2026 from FinNode's checkup: its broad
   `Bash(rtk git *)` allow lets them run unprompted there, and nothing global stops
   them in any project. `git switch --discard-changes` can lose uncommitted work.
   Read from `settings.json` 09-10-2026: the 16 git `ask` rules cover commit, push,
   checkout, reset, restore, clean, merge, rebase, rm, mv, branch delete, and stash
   clear/drop — not these. Not acted on: a global rule change needs the item 3
   replay first. FinNode's project-side item is in its own `docs/BACKLOG.md`.
   Also: the global `allow` rule `Bash(gh run list*)` never matches — the hook
   rewrites it to `rtk gh run list` first (Voice-Flow's checkup, 09-10-2026).

## Project-specific — pointers only

These belong in each project's own test record (`tests/` or `qa/`), created when
that project is next worked on. Nothing here is actioned from `~/.claude`, because
these rules forbid opening another project to settle a question.

9. **A real project-task test.** The 2026-09-29 file-changing probe used synthetic
   markers, not real work, so Block 3's "test a project task" intent is only
   partly met. **Project: FinNode.**
   Detail: `SETUP-PLAN.md` § *Where this stands*, item 4;
   `baselines/2026-09-29-run2.md`.

10. **Voice-Flow's real npm scripts have never been seen to prompt** —
   `install:app`, `compile:vault`, `reset:permissions`. Deliberate: they act on
   the machine and the installed app, and running one to prove a prompt appears is
   a bad trade. Only harmless greps containing those names have been observed.
   **Project: Voice-Flow.**
   Detail: `SETUP-PLAN.md` § *Where this stands*, item 4;
   `baselines/2026-09-29-run4.md`.
