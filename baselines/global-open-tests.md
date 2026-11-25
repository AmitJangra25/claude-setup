# Open tests — global index

Purpose: What is still unproven about this setup, and what was closed — one row per test: how to run it, what to expect, the latest result, and its status. An index, not a dated run: the detail stays where it already lives.
Audience: Claude and Amit.
Read when: Deciding what to test next. Not imported.
Owner: Setup sessions (changes are Amit's decision).
Update rule: A test is opened, run, closed, accepted or deferred. Overwrite the row's result and status; closed tests stay, marked closed; the old story goes to a dated record.
Related: `harness/overview.md` § *What "finished" means* · `harness/status.md` · `baselines/README.md` · old text, item by item: `baselines/open-tests-old-11-11-2026.md`
Status: active
Last reviewed: 11-11-2026

Next ID: TC14

---

TC numbers keep the old numbers: TCn is "open test n" or "item n" in older text. TC9 and TC10 are project tests. **Pointers are section names, never line numbers** — line numbers rot. "not recorded" = never written down; not guessed.

## Global tests

Setup-wide — permissions, hooks, rtk, the mirror, the account switch.

| TC | What it tests | How to run | Expected | Last result + date | Status |
|---|---|---|---|---|---|
| TC1 | Check 2 — what an unmatched command (no `allow`, no `ask` rule) does, with auto mode off and on | A read-only and a changing command outside the project folder, in manual, accept edits and auto mode. Design: `baselines/03-10-2026.md` § *Check 2* | not recorded | 09-10-2026 (T4): manual mode and accept edits both prompt; auto mode lets both through. Open limit: the morning run in accept edits ran without a box; T4's prompted — the discrepancy stays as recorded. Detail: `baselines/09-10-2026-run2.md`, `baselines/09-10-2026.md` | [x] closed 10-10-2026 (Amit, T6) |
| TC2 | Whether `Bash(rtk proxy *)` comes back, and what re-adds it | `harness/session-check.sh`, at every setup session start: searches this repo, the copies and each manifest project's live settings | No warning: the rule is absent (`harness/session-check.sh`: "Prints nothing when all is well") | 29-10-2026: one return traced — this repo's `.claude/settings.local.json` last changed 23-10-2026 07:43:37 IST, the same second setup session `26b8c4c8` logged a `user_permanent` ("don't ask again") approval for `rtk proxy git -C … commit`. Earlier returns not traced. Ruled out 09-10-2026: `sync.sh`, `drift.sh`, the one hook, `rtk init`. Answer plain "Yes" to that offer: `RTK.md` § *`rtk proxy`*. Detail: `baselines/09-10-2026-run2.md` § *Not established* | [x] accepted 10-10-2026 (Amit, T6) — detected every setup session |
| TC3 | The 59-destructive-command review, re-run with auto mode in scope (the original measured rule coverage, not real exposure — 3 prompted, 56 did not) | Replay against real Bash history. Method: `ENVIRONMENT.md` § *How numbers are measured*; last such measurement (0.069 prompts per session over 6,662 calls): `SETUP-PLAN.md` § *FinNode — open, not acted on*. Do not add a rule without first replaying it against real Bash history | not recorded | No later run recorded. Detail: `baselines/03-10-2026.md` § *Known gaps* | [-] deferred 09-10-2026 (Amit): not triggered by T4; the replay is large — until Amit asks |
| TC4 | Mirror drift: `project-rules/` copies against the live project files | `project-rules/drift.sh`; also run by `harness/session-check.sh` at every setup session start | 0 drifted (a finish line in `harness/overview.md` § *What "finished" means*) | 09-10-2026: 0 drifted after the `rtk proxy *` rule was removed in FinNode's and Voice-Flow's own sessions. Session start 11-11-2026: Voice-Flow and vthrudebugger_v1 `CLAUDE.md` drifted — `harness/status.md` § *Open* | [x] closed 09-10-2026 — ongoing detection by the session check |
| TC5 | Whether each global `ask` rule fires | A harmless command matching the rule; the box names its rule | not recorded | 7 of 58 fired: 2 in manual mode 21-09-2026; 5 in auto mode 09-10-2026 (T4) — `rm *`, `*sudo *`, `*curl *` (on the hook-rewritten `rtk curl`), `*git rebase*`, `kill *`, each naming its rule with no "don't ask again". Counts 09-10-2026: 33 `allow`, 58 `ask`, 2 `deny`. Open limit: `ask` beating `allow` not shown beyond the 21-09 two — the hook did not rewrite `git rebase`. Detail: `baselines/09-10-2026-run2.md`; `SETUP-PLAN.md` § *Status at handoff (2026-09-18)* | [x] accepted 09-10-2026 — the other 51 untested |
| TC6 | The account switch — Block 4: a second Claude account used by Amit on this same Mac, not another macOS user | `SETUP-PLAN.md` § *Rebuilding on another account*; re-take its counts first | not recorded | Never run | [-] deferred 09-10-2026 until Amit asks |
| TC7 | Why `wc -l ~/.claude/RTK.md` returned a bare count on 03-10-2026 | Read `hook-audit.log` | not recorded | 09-10-2026: it was the hook — `2026-10-03T16:03:28 \| rewrite \| wc -l ~/.claude/RTK.md \| rtk wc -l ~/.claude/RTK.md`; rtk's `wc` filter prints the bare count. Why the UI labelled the call "Read 1 file" was not determined and changes nothing. Detail: `baselines/03-10-2026.md` § *Known gaps* | [x] closed 09-10-2026 |
| TC8 | `ask` coverage for `git pull`, `git stash pop`, `git stash apply` and `git switch` (`git switch --discard-changes` can lose uncommitted work) | A harmless command containing the pattern, e.g. `rtk grep -c "git pull" …`, in a fresh session | Inferred from recorded test design: a box naming the rule | 30-10-2026 (S4, `SETUP-PLAN.md` D41): the global list asks for the risky forms in every project — `pull --rebase\|-r\|--force\|-f` and `switch -f\|--force\|--discard…\|-C`, `git -C` spellings included — plus the `git -<opt> …` forms of push, reset, rebase, merge, checkout, clean, restore, rm, mv, stash drop/clear and branch delete. Plain `git pull` and `git switch <branch>` no longer ask anywhere. Open limit: `git stash pop` and `git stash apply` outside `~/.claude`. Not proven: that `Bash(gh run list*)` "never matches" — rtk's hook passes an `allow` through for it (`SETUP-PLAN.md` D35). FinNode's project-side item: its own `docs/BACKLOG.md`. Record: `baselines/s4-permissions-30-10-2026.md` | [~] partly closed 30-10-2026; the rest deferred with TC3's replay (Amit, 10-10-2026) |
| TC11 | Whether rtk's hook `allow` can beat an `ask` rule — rtk 0.48.0's hook returns `"permissionDecision": "allow"` on some rewrites (`SETUP-PLAN.md` **D35**) | Read the hooks reference, PreToolUse: `code.claude.com/docs/en/hooks` | `ask` and `deny` rules still apply | 10-10-2026, from the docs: *"Deny and ask rules are still evaluated regardless of what the hook returns."* No. Consistent with T4's five `ask` probes and the D36 `git pull` probe | [x] closed 10-10-2026 (T6) |
| TC12 | D38's sweep script checks only part of what D38 enforces | not recorded | not recorded | Script unchanged. Detail: `SETUP-PLAN.md` § *Decisions already made*, row **D38** | [-] deferred 11-10-2026 (Amit) |
| TC13 | Whether the session check runs after `/clear` | Give a mirror copy a known drift; start a setup session (control), then `/clear` and "hi"; restore the copy | Inferred from recorded test design: the drift warning at startup and again after `/clear`, unprompted | 30-10-2026: yes — both named `SecondBrain schema` `CLAUDE.md` (Amit's report); copy restored, `drift.sh` 18 current, 0 drifted. Detail: `baselines/status-completed-01-11-2026.md` | [x] closed 30-10-2026 |

## Project tests

Pointers only. Each belongs in that project's own test record (`tests/` or `qa/`), created when that project is next worked on, and is settled in that project's own session — a setup session may read a project (D46) but changes only `~/.claude`.

| TC | Project | What it tests | Status | Detail |
|---|---|---|---|---|
| TC9 | FN | A real project-task test. The 29-09-2026 file-changing probe used synthetic markers, not real work, so Block 3's "test a project task" intent is only partly met | [-] deferred to the project | `SETUP-PLAN.md` § *Where this stands*, item 4; `baselines/2026-09-29-run2.md` |
| TC10 | VF | Voice-Flow's real npm scripts — `install:app`, `compile:vault`, `reset:permissions` — have never been seen to prompt. Deliberate: they act on the machine and the installed app, and running one to prove a prompt appears is a bad trade. Only harmless greps containing those names have been observed | [-] deferred to the project | `SETUP-PLAN.md` § *Where this stands*, item 4; `baselines/2026-09-29-run4.md` |
