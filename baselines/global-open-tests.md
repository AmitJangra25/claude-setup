# Open tests — global index

What is still unproven about this setup, and what was closed, one short entry each.
**An index, not a dated run**: the detail stays where it already lives, and this file
only says what is open or how it closed, and where to look.

Not imported. Read when deciding what to test next.

**Scope.** Global items are setup-wide — permissions, hooks, rtk, the mirror, the
account switch. Project items belong in that project's own test record and appear
here as pointers only, because these rules forbid opening another project to
settle a question.

**Pointers are section names, never line numbers.** Line numbers rot: the pointer
this file replaced was 44 lines out of date when it was checked on 03-10-2026.

**Durability.** Items 1–3 and 7 point at `baselines/03-10-2026.md`, a tracked copy
of the record that used to live only in the untracked `.claude/current-task.md`.

Last reviewed 11-10-2026.

## Global — setup-wide

1. **Check 2 — an unmatched command with auto mode off.** Answered 09-10-2026 (T4),
   for a read-only and a changing command outside the project folder: manual mode
   and accept edits both prompt; auto mode lets both through. Two early manual runs
   were void — mistaken Yes clicks — and were re-run. One discrepancy remains: the
   morning run in accept edits ran without a box; T4's prompted. The "don't ask
   again" finding is in item 2.
   Detail: `baselines/09-10-2026-run2.md` and `baselines/09-10-2026.md`; the original
   design is in `baselines/03-10-2026.md` § *Check 2*.
   **Closed 10-10-2026 (Amit, T6):** answered by T4; the discrepancy stays as recorded.

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
   T4 09-10-2026: on an unmatched `rtk proxy wc -l …`, manual and accept edits both
   offered "don't ask again for: rtk proxy *"; auto mode showed no box. Not clicked.
   Mechanism not proven on two counts: clicking was never shown to write the rule,
   and no click was shown to be how it came back. Detail:
   `baselines/09-10-2026-run2.md` § *Not established*.
   **Accepted 10-10-2026 (Amit, T6):** the mechanism stays unproven; a return is now
   detected at the start of every setup session (`harness/session-check.sh`, T3).
   **Mechanism shown 29-10-2026:** this repo's `.claude/settings.local.json` last changed
   23-10-2026 07:43:37 IST, the same second setup session `26b8c4c8` logged an approval
   with source `user_permanent` ("don't ask again") for `rtk proxy git -C … commit`. Only
   that return is traced; the earlier ones are not. Removed again; `STANDARDS.md`
   § *Reuse what is already there* then kept `rtk proxy` to reads and said to answer plain
   "Yes" to that offer (moved to `RTK.md` § *`rtk proxy`* on 29-10-2026); `session-check.sh` also checks live project settings (it had come
   back in FinNode and Voice-Flow, with `rtk git *` in Voice-Flow).

3. **The 59-destructive-command review, re-run with auto mode in scope.** The
   original run measured rule coverage, not real exposure — 3 prompted, 56 did
   not. Do not add a rule without first replaying it against real Bash history.
   Detail: `baselines/03-10-2026.md` § *Known gaps*. Method:
   `ENVIRONMENT.md` § *How the numbers were measured*; the last such measurement
   (0.069 prompts per session over 6,662 calls) is in `SETUP-PLAN.md`
   § *FinNode — open, not acted on*.
   Decision 09-10-2026: run only if T4 (Check 2) shows something unexpected.
   T4 result: manual and auto mode behaved consistently once mistaken clicks were
   re-run; one discrepancy remains (item 1). Decision 09-10-2026 (Amit): not
   triggered — that run may also have been a mistaken click, and the replay is
   large. Revisit if it matters.

4. **Mirror drift — closed 09-10-2026.** First run: 2 drifted, both the
   `rtk proxy *` allow rule in FinNode's and Voice-Flow's `settings.local.json`.
   Removed in each project's own session; Voice-Flow's narrowed `settings.json`
   pulled with `sync.sh --pull`; `drift.sh` then 0 drifted. Ongoing detection is T3.
   Detail: `project-rules/drift.sh`.

5. **51 of the 58 global `ask` rules have never been probed — accepted.** Two
   fired in a manual-mode probe on 21-09-2026. Five more fired in auto mode
   09-10-2026 (T4): `rm *`, `*sudo *`, `*curl *` (on the hook-rewritten
   `rtk curl`), `*git rebase*`, `kill *` — each box named its rule and offered no
   "don't ask again". Counts re-verified 09-10-2026, unchanged: 33 `allow`, 58 `ask`,
   2 `deny`. Decision 09-10-2026: accept the rest untested. Still not shown: `ask`
   beating `allow` on any rule beyond the 21-09 two — T4's planned collision never
   happened, because the hook did not rewrite `git rebase`.
   Detail: `baselines/09-10-2026-run2.md`; `SETUP-PLAN.md` § *Status at handoff
   (2026-09-18)* — the **`ask` rules proven** row and the runtime probe after it.

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
   Decision 10-10-2026 (Amit): deferred with test 3's replay — revisit if it matters.
   **Closed for `~/.claude` only, 10-10-2026 (T6, D36):** four `ask` rules in
   `.claude/settings.json`; a harmless `rtk grep -c "git pull" …` prompted, naming
   `Bash(*git pull*)`, in a fresh setup session (Amit). Still open globally and in
   every project. Not caught: `git -C <path> pull`.
   The 09-10-2026 note that `Bash(gh run list*)` "never matches" is not proven: rtk's
   hook passes an `allow` through for it — `SETUP-PLAN.md` **D35**.

11. **Can rtk's hook `allow` beat an `ask` rule? No — closed 10-10-2026 (T6), from the
   docs.** rtk 0.48.0's hook returns `"permissionDecision": "allow"` on some rewrites
   (`SETUP-PLAN.md` **D35**). Claude Code's hooks reference, on PreToolUse, quoted:
   *"Deny and ask rules are still evaluated regardless of what the hook returns."*
   Source: `code.claude.com/docs/en/hooks`, read 10-10-2026. Consistent with T4's five
   `ask` probes and the D36 `git pull` probe.

12. **D38's sweep script checks only part of what D38 enforces** — **deferred 11-10-2026**,
   script unchanged (Amit). Detail: `SETUP-PLAN.md` § *Decisions already made*, row **D38**.

13. **Does the session check run after `/clear`? Yes — closed 30-10-2026.** A clean
   session prints nothing, so the test used a known drift: the SecondBrain mirror copy
   given a final line ending (`drift.sh`: 17 current, 1 drifted). In a new setup session
   the warning appeared at startup (the control) and again after `/clear` and "hi",
   unprompted, both naming `SecondBrain schema` `CLAUDE.md` (Amit's report). Copy then
   restored: `drift.sh` 18 current, 0 drifted; git clean.
   Detail: `harness/status.md` § *Completed*, session check after `/clear`.

## Project-specific — pointers only

These belong in each project's own test record (`tests/` or `qa/`), created when
that project is next worked on. Nothing here is actioned from `~/.claude`, because
these rules forbid opening another project to settle a question.

9. **A real project-task test.** The 29-09-2026 file-changing probe used synthetic
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
