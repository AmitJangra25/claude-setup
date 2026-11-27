# Claude Code setup — specification, repair plan, and rebuild runbook

Written 2026-09-18. Owner: Amit (amit@v-thru.com). Machine: this Mac.

---

## Contents and decisions index (added 01-11-2026)

Added 01-11-2026 (audit CL18, CL7). Nothing below this block was rewritten. **For setup
work, start at `harness/status.md`**, then § *Next session: start here, not at the top*.
The `► START HERE` block below is history since 29-09-2026; its heading stays because
other records cite it. Do not read this file whole — search by D-number or section.

**Contents** (top-level sections, in file order):
`► START HERE` (historical) · *Where this stands* · *Git state is not recorded here* ·
*Next session: start here, not at the top* · *How a pass is run* · *Standing context* ·
*Project names, and what a rename costs* · *The order from here* · *Status at handoff
(2026-09-18)* (the phase-by-phase status table) · *The git repo — where it lives* ·
*Verify that state rather than trust it* · *How to work on this, in one line each* ·
*Why this file exists* · *What I got wrong while surveying it, and why* · *The five
systems* · *Scope* · *Decisions already made* (D1–D45) · *Why permissions cannot be made
airtight* · *The precedence rule that makes this work* · PHASE 1–5 · *Explicitly not
doing* · *Open questions* · *Rebuilding on another account* · PHASE 6 · *Tools
considered, and the decision* · PHASE 7–11 · *Findings not acted on*.

**Decisions in force.** All 45 are in § *Decisions already made*, as `### D<n> · <date>`
headings, **not in number order** (D15–D17, D26–D29 sit out of sequence). "In force"
unless the decisions' text says otherwise — its own, or a later decision that names it;
the status column says which.

| D | Date | Decision, in short | Status (from the decisions' text) |
|---|---|---|---|
| D1 | 18-09-2026 | Make consequential actions visible, not build a lock | in force |
| D2 | 18-09-2026 | Always ask before `git push` and anything that can destroy unsaved work | in force |
| D3 | 18-09-2026 | Permission prompts get four short lines | in force |
| D4 | 18-09-2026 | Never block or remove anything without explicit approval | in force |
| D5 | 18-09-2026 | `tccutil reset` asks with full detail; not blocked | in force |
| D6 | 18-09-2026 | Dated backup folder before the first edit, kept permanently | in force |
| D7 | 18-09-2026 | Voice Flow rules split into short rules + docs | in force |
| D8 | 18-09-2026 | `ENVIRONMENT.md` stays unloaded; pointer from `PROJECTS.md` | in force |
| D9 | 18-09-2026 | Remove dead and one-off permission rules after per-rule check | in force |
| D10 | 18-09-2026 | `python3 -c`, `node -e`, `awk`, `osascript` stay allowed | in force |
| D11 | 18-09-2026 | Voice Flow + Emp portal rules committed after the split | **superseded by D13** (stated in D13; D13 itself reversed 20-09-2026) |
| D12 | 18-09-2026 | rtk stays; verify raw output before deciding to delete | in force |
| D13 | 18-09-2026 | Project `CLAUDE.md` files out of their own repos | **superseded 20-09-2026** — reversed; `STANDARDS.md` § *Git* governs |
| D14 | 18-09-2026 | Read the memory files before recommending project changes | in force |
| D15 | 18-09-2026 | `npx` stays out of `ask` | in force |
| D16 | 18-09-2026 | Every new `ask` rule in three spellings | **superseded 20-09-2026** by the `ask` list merge |
| D17 | 18-09-2026 | Session size managed at the task boundary, not a number | principle in force; **the ~300k figure superseded** (now the status-line thresholds) |
| D18 | 18-09-2026 | Priority scale P1 / P2 / P3 | in force |
| D19 | 18-09-2026 | Before code: what it is for, what depends on it, what it cannot affect | in force |
| D20 | 18-09-2026 | A rule in `STANDARDS.md` is not restated in other words | in force |
| D21 | 18-09-2026 | B3 pipeline-fragment rules stay | in force |
| D22 | 18-09-2026 | A rule with a literal `*` is not removed until matching is known | in force |
| D23 | 18-09-2026 | A project reads only its own tree, never another | read part **superseded by D46**; no standing grant to another project still in force |
| D24 | 18-09-2026 | Voice Flow rule claims in `CLAUDE.md`, evidence in `docs/` | in force |
| D25 | 18-09-2026 | A stale measurement is annotated, never overwritten | in force |
| D26 | 22-09-2026 | A rule file is trimmed only where it is procedure | in force |
| D27 | 25-09-2026 | Two modes and one task order are rules in `STANDARDS.md`; templates separate | in force |
| D28 | 26-09-2026 | A capability is made cheap, not removed (`skillOverrides`) | in force |
| D29 | 26-09-2026 | A skill earns its tokens only by knowing something new | in force |
| D30 | 28-09-2026 | A project rule cannot weaken a global gate | in force |
| D31 | 29-09-2026 | Task records at the project's `.claude/current-task.md` | in force |
| D32 | 03-10-2026 | Part 2B: one owned file per kind of fact | in force |
| D33 | 08-10-2026 | Harness: `harness/status.md` is the one current status | in force; **its rejection of `overview.md` superseded by D34** (stated in D34) |
| D34 | 10-10-2026 | `harness/overview.md` kept as map and definition of "finished" | in force |
| D35 | 10-10-2026 | A global `allow` rule in the spelling the hook produces | in force |
| D36 | 10-10-2026 | Setup sessions ask before `git pull`, `switch`, `stash pop`, `stash apply` | **partly superseded 30-10-2026 by D41** — `pull` and `switch` removed, stash rules stay |
| D37 | 10-10-2026 | `.gitignore` root allow lines anchored with `/` | in force |
| D38 | 10-10-2026 | D23 restated to what is proven; wording only | read block part **superseded by D46** |
| D39 | 12-10-2026 | Model choice: Sonnet default, Opus for unclear or sensitive work | in force |
| D40 | 12-10-2026 | `STANDARDS.md` slimmed by wording only, every rule kept | in force |
| D41 | 30-10-2026 | An `ask` rule boxes what can change or leak, not every use (S4) | in force |
| D42 | 30-10-2026 | Branches with `git switch`; work proposed only past the value bar | in force |
| D43 | 30-10-2026 | Backlog items meet the value bar; Claude judges worth, then asks | in force |
| D44 | 01-11-2026 | Stage C security fixes: private-store denies, gist/Ollama/`git add` asks | in force |
| D45 | 01-11-2026 | Stage C switches: bypass mode off, error reports off, rtk audit log off, pre-commit secret check; gist scope kept | in force |
| D46 | 10-11-2026 | Read everywhere, write only here: read block off, write lock on globally, private data denied | in force |
| D47 | 10-11-2026 | `DOCUMENT-MAP.md` is the one document map; replaces the three old maps | in force; closed 11-11-2026; supersedes item 16's "setup map = `harness/overview.md`" |
| D48 | 11-11-2026 | Global `CLAUDE.md`: three imports plus one non-loading HTML comment | in force; closed 11-11-2026 (all five affected files checked) |
| D49 | 13-11-2026 | Done files only by size: one roadmap, backlog and decisions file; split past about 150 *Completed* lines | in force; closed 13-11-2026 (all eight affected files checked) |
| D50 | 20-11-2026 | New phase order (8 planning, 9 agents and skills, 10 clean-up, 11 further checks); borrow OpenSpec/Spec Kit ideas, install neither; read-only reviewer agents; no `git-safety` skill | in force; open (affected files change during Phases 8–10); clarified 23-11-2026 (D51) |
| D51 | 23-11-2026 | Planning system design: one entry point, six kinds of work, depth by risk, risk checked before the tiny-change route; build in four gated packages | final plan approved 24-11-2026; switched on 24-11-2026 (WP3); deferred checks passed in Phase 9 WP5, 25-11-2026; closed (Amit). |
| D52 | 24-11-2026 | Phase 9 design: two fresh read-only reviewers, layered minimum context, setup brief, three skills (`handoff`, `send-for-review`, `documents`), migration in the switch-on package, approved acceptance criteria | approved 24-11-2026; built WP2–WP4; R1–R8, K1–K5, I1–I5 passed or waived; closed 25-11-2026 (Amit). |
| D53 | 25-11-2026 | Phase 10 WP3 design: seven document types, a role and home per major document, writing style, contents-list rule, link model, `DECISIONS.md` shape, WP9 prompt file name | approved 25-11-2026; open until WP5–WP9 apply it (now inside Phases 12–19, D54); writing-style text moved to `WRITING-GUIDE.md` (D55) |
| D54 | 26-11-2026 | Expert rewrite programme, Phases 12–21: rewrite Claude Setup on its own base in the backend kit's writing style and structure; Phase 10 closed at WP3b, Phase 11 merged in; archive instead of delete; every open item closed (fixed or concluded) | agreed 26-11-2026 (Amit); open. Full brief: `harness/doc-structure-plan.md` § 3 *Phases 12–21* |
| D55 | 26-11-2026 | Phase 12 writing guide: `WRITING-GUIDE.md` is the writing-style home (amends D53) with one form per file kind in `templates/`; cases inline in 2–4 sentences, longer ones as case studies; up to five questions before creating a skill; no repo-wide `examples/`; agent shape rules from the blind test; drafts kept in `harness/drafts/` | approved 26-11-2026 (Amit); gate passed on try 2; WP3 cross-check closed; `/context` measure missed by about 0.05k, accepted by Amit; committed `d609140`; closed 26-11-2026; amended 26-11-2026 (Amit): skills are coding-first, not coding-only; amended 26-11-2026 (Amit): examples rule — one per skill in `SKILL.md`, one short line per agent description with the full example in the body, more in `examples/` or `agent-examples/<name>/`. Full list: `harness/doc-structure-plan.md` § *Phase 12 decisions and rule changes (D55)* |
| D56 | 26-11-2026 | Phase 13 planning: a seventh kind of work, research or business, with its own guide `skills/planning/research-business.md` (amends D51); three review sizes — self-check, short review (Sonnet, ~300 words), full review (Opus, ~500 words) — in `harness/cross-check.md` § *Review sizes*; "money" defined in the `STANDARDS.md` risk list, INR by default | approved 26-11-2026 (Amit); closed 26-11-2026 with Phase 13 (routing test passed; B37 closed by the requester's check-and-retry in `harness/cross-check.md` § *The reviewer*; `/context` observed about 10.61k). Full list: `harness/doc-structure-plan.md` § 3 *Phase 13 plan* → *Session 2 decisions*, *WP5 decisions* |
| D57 | 27-11-2026 | Phase 14 sub-agents: `change-reviewer` rewritten from the Phase 12 try 2 (report skeleton, 400-word limit, nine lenses, missing-check bar, "Nits alone give `no concerns`"); `plan-reviewer` B41 fixes; I1: a project's facts file is `<project>/.claude/agent-brief.md` (shape of `harness/agent-brief.md` plus *Words to use and avoid*; the packet names it; recorded in `harness/cross-check.md` § *The reviewer*; files written in Phase 20); description-versus-body rule (B43, `WRITING-GUIDE.md` § *Agents*): the description's one example line says request → what it is handed, the body's *Example* adds context and why this agent; I-decisions: I1 go, I8 closes B24, I2–I7 not built (I4 needs information; I3 and the others don't — WP2 showed no lens gap); `plan-reviewer`'s three extra sections (decisions, first question, five lenses) allowed as its *How to work* | approved 27-11-2026 (Amit); WP2 passed 27-11-2026: P1, P3 pass; P2 failed, fixed, re-run passed; P2 pass stands (Amit); B45 open; agents load 240 tokens (cap about 0.26k); closed 27-11-2026 with Phase 14. Amended "B45 fix 27-11-2026": both reviewers' *Facts checked* split into *Files opened* / from the diff (or named in the plan) only / assumptions, `diff:<n>` citation rule, requester log check in `harness/cross-check.md`; B46 line in `plan-reviewer` and `templates/agent.md`; fresh-session test P1, P2, P3 passed, B45 and B46 closed. Full list: `harness/doc-structure-plan.md` § 3 *Phase 14 plan* |
| D58 | 27-11-2026 | Phase 15 skills and hooks. Take now: T1 rewrite `documents`, `handoff`, `ollama`, `send-for-review` in the new style · T2 B21 ask rules for `git -c` alias reads · T3 `harness/hook-test.sh` for the three existing hooks · T4 new `wrap-up` skill (mistakes → ladder rung → proposed backlog rows; scratch files kept or archived, never deleted) · T5 B44 stays at the instruction rung, B15 merged into B44 · T6 one small example per `SKILL.md`, no `examples/` folder · T7 close B25 · T8 B47 phrase in `WRITING-GUIDE.md` · T9 B12 to Phase 20. Later, each with its trigger (backlog B48–B62): L1 kit 1 + 3 gitleaks pre-commit for projects · L2 kit 51 stale branches · L3 kit 72 resolve-conflicts · L4 kit 34 destructive-git guard · L5 kit 31 main-checkout switch guard · L6 kit 36 sub-agent push guard · L7 unproven-excuse hook · L8 kit 35 part 2 · L9 kit 53 hook wiring · L10 old candidate skills (judged at S1.2) · L11 researcher helper and kit 23 routing table (Phase 14 additions). Don't: kit 35 part 1 · kit 76 · kit 45 · kit 58 · kit 57 (Phase 14 addition). Parked ideas: B60–B62 | approved 27-11-2026 (Amit); open. Full list: `harness/doc-structure-plan.md` § 3 *Phase 15 plan* |

---

# ► START HERE — resuming in a new session

## Where this stands

**Current status lives in `harness/status.md`** (**D33**), not here. Everything else in
this block is **historical**: it was last updated 2026-09-29 and stops there.

**For the current commit, branch, remote state and working tree, check git.** None of
them are recorded here on purpose — see § *Git state is not recorded here*.

**Start setup sessions from `~/.claude`, not from `~/Documents`.** Memory is stored per
starting folder, so sessions run from `~/Documents` wrote their notes into a folder that
setup sessions never read. `~/Documents` is also not a repo and holds every project at
once, which is the widest possible working directory — the opposite of the one-project
boundary **D27** exists to keep.

A second pass on this repo is running, organised as four blocks:

| Block | What it is | State |
|---|---|---|
| 1 | Rules, task workflow, templates, permissions, startup baseline | **Done** — D27, and the baseline in `ENVIRONMENT.md` |
| 2 | Measure what loads at startup, and cut it | **Done and measured** — `/context` 34.3k → 21.9k, 2026-09-26, **D28**, **D29**. A later reading the same day was 22.0k, after other changes |
| 3 | Fix verified local defects, then test a simple and a project task | **Local defects fixed 2026-09-26. Both task tests run 2026-09-28, read-only — 14 prompts, recorded in `baselines/2026-09-28.md`. Five of Voice-Flow's `ask` entries were then seen to prompt live, 2026-09-28 — observed and pasted in by Amit, `baselines/2026-09-28-run2.md`. A designed file-changing probe ran 2026-09-29 and held scope across a `/compact` (`baselines/2026-09-29-run2.md`), but it used synthetic markers, not real project work. Four direct-spelling `ask` rules were then added to Voice-Flow and each was observed prompting, 2026-09-29; real script execution stays unobserved (`baselines/2026-09-29-run4.md`)** |
| 4 | Review what is safe to keep in the repo, then switch accounts | **Not started** |

**Block 3's three defects**, all found by audit on 2026-09-26 and fixed the same day: the
`autoMode` trusted-repo line described `/Users/amitjangra/Documents` ("no remotes, 0
tracked files") because `/auto-mode-setup` ran from there on 2026-09-22; the two memory
notes lived only in the `~/Documents` memory folder; and `README.md` still said
`CLAUDE.md` holds five `@`-imports, which has been three since 2026-09-22.

**The finish order — Amit's current order, set 2026-09-27.** Blocks 3 and 4 are last *in
this plan*. That is the order chosen now, not an unchangeable rule.

1. ~~**Agreed cleanup**~~ — **done 2026-09-27.** The three `PHASE2-REMOVALS` files are in
   `archive/`, moved with `git mv` and verified byte-identical by blob hash. Item 5.8 is
   half closed: `browser-use` superseded by **D28**, the `definite` vendor URL still open
   and not ours to fix. Also done that day: `ENVIRONMENT.md`'s startup section, this status
   block, the plan's own size warning, and the permission counts after seven `ask` rules
   were added.
2. ~~**Individual-project decisions**~~ — **done 2026-09-27.** Amit is working on
   `vthrudebugger_v1` and `Debugger v2` is parked — a decision, not a check of which tree
   is furthest ahead; `Voice Flow_v1` is superseded but stays on disk, not archived;
   `Packbly v2` is a real project, left as it is. Written into `PROJECTS.md` and
   `ENVIRONMENT.md`, and on 2026-09-28 into `project-rules/README.md` as well — the
   retired `Voice Flow_v1` mirror had been sitting as a table row directly under
   `Voice-Flow`, one hyphen apart, and now has its own *Retired* section saying nobody
   works on it while the tree, its `manifest.tsv` line and its `sync.sh` coverage all
   stay (commit `0f0d8e1`). The earlier wording here said "`PROJECTS.md` and `REPOS.md`"
   — that was wrong: `REPOS.md` is a shortlist of third-party GitHub repos and needed no
   change.
3. ~~**The 29 Sep repository pass, and Phase B documentation**~~ — **done 2026-09-29.**
   The mirror's report path was split out of `sync.sh` into a read-only `drift.sh`,
   because auto-mode classified the combined script as self-modification and the
   mirror's only guard therefore could not be run; `sync.sh` keeps `--pull`, now
   required. `drift.sh` has no `cp`, `rm`, `mkdir` or output redirect. Its first run
   found real drift — FinNode's `CLAUDE.md` copy had diverged and its
   `settings.local.json` had never been copied — and both were pulled back in
   (commits `6cef5f8`, `45e825a`). Also that day: the stale tracking policy in
   `project-rules/README.md` and **D13**, two pointers at a section that no longer
   exists, the run-2 repo-state fact, and the memory note that Claude cannot observe
   permission prompts. **D31** then settled where a live task record lives —
   `.claude/current-task.md` inside the selected project — with `templates/handoff.md`
   extended as its template and one pointer line at *Orient* in `STANDARDS.md`.
   **Fresh-session resume checked 2026-09-29:** the FinNode session reported finding
   and reading `.claude/current-task.md`, and reporting the Phase B task and its
   approved scope, without changing a project file. The agreed token was present in
   the test prompt, so repeating it is **not** independent proof of recovery. The
   exact prompt text was not captured here, so nothing is claimed about what else it
   did or did not contain. **Compaction probed 2026-09-29, same-session:** the record was
   written, work started, `/compact` run and the work continued from `carry on` alone,
   within the approved scope and honouring the stated exclusions — `baselines/2026-09-29-run2.md`.
   **That does not prove the record caused it:** the task passed through the conversation
   before the compaction, so the summary may carry it, and no control separates the two.
   **D31's mechanism claim stays unproven.**
   Observed and reported by the FinNode session; not verified from this repo. The
   temporary record was deleted there after approval, leaving that project's
   `git status --porcelain` empty — also its report, not a check made here.
4. **Block 3 — the workflow tests.** Both task tests were run read-only on 2026-09-28;
   the 14 prompts and replies are in `baselines/2026-09-28.md`. File-changing work happened on
   2026-09-28 — the project `ask` entries and the documentation corrections — as real work,
   not as a designed test; the original 14-prompt run was read-only throughout. **Partly
   closed 2026-09-28:** Voice-Flow's five `ask` entries — `compile:vault`, `install:app`,
   `signing:cert`, `create-signing-cert`, `reset:permissions` — each prompted in a
   Voice-Flow auto-mode session against a harmless `rtk grep -c <name> package.json`, and
   each prompt named its matching rule. **Observed and pasted in by Amit; Claude cannot see
   prompts.** Voice-Flow's real npm scripts remain **not observed**, and deliberately so —
   `install:app`, `compile:vault` and `reset:permissions` act on the machine and the
   installed app, and running a destructive command to prove a prompt appears is a bad
   trade. **Spelling probed 2026-09-29:** two harmless greps containing `reset:permissions`
   prompted, one of them wrapped in `sh -c '…'`, each box naming `Bash(*reset:permissions*)`;
   a harmless grep containing `reset-permissions` — hyphen, not colon — **did not prompt**.
   That is a spelling-coverage observation for those three commands only, and **not a
   confirmed bypass**. **The direct `node scripts/…` spellings remain not observed** — none
   was executed — so `node scripts/reset-permissions.js --dry-run` is untested and nothing
   here shows it runs ungated. The `sh -c` observation covers that one wrapped harmless
   grep, not `sh -c` in general, and no universal matcher or precedence result follows.
   Record: `baselines/2026-09-29-run3.md`. **The direct-spelling gap was then closed by
   rule, not by proof, 2026-09-29:** four `ask` patterns keyed on the *file* spelling were
   added to Voice-Flow — `Bash(*scripts/install-app*)`, `Bash(*scripts/compile-vault*)`,
   `Bash(*scripts/reset-permissions*)` and `Bash(*scripts/uninstall-app*)` — taking `ask`
   5 → 9 with `allow` (122), `deny` (absent) and `additionalDirectories` unchanged. Each was
   then observed to prompt against a harmless `rtk grep -c 'scripts/<name>' package.json`,
   each box naming its own rule. **Observed and pasted in by Amit, in separate fresh
   sessions; Claude cannot see prompts.** Run3's colon/hyphen hypothesis is neither
   confirmed nor refuted — no real script was run, and that stays deliberate. Two results
   this repo had previously only asserted now have an observation behind them:
   **leading-`*` substring matching works**, and **an `ask` overrides an `allow`**, since
   `Bash(rtk grep *)` is in the global `allow` list and those commands still stopped.
   Record: `baselines/2026-09-29-run4.md`. The `echo` check run that day also stays
   **not observed**, not failed: manual mode prompts on every Bash command, so it could not
   discriminate. Record: `baselines/2026-09-28-run2.md`.
   **Closed for FinNode 2026-09-29:** its live `ask` list was checked and held exactly the
   three connected-test patterns, and each `Bash(*connectedDebugAndroidTest*)`,
   `Bash(*connectedAndroidTest*)` and `Bash(*connectedCheck*)` prompted against a read-only
   `rtk grep -c <name> CLAUDE.md` containing that task name — each prompt naming its own
   matching rule. **Observed and pasted in by Amit.** The probes were greps containing the
   protected names, **not** the real Gradle tasks, which reach a device and which FinNode's
   own `CLAUDE.md` warns destroy data; those have still never been seen firing. Record:
   `baselines/2026-09-29.md`. **A designed file-changing probe was then run 2026-09-29** —
   a four-line throwaway file in FinNode's `docs/`, carried across a `/compact` in one
   session, scope and the stated exclusions held (`baselines/2026-09-29-run2.md`). **Block 3 is
   still not closed:** that probe used synthetic markers, not real project work, so the
   "test a project task" intent is only partly met, and Voice-Flow's remaining spellings
   stand.
5. **Block 4 — the repository review, then the same-Mac account-switch test.**

**Where the record is.** Everything already done is recorded dated, and not here.
§ *Status at handoff (2026-09-18)* holds the step-by-step table (Note 12-10-2026: this is now a section, not a table.), the phase sections below
hold each pass in full, and `ENVIRONMENT.md` holds every startup measurement. This block
is current state only: when it changes it is replaced, not added to.

## Git state is not recorded here — read it from git

**This plan records dated events, not current state.** Whether a branch is clean, checked
out, ahead of its remote or merged changes the moment anyone touches a repo, and on
2026-09-21 four separate edits each left a sentence here wrong within minutes. Restating
it was the defect; the fix is to stop.

Run the one-command sweep instead. It lives in `ENVIRONMENT.md` § *Branch state*, the one
copy since 10-10-2026 (T6), and is always right.

Anything the output does not show — an open PR, a stashed change — comes from
`gh pr list` in that repo, not from this file.

**What belongs here instead, and does not rot:** the dated record of what was done and
why. *"FinNode's duplicate-rule removal was committed as `4fb453f`, merged via PR #1 and
squashed onto `main` as `5fd4ddc` on 2026-09-21"* stays true forever. *"FinNode is clean
and in sync"* was true for about four minutes. The phase sections below follow the first
form; if a future edit is tempted into the second, that is the mistake this section
exists to prevent.

**The one structural fact worth stating**, because it is a decision rather than a state:
`~/.claude` commits to `main` directly, since it has no reviewer and no PR flow. Every
project branches, one PR per feature off `main`. That is in `STANDARDS.md` § *Git*.

**`backups/` was deleted on 2026-09-21** — see § *Where the backups went*. (10-10-2026: the folder exists again, holding only Claude Code's own `.claude.json` backups, not this setup's.) What could not
be recreated moved into `archive/`, which is tracked and pushed precisely so it survives
the Mac.

## Next session: start here, not at the top

**Do not read this whole file.** It is ~208 KB, measured 10-10-2026 (~176 KB on
2026-09-27); reading it all would cost an estimated 52k tokens, scaled from that size
rather than measured. Either
way it is the opposite of the point. Read, in this order:

1. **`harness/status.md`** — the current setup status (**D33**). Added 10-10-2026.
2. **§ *Where this stands*** at the top — the finish order, historical since 2026-09-29 —
   then the status table in § *Status at handoff (2026-09-18)*. (Note 12-10-2026: this is now a section, not a table.)
3. **§ PHASE 11 — The global pass** — the per-file records, the method that governs any
   remaining pass, and the permission-list findings.
4. The specific phase section only if the work touches it.

Everything else is reference. Search it when you need it.

## How a pass is run — the method that has held

1. **Measure before proposing.** Section by section, with a word count. FinNode's
   correction: the biggest section is not automatically the problem.
2. **Apply the split test.** Something stays global only if it must arrive *before*
   Claude would know to load anything. Detail consulted once already engaged moves out.
3. **Show the proposal and the numbers before editing.** Every removal is a question,
   never an inference.
4. **Back up, verified.** Where the tree is clean, git *is* the backup — say so rather
   than making a redundant dated copy.
5. **Move verbatim, prove it verbatim** — two independent methods.
6. **Re-measure, then record the real figure**, not the estimate.

**Three things learned on 2026-09-20, worth carrying into any pass:**

- **Expect correctness, not weight.** The five global files netted 93 words between them,
  and fixed five wrong or dead facts. `PROJECTS.md` got *heavier* and that was right.
- **The rtk hook rewrites a command before the permission check** — measured 2026-09-21, not just inferred: an `allow` rule that matches only the `rtk `-prefixed spelling silenced the command. A fence needs every
  spelling the hook can produce — `wget` was fenced bare and via `rtk proxy` but not
  `rtk `, and so was not fenced at all.
- **Keep the report short.** Amit said so directly, twice: conclusion first, findings
  grouped into a few buckets with counts, two or three questions — not twelve.

## Standing context

**Renames are decoupled — ignore them.** Amit renames a project when he opens it to work
on. A pass runs on whatever the project is called today, must not propose a rename, and
must not wait for one. This was briefly made a prerequisite on 2026-09-20 and it was wrong.

**Carry in — nothing outstanding on arbitrary code.** Both items that were open at
the end of the project passes were closed the same day, 2026-09-20, at Amit's
direction:

1. **Voice-Flow's `Bash(rtk proxy *)` and `Bash(rtk npx *)` are gone.** Closed as a
   targeted fix, not a second pass — Amit's instruction was "just close those two
   holes, leave the rest", so the other 139 rules are untouched and Voice-Flow still
   wants a proper look one day.
2. **Voice Flow_v1 was stripped**, reversing the decision to leave it alone. 50 → 9
   rules.

**No project holds a broad arbitrary-code rule any more.** Verified by sweeping every
`.claude/settings*.json` under `VS Code/` for `rtk proxy *`, `rtk npx *`, `python3 -`,
`python3 -c ' *`, `node *` and `osascript -l JavaScript -e ' *`. Phase 9's headline
finding — 18 such rules — is closed for every project that had one.
**Correction, 10-10-2026:** this stopped being true. `Bash(rtk proxy *)` was found back
in FinNode's and Voice-Flow's `settings.local.json` on 09-10-2026 and removed that day,
in each project's own session — `baselines/global-open-tests.md` items 2 and 4. The
paragraph above is kept as the 2026-09-20 record.

### Renames are Amit's, and they are not part of any pass

Each of the **three** remaining projects carries a name Amit picked at random, and
he has said he will rename them — GitHub repo, local folder, and the name inside
the code — at some point when he is working in them. **That is information, not a
task.** Voice-Flow and FinNode are the two he considers correctly named.

**Do not rename, do not propose renaming, and do not sequence a pass around it.**
A review runs on whatever the project is called today. This was written up as
"rename first, then review" on 2026-09-20; it was wrong, it made setup work wait on
a project chore, and it was reversed the same day.

§ *Project names, and what a rename costs* below stays as **reference for whenever
Amit does rename** — what breaks, and the memory-folder trap that matters most. It
is not a step in anything.

## Project names, and what a rename costs

Verified live 2026-09-20 by reading each project's `git remote`, not from memory.

| Manifest name | Local folder | GitHub repo | Branch |
|---|---|---|---|
| FinNode | `VS Code/FinNode` | `FinNode` | main |
| Voice-Flow | `VS Code/Voice-Flow` | `Voice-Flow` | main |
| Voice Flow_v1 | `VS Code/Voice Flow_v1` | `Voice-Flow_v1` **≠ folder** | `rename-voice-flow-v1` |
| vthrudebugger_v1 | `VS Code/vthrudebugger_v1` | `vthrudebugger_v1` | `alert-swipe-to-dismiss` |
| Packbly_web | `VS Code/Packbly_web/`**`v1.1-Packbly`** | **`v1.1-Packbly`** — a version, not a name | main |
| Emp portal | `VS Code/Emp portal/`**`Vthru_Emp_v2.1_jun26`** | **`Vthru_Emp_v2.1_jun26`** — version + month | `fix/dead-code-cleanup-and-test-fix` |
| Debugger v2 | `VS Code/Debugger v2` | **`vthrudebugger_v2`** ≠ folder | main |
| SecondBrain schema | `SecondBrain Obsidian/schema` | **not a git repo at all** | — |

**Four things a rename breaks, and the memory one is the expensive one.**

1. **Claude's memory folder is named from the absolute path.** Renaming
   `VS Code/Debugger v2` orphans `~/.claude/projects/-Users-amitjangra-Documents-VS-Code-Debugger-v2`
   and its **4 memories**; `vthrudebugger_v1` has **3**, Voice-Flow **11**. This is
   exactly the breakage Phase 7a had to repair by hand. **Move the memory folder in
   the same step as the rename**, or the project silently loses its history.
2. **`project-rules/manifest.tsv`** holds an absolute path per project, and `sync.sh`
   reports `MISSING SOURCE` once it is wrong.
3. **`PROJECTS.md`** and any project `settings.json` holding an absolute path.
4. **The GitHub repo URL**, which breaks existing clones and any link to it.

**The rename needs no new permission, and will strand almost nothing.** Checked
2026-09-20 by reading all three projects' rules: `vthrudebugger_v1` (39 rules) and
`Emp portal` (11) contain **zero** rules holding a path or their own current name, so
renaming them leaves no dead rule behind. `Debugger v2` has exactly **one** —
`Bash("…/VS Code/Debugger/node_modules/.bin/tsc" …)` — and it is *already* dead, since
that path no longer exists. `gh repo *` and `git mv *` are on the global `ask` list and
a bare `mv` prompts by default, which is the right setting for an irreversible,
outward-facing change.

**No per-project memory carries this.** `vthrudebugger_v1` and `Debugger v2` each
had one; both were deleted 2026-09-20 because they instructed a sequencing that was
never wanted. This section is the only record, and it is reference only. **`Emp portal` did not**, deliberately: it has no Claude memory
folder yet, and the folder name is derived from the absolute path — every existing one
maps `/`, space and `_` to `-`, but no existing folder contains a `.`, and
`Vthru_Emp_v2.1_jun26` does. Guessing that mangling risks creating an orphan, which is
the exact failure Phase 7a repaired. Its note lives here instead, and the folder will
be created correctly by simply opening the project once.

**After each rename, drop what the rename made pointless.** Not because paths went
stale — they mostly did not — but because these three have never had a pass, so they
still carry the category FinNode's pass removed and Voice-Flow's did not: **spent
one-off literals**, a single exact command left over from a finished session. Remove
those in the same sitting as the rename, plus Debugger v2's dead `tsc` rule and any
rule that names the old project name. Then run the pass proper.

**Check for uncommitted work and the current branch before renaming anything** — a rename
moves a folder out from under whatever is in flight. Use the one-command sweep in
`ENVIRONMENT.md` § *Branch state*; the figures that used to sit in this paragraph went
stale the same week they were written, which is the reason that section exists.

## The order from here

Amit's call each time. **All five project passes and the whole of Phase 11 are done**
— the entries below are the record, not a queue. Two projects were dropped and two were
never projects.

**Renames are not part of a pass — ignore them.** Amit renames a project when he
opens it to work on. § *Project names, and what a rename costs* stays as reference
for when he does; it is **not** a step in the review, and must not be raised as one.
Briefly written up as a prerequisite on 2026-09-20; that was reversed the same day
because it made setup work wait on a project chore.

- ~~**vthrudebugger_v1**~~ — **DONE 2026-09-20.** 39 → 20 rules. Its two trapped
  universal rules went into `STANDARDS.md` § *Git*, which finishes Phase 8 step 1.
  `CLAUDE.md` measured lean and was left untouched.
- ~~**Debugger v2**~~ — **DONE 2026-09-20.** 17 → 9 rules, closing both `python3`
  arbitrary-code holes. Still has **no `CLAUDE.md`** — offered and declined.
- ~~**Emp portal**~~ — **DONE 2026-09-20.** 11 → 6 rules. `CLAUDE.md` measured lean
  and left untouched; all 8 of its must-follow rules are app-specific, so nothing was
  promoted. The 5.7 `.gitignore` change was **committed and pushed 2026-09-21** as `53c4aba`.

**Dropped from the review — Amit's call, 2026-09-20.** He has never worked in either,
so there is nothing there to untangle. **The global rules still apply to them; they
are simply not getting a pass.** Do not survey them, do not trim them, do not open
them to "check something quickly".

- ~~**Voice Flow_v1**~~ — an old tree, never worked on, still not getting a pass.
  **But its permissions were stripped on 2026-09-20, 50 → 9**, reversing the earlier
  decision to leave the arbitrary-code rules open there. See § PHASE 10.
- ~~**Packbly_web**~~ — 8 rules. Holds **real customer and courier records**, which
  is another reason not to go poking.

**Not projects, and not getting a pass.**

- **Packbly_v2** — no `CLAUDE.md`, no `.claude/`. Likely a Figma export, not an app.
  (Reversed by Amit, 2026-09-27: it is a real project, just not one he works on —
  `ENVIRONMENT.md` § *Project-tree decisions*.)
- **SecondBrain schema** — Voice-Flow's vault (`electron/vaultStore.js:22` sets it as
  `DEFAULT_VAULT_ROOT`), not a separate project, and not a git repo. `PROJECTS.md`
  still lists it as its own project, which is wrong and worth fixing in the global
  pass. (Fixed 2026-09-20 in Phase 11 — `PROJECTS.md` lists it under *Not projects*.)

**The global pass — after the three projects.** `STANDARDS.md`, the other four
imported files, the global permission list, and whatever turned out to be
universal. **`STANDARDS.md` goes last within it**, because the universal rules
still trapped in `vthrudebugger_v1` have to be added to it — trimming it first
means opening it twice.

> **Current state — 2026-10-03:** the ordering reason above is **spent**. Both rules
> have since been added — *Never commit or push without being asked* and *One PR per
> feature, own branch off `main`* are in `STANDARDS.md` § *Git*. Nothing universal is
> still trapped in `vthrudebugger_v1`. Kept as the record of why the order was chosen.

**Why it goes first.** The six global files are loaded every turn in **every**
project — they are paid eight times over. 100 words cut there saves ~132 tokens in
*every* project, forever; 100 words cut in a project saves it once.

**Re-measured 2026-09-20 after the `OLLAMA.md` pass.** Note the earlier figure in
this file was **3,097 words / 4,089 tokens** and it was wrong by ~42 words —
`STANDARDS.md` had grown to 1,559 when Phase 4 added the "Why now" rule, after the
original count was taken. The corrected before-figure is **3,139**.

| | Words | ~Tokens/turn |
|---|---|---|
| Six global files, as found | 3,139 | ~4,144 |
| **After the `OLLAMA.md` pass** | **2,474** | **~3,266** |
| Saved, every turn, every project | 665 | **~878** |

Where the remaining weight sits: **`STANDARDS.md` 1,559** · `PROJECTS.md` 376 ·
`RTK.md` 188 · `OLLAMA.md` 133 · `REPOS.md` 105 · `CLAUDE.md` 114.

**`STANDARDS.md` is now 63% of the global weight and the obvious next target** —
but it is not the same shape as `OLLAMA.md`. See § *The next piece of work* for the
split test that applies to a file which really does govern every turn. (10-10-2026: that
section no longer exists. The split test is in PHASE 11 § *The method*, and its result for
`STANDARDS.md` in § *`STANDARDS.md` — DONE 2026-09-20*.)

## Status at handoff (2026-09-18)

### 1.1 Back up 27 files · ✅

**DONE**, verified byte-identical with `cmp`

### 6.1 `git init` + `.gitignore` + baseline commit · ✅

**DONE**, commit `14883fa`, 38 files, 90 KB

### Read all 27 memory files · ✅

**DONE** — produced D13, D14 and Phase 7

### 1.2 Close the holes in the global ask list · ✅

**DONE**, 35 rules added, `ask` 52 → 87

### 1.3 Add two global entries rtk needs · ✅

**DONE**, 3 rules added, `allow` 32 → 35

### **Phase 2a + 2b Permission cleanup** · ✅

**DONE** 2026-09-18. All 144 rules removed from 9 files; allow 560 → 416, verified against
the `2026-09-18-phase2` backup: 0 added, `ask`/`deny` untouched, every file still valid
JSON

### **Phase 2c Group B one-off leftovers** · ✅

**CLOSED 2026-09-21 — nothing was left to do.** B1 (14) + B2 (9) removed 2026-09-18, allow
416 → 393, verified. **B3 (74 pipeline fragments) stays by decision D21**, not as pending
work: removing them only tidies and costs a prompt mid-task on read-only commands. The **3
`*` rules still flagged** row was stale — a scan of all 394 rules across 15 settings
files, including the three inside `node_modules`, found **zero** bare-`*` rules in
`allow`, `ask` or `deny`. Stale like 5.4 and 5.6 were: the row was wrong, not the files

### Phase 7a Repair where memories are stored · ✅

**DONE**, 3 orphaned dirs fixed, 18 memories reachable

### Phase 7b Promote working preferences to STANDARDS.md · ✅

**DONE**, 5 sections + 3 edits, +626 tokens/turn

### **Phase 3 The deliberate set** · ✅

**DONE** 2026-09-20. Scope rewritten first, as instructed: 1.2 had already made the
change, so this documented it — all 124 rules grouped in plain English with a reason each
(deny 2 · ask 87 in 11 groups · allow 35 in 6), every rule classified, nothing left
over. **No permission rule changed.** Surfaced **4 gaps, none closed** (D4): `pnpm add`/`yarn
add`/`npm i` missing rtk spellings of a rule that already asks, and **`rtk git branch *`
sits in `allow` but `-D` deletes** — visible in the rule list (my first runtime 'proof' of
this was invalid; see What I got wrong). Backup: `backups/2026-09-20-phase3/`

### **Phase 4 Make the prompts readable** · ✅

**DONE** 2026-09-20. Hard rule, not guidance; new fifth line **"Why now"** on every
global-`ask` command; `tccutil reset` gets its own subsection — must name the service and
the app, and say when it hits every app on the machine. +360 tokens/turn. Backup:
`backups/2026-09-20-phase3/`

### **Phase 3 gaps closed** · ✅

**DONE** 2026-09-20. 14 `ask` rules added, `ask` 87 → 101. Additions only — verified
`allow` (35), `deny` (2) and every other setting byte-identical against the backup, 0
rules removed. Covers the 3 missing install spellings (`rtk`/`rtk proxy` × `pnpm add`,
`yarn add`, `npm i`) and branch deletion (`-d`/`-D`/`--delete` × bare/`rtk`/`rtk proxy`),
which ask beats allow on by rule-type precedence. **Runtime confirmation still
outstanding** — this session does not enforce `ask`. Backup:
`backups/2026-09-20-phase3-gaps/`

### **PHASE 8 Where rules live** · ✅

**DONE — all four steps complete. Step 4 closed 2026-09-21: it had already been done
inside FinNode's own Phase 10 pass, commit `725ca2e` on `main` — the four re-stated
sections 426 → 204 words, replaced by one pointer line to `STANDARDS.md`, every piece of
project evidence kept. The row was stale, not the file.** Step 3 closed 2026-09-21: Phase
10's `vthrudebugger_v1` pass had already promoted the two trapped rules, leaving only
the **stash-and-branch technique** ungloballed. Added to `STANDARDS.md` § *Git* as one
sentence, 1,600 → 1,634 words, and the memory's pointer now reads *all five* rules global.
The memory body and its dated evidence are untouched. Step 2 verified closed 2026-09-21:
all 6 redundant memories carry a pointer to their governing global section, Voice-Flow's 5
and FinNode's `always-recommend-an-option`. The two projects word the pointer differently
— Voice-Flow *"Now global"*, FinNode *"Governed globally by"* — which is cosmetic and was
left alone. Step 1: **3 of the 5** trapped rules promoted — two of Voice-Flow's —
`verify-shipped-bundle-not-source` into § *Evidence, not assumption*,
`claude-md-not-in-git` into a new § *Git* — plus FinNode's rtk `--dry-run` gotcha into
`RTK.md`, as a two-line claim with the dated evidence left in the memory. Additions
only, **0 deleted lines**. The other **2 stay trapped** (vthrudebugger's *never commit without
being asked* and *one PR per branch*) and wait for those projects' own passes — see
Phase 10. Step 2 done for Voice-Flow's 7 duplicates, **by a better method than planned**: a
pointer line at the *top* naming the governing section, body and dated evidence kept.
Replacing the body would have deleted the record of why each rule was given, which
`dont-delete-reference-docs` forbids — and memory bodies do not load every turn, so
keeping them costs nothing. **Original survey, unchanged below:** surveyed 2026-09-20. The
structure is already written in `STANDARDS.md` line 3; the files don't follow it. **There
is no global memory** — memory is always project-scoped, so a universal preference saved
in one project is structurally trapped. Found **10 rules written in two places** and **5
universal rules trapped in one project**, incl. *never commit without being asked* (not in
`STANDARDS.md` at all) and the rtk dry-run gotcha. 4-step plan in the Phase 8 section.
https://claude.ai/artifact/JPhMJ7z3bAMux6w5G3ZaMy

### **PHASE 10 Project-by-project review** · ✅

**COMPLETE 2026-09-20. All five projects passed** — Voice-Flow, FinNode,
`vthrudebugger_v1`, `Debugger v2`, `Emp portal`, one at a time, in that
order. **`vthrudebugger_v1`:** 39 → 19 rules, `CLAUDE.md` measured lean and left alone, and its
two trapped universal rules promoted to `STANDARDS.md` § *Git*, finishing Phase 8
step 1. **`Debugger v2`:** 17 → 9 rules, both `python3` arbitrary-code holes closed, still no
`CLAUDE.md` by choice. **`Emp portal`:** 11 → 6 rules, nothing promoted — all 8 of its
rules are app-specific. Project `allow` totals **318 → 285** after the passes, then **→
244** after two follow-ups the same day: **Voice Flow_v1 stripped 50 → 9** (reversing the
decision to leave the dropped trees alone) and **Voice-Flow's two arbitrary-code holes
closed** as a targeted fix, not a pass. An end-of-session cross-check found one defect
introduced and fixed (trailing-`*` rules) and one miss in an already-DONE pass, which is
what the Voice-Flow fix answered. **Renames are decoupled and must be ignored** — Amit
renames a project when he opens it to work on. Briefly made a prerequisite on 2026-09-20
and reversed the same day; making setup work wait on a project chore had turned it into a
blocker. Amit's order, and it supersedes doing global first: walk each project, decide
what is universal only after seeing them all, then one global pass at the
end. **Voice-Flow:** `CLAUDE.md` 4,650 → 1,534 words, per-turn cost in this project **10,056 →
6,003 tokens**; permissions 234 → 180; 2 rules promoted to `STANDARDS.md`; 7 memories
marked; 3 skills added. **FinNode:** `CLAUDE.md` 2,501 → 2,118 words, per-turn cost in
this project **7,363 → 6,966 tokens**; permissions 25 → 13, closing two arbitrary-code
holes; 3 skills added; 2 memories marked; committed as `725ca2e`. Its headline is
a **method correction** — the Voice-Flow diagnosis did not transfer, and measuring the
sections first is what caught it. Every deletion cross-checked twice by two methods before
it was made. Full detail in the Phase 10 section.

### **PHASE 11 The global pass** · ✅

**COMPLETE 2026-09-20 — six imported files and the global permission list.** The list
gained 5 rules (`ask` 107 → 112) and lost none: `wget` was unfenced because the hook
rewrites before the permission check and only the bare and `rtk proxy` spellings existed,
and `pip` was fenced nowhere. `uv` skipped as unused; no rules for the 12 rtk-wrapped
tools that are not installed. Order: `OLLAMA.md` 797 → 133 (detail moved verbatim to
`~/.claude/skills/ollama/SKILL.md`, byte-identical by `diff` and MD5), then `STANDARDS.md`
1,621 → 1,600, `PROJECTS.md` 376 → 393, `RTK.md` 188 → 140, `CLAUDE.md` 114 → 73, and
`REPOS.md` measured at 105 and deliberately left whole. Global files **3,201 → 2,444 words
/ ~4,225 → ~3,226 tokens a turn**. `PROJECTS.md` got *heavier* and that was right — across
the five passes on 2026-09-20 the net was 93 words, and the real return was correctness: a
fifth-line `ask` category list that missed destructive git and process kills, FinNode's
stale checkpoint, SecondBrain schema listed as a project, `RTK.md` pointing at a reference
that never existed, and rtk's overstated 60-90% headline (measured: 59.9% over 9,491
commands). This row said **PARKED — `STANDARDS.md` is LAST, not next** until 2026-09-20;
that was true when written and the section body was updated without it. Also fixed earlier
in the phase: `.gitignore` blocked `skills/` because `skills/synced/` is account-keyed,
but a hand-written skill carries no UUID and would simply have been **lost on an account
switch**. Allowed by name; `synced/` still blocked.

### **PHASE 9 The 384 permission rules** · ✅

**DONE 2026-09-21: 23 rules removed, project allow 244 → 221.** The survey's counts were
stale — the five Phase 10 passes had already cleaned most of it. Re-measured
live: *already granted globally* 37 → **17** (all removed), *subsumed* 8 → **0**, *write-file
rules* 8 → **6** (all removed: 3 spent `sed -i`, 2 spent shell literals, and `cp
~/.continue/config.yaml`, which wrote **outside the project** — the class 5.2b
removed), *present in 3+ projects* 83 copies → **11 distinct**. **Promotion declined at Amit's
direction:** promoting the 11 would delete 33 copies but grant them to every project,
including ones that never had them — the setup has spent its length narrowing project
grants, not widening them. Cross-checked twice before deleting (set membership against the
global list, then a literal grep of the global file; `sed -i` targets confirmed spent in
the files they name). Verified against `backups/2026-09-21-phase9/`: 23 removed, **0
added**, `ask`/`deny` and every other setting identical in all four files. FinNode's file
is the only tracked one, so its removal is committed there as `4fb453f` on branch
`chore/drop-duplicate-permission-rules`, off `main`, pushed 2026-09-21 and merged via
PR #1 as `5fd4ddc`; the other three files are untracked, so the backup is their only record —
and `backups/` is gitignored, so that record is local to this machine, as it is for every
earlier phase. Anything that must outlive the machine goes in `archive/` instead, which is
tracked; nothing from this phase did. **Both leftovers closed 2026-09-21.** *Spent
one-offs:* **nothing actionable** — zero rules contain a session-scratchpad UUID, the only
signal this plan says can be trusted, because Phase 2a already removed those; the
remaining 117 literal rules include `rtk npm test`, `jobs` and `lsof …`, which recur
constantly and are not spent. Classifying them any other way is what burned two earlier
passes. **D21 stands.** *`node_modules`:* **leave them, at Amit's direction** — and the
count was stale, **3 files / 60 rules**, not 4 / 68: `nanoid`'s copy is gone. Their
inertness is now **verified, not assumed**: the docs state `.claude/settings.local.json`
loads from the **git repository root** even when a session starts in a subdirectory, and
`node_modules/resolve/` is never a repository root, so they are never read. Deleting them
is churn — `npm install` returns them. Surveyed 2026-09-20. **Its headline finding is now
CLOSED: no project holds a broad arbitrary-code rule any more**, verified 2026-09-20 by
sweeping every `.claude/settings*.json` under `VS Code/` for `rtk proxy *`, `rtk npx *`,
`python3 -`, `python3 -c ' *`, `node *` and `osascript -l JavaScript -e ' *`. As surveyed
it found **18 rules that execute arbitrary code and bypass the entire ask list** —
`node *`, `python3 -c ' *`, `rtk proxy *`. Plus 37 already-global, 67 spent one-offs, 8
subsumed, 8 that write files. **The 384 cost zero tokens** — that was conflated when first
reported. https://claude.ai/artifact/YAJNnNkSemQyCCtMsNkzDD

### **Emp portal working tree** · ✅

**DONE 2026-09-21.** The 5.7 `.gitignore` change is committed on
`fix/dead-code-cleanup-and-test-fix` as `53c4aba`, on its own, at Amit's direction, and
pushed 2026-09-21 with no PR — reverting would have restored the `git add -A` risk that
5.7 found. **Closed 2026-09-21:** `.claude/settings.json` was untracked *and* unignored,
so the same sweep would have committed it. One line added to `.gitignore` under the
existing `.claude/settings.local.json`, matching Voice-Flow, and confirmed ignored with
`git check-ignore`. Committed as `4a5a263` and pushed 2026-09-21

### **`ask` list merged** · ✅

**DONE 2026-09-20. 112 → 51 rules**, one pattern per command instead of up to three
spellings (`X`, `rtk X`, `rtk proxy X`), using a leading `*`. Wildcards match at any
position in Bash rules; the leading-`*` startup warning applies to `allow` rules
only. **Two traps found and handled:** a leading `*` stops the trailing `*` from matching
the *bare* command, so `Bash(*git push *)` would not have matched `git push` — pattern shape
is now chosen per command, wide (`*git push*`) where the bare form matters, tight
(`*sudo *`) where a wide pattern would fire on ordinary text like `cat sudoku.txt`. `rm`, `kill`,
`killall`, `pkill` and `open` keep explicit spellings: they sit inside ordinary words
(`confirm`, `skill`, `reopen`). Verified by generating every command the old 112 matched
(226) and checking the new list covers **216**; the 10 dropped are no-argument `curl`,
`wget`, `sudo` and `security`, which only print usage. Bare `npm i` and bare `sqlite3`
were dropped by the same mechanism, are **not** harmless, and got explicit rules back. 0
over-fencing on a 40-command negative corpus. `allow` (35) and `deny` (2) byte-identical;
`claude doctor` reports no invalid rules. **Not runtime-tested — this session cannot
surface an `ask` prompt**

### **`ask` rules proven** · ✅

**CLOSED 2026-09-21.** The 20 rules that had never been seen to fire — the 14 Phase 3 gap
rules and the 6 `git commit` spellings — are covered by the merged list and the mechanism
is now measured. Manual-mode probes: `git branch --list` (covered by `allow`)
ran **silently**, while `git branch -d` and `gh auth status` (covered by `allow` *and* `ask`)
both **prompted**. So `ask` fires, `ask` beats `allow`, a merged leading-`*` pattern
matches at runtime, and the check is applied to the **hook-rewritten** command — the
`wget` lesson, measured rather than inferred. A naive probe proves nothing here: manual
mode prompts on every Bash command, so only a command an `allow` rule covers can
discriminate. Rules with no `allow` collision (`sudo`, `curl`, `wget`, `rm`, `open`) have
no conclusive probe and rest on the offline coverage check

### **Full setup review**

https://claude.ai/artifact/2WH7CSysZCJY7Ta6EhskA3 — every permission rule, global file,
memory and today's changes in one page

### **5.3 – 5.8 Low-priority tidying** · ✅

**DONE** 2026-09-20. Only **2 of the 6 needed work** — 5.4 and 5.6 were already satisfied
(by D8 and by 7a) and the rows were stale, not the files. **5.3** moved Emp portal's rules
to the project root and updated `manifest.tsv`, with the drift check proven live. **5.5**
was reframed: 10 of the 17 recorded paths no longer exist, so the real work was fixing **3
errors** in `PROJECTS.md` — Emp Portal misfiled as having no `CLAUDE.md`, a dead
`Voice-Flow-main` entry, and a stale date. **5.7** is a decision, recommended as
leave-as-is, nothing changed. **5.8** is cloud-side and not fixable here: `uv`/`uvx`
absent for browser-use, and definite's shipped URL 404s while its host answers 200.

### **Voice-Flow history + 5.8** · ✅

**DONE 2026-09-21.** `CLAUDE.md` had survived in git history — 4,647 bytes recoverable
from `598e38e Initial commit`, before `c1e9459` untracked it. Rewritten at Amit's request
with `git-filter-repo` 2.47.0 (installed for this), `--invert-paths --path
CLAUDE.md`: **162 commits on `main` and `phase-2.75-stop-losing-words`**, force-pushed with
`--force-with-lease` pinned to the recorded tips `ad38b97` and `34ad3cd`. New tips
`e0be479` and `6fb7c91`, remote confirmed to match. **Verified two ways before pushing** —
`git log --all -- CLAUDE.md` empty, and no object named `CLAUDE.md` in any commit — and
the old commit is not fetchable from GitHub by SHA afterwards. The working file is
untouched, still gitignored, byte-identical to the `project-rules/` copy; upstream
tracking restored on both branches. Mirror backup of all 162 original commits at
`backups/2026-09-21-voice-flow-history/Voice-Flow.git`. The standing recommendation had
been to wait until the repo went public; Amit chose to do it now. 5.8: `definite` stays
broken until the vendor fixes its URL

### **5.2 Cross-project read access** · ✅

**DONE** 2026-09-18, **completed 2026-09-22.** Voice-Flow's `Read(//Documents/VS Code/**)`
removed — it reached `Emp portal/.../vthru.db` and Packbly. The claim "**No cross-project
grant survives anywhere**" was **premature**: this pass swept `Read()` rules only, and a
`Bash(cd "…/SecondBrain Obsidian" && …)` rule reached a manifest-listed project until
2026-09-22. Now true and **verified by walking every rule in all 17 settings files for a
path outside its own project tree**, not by inference. D23

### **5.2b Standing grants over other folders** · ✅

**DONE** 2026-09-18. 12 entries removed. Voice-Flow now reaches only `/private/tmp`,
`/tmp`, `Voice Flow.app` and its own tree; FinNode only its own

### **5.1 Voice Flow 110 KB rules → short `CLAUDE.md` + `docs/`** · ✅

**DONE** 2026-09-18, both parts. Part one: `CLAUDE.md` **110 KB → 29 KB**, evidence moved
verbatim to `docs/working-rules.md` (42 entries) and `docs/known-pitfalls.md` (47
entries), 0 rules lost. **Part two: all 89 checked against the code — 0 superseded, 7
re-measured.** D24, D25

### **5.1 part two: check the 89 entries against the code** · ✅

**DONE** 2026-09-18. Every cited path, symbol, constant, version and build setting
resolved; `npm test` 76 files / 1764 tests and `npm run typecheck` green; `doctor:polish`
and `doctor:vault` re-run. **No rule or pitfall is superseded.** 7 entries carry a dated
re-measurement note (5 in working-rules, 2 in known-pitfalls) — the rules held, the
numbers had drifted. Both docs' "not yet checked" headers replaced; `docs/README.md` rows
updated. Backup: `backups/2026-09-18-phase5.1-part2/`. One open app defect confirmed still
open: `electron/main.js:387` `fullScreenable`. **Addendum 2026-09-19:** the same figures
were found in 20 more places across 6 Voice Flow docs, all outside 5.1's scope. 18 were
left alone — they read as dated records of decisions made on those numbers, which is what
D25 says to keep. The 2 that were annotated are in `docs/manual-testing.md` (Test 23's
live baseline and the 10 Sep pass record), because a tester reads them at the moment of
deciding whether a run passed. So the note count is **9 places in 3 docs**, not 7 in 2.
The 4 stale code comments (`doctor-polish.js:64`/`:500`, `polishPrompt.ts:171`,
`polishGuard.ts:25`) are still untouched — a source change wants its own commit. Backup:
`backups/2026-09-19-manual-testing-baseline/`; Voice Flow commit `f91c399`

### 6.2 Private GitHub remote + push · ✅

**DONE**, `AmitJangra25/claude-setup`, verified private

### Pushed 2026-09-18 · ✅

4 commits, head `8cdee2f`, remote confirmed private via the API

### **6.3 Project rules into this repo** · ✅

**DONE** 2026-09-18. All 7 project `CLAUDE.md` files copied to `project-rules/`, with
`sync.sh` + `manifest.tsv` as the anti-drift step. All 7 read in full first. Drift
detection proven by breaking a copy on purpose

**Where the numbers stand now** — project `allow` rules **560 → 318**:
560 as found · **416** after 2a+2b (−144) · **393** after 2c (−23) · **392**
after 5.2 (−1) · **384** after 5.2b (−8, plus 4 `additionalDirectories`
entries) · **330** after the Voice-Flow pass (−54) · **318** after the FinNode
pass (−12) · **299** after the `vthrudebugger_v1` pass (−19) · **291** after the
`Debugger v2` pass (−8) · **285** after the `Emp portal` pass (−6) · **244** after
the two same-day follow-ups (−41 stripping Voice Flow_v1, Voice-Flow unchanged at 141)
· **221** after Phase 9 on 2026-09-21 (−23) · **213** after the 2026-09-22
maintenance pass (−8, all Voice-Flow: 2 dead, 4 duplicates, 1 naming a
`release/mac-arm64` path that no longer exists, and the `SecondBrain Obsidian`
cross-project grant D23 forbids).
Verified live by walking every `.claude/settings*.json` under `VS Code/`, not by
arithmetic. Global `allow` is **33** since 2026-09-22 (two dead `gh` rules removed; it
read 35 from 2026-09-18 until then; **34 since 10-10-2026, D35**) and `deny` is 2; **`ask` is 58** — 87 after 1.2, 101 after the Phase 3 gaps,
107 after the Voice-Flow pass added the `git * commit *` spellings, 112 after Phase 11
fenced `wget` and `pip`, then **51 after the merge of 2026-09-20**, which collapsed the
three per-command spellings into one leading-`*` pattern without losing coverage, and
**58 on 2026-09-27** when seven rules closed the `git restore`, `git stash drop`/`clear`
and brew gaps.

**And rules nobody has ever counted.** `.claude/settings.local.json` files sit
*inside* `node_modules`, carrying `allow` rules that arrived by `npm install`, not
from this machine. **Re-counted 2026-09-21: three files, 60 rules** — three copies
of `resolve`. As first found on 2026-09-20 it was four files and 68 rules; `nanoid`'s
copy is gone. They are the package maintainer's own grants, published to npm by
accident, and one of them ships a `notes.md` of their house style. The 384 count
never included them. Found 2026-09-20 while cross-checking the Voice-Flow pass;
see Phase 9.

**The runtime probe behind "`ask` rules proven", 2026-09-21.** The evidence for that row,
kept because the conclusions are worth less without it. Run in manual mode.

| Command | `allow` | `ask` | Result |
|---|---|---|---|
| `git branch --list` | `Bash(rtk git branch *)` | — | **no prompt** (baseline) |
| `git branch -d claude-ask-probe` | `Bash(rtk git branch *)` | `Bash(*git branch -d*)` | **prompt** |
| `gh auth status` | `Bash(gh auth status*)` | `Bash(*gh auth*)` | **prompt** |

**Method note.** Manual mode prompts on every Bash command, so a probe is conclusive only
when an `allow` rule already covers the command — those run silently, so a prompt can then
only come from an `ask` rule. Where no `allow` rule collides with the `ask` rule under test
— `sudo`, `curl`, `wget`, `rm`, `open` and most others — no conclusive probe exists without
temporarily adding one. Those rules rest on the offline coverage check plus these two
confirmations; the matcher is the same for all of them.

**Dated evidence from the 2026-09-22 plugin pass**, recorded here rather than re-checked
since: before the unused plugins were disabled, no project was found to depend on them —
every grep hit was prose, and the only `Skill()` permission rules anywhere named
`claude-api`, which is built in.

## The git repo — where it lives

- **Local:** `~/.claude` is a git repository (4 commits when written, 2026-09-18 — read today's count from git).
- **Remote:** `https://github.com/AmitJangra25/claude-setup` — **private**,
  owned by GitHub account `AmitJangra25`. Pushed 2026-09-18.

**Verified after every push:** GitHub holds byte-for-byte the same file list as
`git ls-files` locally — no more. The count has moved as work landed: 40 at 6.2,
34 after 7a removed six duplicate memory files, 35 once `PHASE2-REMOVALS.md` was
added. Check it against `git ls-files | wc -l`, not against a number in this file. Zero matches for any excluded
pattern (`.claude.json`, `history.jsonl`, `*.jsonl` transcripts, credentials,
`backups/`, `plugins/`, `skills/`, `file-history`, `paste-cache`). Confirmed
against GitHub's own file listing, not the local `.gitignore`.

To resume on another machine: `git clone` it into `~/.claude`. That covers
everything in the "survives account switch" table below.

## Verify that state rather than trust it

**These commands verify the state as it was on 2026-09-18, after steps 1.1 and 1.2** —
they are the record of that checkpoint, not a health check for today. Their expected
values have all since moved: the repo tracked 37 files at `2e9facc` and has grown with
every file added since — `git ls-files | wc -l` gives today's count — and the permission
counts are 33 `allow` / 58 `ask` / 2 `deny` (34 `allow` since 10-10-2026, D35), after the `ask` list was merged on
2026-09-20, two dead `gh` rules went on 2026-09-22, and seven rules were added on
2026-09-27. Run them
against that date's commits, or read them as history.

**The first two commands no longer apply** — `backups/` was deleted 2026-09-21 and that
snapshot now lives in `archive/pre-setup-originals-2026-09-18.tar.gz`. Extract it to
somewhere temporary if you need to run them.

```bash
# backup exists, 27 files — HISTORICAL, backups/ is gone
# ls -1 ~/.claude/backups/2026-09-18-setup/global | wc -l    # expected 10
# find ~/.claude/backups/2026-09-18-setup -type f | wc -l    # expected 27

# git repo exists, both commits present, tree clean
git -C ~/.claude log --oneline                               # newest first; 14883fa is the baseline
git -C ~/.claude status --porcelain                          # expect empty
git -C ~/.claude ls-files | wc -l                            # expect 37

# settings.json after 1.2. It NO LONGER matches the 1.1 backup — that is
# expected. The real proof is that the change was additions only:
git -C ~/.claude diff 885c1d4 -- settings.json | grep -c '^-[^-]'   # expect 0
python3 -c "import json;p=json.load(open('$HOME/.claude/settings.json'))['permissions'];print(len(p['allow']),len(p['ask']),len(p['deny']))"
                                                             # expect 35 87 2

# 1.2 marker: `tccutil` now appears TWICE — `Bash(tccutil *)` and
# `Bash(rtk proxy tccutil *)`. Do NOT grep for `gh repo` — `Bash(gh repo view*)`
# is a pre-existing ALLOW rule and gives a false positive.
grep -c tccutil ~/.claude/settings.json                      # expect 2
```

If `tccutil` returns 0, 1.2 has been reverted — check `git log` and
`git diff 885c1d4 -- settings.json`.

```bash
# Five dated backups, one per editing step. All verified with `cmp` when made.
# HISTORICAL — backups/ was deleted 2026-09-21; this lists nothing now.
ls -1d ~/.claude/backups/*/
#   2026-09-18-setup     before 1.1   (27 files, the original state)
#   2026-09-18-phase2    before 2a+2b (11 project settings files)
#   2026-09-18-phase2c   before 2c
#   2026-09-18-phase5.2  before 5.2   (Voice-Flow only)
#   2026-09-18-phase5.2b before 5.2b  (Voice-Flow + FinNode)
#   2026-09-18-phase5.1  before 5.1  (Voice-Flow CLAUDE.md + docs/README.md)
#   2026-09-18-phase5.1-part2 before 5.1 part two (CLAUDE.md + the two docs + docs/README.md)

# 5.1 part one: the split lost nothing. Each doc body must still equal the
# line range it came from in the backup. Both MUST print True.
python3 - <<'EOF'
import os
V = os.path.expanduser("~/Documents/VS Code/Voice-Flow")
orig = open(os.path.expanduser("~/.claude/backups/2026-09-18-phase5.1/CLAUDE.md")).read().split("\n")
for slug, (a, b) in (("working-rules", (162, 646)), ("known-pitfalls", (760, 1446))):
    body = open(f"{V}/docs/{slug}.md").read().split("\n---\n", 1)[1].strip()
    print(slug, body == "\n".join(orig[a-1:b]).strip())
EOF

# Project allow rules, and D23's invariant: no project may reach another.
# Prints the current total, then every cross-project grant. The second list
# MUST be empty — if it is not, D23 has been breached and it is a P1.
python3 - <<'EOF'
import json, os
VS = os.path.expanduser("~/Documents/VS Code"); tot = 0; bad = []
for root, dirs, fs in os.walk(VS):
    dirs[:] = [d for d in dirs if d != "node_modules"]
    if os.path.basename(root) != ".claude": continue
    dirs[:] = []
    top = os.path.relpath(os.path.dirname(root), VS).split(os.sep)[0]
    for fn in sorted(fs):
        if not (fn.startswith("settings") and fn.endswith(".json")): continue
        pm = json.load(open(os.path.join(root, fn)))["permissions"]
        tot += len(pm["allow"])
        for a in pm["allow"]:
            if "Documents/VS Code" in a and a.startswith(("Read(", "Edit(", "Write(")):
                inner = a[a.index("(") + 1:-1].lstrip("/")
                if not inner.startswith(f"Users/amitjangra/Documents/VS Code/{top}"):
                    bad.append(f"{top}/{fn}: {a}")
        for x in pm.get("additionalDirectories") or []:
            if x.startswith(VS) and not x.startswith(os.path.join(VS, top)):
                bad.append(f"{top}/{fn}: additionalDirectories {x}")
print("project allow rules:", tot, " (384 on 2026-09-18, 213 on 2026-09-22)")
print("cross-project grants:", bad or "NONE — D23 holds")
EOF
```

## How to work on this, in one line each

- **Nothing is removed or blocked without explicit approval.** This is D4 and it
  governs everything. List it, explain it, wait.
- **Explain every permission request in four lines** before the prompt appears:
  what it does · what changes · risk and why · how to undo. This is D3.
- **Verify with a command and its output, or do not claim it.** Four claims in
  the first session turned out to be wrong; see "What I got wrong".
- **Re-run anything through `rtk proxy`** if it feeds a decision to delete, move
  or overwrite a file. rtk rewrites command output. This is D12.
- **Cross-check twice, by two different methods, before deleting anything.** Amit's
  standing instruction since 2026-09-20. It has already caught a wrong claim and an
  incomplete fix in work reported as done — see Phase 10. **Current rule since
  08-10-2026: `STANDARDS.md` step 4; procedure in `harness/cross-check.md` (D33).**
- **List incidental findings at the end, do not chase them.** Amit sets the pace.
- **Recommend one option and say why — including why not the others.**
- **Amit dictates his prompts.** Read through transcription errors rather than
  asking what he meant. "bs4" meant "VS Code".

---

## Why this file exists

Three reasons, in order of importance.

**1. It is the rebuild spec.** The setup must survive switching Claude accounts
— logging out of account A and into account B — and must be reproducible on a
different machine. This file plus the git repo in Phase 6 are what make that
possible. Section "Rebuilding on another account" is the runbook.

**2. It records what is actually there.** The setup grew by accident over ~120
sessions: rules written in one project, permissions granted by clicking "allow"
in the moment, skills arriving from the cloud on their own. Nobody designed it.

**3. It is the standing record.** As the setup changes with how the work is
actually done, this file is what gets updated — so the reasoning behind each
choice is still here in six months, and so the next change is made against a
known state rather than a guess.

## What I got wrong while surveying it, and why

Recorded so the same mistake is not repeated.

| I claimed | The truth | Why I got it wrong |
|---|---|---|
| `rtk git branch -D` runs with no prompt, proven by running it | **The test could not show that.** The session had `ask` enforcement off — `rm -rf` in the same command line matches `Bash(rm *)` and was also silent. The *rule-list* defect is real; the runtime claim was not earned | Read the absence of a prompt as evidence about one rule, without checking whether any rule was being enforced. A control was available and free — an already-asking command in the same command line — and I did not look at it |
| A stray rules file at `Documents/Voice-Flow-main/` | It is at `Documents/extra/Voice-Flow-main/` | rtk rewrote my search output and dropped a path segment. I did not re-verify. |
| A project's `allow` overrides a global `ask`, so the git safety rule was cancelled | **Backwards.** Rules are evaluated deny → ask → allow, and rule type beats file location. The global `ask` wins. | I assumed instead of reading the documentation. |
| 350 saved permissions | 560 | 350 was Voice Flow alone, not the total. |
| 8 rules ran without prompting | 40 | My risk categories put arbitrary-code and Keychain access in the "low risk" bucket. |
| `ENVIRONMENT.md` never loading was a problem to fix | **Deliberate and already documented.** A comment in `CLAUDE.md` explains it: reference material, and every `@import` is re-read every turn. | I read `CLAUDE.md`'s imports but not the file itself. |
| Voice Flow's `CLAUDE.md` being gitignored was an oversight | A standing preference from 2026-08-11, recorded in memory as `claude-md-not-in-git` | Did not read the memory files before recommending. Fixed by D14. |
| `sudo` ran 2× and `killall` 3× in history, so both needed fencing | **Neither has ever been run.** Every hit was the *word* inside a python regex or a `grep -n "a\|killall\|b"` pattern | My probe split compound commands on `\|` and matched heredoc contents. Fixed by replaying with full-token glob matching, which is what the permission system actually does. |

**Root cause:** each answer came from a fresh narrow query instead of one
complete inventory. Fixed by completing the inventory before planning — this
file is that inventory.

---

## The five systems

Only system 2 was deliberately authored. The rest accumulated.

```
1. CLOUD          claude.ai account — arrives on its own, cannot be edited here
   18 synced skills, 13 synced plugins, 4 MCP connectors
   (ClickUp, Figma, Sentry, Claude Docs)

2. GLOBAL RULES   ~/.claude/*.md — 13 KB, loads in every session
   CLAUDE.md imports STANDARDS, PROJECTS, RTK, REPOS, OLLAMA
   ENVIRONMENT.md (15 KB) exists but is NOT imported — never loads

3. SETTINGS       ~/.claude/settings.json + .claude/ in each project
   model opus[1m], effort high, 1 hook (rtk on every Bash), statusline script
   (12-10-2026: default model now `sonnet`, `switchModelsOnFlag` false — D39.
   Whether "effort high" reaches Sonnet 5.5 or Opus 5.5 is not known — D39.)
   (23-10-2026: default model back to `opus` — `0e47a4f`.)
   AS FOUND: 560 permission rules across 8 projects / 11 files (the "562 / 12
   files" first written here was wrong; measured again it is 560 / 11).
   All 560 are `allow` — not one project-level `ask` or `deny`.
   NOW: 384, after phases 2a, 2b, 2c, 5.2 and 5.2b.

4. PROJECT RULES  CLAUDE.md per project — 6 of 8 projects have one
   Voice-Flow 110 KB · FinNode 16 KB · rest 2-6 KB

5. MEMORY         ~/.claude/projects/<path>/memory/
   27 memory files across 5 folders — 2 folders orphaned by path changes
```

Desktop app is separate (`~/Library/Application Support/Claude/`) and out of
scope for now.

## Scope

Projects inside `~/Documents/VS Code/` only — 8 of them. Everything else in
`~/Documents` is ignored, including `extra/Voice-Flow-main`.

| Project | Rules | Permissions | Memory | Git |
|---|---|---|---|---|
| FinNode | 238 lines | 32 | 3 | CLAUDE.md committed |
| Voice-Flow | 1446 lines | 350 | 11 | CLAUDE.md gitignored |
| Voice Flow_v1 | 83 | 55 | — | |
| vthrudebugger_v1 | 91 | 56 | 3 | |
| Packbly_web | 59 | 8 | — | |
| Emp portal | 86 (wrong folder) | 15 | — | not committed |
| Debugger v2 | none | 23 | 4 | |
| Packbly_v2 | none | — | — | |

---

## Decisions already made

### D1 · 2026-09-18

Goal is to make consequential actions **visible**, not to build a lock

### D2 · 2026-09-18

Always ask before git push and anything that can destroy unsaved work — every project

### D3 · 2026-09-18

Permission prompts get four short lines: what it does · what changes · risk and why · how
to undo

### D4 · 2026-09-18

**Never block or remove anything without explicit approval**

### D5 · 2026-09-18

`tccutil reset` → ask with full detail. Do not block it.

### D6 · 2026-09-18

Dated backup folder before the first edit, kept permanently

### D7 · 2026-09-18

Voice Flow rules: split into short rules + separate docs, trim what is stale

### D8 · 2026-09-18

ENVIRONMENT.md stays unloaded; add a pointer to it from PROJECTS.md

### D9 · 2026-09-18

Remove the dead and one-off permission rules, after per-rule impact check

### D10 · 2026-09-18

`python3 -c` / `node -e` / `awk` / `osascript` stay allowed. Accepted as arbitrary code
execution; fencing them costs many daily prompts and blocks nothing real

### D11 · 2026-09-18

Voice Flow + Emp portal rules get committed to git, but **after** the Voice Flow split
(5.1), so the repo gets the clean version

### D12 · 2026-09-18

rtk stays. The fault was my verification, not rtk: anything feeding a decision to delete,
move or overwrite a file must be re-run through `rtk proxy` first

### D13 · 2026-09-18

**Supersedes D11.** Project `CLAUDE.md` files stay out of their own project repos (August
preference holds). A copy lives in the private `~/.claude` repo under
`project-rules/<project>/` so they still travel. **Superseded 2026-09-20 — reversed at
Amit's direction.** `CLAUDE.md` and `.claude/settings.json` now **stay tracked while a
repo is private and solo**, and taking them out is raised before a repo goes public, never
done silently; `STANDARDS.md` § *Git* governs. The `project-rules/` mirror stays either
way — it is the only version history where a project does not track them, and a second
copy that survives a machine or account switch where it does. The projects were **not**
made uniform: Voice-Flow was left untracked and not reverted, FinNode is tracked
— **recorded, not freshly checked.** The decision above is kept as the record of what held
between 2026-09-18 and 2026-09-20

### D14 · 2026-09-18

Read the memory files before recommending anything that touches a project

### D17 · 2026-09-18

Session size is managed at the **task boundary, not a number**. Past ~300k finish the
current piece, then suggest a fresh session. Never clear mid-task — measured 3% saving
there against 45–54% at a boundary. **The principle still holds. The ~300k is superseded
(2026-09-30): the status line now warns at 250K and says act at the next task boundary at
400K. Lowered again 11-10-2026: it now warns at 200K and says act at the next task
boundary at 300K. Current values and their reasons: `ENVIRONMENT.md` § *Status line* and
the comment block in `statusline/context.py`.**

### D18 · 2026-09-18

Priority is **P1** broken/blocking/losing data · **P2** works but wrong, or blocks the
next piece · **P3** everything else. Assign before dividing the work

### D19 · 2026-09-18

Before writing code: state what the change is for, find what depends on it, and say what
it cannot affect

### D20 · 2026-09-18

A rule already in `STANDARDS.md` is **not** restated in different words. Four of Amit's
2026-09-18 rules were already covered; re-adding them would double the file and let two
phrasings drift apart

### D15 · 2026-09-18

**`npx` stays out of `ask`.** Confirms the existing `ENVIRONMENT.md` exclusion against a
fresh measurement: 231 of 235 calls are build/test. Only `npx --yes|-y` is fenced

### D21 · 2026-09-18

**B3 pipeline fragments stay.** 74 `echo`/`awk`/`grep`/`sort` rules are one-off but
harmless; removing them buys tidiness and costs prompts mid-task on read-only commands

### D22 · 2026-09-18

A rule containing a literal `*` is **not** removed until it is known whether Claude Code's
matcher globs it. 3 spent `sed` rules are held on this

### D23 · 2026-09-18

**A project may read its own tree silently. Another project — never, not by any rule.
Other folders (Documents, `~/.claude`, temp) — by prompt, not by a standing grant.**
Amit's rule, 2026-09-18: "That doesn't make any sense: to give access to other projects."
Supersedes the narrow-it proposal in 5.2, which would have kept `Voice Flow_v1` — that is
another project, so it goes too. **"By prompt" reworded by D38, 10-10-2026.**
**Read part superseded by D46, 10-11-2026:** every session may read other projects and
`~/.claude`; changes stay in the working folder. No standing grant to another project
still holds.

### D24 · 2026-09-18

**Voice Flow's rule claims live in `CLAUDE.md`, the evidence in `docs/`.** This knowingly
bends `docs/README.md`'s own rule 4 ("the moment two files carry the same rule, one of
them starts lying"): each claim line now exists twice. Accepted because D7 asked for
"short rules + separate docs" and a pointer-only `CLAUDE.md` would leave every Voice Flow
session with no rules in context. Tie-breaker written into both files: if they
disagree, **`CLAUDE.md` is the rule** and the document is the record of why — fix the document

### D25 · 2026-09-18

**A stale measurement is annotated, never overwritten.** When 5.1 part two found a figure
the code had outgrown, the original sentence and its date were left standing and a dated
`> **Measured again**` note was added beside it. Overwriting the number would destroy the
thing the document exists for — what was true when the rule was made, and how far it has
moved since. Same principle as `dont-delete-reference-docs`, applied inside a file rather
than to it

### D28 · 2026-09-26

**A capability is made cheap, not removed.** `skillOverrides` has four states, and
`name-only` keeps a skill working and suggestable for ~15 tokens instead of 100–350 — so
the answer to an unused skill is `name-only`, never deletion. What that cannot reach is
removed instead, and only then: a plugin whose cost is MCP *server instructions*
(`browser-use`), the claude.ai connectors (no per-connector setting exists), and a
built-in **tool**, which is not a skill at all — `enableArtifact: false` was the single
largest cut. Every one is reversible by deleting its line. **Plugin skills are the trap:**
bare names are reliable — all 18 took effect — but the 15 plugin entries did nothing as
bare names and nothing again with the prefix `/context` prints. A wrong key is a silent
no-op, not an error, so both attempts looked like success until a fresh session was
measured. **Answered 2026-09-26: `skillOverrides` cannot reach plugin skills at all** —
`/skills` shows `engineering:debug` as *"locked by plugin · Plugin skills are managed via
/plugin"*, and saved twice without writing an entry for it. The key format was never the
problem and three guesses were spent before the menu was asked. **Ask the menu first:**
`/skills` and `/plugin` write the correct key by definition — `/skills` produced
`anthropic-skills:doc-coauthoring`, a prefix `/context` never prints, so the key cannot be
derived from what `/context` shows. `/skills` writes to the gitignored
`settings.local.json`, whose `skillOverrides` **merges** with `settings.json` rather than
replacing it (verified — which `settings.local.json` held the entries is not recorded, so
it does not prove the top-level file is read; noted 10-10-2026), but which therefore
does **not** travel to a second account. Measured `/context` **34.3k → 21.9k**;
`ENVIRONMENT.md` holds the table, the method change and why it is not comparable with
44,700

### D29 · 2026-09-26

**A skill earns its tokens by knowing something this setup does not already know —
otherwise it is proposed, not kept.** Decided 2026-09-26 on the ten `engineering:` skills,
and the reasoning is the rule. Five of them — `debug`, `code-review`, `testing-strategy`,
`documentation`, `tech-debt` — restate rules `STANDARDS.md` already states more sharply
and in Amit's own words, so loading both puts a generic checklist in competition with a
better one. Three more — `standup`, `incident-response`, `deploy-checklist` — assume a
team, an on-call rotation and a release train, none of which a solo developer on private
repos has; they could never fire. `architecture` duplicates this file's own D-number
decision log. **Zero uses across ~120 sessions was the weaker argument and nearly the
wrong one:** never-used does not mean not-needed, and the case only holds because the
content was read and found redundant. 930 tokens a session, and `/plugin` restores it in
seconds — reversible, so the bar for removing is low and the bar for keeping is *use*.
`pdf-viewer` kept at ~195 tokens: real PDF work, no duplication. **The forward half of the
decision:** propose skills from repeated real work rather than keeping the ones that
shipped — `skills/ollama/` is the shape that works, hand-written and specific at ~130
tokens. See the `propose-skills-from-observed-work` memory note. **Done and measured the
same day:** `/plugin` wrote `"engineering@synced": false` — it picked the `@synced` suffix
over `@inline`, the coin-flip that was refused after three failed key guesses.
Skills **3.9k → 3.0k**, the 930 exactly. **Total did not move**, holding at 22.0k, because system
tools rose 0.9k when Claude Code updated 2.1.282 → 2.1.283 in the same window; inferred,
not proven. The saving is real and something else spent it.

### D16 · 2026-09-18

Every new `ask` rule is written in all three spellings — bare, `rtk `, `rtk proxy ` —
because four projects blanket-allow `Bash(rtk proxy *)`. **Superseded 2026-09-20** by the
`ask` list merge — one leading-`*` pattern per command covers all three spellings
(status-table row **`ask` list merged**); no project holds `Bash(rtk proxy *)` since
09-10-2026. Noted 10-10-2026.

### D26 · 2026-09-22

**A rule file is trimmed only where the content is a *procedure*, never where it is
a *rule*.** A procedure is "how to do X" — you know you are doing X, so a skill's
description fires reliably. A rule is "don't do Y" — you do not know you are about to do
Y, so there is no trigger and lazy-loading it means it silently never loads. Anything
moved out of an always-loaded file leaves a one-line pointer naming the skill and when to
load it, the way `OLLAMA.md` does, so the load is an instruction rather than a judgement
call. Applied 2026-09-22 to decline the FinNode split: measured 573 tokens of rule claims
against 990 of supporting prose, but the prose is mostly operative — which of
`observeById`/`getById` fails which way, that moving the device clock does not fire a
pending sweep. **The Voice-Flow 110 KB diagnosis has now failed to transfer to FinNode
twice.** Measure the sections before proposing the fix

### D27 · 2026-09-25

**Two modes and one task order are rules in `STANDARDS.md`; the templates they use are
procedures, loaded on demand.** General mode is the default and opens no project. Reading
one file is not selecting a project. A project is selected on evidence — the working
folder and the git repository that contains it — with the remote, the project's
`CLAUDE.md` and its `PROJECTS.md` entry as supporting checks. A check that cannot run is
reported, not treated as a mismatch; conflicting evidence stops and asks. Naming a project
from general mode needs confirmation before it is opened. Templates sit in `templates/`
behind a one-line pointer, per D26. `STANDARDS.md` 1,634 → 2,120 words. **Startup
measurement pending.** **Clarified 2026-09-25:** the **pre-Block-1** startup measurement
was never taken and is **unavailable**, so Block 1's own startup cost cannot be measured.
The **post-Block-1** first-reply baseline **was measured**: **44,700** (three fresh
sessions: 44,699 · 44,701 · 44,700). Nothing remains pending.

### D30 · 2026-09-28

**A project rule cannot weaken a global gate.** `STANDARDS.md` line 3 already said the
project wins where the two overlap; it now says what that does not cover — approval,
recording, safety and permissions hold everywhere, and a project rule may only tighten
them. **This closes a guidance gap, not an enforcement one.** The enforced side already
held the right way round: rule type beats file location, so a global `ask` beats a project
`allow` — **this plan's** § *The precedence rule that makes this work*, and the opposite
belief is one of the errors listed in **its** § *What I got wrong while surveying it*. The
mechanism was measured in a manual-mode probe on **2026-09-21**, recorded in this plan
under the **`ask` rules proven** row and the evidence table that follows it. That probe
covered two *global* rules; the eight *project* `ask` entries added 2026-09-28 rest on the
same matcher and are **not observed**. **Followed up later on 2026-09-28, after this row
was written:** five of those eight — Voice-Flow's whole set — were observed prompting that
same day, observed and pasted in by Amit and recorded in `baselines/2026-09-28-run2.md`;
FinNode's three remain not observed. Prose cannot enforce anything (`ENVIRONMENT.md`
§ *The two kinds of rule*), so this constrains what Claude tries, and `settings.json` is
still the only boundary. The same edit adds a pointer to read `ENVIRONMENT.md` before
creating or changing a permission rule, because the rtk hook rewrites a command before the
permission check and a rule therefore needs every spelling the hook can produce (**D16**).
`STANDARDS.md` 265 → 271 lines, ~55 tokens a turn; not measured in a fresh session.
(**Corrected 2026-09-29:** this row said "265 → 269". The commit was 265 → 271 — checked
by running `wc -l` over `git show 55a9579:STANDARDS.md`. The token estimate is unchanged.)
Commit `55a9579` **Followed up 2026-09-29:** FinNode's three were then observed too. Its
live `ask` list was checked and held exactly the three connected-test patterns, and each
prompted against a read-only `rtk grep -c <name> CLAUDE.md` containing that task name,
every prompt naming its own matching rule — observed and pasted in by Amit, recorded in
`baselines/2026-09-29.md`. So all eight project `ask` entries added 2026-09-28 have now
prompted at least once. **Bounded:** these were greps containing the protected names, not
the real Gradle tasks or npm scripts, and the evidence is three probe commands in one
session — it supports the rule firing in those cases, and is **not** a universal
precedence conclusion.

### D31 · 2026-09-29

**Task records live inside the selected project, at `.claude/current-task.md` — not under
`~/.claude`.** A central `~/.claude/workspaces/<Project>/` would need a standing
cross-directory grant, and **D23** removed exactly that on 2026-09-18: FinNode's
`Read(//Users/amitjangra/.claude/**)` plus the `additionalDirectories: ~/.claude` in both
FinNode and Voice-Flow (item **5.2b**). In-project needs no grant, no settings change and
no new working directory. The record is read **on demand at Orient**, so it adds nothing
to startup beyond one pointer line in `STANDARDS.md`. It holds approval scope, status,
verified result, blockers and the exact next step, and is written only for meaningful
changing work likely to cross a session or a compaction — never for a small request.
`templates/handoff.md` is its template, **extended rather than duplicated**, so there is
one shape and one source of truth. **Untested:** no resume has been demonstrated, and one
point in the record is unresolved — **D23** says `~/.claude` is reachable from a
project *by prompt*, while the rtk tee finding recorded under **PHASE 1** measured an
outside-directory read as *blocked* until a global `allow` rule was added. Not settled
here, because the chosen design needs neither. **Followed up 2026-09-29, after this row
was written:** the FinNode session reported finding and reading `.claude/current-task.md`,
and reporting the Phase B task and its approved scope, without changing a project file.
Two limits stand. The `RESUME-OK-7431` token was present in the test prompt, so repeating
it is **not independent proof** of recovery; and the exact prompt text was not captured
here, so nothing is claimed about what else it contained. **Recovery after a compaction
remains untested**, as does permission to continue changing work. All of it observed and
reported by the FinNode session — this session verified none of it and did not open that
project. The temporary record was deleted there after approval. The D23 / **PHASE 1**
contradiction above is unchanged and still unsettled. (Settled by **D38**,
10-10-2026.) **Compaction followed up later on 2026-09-29, after the paragraph above was written:**
a **same-session** probe wrote the record, started the work, ran `/compact`, then continued
from `carry on` alone — lines appended in order, the stated exclusions held — no
`CLAUDE.md` edit, no Gradle task, no commit, no push (`baselines/2026-09-29-run2.md`).
That shows **continuation across a compaction with scope adherence**, subject to the
completeness of the pasted tool calls. It does **not** show this record caused it: the
task reached the session before the compaction, so the summary may carry it, and a
no-record control was considered and dropped as non-discriminating for exactly that
reason. **The mechanism claim in this row is therefore still unproven.** The final record
had formatting irregularities, noted so the result is not overstated; formatting was not
what the probe tested. Cleanup was **reported by that session** — both temporary files
absent, FinNode's `git status --short --untracked-files=all` empty at `4af6fae` — with the
deletion turn itself not supplied, so no one here witnessed it.

### D32 · 03-10-2026

**Part 2B decisions — one owned file per kind of fact.** Recorded 03-10-2026 during Part
2B housekeeping; reserved here by **D33**. (1) **Core docs do not grow to justify deleting
a backup.** If something is worth keeping, it goes in a small file that owns that kind of
fact, and the large docs point at it — Amit's rule. (2) **Test records live apart from
this file.** Global setup tests are indexed in `baselines/global-open-tests.md`; project
tests belong in each project's own `tests/` or `qa/`, created when that project is next
worked on. (3) **Pointers use section names, never line numbers.** Line numbers rot.
Source: `.claude/current-task.md` § *Decisions from Part 2B*, which git does not keep, so
this row is their durable record. (11-10-2026: that section no longer exists; this row is
the only record.)

### D33 · 08-10-2026

**A small harness is the control desk for the setup: `harness/status.md` is the one
current status view, `harness/cross-check.md` the cross-check procedure.** Status had
drifted across four places (this file's START HERE, `.claude/current-task.md`,
`baselines/global-open-tests.md`, the `claude-setup-status` memory note) and nothing made
a session check them. The harness points to owners and copies nothing; the task loop stays
in `STANDARDS.md`, which gains only short global rules (cross-check before approval for
risky or structural work, model and why, DD-MM-YYYY for new dates, a skill after four
repetitions, a workload marker for meaningful extra work). Setup-only rules go in
`.claude/CLAUDE.md`, which loads only in sessions started in `~/.claude` — measured
08-10-2026 with `/context all`: 151 tokens there, absent in FinNode — so projects do not
pay for them. Global rules, including the short deletion rule, remain in `STANDARDS.md` so
project sessions can follow them; `harness/cross-check.md` contains the detailed procedure
and is read only when needed. D32 is reserved for the Part 2B decisions, recorded in P1B.
The two older deletion lines in this file now point to both. Rejected: `loop.md`,
`overview.md`, `global-rules.md`, `test-harness.md` as duplicates of `STANDARDS.md` and
`README.md`. Token saving is the primary constraint: one agent cross-check only where risk
justifies it, shown with markers. Moving the history out of `.claude/current-task.md` and
retiring the other status copies is P1B, approved separately.

### D34 · 10-10-2026

**`harness/overview.md` is kept, as a map and the definition of "finished" — this
supersedes only D33's rejection of `overview.md`.** It describes how the pieces fit in a
session and lists checkable done-criteria. It copies no table: it points to `README.md`
for files, `harness/status.md` for owners and `STANDARDS.md` for the task loop. Not
imported, so no per-turn cost. Capped at about 35 lines after a cross-check found a fuller
version would repeat `README.md`. The rest of D33 stands.

### D35 · 10-10-2026

**A global `allow` rule is written in the spelling the hook produces, checked with `rtk
hook check`.** T6 fixes A and B: `Bash(rtk git rev-parse *)` removed — the hook never
rewrites `git rev-parse`, so it never fired. `Bash(rtk gh run list*)` and `Bash(rtk
tree *)` added beside the bare `gh run list*` and `tree *`, which stay for piped lines the hook
leaves raw. **Corrected the same day:** the bare rules were not shown to be dead. rtk
0.48.0's hook answers Claude Code with `permissionDecision: allow` on some rewrites — in
115 recorded simple rewrites, only these two commands, both matching a bare rule — so
whether the bare rules alone were enough is untested. Live, manual mode, 10-10-2026: both
ran with the hook's `allow` and returned in under a second (`tree` 0.2 s, `gh run list`
0.6 s), so no box was waiting. `rtk hook check` was shown to write nothing to
`hook-audit.log`. `allow` 33 → 34. Exact text and checks: `baselines/t6-removals.md`
entries 2–3.

### D36 · 10-10-2026

**Setup sessions ask before `git pull`, `git switch`, `git stash pop` and `git stash
apply`** — four `ask` rules in `.claude/settings.json`, so they apply only to sessions
started in `~/.claude`. Closes open test 8 for this repo; the global list is unchanged,
because a global rule still needs test 3's replay first. Chosen over narrowing `Bash(rtk
git *)` in `.claude/settings.local.json`, which would have prompted on read-only forms in
use (`stash list`, `--no-pager diff`) and still let auto mode through. Not caught: `git -C
<path> pull`, the same gap as the global list. Exact original file and checks:
`baselines/t6-removals.md` entry 4. **Partly superseded 30-10-2026 (D41):** the `git pull`
and `git switch` rules were removed; their risky forms are now asked globally. The two
`git stash` rules stay.

### D37 · 10-10-2026

**`.gitignore` root allow lines are anchored with a leading `/`, and every tracked root
file has its own anchored allow line; folders use the wildcard lines already there.**
Unanchored names matched in every re-included folder — that is how `.claude/settings.json`
and the three `archive/PHASE2*` files were allowed by accident, and it would have let in a
stray `projects/x/CLAUDE.md`. The PHASE2 lines moved into the `archive/` block;
`!.claude/settings.json` added. Same 95 files allowed and same 4,267 ignored before and
after. Original lines and checks: `baselines/t6-removals.md` entry 5.

### D38 · 10-10-2026

*Read block part superseded by D46, 10-11-2026 — the block is off.*

**D23 restated to what is proven — wording only, no behaviour change.** Enforced: no
project holds a standing grant (`allow` rule or `additionalDirectories`) to another
project or to `~/.claude`; the sweep in § *Verify that state rather than trust it* checks
it. **Corrected 10-10-2026 (T6):** the sweep checks only part of this. It reads the
`allow` list of every `settings*.json` directly inside a `.claude` folder under
`Documents/VS Code`, skipping `node_modules`, and flags only `Read(`, `Edit(` and `Write(`
rules whose text names `Documents/VS Code`, and `additionalDirectories` entries written as
a full path under it. It misses grants to anywhere outside `VS Code` (`~/.claude`,
`~/Documents/SecondBrain Obsidian`), `additionalDirectories` written as `~/…`, and Bash
rules that reach another folder — the `cd "…/SecondBrain Obsidian"` rule removed
2026-09-22 was one; and its same-project test lets a sibling whose name starts the same
(`Voice-Flow-main`) pass. Those rest on the walk of every rule in all 17 settings files,
last done 2026-09-22 (status-table row 5.2); the 09-10-2026 checkups only removed or
narrowed rules (`harness/status.md` § *Completed*) and did not repeat the walk. The script
is unchanged; the gap is open. The Read tool is **blocked**, not prompted, outside the
working folder (`blockReadsOutsideWorkingDirectories`, PHASE 1 § 1.3). **Unproven:** reads
through Bash — `cat` becomes `rtk read`, which the global `allow` list permits for any
path — and whether the block setting covers them. D23's intent stands; its "by prompt" for
other folders is replaced by this. Settles the D23 / PHASE 1 disagreement noted
in **D31**. Nothing depends on it, so it was not tested: testing means reaching into
`~/.claude` from a project session.

### D39 · 12-10-2026

**Sonnet is the default model; Opus for unclear, multi-step or sensitive work; the model
is chosen with `/model` at task start and not switched mid-task. A denied permission
prompt is followed by one plain-text question — meant or a mistake — and a confirmed or
second No is final.** Amit's rules, 12-10-2026; text in `STANDARDS.md` § *Which model* and
§ *Explaining a permission request*. `settings.json`: `model` `opus` → `sonnet`;
`switchModelsOnFlag` `true` → `false`, because the docs (model-config page, read by the
cross-check through WebFetch summaries, 12-10-2026) say a classifier-flagged request
otherwise switches the session to a fallback model and stays there until `/model` — which
would break "not switched mid-task"; with `false` it asks instead. Helper agents still
switch without asking, per the same page. Model names carry no version in the rule because
the alias moves; on the Anthropic API `sonnet` is documented as Sonnet 5.5. **Not known:**
whether top-level `effortLevel: high` applies to Sonnet 5.5 or Opus 5.5 — the docs say
Opus 5.5 ignores it, and only `claude-opus-5` has a `modelSettings` entry. Left unchanged;
Amit sets effort with `/effort`. The cross-check model line stays in
`harness/cross-check.md` only. Cross-check 12-10-2026 · Opus · change, then go ahead ·
41.6k tokens measured.

### D40 · 12-10-2026

**`STANDARDS.md` slimmed by wording only — every rule kept, every safety gate at the same
strength.** Amit's condition: quality over token savings; only redundant wording, examples
and explanations go. 3,161 → about 2,570 words, an estimated 5.9k → 4.8k tokens (scaled
from the measured 5.4k at about 2,880 words; not measured). All 20 section headings
unchanged, so every pointer still resolves. Removed: the "Not this" permission example and
other reasons or figures whose rule stays stated — the 3% / 45–54% figures live
in **D17**. Nothing moved to skills or `docs/`: project sessions cannot read outside their
folder, and a rule moved behind a trigger can silently never load (**D26**). Rejected as
adding tokens: a Layer 1 summary (restates rules, **D20**). Rejected: an archive copy —
`archive/` holds only what git cannot recover. **The full old text is in commit `f6a4c2c`;
restore with `git show f6a4c2c:STANDARDS.md`.** Cross-check 12-10-2026 · Opus · rule by
rule · FAIL narrowly: 3 rules weaker (tests seen to fail, verify the installed artifact,
record the out-of-scope fix) and 1 borderline (group findings); all 4 restored to old
strength with Amit's approval, then self-checked against the old text · 47.8k tokens
measured.

### D41 · 30-10-2026

**An `ask` rule boxes what can change or leak something, not every use of a command.**
S4, approved by Amit as one package: he clicks "Yes" on almost every box, so a box that
protects nothing is a cost. Ask rules that matched reads were narrowed to the writing forms
(`gh pr|repo|auth|api`, `git merge`, `git * commit`, `security`, `tccutil`,
`brew install`, the Voice-Flow script rules, and D36's `git pull` and `git switch`). Holes
closed in the same change: the `git -<opt> …` spellings of dangerous git commands
(`git -C dir push` matched no rule before), `--output`, `--upload-pack`, remote
remove/rename, forced or discarding `switch`, `pull --rebase|--force`, and FinNode
`gradlew` uninstall/publish/init-script. Allows that could write were removed or narrowed
(`xxd`, `git apply`, `git stash`, `git config`, `git remote`, `git ls-remote`, `npm pack`,
`npm audit`). Replayed against 16,563 past Bash calls: boxed calls **2,241 → 1,722**;
5/5 live box tests as expected. Global `allow` 39 → 37, `ask` 96 → 188. Not verified: how
`$(…)`, `env`/`xargs` wrappers and double spaces are matched. Cross-checks · Opus · plan v1
CHANGE, 6 fixes taken · 51.3k tokens; final keep after 5 fixes · 46.3k tokens. Record, full
rule list and replay script: `baselines/s4-permissions-30-10-2026.md`.

### D42 · 30-10-2026

**Branches move with `git switch`; work is proposed only if it clears a value bar.**
F5: `STANDARDS.md` § *Git* says `git switch <branch>` to move and `git switch -c <branch>
main` to create (`main`, so a new branch never carries another branch's commits);
`git checkout` stays boxed because it can also overwrite files. About 120 of 140 past
`git checkout` calls were branch moves. F9: Claude offered 8 follow-ups, mostly as P2 and
priced, and judged only 2 worth doing once Amit pushed back. Cause: priority was set by
category, so any theoretical gap counted. Now P2 needs a case that has happened or a named
normal-use trigger, in `STANDARDS.md` and `templates/deferred-improvements.md` alike;
§ *Stay on the task* adds the value bar; security, data-loss and safety risks are always
raised, but are P1 only when normal use exposes them. F2 (box 39 GitHub write commands)
rejected under the bar: 0 uses in 16,563 calls. The other items are listed as known and
accepted in `harness/status.md` § *Open*. Cross-checks · Opus · F5+F2 keep with 4 changes ·
32.7k tokens; F9 change, all taken except P1 for every open security risk · 22.9k tokens.

### D43 · 30-10-2026

**Backlog items meet the value bar too; Claude judges worth, then asks.** FinNode backlog
item 6 — "does anything still let `git add` run without a box?" — was a gap nobody had hit,
recorded with a full investigation plan; a later session ran it over many turns. Outcome:
no rule decides `git add` (the hook makes it `rtk git add`), auto mode lets it through, and
Amit accepted that (`ENVIRONMENT.md` § 3). Cause: the value bar covered proposals in chat
but not backlog entries, and "security risks are always raised" read as clearing the bar.
Now in `STANDARDS.md` § *Stay on the task*: a backlog entry gets a next step only if it
clears the bar, otherwise it is known and accepted; before working an unapproved backlog
item, Claude judges it with Amit's wider goals in view and says in one line worth it or
not, priority, size and rough tokens, then waits; raising a security risk is a line with
its likelihood, with a next step only if it clears the bar. `templates/deferred-improvements.md`
ties *Next step* to *Worth doing*. Cross-check · Opus · two of three sentences taken as
written, the third narrowed to unapproved backlog items · 22.6k tokens.

### D44 · 01-11-2026

**Stage C security fixes from the 31-10-2026 audit.** Bash could read any file on the
Mac with no box, and rtk's hook returned "allow" for `git add` (audit C1, C3). Now:
`settings.json` denies private stores by path wherever they appear in a command (SSH,
Ollama, GitHub CLI login, prompt history, `.claude.json*`, paste cache, transcripts,
Claude backups, `.netrc`, `.git-credentials`, `.npmrc`), with a `Read(...)` rule each —
deny 34 → 68; asks for `gh gist create|edit` and `ollama run *cloud*` — ask 188 → 191;
setup sessions ask for `git add` and `git stage` (`.claude/settings.json` 2 → 6), and
the two local `Bash(git add *)` allows are gone. Ollama cloud is disabled and
`ollama-do` matches the host whole and refuses `@`; `drift.sh` scans committable files
for secret patterns. Known limits and side effects: `ENVIRONMENT.md` § 3. Record:
`baselines/stage-c-fix-report-01-11-2026.md`. Cross-checks · Opus · plan: change, 7 of 8
taken · 70.5k; changed rules: keep, 2 of 3 taken · 32.2k tokens.

### D45 · 01-11-2026

**Stage C switches decided by Amit (audit C4, C9, C10, C13, C7 hook).** C9:
`settings.json` → `permissions.disableBypassPermissionsMode: "disable"` — no Claude Code
session can enter bypass mode or use `--dangerously-skip-permissions`; Claude Desktop has
its own "Allow bypass permissions mode" toggle, which Amit switches off by hand (this key
is not documented to cover it). C10: `env` → `DISABLE_ERROR_REPORTING=1` only; telemetry
and automatic updates stay on, because `DISABLE_TELEMETRY` also stops feature-flag
fetching, which claude.ai skill sync and Remote Control need, and
`CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC` also stops the updater. C13:
`RTK_HOOK_AUDIT=1` removed from `env`; `~/.local/share/rtk/hook-audit.log` (6.7 MB) kept.
C4: no change — `gist` is one of the GitHub CLI's minimum scopes and cannot be removed,
and Amit has a gist; the D44 ask rules stay. C7: a git `pre-commit` hook in `~/.claude`
runs `drift.sh`'s secret scan and blocks on a pattern or when the scan does not run
(`ENVIRONMENT.md` § 3). Tested: `/tmp` copy — clean passes, fake token blocks a real
`git commit`, missing `drift.sh` blocks; real repo — clean passes, planted fake key
blocks, file restored. Cross-check · Opus · change then go ahead, 5 of 5 taken · 64.2k
tokens. *Later 01-11-2026:* Amit chose not to switch off the Desktop toggle (Team plan)
and to leave the check that the rtk log has stopped growing.

### D46 · 10-11-2026

**Read everywhere, write only here (Amit).** Any session may read every project and
`~/.claude`; it may change only its own working folder. What "stick to one project" was
always meant to stop is writes, not reads. `settings.json`:
`blockReadsOutsideWorkingDirectories: false`, `blockWritesOutsideWorkingDirectories: true`
(global; reverses backlog item 7's "projects only, never global"), `Read` allowed with no
box for `~/Documents/VS Code/**` and `~/.claude/**` (other folders ask), and new denies,
Read and Bash, for FinNode `private/`, Emp Portal `vthru.db*` and the Packbly folder.
Supersedes the read part of D23 and D38; D23's "no standing grant to another project"
stays. A setup session edits a project's `CLAUDE.md` only after `/add-dir` of that folder.
**Tested 10-11-2026 from a Voice-Flow session:** reads of `~/.claude` and FinNode work;
`.env`, FinNode `private/` (Read and `cat`) and Packbly denied with no box; Write tool into
`~/.claude` blocked. **Known limits, accepted (Amit):** (1) shell commands are not covered —
`touch` into `~/.claude` boxed ("sensitive file") with auto mode off, and auto mode
approved it silently; (2) the Write tool is blocked from `/private/tmp` in Voice-Flow
although its `additionalDirectories` lists it — cause not found; shell use of `/tmp` is
unaffected. Cross-check · Opus · partly, fixes taken (private-data denies, narrow read
allow) · 66.3k tokens.

### D47 · 10-11-2026

**One document map (Amit).** `DOCUMENT-MAP.md` replaces the document table in
`README.md` (§ *What is in here*), the map part of `harness/overview.md` and the
*Source of truth* table in `harness/status.md`. Reason: one routing map prevents
scattered and duplicated document indexes. Supersedes the part of backlog item 16 that
made `harness/overview.md` the setup map. The three old maps are trimmed in Phase 2
(T4, T9, T5), not now. **Closed 11-11-2026:** all three trimmed (old text in
`baselines/old-document-maps-11-11-2026.md`) and all five affected files checked. **Affected files:** `README.md` · `harness/overview.md` ·
`harness/status.md` · `DOCUMENT-MAP.md` · `DOCUMENTATION-STANDARD.md`. Closed when all
five are checked (after Phase 2). Plan: `harness/doc-structure-plan.md` (T2, T3).

### D48 · 11-11-2026

**Global `CLAUDE.md` keeps one non-loading comment (Amit).** The file holds the three
imports and one HTML comment line pointing to `DOCUMENT-MAP.md`. Claude Code does not load
HTML comments, so it costs nothing per turn; it is there for anyone opening the file, so
imports are not added by mistake. Reason: the Phase 3 cross-check (11-11-2026) found that
"imports only" in `DOCUMENTATION-STANDARD.md` conflicted with keeping the comment.
Rejected: dropping the comment (loses that guard). Backlog: B35, which authorises the
`DOCUMENTATION-STANDARD.md` line-51 change. **Affected files:** `CLAUDE.md` ·
`DOCUMENTATION-STANDARD.md` · `DOCUMENT-MAP.md` · `harness/doc-structure-plan.md` ·
`harness/doc-check.sh`. **Status:** in force. **Closed 11-11-2026 (Go 2):** all five
affected files updated and checked; old text in `baselines/always-loaded-old-11-11-2026.md`.
Plan: `harness/doc-structure-plan.md` § 3 *Phase 3 plan*.

### D49 · 13-11-2026

**Done files only by size (Amit).** Each project starts with one roadmap, one backlog and
one decisions file. Finished work stays in a short `## Completed` section, one line per
item; old detail always goes to the archive. A `-DONE` or `-OLD` file is made only when
*Completed* grows past about 150 lines, with a pointer left in the original file. The rule
lives in `DOCUMENTATION-STANDARD.md` § *Growth and rollover* only; templates and the map
point to it. Reason: the Voice-Flow Phase 6 pilot (its D22) worked with no done files; the
old trigger (about 300 lines or 10 done rows) split files too early. Rejected: keeping the
old trigger (extra files to read for little gain); no done files ever (a long *Completed*
section would grow without limit). Accepted: a superseded decision shows in both its Index
row and its *Completed* line. Backlog: B36. `harness/doc-structure-plan.md` § 2 *Growth*
keeps the old wording as history. **Affected files:** `DOCUMENTATION-STANDARD.md` ·
`templates/roadmap.md` · `templates/deferred-improvements.md` · `templates/decisions.md` ·
`templates/roadmap-done.md` · `templates/backlog-done.md` · `templates/decisions-old.md` ·
`DOCUMENT-MAP.md`. **Status:** in force. **Closed 13-11-2026:** all eight files updated and
checked with `harness/doc-check.sh`.

### D50 · 20-11-2026

**Planning first, then reviewers, then clean-up (Amit).** Phase order: 8 planning system → 9
reviewer agents and skills → 10 clean-up and rewrite (absorbs the old Phase 8 `SETUP-PLAN.md`
split T30–T33 and the old Phase 9 30-day review) → 11 further checks. Reason: planning is the
foundation; a reviewer can only review a clear plan; the setup grew as always-loaded rules and
needs skills and agents for sometimes-needed work. Agreed with it: (1) borrow ideas from
OpenSpec and Spec Kit, install neither (and not Superpowers); (2) reviewer agents are read-only
(Read, Grep, Glob), set `omitClaudeMd: true`, load no memory, get only a short brief and the
task's files, and report `no concerns / concerns / blocked` — never approve; (3) the
small-change and feature reviewers merge into `change-reviewer`, plus a separate
`plan-reviewer`; (4) git safety stays always-on in `STANDARDS.md` and the settings ask list — no
`git-safety` skill; (5) no skill folders by P1–P4 — skills load by trigger and `skillOverrides`
state; (6) no commit/push/PR agent — Claude prepares git actions, Amit approves. Rejected:
installing Spec Kit or OpenSpec (a second planning system; telemetry and file writes unchecked;
does not fit VT, where nothing Claude-related may reach GitLab); separate `code-review-checklist`,
`data-safety-review` and `test-plan` skills (duplicates); briefs in `project-rules/` (copies only).
B24 and B25 are revisited in Phase 10. Open questions Q1–Q8: `.claude/current-task.md`.
**Affected files:** `harness/doc-structure-plan.md` · `harness/status.md` ·
`harness/backlog.md` · `harness/planning-research.md` · later `STANDARDS.md`,
`harness/cross-check.md`, `DOCUMENT-MAP.md`, `.gitignore`. **Status:** in force; open until
those are updated in Phases 8–10. Plan: `harness/doc-structure-plan.md` § 3 *Phase 8* onwards.
**Clarified 23-11-2026 (Amit, D51):** Phases 8 and 9 update the instructions their own changes
replace, in the same approved change, so no two conflicting instructions stay active. Phase 10
remains the whole-setup audit and rewrite.

### D51 · 23-11-2026

**Planning system design (Amit).** One planning entry point (a `planning` skill) with six kinds of
work: new project · new feature and small enhancement (one shared guide) · bug fix · documentation
· Claude Setup change. Kind of work and planning depth are chosen separately; depth follows risk,
and risk is checked before the tiny-change route, so a small diff never skips a risky change's
care. Always-on gates stay in `STANDARDS.md` (the 10 steps as short signposts); planning detail
moves to the skill. Session limits (220K checkpoint, 250K maximum) apply to the main context only.
Ideas adapted from OpenSpec and Spec Kit, neither installed. Built in four packages — save design,
draft inactive, switch on with the rules it replaces, test — each on Amit's word. Rejected: a
separate testing scale (P1–P4 stays urgency only) · a new spec folder system · a separate
idea-assessment guide for now. **Approved by Amit 24-11-2026:** the two-attempt / two-review-round
escalation rule, routing tests in short fresh sessions, optional draft commits, and recommendations
Q1, Q4, Q6, Q8; also simple human English for every guide, and sub-agents one level deep in Phase 9.
**Affected files:** `harness/doc-structure-plan.md` § 3 *Phase 8* (the full plan) · later
`STANDARDS.md`, `ENVIRONMENT.md`, `.gitignore`, `DOCUMENT-MAP.md`, `templates/handoff.md`,
`skills/planning/`. **Decided by Amit at switch-on, 24-11-2026 (WP3):** the core planning rules
stay in `STANDARDS.md`, including "tell Amit first" (kind, risk, depth, priority, estimates) in
step 3 · testing runs the checks that matter for the change plus the project's major tests
(money, data, security, the main user path), not everything · a wording fix that keeps the
meaning meets no risk trigger, even in a rule file, but the tiny-change *Never* list still
applies. **Status:** switched on 24-11-2026. WP4 recorded 24-11-2026: acceptance partly verified;
named checks deferred to Phase 9's final integration package (Amit's scheduling choice, not a
technical dependency). Deferred checks passed in Phase 9 WP5, 25-11-2026; closed (Amit).
Results: `harness/doc-structure-plan.md` § 3 *Phase 8* → *Acceptance result (WP4)* and § 3
*Phase 9* → *Integration test result (WP5)*.

### D52 · 24-11-2026

**Phase 9 design (Amit).** Two fresh, read-only reviewers, `change-reviewer` and `plan-reviewer`
(tools Read, Grep, Glob; `omitClaudeMd: true`; no reviewer memory; behaviour proven by tests).
Context in four layers, minimum sufficient: agent file, a short project brief
(`harness/agent-brief.md` for Claude Setup), a neutral task packet, linked detail only when needed;
no full `STANDARDS.md` copy per reviewer. Three skills: `handoff`, `send-for-review`, `documents`.
`send-for-review` is never started by the model; Amit typing it is his "send it for review"
(`STANDARDS.md` § *Git*, unchanged): push to GitHub and open the PR, then stop. Amit merges by
hand and confirms; Claude may then delete only the local branch; remote branch deletion follows
the repository setting or Amit's separate instruction; Claude never merges. Replaced instructions
move in the same package that switches on their replacement. Built in five packages, each on
Amit's word; Phase 8's deferred checks run in the final one. Rejected: `setup-cross-check` skill
(a short procedure already read on demand) · a fake `.env` test · undoing the live setup to test
recovery (a local copy is used). Cross-check before approval: Opus, verdict concerns, 10 findings,
all closed. **Affected files:** `harness/doc-structure-plan.md` § 3 *Phase 9* (the full plan) ·
later `harness/agent-brief.md`, `agents/`, `skills/`, `.gitignore`, `harness/cross-check.md`,
`STANDARDS.md` (pointers only), `DOCUMENT-MAP.md`, `DOCUMENTATION-STANDARD.md`. **Status:**
approved 24-11-2026; built WP2–WP4; R1–R8, K1–K5, I1–I5 passed or waived; closed 25-11-2026
(Amit).

### D53 · 25-11-2026

**Phase 10 WP3 design (Amit).** Seven document types: Rules · Reference · State · Plan · List ·
Catalog · History (Record becomes History; Plan and Catalog are new). Each major document has one
role and is the one home for named facts; other places link. A writing-style guide (simple human
English, conclusion first, never cut facts), contents lists only in documents over about 150
lines, standard markdown links (no `[[wikilinks]]` outside memory notes), the `DECISIONS.md` shape
for WP5, and the WP9 prompt file `harness/project-cleanup-prompt.md`. The old 30-day format review
is dropped: formats change only from a real case. Rejected: calling the plan file a State
document (it is added to while a phase runs) · clickable links in always-loaded files (tokens
every turn) · status words that force a replacing D-number. Cross-check before approval:
`plan-reviewer`, Opus, verdict concerns, 9 findings, all taken in (55,880 measured). Full design:
`harness/doc-structure-plan.md` § 3 *Phase 10* → *WP3 design*. **Affected files:**
`harness/doc-structure-plan.md` · `harness/status.md` · later `DOCUMENTATION-STANDARD.md`,
`DOCUMENT-MAP.md`, `templates/decisions.md`, `harness/doc-check.sh`, `DECISIONS.md` (WP5),
`.gitignore` and `harness/project-cleanup-prompt.md` (WP9). **Status:** approved 25-11-2026; open
until WP5–WP9 apply it. **Amended 25-11-2026 (WP3b, Amit):** `MEMORY.md` index lines may use
`[Title](file.md)` because Claude Code's memory system requires that format — a second memory
exception to the link model, alongside `[[name]]` memory-note links.

**D4 governs everything below.** Every removal is listed individually and waits
for a yes.

---

## Why permissions cannot be made airtight

From Claude Code's documentation:

> "A Bash rule matches the command text Claude writes... It doesn't match the
> same program invoked in a different form, so a deny or ask rule covers the
> invocation Claude usually produces and isn't a security boundary around the
> program."

Blocking `python3 -c` while `node -e` is allowed achieves nothing. Blocking both
while `bash script.sh` is allowed achieves nothing. So the aim is not to stop a
determined action — it is to make the consequential ones *visible*, and to catch
honest mistakes. Anything stronger is theatre.

## The precedence rule that makes this work

> "Rules are evaluated in order: deny, then ask, then allow. The first match in
> that order determines the outcome, and rule specificity doesn't change the
> order."

**Rule type beats file location.** A global `ask` wins over a project `allow`.
This is the key to the whole plan: a broad project rule can be made visible by
adding a global `ask`, **without removing the project rule**. Nothing breaks,
nothing is deleted, and the action starts prompting. That satisfies D4 and is
more durable than deleting, because it also covers projects that do not exist yet.

---

## PHASE 1 — Safety net and the real fix  (HIGH)

### 1.1 Back up  ·  **DONE 2026-09-18**
27 files copied to `~/.claude/backups/2026-09-18-setup/`, folder structure
preserved: 8 global `.md` + global `settings.json` + `statusline/context.py`
+ 6 project `CLAUDE.md` + 11 project settings files.
**Verified:** all 27 confirmed byte-identical to their originals with `cmp`.
**Undo:** n/a, nothing was changed.

### 1.2 Close the holes in the global ask list  ·  **DONE 2026-09-18**

> **PREREQUISITE — do this first.** `~/.claude/CLAUDE.md` carries an instruction
> in a comment: *"Read ~/.claude/ENVIRONMENT.md before changing settings.json or
> the thresholds."* `ENVIRONMENT.md` is 15 KB and holds the measurements behind
> the current permission and rtk choices. Read it before editing `settings.json`,
> and check whether anything in it already covers or contradicts the additions
> below.
Add to `permissions.ask` in `~/.claude/settings.json`. Each makes an action
visible that currently runs silently in at least one project.

| Add to ask | Why | Currently silent in |
|---|---|---|
| `Bash(tccutil *)` | Can wipe mic/camera permissions for every app on the Mac | Voice-Flow |
| `Bash(gh api *)` | Any GitHub API call, including delete | Debugger v2, Voice Flow_v1, Voice-Flow |
| `Bash(gh repo *)` | Includes `gh repo delete` | Debugger v2, Voice-Flow, vthrudebugger |
| `Bash(gh pr *)` | Opens/merges/closes pull requests | vthrudebugger |
| `Bash(gh auth *)` | Changes which GitHub account is used | 3 projects |
| `Bash(rtk gh *)` | Same via rtk | 3 projects |
| `Bash(security *)` | Reads macOS Keychain | Voice-Flow |
| `Bash(sudo *)` | Runs as administrator — no rule exists today | Voice-Flow |
| `Bash(killall *)` | Force-stops programs by name | Voice-Flow |
| `Bash(npx *)` | Downloads and runs a package (only `--yes`/`-y` covered today) | Voice-Flow |
| `Bash(rtk npx *)` | Same via rtk | Voice-Flow, vthrudebugger |
| `Bash(ollama pull *)`, `Bash(ollama rm *)`, `Bash(ollama signin *)` | Multi-GB downloads, deletions, account change | Voice-Flow |
| `Bash(gem install *)` | Installs Ruby packages | vthrudebugger |
| `Bash(git mv *)` | Renames tracked files | Voice-Flow |
| `Bash(sqlite3 *)` | Arbitrary SQL on any database file | Voice-Flow |
| `Bash(open *)` | Opens any file or app | vthrudebugger |

Not added, deliberately: `python3 -c`, `node -e`, `awk`, `osascript`. These are
how routine inspection work gets done — including the analysis that produced
this file. Fencing them costs many prompts a day and stops nothing, per the
"not a security boundary" note above. **Flagged for your call, not decided.**

**Impact:** a handful of extra prompts, only for the actions listed.
**Undo:** `git -C ~/.claude checkout settings.json`, or delete the added lines.

#### What was actually added, and how it differs from the table above

35 rules, `ask` 52 → 87. Verified: 35 insertions, **0 deletions**; `allow` (32),
`deny` (2), `hooks`, `statusLine` and every other key byte-identical.

15 commands — `tccutil` · `sudo` · `security` · `killall` · `sqlite3` · `open` ·
`git mv` · `gem install` · `ollama pull|rm|signin` · `gh api|pr|auth|repo` —
each in bare and `rtk proxy` spelling, plus `rtk ` for `git mv` and the four `gh`
forms.

Three deliberate departures from the table above, all found by the
`ENVIRONMENT.md` prerequisite:

1. **`npx *` and `rtk npx *` were NOT added.** Of 235 `npx` calls in history, 231
   are `vitest` (165), `tsc` (55), `vite` (7) and `asar` (4) — routine build and
   test. Only 4 are `--yes`, which `ask` already catches. The rule would have
   added ~231 prompts and caught nothing new. `ENVIRONMENT.md` had already
   excluded these deliberately; the 1.2 table had silently reversed that.
2. **`gh auth *` and `gh repo *` were kept broad**, knowing they override the
   existing `Bash(gh auth status*)` and `Bash(gh repo view*)` allow rules. Cost
   is 7 prompts across 56 sessions. The alternative — 11 narrow subcommand rules
   — costs the same to avoid and `ENVIRONMENT.md` warns argument-constrained
   patterns are fragile. **Those two allow rules are now dead letters.** Left in
   place, not removed; removing them is a Phase 2 decision.
3. **`rtk proxy` spellings were added**, which the table omitted. Confirmed by
   `find`: four project files carry blanket `Bash(rtk proxy *)` —
   `vthrudebugger_v1`, `Voice-Flow`, `Voice Flow_v1`, `Debugger v2`. Without the
   third spelling, `rtk proxy sudo …` would still run silently in those four.

**Measured cost:** replaying 5,734 historical Bash calls across 56 sessions,
**+26 prompts total = +0.46 per session**. 25 of the 35 rules never fire against
history at all — they are pure fences. The only real `tccutil` call ever made was
`tccutil reset All …` against the Claude install directory, which is exactly the
case D5 wanted visible.

### 1.3 Add two global entries rtk needs  ·  **DONE 2026-09-18**
- `Read(//Users/amitjangra/Library/Application Support/rtk/tee/**)` — rtk writes
  overflow output there and refers to it. Currently granted in Voice-Flow only,
  while the rtk hook runs in every project. This is why output went missing
  during the survey.
- `Bash(rtk gain*)`, `Bash(rtk discover*)`, `Bash(rtk --version)` — already
  partly present; confirm all three.

**Undo:** `git -C ~/.claude checkout settings.json`, or delete the three lines.

#### What was added, and the root cause it fixes

3 rules, `allow` 32 → 35. Verified: 3 insertions, **0 deletions**; `ask` (87),
`deny` (2) and every non-permission key byte-identical.

```
Bash(rtk --version)
Bash(rtk discover*)
Read(//Users/amitjangra/Library/Application Support/rtk/tee/**)
```

`Bash(rtk gain*)` was already present, so only two of the three Bash entries
were actually missing.

**Root cause of the missing output, now confirmed.** `permissions` sets
`blockReadsOutsideWorkingDirectories: true` (*turned off 10-11-2026, D46*). rtk's tee directory sits outside
every project, so reading it was blocked in **every** project except Voice-Flow,
which was the only file granting the path. The rtk hook itself is global — it is
`hooks.PreToolUse` → `rtk hook claude` in this same file, and applies to every
project automatically. So the hook wrote overflow logs everywhere and could read
them back in exactly one place.

**Verified, not assumed:** the directory exists with 20 log files, mode 700; the
newest were written by rtk during the session that made this change; and a real
file path was matched against the rule prefix. `find` confirmed Voice-Flow's
`settings.json` was the only project file granting it.

**Note the two leading slashes** in the `Read(...)` rule. A single slash anchors
at `~/.claude/`, not at the filesystem root — see the deny-rule note in
`ENVIRONMENT.md`. The spelling here is copied from Voice-Flow's working rule.

**Portability caveat for an account or machine switch:** this rule hardcodes
`/Users/amitjangra`. There is no home-relative spelling for an absolute path in
a permission rule, so on a different machine or username this one line must be
edited by hand after cloning. The rtk **binary** does not travel in this repo
either — it is at `~/.local/bin/rtk` (0.48.0); install rtk first, then clone.

---

## PHASE 2 — Permission cleanup  (HIGH, needs line-by-line approval)

### Measured 2026-09-18 — supersedes the estimates below

**Written before phase 2 ran. 2a, 2b and 2c have since been applied — see the
status table. Kept because the reasoning is what makes the result reviewable.**

The single most important fact: **all 560 project rules are `allow`. Zero `ask`,
zero `deny`.** Removing any of them can only ever *add* a prompt — it cannot
remove a protection or unblock anything. That is what makes 2a and 2b safe.

| Group | Measured | Action | Behaviour change |
|---|---|---|---|
| A — Dead | **53** | Remove (2a) | **None, provably.** The path each names is gone; it can never match again |
| C — Redundant | **93** | Remove (2b) | **None today.** A global `ask` rule already overrides it |
| A ∩ C | 4 | — | counted once |
| **Union proposed** | **144** | | 560 → 416 rules (measured after the fact) |
| Exact duplicates | 7 | Remove (2b) | Same 7 rules listed twice in Voice-Flow `settings.json` |
| Dormant — **excluded** | 1 | **Keep** | `release/mac-arm64/Voice Flow.app` is build output: gone now, returns on the next build |
| B — One-off leftovers | **97** | 23 removed (2c), 74 held | B1 dead operand 14 ✅ · B2 spent edit 9 ✅ · B3 pipeline fragment 74 **kept**. Old estimate of 53 was a pattern guess |
| D — Broad and silent | 40 | **Keep.** Fenced by 1.2 | |

**Why 144 and not the 112 estimated:** group C grew from 18 to 93 when 1.2
expanded the global `ask` list from 52 to 87. Every project `allow` rule that a
new `ask` rule covers became a dead letter. Four were live until 1.2 landed
(`security`, `sqlite3`, `open`, `gh`) — a consequence of an approved change, not
a pre-existing condition.

**Evidence for group A:** 6 distinct session scratchpad directories referenced,
**0 still exist**. Plus 10 literal paths tested individually and confirmed gone:
`~/vthrudebugger_v1`, `~/Debugger/vthrudebugger_v1`, `~/vthru-debugger-demo`,
`Voice_Flow_v2.1`, four `/tmp/vf_*.cjs` scripts, a rotated rtk tee log, and a
SecondBrain subfolder.

**Nine rules that looked dead are live and stay:** the Android SDK symlink,
`com.apple.TCC/TCC.db` ×3, the Whisper model ×2, and Voice-Flow's own
`git -C` commands ×2.

> **Warning for whoever runs this.** Two classifier passes wrongly flagged those
> nine. Both bugs were the same: a regex that split paths at spaces, turning
> `/Users/amitjangra/Documents/VS Code/…` into `/Users/amitjangra/Documents/VS`
> and calling it missing. **Do not classify by parsing paths out of rule text.**
> The only unambiguous signal is the session-scratchpad UUID pattern, which
> contains no spaces. Everything else was confirmed by testing the literal path.

**The list to approve:** `archive/PHASE2-REMOVALS.md` — 144 rows, each
with project, file, group and reason. It is committed, so it survives a restart. It read
`PHASE2-REMOVALS.md` *in this directory* until 2026-09-27, when it moved to `archive/`.

### Still to check before Phase 2 runs
- [x] Group A re-derived by measurement, not pattern guess — 53, evidence above.
- [x] Group C recomputed against the **current** 87-rule global ask list — 93.
- [x] **Amit's approval of the 144.** Given 2026-09-18 ("approve the 142 removals" — the list held 144).
- [x] Re-count B by hand. **97**, not 53, read rule by rule against the 416 survivors.
- [x] Confirm no group-B rule is load-bearing for a build or test script. Every operand tested; `scripts/audit.sh`, `create-signing-cert.sh`, `reset-permissions.js`, `uninstall-app.js`, `electron/main.js` are live and **kept**.
- [x] Confirm each file stays valid JSON after editing. All 11 re-parsed clean.
- [x] Back up the project settings files before the first edit (D6). There are **11**, not 12; copied to `backups/2026-09-18-phase2/`, verified with `cmp`.

### Non-Bash permissions — surveyed, no action proposed yet

The 560 count is Bash rules. These are the rest, and they were not examined
until late in the survey.

| Project | Grant | Note |
|---|---|---|
| Voice-Flow | `Read(//Users/amitjangra/Documents/VS Code/**)` | Reads **every** project, incl. Packbly and Emp portal — 5.2 |
| Voice-Flow | `Read(//private/tmp/**)`, `Read(//tmp/**)` | Whole temp directories |
| Voice-Flow | `Read(//Applications/Voice Flow.app/**)` ×3 | The installed app bundle |
| Voice-Flow | `Read(//Users/amitjangra/.continue/**)`, `.claude/**`, SecondBrain ×3 | Other tools' config and the Obsidian vault |
| Voice-Flow | `Read(.../rtk/tee/**)` | rtk's overflow logs — **should be global**, see 1.3 |
| Voice-Flow | `Skill(claude-api)`, `Skill(claude-api:*)` | Pre-approves that skill |
| Voice-Flow | 5 × `additionalDirectories`: the project, `.continue`, `.local/bin`, `.claude`, `/private/tmp` | Widens the working directory |
| FinNode | `Read(//Users/amitjangra/.claude/**)` + `additionalDirectories: ~/.claude` | Can read global config |
| FinNode | `Edit(docs/**)`, `Write(docs/**)`, `Edit(CLAUDE.md)` | Write access, scoped |
| FinNode | `WebFetch(github.com)`, `WebFetch(kotl.in)` | |
| Voice Flow_v1 | `Read(//private/tmp/**)`, `Read(//tmp/**)`, `Read(~/.npm/_npx/**)` | |
| Voice-Flow `.local` | `WebSearch` + 7 `WebFetch` domains (github, morphllm, promptquorum, ollama ×2, continue) | Accumulated, harmless |
| Voice Flow_v1 `.local` | `WebSearch` + 8 `WebFetch` domains (wisprflow ×4, wikipedia, substack, alternativeto, github) | Research leftovers from competitor work |

Nothing here is urgent. 5.2 is the only one worth changing, and the rtk read
grant is worth promoting to global (1.3).

---

## PHASE 3 — The deliberate set  ·  **DONE 2026-09-20**

**Scope rewritten before starting, as the status table instructed.** The
original scope said "write three lists into `~/.claude/settings.json`". Step 1.2
already did that — `ask` went 52 → 87 and the rules are in place. What was
missing was the *plain-English* version: the rules as named groups with a reason
each, so the set can be read back and argued with instead of re-derived from 87
globs. That is what this phase delivers. **It changed no permission rule.**

Verified against `settings.json` on 2026-09-20: **allow 35 · ask 87 · deny 2**.
Every rule falls into one of the groups below; nothing is left over.

> **The counts below are superseded; the reasoning is not.** Checked 2026-09-27.
> Live then: **ask 58 · allow 33 · deny 2**; `allow` is 34 since 10-10-2026 (D35). Three changes did it — on 2026-09-20 the
> `ask` list merged from 112 spellings to **51 wildcard patterns**, one per command
> instead of the three (`X`, `rtk X`, `rtk proxy X`) the next paragraph describes;
> on 2026-09-22 two dead `gh` rules took `allow` 35 → 33; and on 2026-09-27 seven rules
> took `ask` **51 → 58**, closing the `git restore`, `git stash drop`/`clear` and brew
> gaps. The groups and the reason
> given for each still hold, and this is the only plain-English pass over every rule,
> which is why it is kept rather than rewritten. **Take counts and spellings from
> `settings.json`, never from here.** One consequence worth carrying: because the
> merged patterns lead with `*`, a rule matches the bare command, the `rtk` rewrite and
> a piped or chained form alike — verified 2026-09-26 against `git push`, `git reset`,
> `git clean`, `sudo`, `gh auth` and `rm`.

### Never — `deny`, 2 rules

`Read(//**/.env)` and `Read(//**/.env.*)` — credentials. The only outright block
in the setup, and the only one no `allow` anywhere can override, because deny is
evaluated first.

Narrower than it sounds: it stops *reading* a `.env`, not a program that loads
one, and it does not cover a database holding real records. That is why D23
removed cross-project read access instead of leaning on `deny`.

### Always ask — `ask`, 87 rules in 11 groups *(2026-09-20 snapshot; now 58)*

The count looks large because most commands appear up to three times: bare
(`sudo *`), rtk-wrapped (`rtk git push *`) and proxied (`rtk proxy sudo *`). The
`rtk hook claude` PreToolUse hook rewrites Bash commands, so a rule covering
only the bare spelling can be walked around by the rewritten one. **36 distinct
commands, 87 spellings.**

| n | Group | Why it asks |
|---|---|---|
| 24 | Git history / tree rewrite — `checkout` `clean` `merge` `mv` `push` `rebase` `reset` `rm` | Each can destroy uncommitted work or rewrite shared history. `push` also leaves the machine. |
| 21 | Package installs — `npm`/`pnpm`/`yarn` add+install, `npx -y`, `gem install` | Runs arbitrary third-party code as me, and edits the lockfile. |
| 12 | GitHub — the account, not the repo: `gh api` `gh auth` `gh pr` `gh repo` | Acts as my GitHub identity and is visible to other people. |
| 6 | Process termination — `kill` `killall` `pkill` | Kills work that is not mine to kill; a loose pattern takes the editor with it. |
| 6 | Ollama models — `pull` `rm` `signin` | A pull is a multi-GB download, `rm` deletes a model, `signin` is an account action. |
| 5 | Network fetch — `curl` `wget` | Reaches the network and can write a file to disk. |
| 4 | macOS privacy + Keychain — `security` `tccutil` | `security` reads stored credentials; `tccutil` revokes app permissions that must then be re-granted by hand. |
| 3 | Deletion — `rm` | The obvious one. |
| 2 | Administrator — `sudo` | Anything at all, outside the project, without the usual limits. |
| 2 | Local database — `sqlite3` | Two projects hold real records (Emp Portal, Packbly). A write is silent and not reversible. |
| 2 | Launching apps / files — `open` | Hands a file to whatever app claims the type, outside Claude's control. |

### Always fine — `allow`, 35 rules in 6 groups *(2026-09-20 snapshot; 33 on 2026-09-27, 34 since 10-10-2026)*

Everything here is read-only, or reversible and confined to this setup.

| n | Group | Why it is fine |
|---|---|---|
| 14 | Read-only shell — `ls` `read` `cat` `find` `grep` `wc` `du` `df` `ps` `tree` `xxd` | Observation only; none of them writes. |
| 8 | Web — 7 pinned domains + `WebSearch` | Named domains only: github.com, api.github.com, raw.githubusercontent.com, docs.claude.com, code.claude.com, developer.android.com, npmjs.com. Reading, not posting. |
| 6 | Git, read-only — `branch` `diff` `log` `rev-parse` `show` `status` | Reports state rather than changing it — **except `branch`, see gap 4.** |
| 3 | GitHub, read-only — `gh auth status` `gh repo view` `gh run list` | Reads only; every writing `gh` verb is in `ask`. |
| 3 | rtk meta — `--version` `gain` `discover` | Reports rtk's own analytics. |
| 1 | rtk tee output — `Read(.../rtk/tee/**)` | rtk's own captured output, needed to re-read a filtered result. |

Also on: `blockReadsOutsideWorkingDirectories: true`. *Turned off 10-11-2026, D46.*

### Why this holds

Rules are evaluated **deny → ask → allow**, and rule *type* beats file
*location*. A project-level `allow` therefore cannot cancel a global `ask` —
clicking "allow, don't ask again" inside a project still hits the global ask.
That is the entire point of the set, and it is the thing I had backwards in the
first session; see "What I got wrong".

### Gaps found while writing this down — none closed

Writing the lists out is what surfaced these. Per D4 nothing was changed.

1. **`pnpm add`** — no rtk spelling at all. rtk wraps `pnpm`, so `rtk pnpm add x`
   is reachable and matches no `ask` rule. `rtk proxy pnpm install` exists,
   `rtk proxy pnpm add` does not.
2. **`yarn add`** — `rtk proxy yarn add *` missing, while `rtk proxy yarn install *` is present.
3. **`npm i`** — the bare short form asks, but neither `rtk npm i *` nor
   `rtk proxy npm i *` exists, and rtk wraps `npm`.
4. **`rtk git branch *` is in `allow`, but `-D` deletes.** Established by
   *reading* the rule: the glob covers every flag, and `-D` force-deletes a
   branch, so a deleting command sits inside the "always fine" list. Confirmed
   separately that rtk passes the flag through to git rather than filtering it
   (throwaway repo, 2026-09-20 — the branch was removed).

   **What was NOT established, and what I first claimed wrongly:** that it runs
   *unprompted*. The session used for that test does not enforce the `ask` list
   at all — the same command line contained `rm -rf`, which matches the existing
   `Bash(rm *)` ask rule, and that ran silently too. So "no prompt appeared"
   distinguished nothing. The defect is real and visible in the rule list; the
   runtime proof is still outstanding and needs a session that enforces `ask`.
   This is the only one of the four that sits in the *always fine* list, so it
   is still the one worth fixing first — the other three are missing spellings
   of a rule that already asks.

   > **Closed 2026-09-21.** The proof arrived. A manual-mode probe ran `git branch -d`
   > against `Bash(rtk git branch *)`, which sits in `allow`, and it prompted — so `ask`
   > beats `allow` at runtime. The three-row table is in § *Status at handoff*. The
   > paragraph above is the record of what was outstanding on 2026-09-20; it is no
   > longer open.

1–3 are installs, which the table says always ask; closing them is 3 additions
and removes nothing. 4 wants either an `ask` on the destructive flags or a
narrowing of the allow rule — a narrowing is a removal, so it needs approval
either way.

The other 15 asymmetries in the rtk coverage table are **not** gaps: rtk does
not wrap `sudo`, `tccutil`, `security`, `kill`, `killall`, `pkill`, `open`,
`rm`, `sqlite3`, `gem`, `ollama` or `yarn`, so the missing `rtk <cmd>` spelling
is unreachable and `rtk proxy` alone covers it. Verified against `rtk --help`,
rtk 0.48.0.

**Undo:** was `backups/2026-09-20-phase3/`; that folder is gone since 2026-09-21, and this state is recoverable from git history instead — it was verified as such before the delete.

---

## PHASE 4 — Make the prompts readable  ·  **DONE 2026-09-20**

All three changes landed in `STANDARDS.md`, in the "Explaining a permission
request" section. The four lines — what it does · what changes · risk and why ·
undo — are unchanged and still the core of it.

**1. Stated as a hard rule.** The opening now reads "This is a hard rule, not a
preference", and names the failure explicitly: a prompt that arrives unexplained
is a failure *even if it is approved*. Previously it read as guidance and, per
D5, was not reliably happening.

**2. A fifth line — "Why now" — whenever the command is on the global `ask`
list.** What was asked for that needs this, in Amit's terms, not the command
restated. The example contrasts "You asked to see the test failures and the
runner isn't installed" against "installing dependencies". The reasoning is
written into the section itself: those commands ask because they were judged
consequential *in advance*, so the prompt is the last point where that judgement
meets what is actually happening, and it has to carry the reason.

**3. `tccutil reset` has its own subsection.** "Resets permissions" is banned
outright. It must name the **service** and the **app**, say what stops working
until re-granted, and — when the command carries no bundle id — say that it hits
**every app on the machine**. It also records that the fix is by hand in System
Settings → Privacy & Security, per app, and that some apps must be quit and
reopened before they ask again. Worked example uses Voice Flow's Accessibility
permission and auto-paste.

**Cost:** `STANDARDS.md` 1164 → 1438 words, about +360 tokens per turn, on top
of 7b's +626. It loads in every session in every project.

**Verified:** all 10 preceding sections byte-identical — the diff touches only
line 113 onward (3 lines removed, 31 added), and the section list is unchanged
apart from the new `tccutil` subsection.

**Undo:** was `cp backups/2026-09-20-phase3/STANDARDS.md STANDARDS.md`; `backups/` is gone since 2026-09-21, so use `git show <commit>:STANDARDS.md` — that file is tracked and every version is in this repo.

---

## PHASE 5 — Structure  (MEDIUM / LOW)

### 5.1 · Voice Flow 110 KB rules → short `CLAUDE.md` + `docs/`

**DONE** 2026-09-18

Split in two on purpose: the relocation is verifiable in minutes, the staleness pass needs
file-by-file evidence and is where a session gets expensive. **Part one, done:** `Working
rules` (lines 161-646, 42 bullets) → `docs/working-rules.md`, `Known pitfalls` (759-1446,
47 bullets) → `docs/known-pitfalls.md`, both moved **verbatim**; `CLAUDE.md` keeps the
section order, `Stack`/`Architecture map`/`Commands` untouched, and each rule's one-line
claim with a pointer. 110 KB → 29 KB, a 73% cut. Two rows added to `docs/README.md` per
its own rule 2. **Verified:** each doc body compares *equal* to the corresponding line
range of the backup, all 89 claims found in their doc, and `git status` showed exactly the
3 expected changes. Restore point: `backups/2026-09-18-phase5.1/`. **Part two, done
2026-09-18:** all 89 read against the code. Every cited file path, identifier, constant,
dependency version and electron-builder setting resolved; `npm test` (76 files, 1764
tests) and `npm run typecheck` green; `npm run doctor:polish`, `-- --plans` and `npm run
doctor:vault` re-run; `structurePlan` + `looksLikeBenchmarkScript` replayed over all 172
history entries. **Nothing is superseded** — every entry whose symbol is absent from the
code is an entry documenting its own deletion. **7 carry a dated `> **Measured again 18
Sep 2026**` note** because the dictation history grew 118 → 172 and two line counts moved;
the rules themselves held, including the load-bearing one (`all 64 sections-shaped
dictations are still benchmark-script repeats`, re-verified at the larger N). Per
`dont-delete-reference-docs` nothing was deleted — the original wording stands and the
note sits beside it. Verified by diffing against the backup: the only changes are the two
headers and 7 inserted blockquotes, **0 original lines removed**, and all 89 `CLAUDE.md`
claims still resolve.

### 5.2 · Voice Flow `Read(//Documents/VS Code/**)`

**DONE** 2026-09-18

**Removed, not narrowed** — D23. It reached `Emp portal/.../server/data/vthru.db`
(employee records) and Packbly (customer records), and the global `deny` is only `.env`,
so nothing covered the database. Voice Flow's rules and docs reference no other project
except one line about `Voice Flow_v1`, which goes too under D23. Verified: **no
cross-project grant survives anywhere in the setup.** The 5 `additionalDirectories` are a
separate item — none point at another project.

### 5.2b · Standing grants over other folders

**DONE** 2026-09-18

D23's second half. 12 entries removed across Voice-Flow and FinNode: SecondBrain vault ×2,
`.continue`, rtk tee (redundant — the global rule is `settings.json:30`, verified), 3
duplicate `Voice Flow.app` spellings subsumed by `Voice Flow.app/**`, and the
`additionalDirectories` for `.continue`, `.local/bin` and `~/.claude` (both
projects). **Voice-Flow now reaches only** `/private/tmp`, `/tmp`, `/Applications/Voice Flow.app` and
its own tree; **FinNode only its own tree.** Kept `/private/tmp` — the session scratchpad
is needed every turn.

### 5.3 · Emp portal `.claude/CLAUDE.md` → `CLAUDE.md`

**DONE** 2026-09-20

Moved to the project root, content byte-identical (`cmp`). `project-rules/manifest.tsv`
hardcoded the old path, so it was updated in the same step — that was the whole blast
radius. **Proved the drift check is live rather than assuming it:** pointed the manifest
back at the old path and `sync.sh` reported `MISSING SOURCE` and exit 1; restored, and it
reports 7 current / 0 drifted / 0 missing. Emp portal's `.claude/` still holds
`settings.json`, `settings.local.json` and `launch.json`, which stay where they are.

### 5.4 · Add pointer to ENVIRONMENT.md from PROJECTS.md

**ALREADY DONE** — no action 2026-09-20

D8 is satisfied and was before this phase started. `PROJECTS.md` references
`ENVIRONMENT.md` twice: line 7 ("Branch state, duplicate trees and the open questions are
in `ENVIRONMENT.md`") and in the closing "Not projects" line. The row was stale, not the
file.

### 5.5 · Update PROJECTS.md — folders opened that it does not list

**DONE** 2026-09-20

The row's framing was wrong, so the work changed. Of the **17** paths in
`~/.claude.json`, **10 no longer exist** — old Voice Flow trees, `Packbly_Admin`, `claudetr`, a `Downloads`
copy of Emp Portal — so listing them would document history, not projects. They are named
in `PROJECTS.md` as deliberately excluded. Of the 7 that do exist, 5 were already listed
and 2 are `~` and `~/Documents` themselves, now recorded as working directories rather
than projects. **Three actual errors found and fixed:** Emp Portal was filed under "No
`CLAUDE.md` yet" when it has had one since 6 Aug; `~/Documents/Voice-Flow-main` was listed
under "Not projects" and is gone; the verification date said 2026-09-15.

### 5.6 · Merge 2 orphaned memory folders

**ALREADY DONE by 7a** — no action 2026-09-20

Verified rather than assumed: all **5** folders under `projects/` map to a directory that
exists on disk, and the two the row names (`-Users-amitjangra-Debugger-vthrudebugger-v1`,
`Voice-Flow-Pro`) are gone. **18 memories, none stranded** — corrected 2026-09-20 from
"23", which wrongly counted the five `MEMORY.md` index files as memories. Counted with
`MEMORY.md` excluded: Voice-Flow 10, Debugger v2 3, FinNode 2, vthrudebugger_v1 2,
Documents 1.

### 5.7 · Commit Voice Flow + Emp portal rules to git?

**RESOLVED — the question was backwards** 2026-09-20

Read the `claude-md-not-in-git` memory before recommending this time. It is a standing
preference stated "from now onwards" on 2026-08-11: keep `CLAUDE.md` untracked and
gitignored, applied **proactively at repo setup rather than on request**. So committing
them was never the open question — compliance was. **Both project repos are private**
(checked via the API) and **neither file contains a secret**: the credential-shaped grep
hits are all prose *describing* auth design that already lives in the same repo's
source. **Voice-Flow: already compliant** — `c1e9459 Untrack CLAUDE.md and add it to
.gitignore`. **Emp portal: was not, and it was a live risk** — the file was untracked *and* unignored,
so `git add -A` on the current feature branch would have committed it. Fixed by adding
`CLAUDE.md` to its `.gitignore` with the same comment Voice-Flow uses; the file itself is
untouched and `sync.sh` still reports 7 current. Never committed there, so its history is
clean. **Cost accepted, unchanged:** a cloud session cloning either repo still gets no
project rules; `project-rules/` here is what carries them.

### 5.8 · Two cloud plugins fail to connect

**HALF RESOLVED** 2026-09-20

Both live under `plugins/synced/`, which is **gitignored and cloud-synced**, so a local
edit is overwritten on the next sync. **`browser-use`:** ran `uvx --python 3.12
browser-use@latest --cli-mcp` with no `uv` or `uvx` on PATH. **`uv` 0.12.17 installed via
Homebrew 2026-09-20 at Amit's instruction**, after I recommended against it — `uv` and
`uvx` both resolve to `/opt/homebrew/bin`. **Not yet proven to fix the plugin:**
connections are attempted at session start, and the first run must still download CPython
3.12 (not installed locally, `uv python list` shows it as download-available) plus
`browser-use@latest`, which is re-fetched from the network on every start. **`definite`:**
points at `https://api.definite.app/v3/mcp/http`; checked directly — DNS resolves, the
host answers **200 at `/`**, the configured path returns **404**. Stale shipped URL,
vendor- or cloud-side, not fixable here. Undo for the install: `brew uninstall uv`. **Half
closed 2026-09-27.** `browser-use` is superseded: **D28** disabled the plugin outright,
because its cost was MCP *server instructions*, which `skillOverrides` cannot reach — so
whether `uv` would have fixed the connection is moot and was never proven either way. The
`uv` install stands; `/opt/homebrew/bin/uv` is present, checked 2026-09-27. **`definite`
remains open and is not ours to fix:** as checked on **2026-09-20** its shipped URL
returned 404 while the host answered 200, which is vendor- or cloud-side. **Not re-checked
since.** The row stays `HALF RESOLVED` for that reason, not from inattention.

---

## Explicitly not doing

- **Adding another tool.** Nothing here needs one. A sixth system to maintain
  would make this worse, not better.
- **Touching the cloud skills and plugins.** They are account-side; edits here
  get overwritten. A tour of what they are is worth doing — that is reading,
  not fixing.
- **Reaching an "expert" setup.** Fix what exists, improve it gradually.

## Open questions

All three original open questions are now answered — see D10, D11, D12.

Nothing is currently open. New questions get added here as they come up, with
the decision recorded in the table above once made. (Note 12-10-2026: this is now a section, not a table.)

---

## Rebuilding on another account

> **Counts in this section are from 2026-09-18 to 2026-09-22** — memory files, cloud skills
> and plugins, the *Five systems* list, and the plugins named in step 4. **Re-take them
> before the switch** (`baselines/global-open-tests.md` TC6). Noted 10-10-2026.

### The short answer

**Same Mac, different email: you lose very little.** Almost everything is files
on disk, and files do not care which account is logged in.

**"User B" means another Claude account for Amit on this same Mac** — not another
macOS user. **The switch has not been tested.**

| What | Survives account switch? | Why |
|---|---|---|
| All 6 global `.md` rules files | **Yes** | Plain files in `~/.claude/` |
| `settings.json` — model, effort, hook, permissions, `skillOverrides` | **Yes** | Plain file, tracked here |
| `settings.local.json` — anything set through the **`/skills` menu** | **No** | **Gitignored, so it is not in this repo.** Verified 2026-09-26: the menu writes here, not to `settings.json`, and its `skillOverrides` block *merges* with that file rather than replacing it. (Noted 10-10-2026: which `settings.local.json` held the entries during that check is not recorded — `ENVIRONMENT.md`, local-settings table.) A skill set to `name-only` or `user-invocable-only` through the menu is therefore lost on a switch, silently — the skill simply comes back at full cost. Copy it into `settings.json` by hand if it should travel, or re-set it through the menu afterwards |
| All 8 projects' `CLAUDE.md` and `.claude/settings.json` | **Yes** | Plain files in the project |
| The 27 memory files | **Yes** | Plain files under `~/.claude/projects/` |
| rtk, ollama-do, statusline script | **Yes** | Installed in `~/.local/bin` and `~/.claude/statusline/` |
| The 18 cloud skills | **No** | See below |
| The 13 cloud plugins | **No** | See below |
| MCP connectors | **No** | Authorised per account. Moot since **D28** — `disableClaudeAiConnectors: true` turns the channel off for every account, and that setting *does* travel, because it is in `settings.json` |
| Artifacts and Claude Docs you have made | **No** | Live in the account |

### Why the cloud skills and plugins do not survive — verified

They are stored in folders **named after the account**:

```
~/.claude/skills/synced/<organizationUuid>_<accountUuid>/
~/.claude/plugins/synced/<organizationUuid>_<accountUuid>/

current: 26df45ac-a0b9-4c23-a8bd-b39351292679_30b66a9c-25e5-4e24-bdfe-8ebf23b886cb
                    ^ organization (v-thru.com)      ^ account (amit@v-thru.com)
```

Account B has a different `accountUuid`, so Claude Code creates a new empty
folder and syncs whatever **B's** account has. A's folder stays behind doing
nothing. If B is in the same organisation the org half matches, but the account
half still differs — so the folder is still new.

**This cannot be fixed by copying the folder.** Renaming A's folder to B's UUID
would be overwritten on the next sync. The skills and plugins have to be
present on account B's claude.ai side. That is a web-side action, not a file.

### The switch checklist

Run in this order. Steps 1-3 need no work if the git repo from Phase 6 exists.

1. **Before logging out** — `git -C ~/.claude add -A && git commit && git push`.
   This is the only step that cannot be done afterwards. The remote exists
   (6.2 DONE), so this now works.
2. `/logout`, then `/login` with account B.
3. **Verify the files are untouched** — `/status`, then check `~/.claude/CLAUDE.md`
   still loads and one project's `CLAUDE.md` is still read. Nothing should have
   moved.
4. **Re-enable the marketplace plugin**: `/plugin install swift-lsp@claude-plugins-official`.
   `settings.json` already lists it under `enabledPlugins`, but the plugin files
   install per account.
5. **Re-authorise MCP connectors only if they are wanted back.** ClickUp, Figma and
   Slack were disconnected on 2026-09-22, and **D28** set
   `disableClaudeAiConnectors: true`, which turns the whole claude.ai connector
   channel off for every account — so nothing is authorised until that line is
   deleted from `settings.json`. Sentry and Claude Docs were the two still in use
   before D28. Leaving this step undone is the cheaper default.
6. **Check which cloud skills and plugins arrived.** Compare against the list in
   the "Five systems" section above. Anything missing has to be added on
   claude.ai for account B — it cannot be copied across.
7. **Delete the stranded folders** once B is working:
   `~/.claude/skills/synced/<A's uuid>/` and the same under `plugins/`. Only
   after confirming B is healthy, and only with approval (D4).

### What to do on a *different* machine

Steps above, plus: install Claude Code, clone the dotfiles repo into `~/.claude`,
install rtk (`~/.local/bin/rtk`, v0.48.0), install `ollama-do` and Ollama, and
re-clone the 8 projects. The projects carry their own `CLAUDE.md` and
`.claude/settings.json` in their own repos — except two, see 5.7.

**What comes back with the clone, and what does not.** `archive/` is tracked, so it
arrives with the repo. `backups/` no longer exists (as of 10-10-2026, Claude Code has recreated it for its own app backups — see § *Where the backups went*): it was deleted on 2026-09-21 once
its contents were proven recoverable, and anything that has to outlive a machine goes in
`archive/` instead.

`archive/` holds what cannot be recreated:

| File | What it is |
|---|---|
| `archive/pre-setup-originals-2026-09-18.tar.gz` | The 29 files from the old `backups/` that existed in **no git repo at all** — 127 KB. Voice-Flow's original 110 KB `CLAUDE.md`, the eight pre-Phase-2 project settings files from when the projects held 560 `allow` rules, and the original `SETUP-PLAN.md`. Established by hashing all 135 backup files as git blobs against every commit in this repo and all eight project repos: 101 were recoverable, 34 were not, 5 of those were Claude Code's own `.claude.json` app state and were deliberately dropped. |
| `archive/voice-flow-pre-rewrite-2026-09-21.bundle` | Voice-Flow's complete history **before** the 2026-09-21 rewrite — 162 commits, both branches, 2.2 MB. The rewrite made those commits unreachable on GitHub, so this is the only durable copy. Restore with `git clone <bundle> voice-flow-original`. It contains the 4,647-byte `CLAUDE.md` the rewrite removed, which is **why this repo must stay private** — the same reason `project-rules/` holds every project's current `CLAUDE.md`. |

`archive/README.md` carries the same facts next to the file, so they survive being read
out of context. Adding to `archive/` needs a named allow-line in `.gitignore`, which
blocks everything by default. (10-10-2026: `*.bundle` and `*.tar.gz` files are already
covered by wildcard lines; any other kind needs its own.)

### Where the backups went

**`~/.claude/backups/` was deleted on 2026-09-21**, at Amit's request, after its contents
were proven recoverable rather than assumed to be. It had grown to 21 dated folders,
5.2 MB, one per editing step.

**Since then, 10-10-2026:** the folder exists again. Claude Code recreated it for its own
`.claude.json.backup.*` files — a rolling set, five on 10-10-2026, 520 KB. They are the app's state, not
this setup's: gitignored, untracked, and outside T6 (Amit, 10-10-2026).

The test, run before anything was removed: every one of the **135 files** was hashed as a
git blob and looked up in every commit of this repo and of all eight project repos.

| | |
|---|---|
| **101** | recoverable from git — the mirrored project rules, the global files, the memories |
| **29** | recoverable from nowhere → archived as `pre-setup-originals-2026-09-18.tar.gz`, then verified by extracting and comparing all 29 byte-for-byte |
| **5** | Claude Code's own `.claude.json.backup.*` app state — account info and caches it rewrites itself. **Dropped deliberately**, and they are the one thing that is genuinely gone |

The 3.0 MB `2026-09-21-voice-flow-history/` mirror went too, superseded by
`archive/voice-flow-pre-rewrite-2026-09-21.bundle`, which was verified to restore all 162
commits before the mirror was touched.

**The rule going forward:** a working snapshot taken during an edit is disposable and
belongs nowhere permanent. Anything that cannot be reconstructed from a git repo goes in
`archive/`, tracked, with its provenance written into `archive/README.md` at the same
time. Every older § in this plan that says *"Backup: `backups/<date>-<name>/`"* is a
record of what was done that day, not a path that still exists.

---

## PHASE 6 — Put it in git  (HIGH — do before any account switch)

**Suggested reorder, not yet approved:** run `git init` and the `.gitignore`
*before* Phase 1.2 rather than here. Every phase then becomes its own commit,
giving a restore point per step instead of the single snapshot from 1.1. Same
work, better safety net. D6 (dated backup folder) stays either way — it is
already done.

A private git repo for `~/.claude`. No third-party tool: git and a `.gitignore`
are enough. This is also the standard approach for the same problem — see
"Tools considered" below.

### Commit — roughly 60 KB total

```
CLAUDE.md  STANDARDS.md  RTK.md  REPOS.md  PROJECTS.md  OLLAMA.md
ENVIRONMENT.md  SETUP-PLAN.md
settings.json
statusline/context.py
projects/*/memory/**          <- the 27 memory files ONLY
README.md                     <- new: how to rebuild, points at this file
```

### Never commit — and why each one matters

| Excluded | Size | Why |
|---|---|---|
| `.claude.json` | 92 KB | Account UUIDs, machine ID, every folder you have opened, all cached state |
| `history.jsonl` | 348 KB | **Every prompt you have typed, plus pasted content** |
| `projects/**/*.jsonl` | ~158 MB | 61 full session transcripts — entire conversations |
| `backups/` | — | **Deleted 2026-09-21.** Held copies of `.claude.json` plus every dated pre-change snapshot. What was irreplaceable is in `archive/`; the rest was recoverable from git |
| `plugins/`, `skills/synced/` | 24 MB | Account-keyed; regenerate on login. Committing them would carry A's UUID into B |
| `file-history/`, `paste-cache/` | 6 MB | Snapshots of your files and clipboard |
| `shell-snapshots/`, `session-env/`, `sessions/`, `cache/`, `tmp/`, `jobs/`, `tasks/`, `ide/`, `downloads/`, `feedback/`, `daemon*` | — | Machine state, no value elsewhere |
| `*.bak`, `policy-limits.json*`, `remote-settings.json`, `mcp-needs-auth-cache.json` | — | Stale or account-side |

**Checked:** no `.credentials.json` and no `buddy-tokens.json` in `~/.claude` —
your login lives in the macOS Keychain, so the repo cannot leak it. That is
worth re-checking before the first push, because the file appears if the
Keychain is ever unavailable.

### 6.1 Local repo  ·  **DONE 2026-09-18**
`git init`, deny-by-default `.gitignore` written first, 3 commits, tree clean,
40 files, 90 KB. Verified: no `.claude.json`, no `history.jsonl`, no session
transcripts, no credentials staged — 14 danger patterns checked, all clean.

### 6.2 Remote  ·  **DONE 2026-09-18**

```
repo       AmitJangra25/claude-setup
visibility PRIVATE  (confirmed via gh repo view before pushing)
branch     main, tracking origin/main
commits    4
files      40, verified identical to local git ls-files
```

Approved explicitly before running, as an outward-facing action. `gh` was
authenticated as `AmitJangra25` with `repo` scope.

**For any future push, check three things:**

1. **The repo is private.** This folder holds your rules, your working
   preferences and 27 memory files about your projects and how you work. Not
   secret, but not public either.
2. **`git status` shows nothing unexpected.** The `.gitignore` is
   deny-by-default, so it should hold — but verify rather than trust, because a
   push cannot be undone once GitHub has it. Content sent to GitHub may be
   cached or indexed even if the repo is deleted afterwards.
3. **Which GitHub account.** See the identity note below.

### Git identity is your personal Gmail, not your work address

```
user.name  : AmitJangra25
user.email : amitjangra044@gmail.com
```

Your Claude account is `amit@v-thru.com`. The two commits so far are authored by
the Gmail address, because that is the global git config on this Mac. Left as
found — changing it was not asked for. Worth a decision before adding a remote,
since it determines which GitHub account owns the repo and whose name is on
every commit.

### 6.3 Project rules into this repo  ·  **DONE 2026-09-18**
Per D13, all **7** project `CLAUDE.md` files are copied to
`project-rules/<project>/CLAUDE.md`. Seven, not the six `PROJECTS.md` implies —
the SecondBrain vault schema has one too. Voice Flow's copy is the 29 KB cleaned
version from 5.1 part one, which is why this waited.

**The sync step:** `project-rules/sync.sh` reports which copies have drifted from
their live files and exits non-zero if any have; `--pull` copies the live files
over. `manifest.tsv` maps each copy to its source path, so a project that moves
is one edited line and says `MISSING SOURCE` until it is fixed. Report mode
changes nothing.

**Verified:** all 7 copies byte-identical to their sources by `cmp` run
independently of the script; drift detection proven by breaking one copy on
purpose and watching *only* that project report `DRIFTED`, exit 1; `git status
--porcelain -uall` lists exactly the 10 intended files and `git ls-files
--others --ignored` shows nothing in `project-rules/` being silently dropped.

**Before adding an eighth:** all 7 were read in full first, because this repo is
pushed. They carry architecture, conventions and pitfalls — env var *names* but
no values, and no customer, employee or account record, including from the two
projects whose databases hold real ones. A regex scan is not a substitute for
reading the file.

### 6.4 Optional  ·  **DECLINED 2026-09-27**
A shell function to pull on open and push on close. Out of scope until Phases
1-2 are done.

> **Declined 2026-09-27, Amit's decision.** Phases 1-2 closed, which lifted the condition
> above, and he decided not to build it. An automatic push on close would send unreviewed
> work to `main`, against the standing rule in `STANDARDS.md` § *Git* that nothing is
> committed or pushed without being asked. Nothing here is blocked or waiting.

### Project rules are separate — `settings.json` only, since 6.3
Each project's `.claude/settings.json` belongs in that project's own repo, not
in this one. **`CLAUDE.md` no longer does:** D13 supersedes the original line
here, and since 6.3 a copy of every project's rules lives in `project-rules/`.
The concern this paragraph was written about — that on a new machine or account
those projects start with no rules — is what 6.3 answers for `CLAUDE.md`. It is
still true of `settings.json` — **it was, until 2026-09-20.** They are mirrored
here now too, for the same reason `CLAUDE.md` is: gitignored in the project means
no version history anywhere else.

**Skills are a third category, decided 2026-09-20.** A project's
`.claude/skills/` travels in **that project's own repo**, not here and not in
`project-rules/`. The reason `CLAUDE.md` needs a mirror is that it is
gitignored in every project; skills are not, so they already have version
history and a remote where they live. Voice-Flow's three are on
`AmitJangra25/Voice-Flow` as of `d106eda`, verified present in `origin/main`.
**Do not add them to `manifest.tsv`** — a second copy of a file that is already
tracked is the drift `sync.sh` exists to prevent.

So the three project-level things now sit in three different places, and the
split is deliberate rather than accidental:

| | Lives in | Why |
|---|---|---|
| `CLAUDE.md` | this repo, `project-rules/` | gitignored in the project (`claude-md-not-in-git`), so this is its only history. (Not uniform since D13 was reversed on 2026-09-20 — FinNode tracks it, recorded, not freshly checked; noted 10-10-2026.) |
| `.claude/skills/` | the project's own repo | not ignored; travels with the code it describes |
| `.claude/settings*.json` | this repo, `project-rules/<name>/.claude/` | gitignored in the project, so this is their only history (not uniform since D13 was reversed; noted 10-10-2026). **Added 2026-09-20**, reversing the earlier leave-as-is: until then **330 permission rules existed in no repo at all**, and the decision had been taken before anyone counted them |

`manifest.tsv` changed shape in the same step. Its second column was the path to a
project's `CLAUDE.md`; it is now the **project root**, and `sync.sh` derives all
three tracked files from it. Same format, same tab-separated line per project — but
a project can now be mirrored when it has permissions and no rules file yet, which
is how **Debugger v2** and its 17 rules got covered. The `CLAUDE.md` half was
proved to behave identically before the change was trusted: same 6 current, same
one drift, same exit code.

**Still outside it:** the 2 rules in `~/Documents/.claude/`, and the 68 inside
`node_modules` (60 when re-counted 2026-09-21) — the first because it is not a project, the second because they
return on every `npm install`.

---

## Tools considered, and the decision

Asked for explicitly. Honest assessment.

| Tool | Licence | Verdict |
|---|---|---|
| **rtk** (in use) | — | Keep for now. It saves tokens. It also corrupted a file path and hid output twice during this survey, so open question 3 stands. (Answered by **D12** — see § *Open questions*.) |
| **claude-mem** (`thedotmack/claude-mem`) | Apache 2.0, not MIT | **No.** Claude Code already has a native memory system and you are using it — 27 files across 5 folders. claude-mem would be a second, parallel memory system, and it wants its own model provider key. Two memory systems is worse than one imperfect one. |
| **claude-memory-skill** (`hanfang/claude-memory-skill`) | MIT | No, same reason. It is a lighter version of something you already have. |
| **claude-code-dotfiles** (`Povaz/claude-code-dotfiles`) | — | **Read it, do not install it.** It solves exactly this problem — "across machines and subscriptions" — with symlinks and git. Worth reading for its `.gitignore`. But Phase 6 is about 15 lines of git; a dependency is not warranted. |
| **`import-memory`** (built-in skill) | — | Not applicable. It imports memories from ChatGPT or Gemini into claude.ai's web memory. Not account-to-account, not Claude Code. |

**The principle:** every tool added is a system that has to be understood,
updated and debugged. You have five already and only one was deliberate. The
answer to "how do I make this portable" is a git repo, and that is not a tool.

Sources: [claude-mem](https://github.com/thedotmack/claude-mem) ·
[claude-memory-skill](https://github.com/hanfang/claude-memory-skill) ·
[claude-code-dotfiles](https://github.com/Povaz/claude-code-dotfiles)

---

## PHASE 7 — Fix where the working preferences live  (HIGH)

Found while reading the 27 memory files, 2026-09-18. This is a root-cause fix,
not a workaround.

### The problem

Memory is stored **per project folder**. Most memories are not about a project
at all — they are standing instructions about how the work should be done. They
only load in the one project they happen to be filed under.

**Measured 2026-09-18** (the earlier "11 of 16" was an estimate): 23 memory
files, **18 unique**, across 6 directories. Nine are cross-project working
preferences filed under a single project.

| Preference | Loads only in | Should apply |
|---|---|---|
| `always-recommend-an-option` — name a recommendation and say why, **including why not the others** | FinNode | everywhere |
| `report-findings-dont-chase-them` — list incidental findings at the end; Amit sets the pace | Voice-Flow, Voice-Flow-Pro | everywhere |
| `fix-root-cause-flag-workarounds` — always label a fix workaround vs root-cause | Voice-Flow | everywhere |
| `dont-delete-reference-docs` — relocate and mark stale, don't delete | Voice-Flow-Pro | everywhere |
| `docs-are-products-not-logs` — write docs about the thing, not about their own history | Voice-Flow | everywhere |
| `claude-md-not-in-git` | Voice-Flow-Pro | everywhere |
| `amit-uses-voice-input` — Amit dictates; read through transcription errors | Voice-Flow | **everywhere** — this is a `type: user` memory sitting in one project |

So: working in Packbly or Emp portal today, none of the above is in context.
`always-recommend-an-option` loads in FinNode only. `amit-uses-voice-input`
explains "bs4" meaning "VS Code" — and it was not loaded in this session.

### 7a — Repair where memories are stored  ·  **DONE 2026-09-18**

A worse problem sat underneath the filing one, found by checking each memory
directory against the filesystem. **Three of the six directories pointed at
project folders that no longer exist**, so 10 of the 23 files could never load
at all:

| Orphaned directory | Files | Sessions | Fate |
|---|---|---|---|
| `…VS-Code-Voice-Flow-Pro` | 6 | 0 | **Deleted.** All 5 memories byte-identical to live Voice-Flow copies; its index was a strict subset |
| `…VS-Code-Debugger` | 4 | 0 | **Migrated** to `…VS-Code-Debugger-v2` |
| `…Debugger-vthrudebugger-v1` | 3 | 0 | **Migrated** to `…VS-Code-vthrudebugger-v1` |

`~/Debugger/` and `~/Documents/VS Code/Debugger/` do not exist anywhere under
`~` — searched, not assumed. The projects moved; the memories stayed behind.

**The sharpest example:** `vthru_debugger_workflow_preferences` holds *"share a
written plan, let the user review, only then implement"* — the plan-first rule
Amit asked for on 2026-09-18 as if it were new. It was already recorded, and had
been unable to load since the folder moved.

Also: `Debugger v2` had no `CLAUDE.md` **and** no reachable memories — the least
instructed project on the machine. It now has 3 memories.

**Method:** copy → `filecmp` verify → only then remove. Deletions confined to
files with a proven identical live counterpart.
**Result:** 5 memory directories, all mapping to a project folder that exists;
18 unique memories, none lost.
**Undo:** `git -C ~/.claude checkout -- projects/` — all 29 memory files are
tracked and were already pushed.

### 7b — The fix for where preferences live

Promote the universal ones into `~/.claude/STANDARDS.md`, which loads in every
project and is already in the git repo. Leave genuinely project-specific
memories where they are:

**Stays as project memory:** `verify-shipped-bundle-not-source`,
`check-history-json-before-chasing-polish`, `history-must-be-unlimited`,
`recorder-page-becomes-chat`, `project-debugger-ui-frozen`,
`project-debugger-repo-fresh-start`, `feedback-debugger-overlay-intentional`,
`vthru-customer-app-debug-toggle`, `vthru-debugger-workflow-preferences`.

**Moves to STANDARDS.md:** the seven in the table above.

Originals are not deleted — per D4 nothing is removed without approval, and a
memory that also exists in STANDARDS.md is harmless duplication until you say
otherwise.

**Undo:** revert `STANDARDS.md` from the git repo or the 1.1 backup.

#### 7b — what was actually written  ·  **DONE 2026-09-18**

`STANDARDS.md` 85 → 145 lines, **60 insertions, 3 deletions**. Five new sections
and three edits to existing ones, in this order:

| Section | Source |
|---|---|
| **Plan before building** *(new)* | Amit's rules 1, 10, 11, 12, 13 + D17, D18 |
| **Evidence, not assumption** *(+1 para)* | rtk rewrites output — re-verify via `rtk proxy` (D12) |
| **Fix the cause** *(+1 para)* | label a fix workaround vs root-cause — `fix-root-cause-flag-workarounds` |
| **Reuse what is already there** *(new)* | Amit's rules 4, 9 |
| **Know what the change touches** *(new)* | Amit's rules 7, 8 + blast radius, per D19 |
| **Stay on the task** *(1 para reworded)* | reconciled with `report-findings-dont-chase-them` |
| **When something is unclear** *(new)* | Amit's rule 14 + `always-recommend-an-option` + `amit-uses-voice-input` |
| **Docs are products** *(new)* | `docs-are-products-not-logs` + `dont-delete-reference-docs` |

**Deliberately not added:** Amit's rules 2, 3, 5 and 6 — already covered by
§ *Fix the cause* and § *Build the smallest thing*. Restating them would have
doubled the file and let two phrasings drift apart. This is D20.

**The one deletion** was the paragraph *"...do not end a task by talking me into
a list of other things to fix"*, which contradicted the
`report-findings-dont-chase-them` memory. The memory's version won, because it
was given directly. Flagged before the edit, not after.

**Cost:** +626 tokens per turn, `STANDARDS.md` ~988 → ~1,614. The always-loaded
set goes from ~3,469 to ~4,095. **My pre-write estimate was +340 — wrong by
most of a factor of two.** The wording was reviewed and approved as written, so
the content is what was wanted; the estimate was the error. If the per-turn cost
proves too high, § *When something is unclear* and § *Docs are products* are the
two most compressible.

**Originals kept.** The nine promoted memories still exist in their project
folders — per D4 nothing is removed without approval, and duplication between a
memory and `STANDARDS.md` is harmless.

---

## PHASE 8 — Where rules live: divide, standardise, restructure  (HIGH)

Opened 2026-09-20 at Amit's request: review **everything built in the setup**, not
just the day's work, and decide what is universal versus project-specific. **All four steps
have since been actioned.** The survey below is unchanged.

**Full write-up:** https://claude.ai/artifact/JPhMJ7z3bAMux6w5G3ZaMy

### The finding

The structure is not undefined. `STANDARDS.md` line 3 already states it: global is
universal, a project's `CLAUDE.md` adds specifics, and where they overlap the
project wins. **The files simply do not follow the rule that is already written.**

### The constraint that causes most of it

**There is no global memory.** Memory always lives at
`~/.claude/projects/<project-path>/memory/`; there is no `~/.claude/memory/`.
A preference stated once while working in Voice-Flow is saved into Voice-Flow's
folder and only ever loads there, however universally it was meant. The only
surface a universal rule can occupy is one of the files `CLAUDE.md` imports — five until
2026-09-22, three since (`STANDARDS.md`, `RTK.md`, `OLLAMA.md`; `PROJECTS.md` and
`REPOS.md` moved out as reference). This is a storage fact, verified, not a judgement
call.

### A · Ten rules written in two places

Phase 7b promoted preferences into `STANDARDS.md` and **left the originals in
place**, so both copies exist and can drift.

Six memories already covered by `STANDARDS.md`, verified by grep:

| Memory | Lives in | Already global as |
|---|---|---|
| `fix-root-cause-flag-workarounds` | Voice-Flow | Fix the cause, not the symptom |
| `report-findings-dont-chase-them` | Voice-Flow | Stay on the task you were given |
| `docs-are-products-not-logs` | Voice-Flow | Docs are products |
| `dont-delete-reference-docs` | Voice-Flow | Do not delete reference or spec docs |
| `amit-uses-voice-input` | Voice-Flow | I dictate most prompts |
| `always-recommend-an-option` | FinNode | Never present options neutrally |

Plus FinNode's `CLAUDE.md` re-states four `STANDARDS.md` sections verbatim in
substance — *Evidence not assumption*, *Fix the cause*, *Build the smallest thing*,
*Stay on the task*. **Not simple duplication:** each carries real project evidence
(the Phase 0/1b/1c defect counts, the `DiaryDao` precedent). Keep the evidence,
drop the re-stated general paragraph.

### B · Five universal rules trapped in one project

> **SUPERSEDED — checked 2026-10-03. All five rows are resolved; the table is kept as
> history only.** Every rule below has since been promoted to a global file, or reversed.
> Do not act on it, and do not re-add these rules — they are already in place.
>
> - *Never commit or push without being asked* → `STANDARDS.md` § *Git*. The row's claim
>   that it is **"not in `STANDARDS.md` at all"** is no longer true.
> - *One PR per feature, own branch off `main`* → `STANDARDS.md` § *Git*.
> - *`verify-shipped-bundle-not-source`* → `STANDARDS.md` § *Evidence, not assumption*.
> - *`rtk-proxy-suppresses-dry-run-output`* → `RTK.md` § *Gotcha — `--dry-run` prints
>   nothing*.
> - *`claude-md-not-in-git`* → **reversed on 2026-09-20**, not promoted. `CLAUDE.md` and
>   `.claude/settings.json` now stay tracked while a repo is private and solo;
>   `STANDARDS.md` § *Git* governs. The memory note carries the same supersede marker.
>
> The rows below record why each was worth promoting at the time.

The half that actively costs something. Each is general but only loads in one place.

| Rule | Trapped in | Why global |
|---|---|---|
| **Never commit or push without being asked** | vthrudebugger_v1 memory | Highest value. **Not in `STANDARDS.md` at all** — currently relies on a Claude Code default rather than Amit's own rule |
| `claude-md-not-in-git` | Voice-Flow memory | Stated "from now onwards" — explicitly global. Only loading in Voice-Flow is why Emp portal was out of compliance until 5.7 |
| One PR per feature, own branch off `main` | vthrudebugger_v1 memory | Nothing project-specific in it |
| `rtk-proxy-suppresses-dry-run-output` | FinNode memory | rtk runs on every Bash call in every project via the hook — an rtk gotcha is global by definition |
| `verify-shipped-bundle-not-source` | Voice-Flow memory | General principle for anything that ships a build |

`vthru_debugger_workflow_preferences` is the worst case: **one file holding three
rules already global** (plan-first, ask-don't-guess, reuse existing helpers), **two
that should be global**, and nothing project-specific. It needs splitting, not moving.

### C · Correctly placed — do not touch

Voice-Flow's 89 working rules and pitfalls, Emp portal's 8 must-follow rules,
Packbly_web's 6, Voice Flow_v1's 5, FinNode's hard rules and architecture, and all
7 project-type memories. All genuinely about their own codebase. Checked by reading.

### The cost, and the shape of the fix

Six global files load **every turn**: 2,968 words when this was written, ≈3,900 tokens.
**2,478 words on 2026-09-21** — Phase 11 cut them and step 3 added one sentence back.
Promoting a rule is not free — it loads in every session of every project forever.

**The fix is the pattern already invented in Voice-Flow:** state the rule as a
one-line claim globally, keep the evidence in the project that earned it. That is
how Voice-Flow's `CLAUDE.md` went 110 KB → 29 KB losing nothing (5.1). Applied here,
the five trapped rules cost about **5 lines / ~60 words**, not five copied files.

### The four steps — all done

| # | Step | Risk |
|---|---|---|
| 1 ✅ | **DONE.** Promote the 5 trapped rules — 4 into `STANDARDS.md`, 1 into `RTK.md`, one line each | low, additions only |
| 2 ✅ | **DONE.** Retire the 6 redundant memories — pointer line at the top naming the governing global section, body and dated evidence kept. Verified 2026-09-21: all 6 marked (Voice-Flow 5, FinNode 1) | low |
| 3 ✅ | **DONE 2026-09-21.** The 2 rules went global in Phase 10's `vthrudebugger_v1` pass; the 3 already-global keep their bodies under a pointer, per step 2's method. The only gap left was the stash-and-branch technique, now in `STANDARDS.md` § *Git* | medium, needs Amit's read |
| 4 ✅ | **DONE.** It had already been done inside FinNode's Phase 10 pass, commit `725ca2e` on `main` — the four sections 426 → 204 words, replaced by a pointer line to `STANDARDS.md`, the Phase 0/1b/1c/2a defect counts and the `DiaryDao` precedent kept. Verified 2026-09-21 by diffing the commit; the status row was stale, not the file | medium, most editing |

**Explicitly out of scope here:** the 384 permission rules and the 18
arbitrary-code-execution rules. Separate problem, separate page — see Phase 9.

---

## PHASE 9 — The 384 project permission rules  (DONE — the safety item is closed)

Surveyed 2026-09-20; **actioned 2026-09-21** — see the Phase 9 rows in the status table.
The category counts below are the original survey and were already stale when acted on.
**Full audit, all 384 rules searchable:** https://claude.ai/artifact/YAJNnNkSemQyCCtMsNkzDD

**Correction recorded first:** the 384 rules cost **zero tokens**. They are read by
the permission system, never sent to Claude. Only the `.md` files load into context.
The two were conflated when first reported to Amit.

**Second correction, 2026-09-20: the audit missed 68 rules.** Four
`.claude/settings.local.json` files live *inside* `node_modules` — three copies of
`resolve`, one of `nanoid` — and the 384 count never saw them. **Re-counted
2026-09-21: three files, 60 rules; `nanoid`'s copy is gone.** They are not Amit's:
they are the package maintainers' own Claude Code grants, published to npm by
accident, and `resolve`'s folder also ships a `notes.md` describing that project's
house style. Practically they are inert, because Claude Code reads settings from the
project root and the working directory's parents, not from an arbitrary dependency —
but **a dependency can ship permission grants, and `npm install` delivers them
silently.** That is worth a decision of its own, not a cleanup: the files reappear
on every install. Found while cross-checking the Voice-Flow pass; see Phase 10.

**Second correction:** "duplicates" was the wrong frame. Rules are per-project, so
`Bash(rtk ls *)` in 7 projects is 7 projects each needing it, not 6 wasted copies.
Deleting them would break those projects. The fix for those is promotion to global.

### The safety item — 18 rules that execute arbitrary code

`Bash(node *)`, `Bash(node -e ' *)`, `Bash(node --input-type=module -e ' *)`,
`Bash(python3 -c ' *)`, `Bash(python3 -)`, `Bash(rtk proxy *)`,
`Bash(osascript -l JavaScript -e ' *)`,
`Bash(osascript -e 'tell application "System Events" *)`, `Bash(awk ' *)`.

Once one matches, **the entire global ask list is bypassed**, because the command
that runs is `node` or `python3`, not `rm` or `sudo`. Concretely:
`node -e "require('fs').rmSync(...)"` matches `Bash(node -e ' *)` in Voice-Flow,
matches no ask rule, and deletes with no prompt.

This is the same blind spot already recorded in "What I got wrong" — *"My risk
categories put arbitrary-code and Keychain access in the low risk bucket."* It was
identified then and never closed.

### The rest

| Category | n | Fix |
|---|---|---|
| Already granted by the global allow list | 37 | Delete — zero effect |
| One-off literal commands, spent, cannot match again | 67 | Delete — nothing lost |
| Subsumed by a broader rule in the same project | 8 | Delete — nothing lost |
| Rules that **write files** sitting in an allow list | 8 | Review — 3 are dead `sed -i` replacements |
| Present in 3+ projects | 83 copies | Promote to ~16 global rules — **but not the 4 that are arbitrary-code** |
| Look fine as they are | 210 | Leave |

Categories overlap; the totals do not sum to 384.

---

## PHASE 10 — Project-by-project review  (COMPLETE 2026-09-20 — all five projects)

Opened 2026-09-20 at Amit's direction, and it **changes the order of everything
left**. Phases 8 and 9 both proposed a global pass first. That is backwards: what
belongs in `STANDARDS.md` cannot be decided until every project has been seen, and
deciding it early means reopening it. So the rule is now:

**Walk the projects one at a time. Promote to global only at the end.**

### How a project pass runs

1. **Read it and say what it is** — in plain English, one short page: what the
   project does, what its `CLAUDE.md` says, what its permissions actually let a
   session do, what is missing. Amit reads and decides; nothing is assumed.
2. **Ask — but few, and short.** Every removal is a question, never an inference.
   **Corrected 2026-09-20:** this step used to say eight to ten questions a project was
   normal and wanted. Amit reversed it during the `vthrudebugger_v1` pass — "how many
   times do I have to tell you, explain in simple and short" — after a report that was
   accurate and unreadable. Group the findings into a few named buckets with counts and
   ask **two or three** questions covering them. The rule that every removal needs
   consent has not changed; asking for it twelve times separately is what changed.
3. **Back up first**, into `backups/<date>-<project>/`, verified with `cmp`.
4. **Cross-check twice before any deletion, by two different methods.** This is
   Amit's standing instruction and it has already earned itself — see below.
   Current rule since 08-10-2026: `STANDARDS.md` step 4; procedure in `harness/cross-check.md` (D33).
5. **Verify after**, against the backup: what was removed, what was added, and that
   `ask`/`deny` and every unrelated setting are untouched.
6. **Report what was not verified** as plainly as what was.

### The cost model that drives the trimming

Three tiers, and confusing them is what made the setup expensive:

| | Cost |
|---|---|
| `CLAUDE.md` and every file it `@import`s | **every turn, forever** |
| `docs/`, `skills/`, `agents/`, memory bodies | only when actually opened |
| `settings.json` permissions, hooks | **zero, always** — never sent to a model |

So the shape of every pass is the same: **claim in `CLAUDE.md`, evidence in
`docs/`, and a skill to force the doc open at the moment it matters.** That is the
pattern 5.1 invented in Voice-Flow; Phase 10 applies it everywhere.

A skill is the important half. Trimming a rule out of `CLAUDE.md` makes it
invisible until something opens the document. A skill named for the dangerous job —
not for a file — costs nothing until called and puts the right document in front of
the session at the right moment.

### Order

Voice-Flow first (biggest `CLAUDE.md`, most to save, proves the method), then the
rest by Amit's call. Two projects — **Debugger v2** and **Packbly_v2** — have no
`CLAUDE.md` at all and start from a blank page rather than an untangling.

### Voice-Flow  ·  **DONE 2026-09-20**

Backup: `backups/2026-09-20-voiceflow/` — 18 files, all verified byte-identical.

**Per-turn cost in this project: ~10,056 → ~6,003 tokens.**

| | Before | After |
|---|---|---|
| `CLAUDE.md` | 4,650 words / ~6,140 tokens | **1,534 words / ~2,024 tokens** |
| `allow` rules | 234 | **180** |
| Documents in `docs/` | 11 | **13** |
| Skills | 0 | **3** |

**The diagnosis was wrong the first time, and the correction matters.** The first
report said the 42 working rules were most of the file. Measured, they were 687
words of 4,650. The real weight was **Architecture map (1,629) and Commands
(1,339)** — 64% of the file — because those two sections had *never* been split and
still carried every war story inline. Rules and pitfalls were already claim-only.
The lesson is the one from 7b: measure the section before proposing the fix.

**What was done.**

- **Permissions, 234 → 180.** Two `git commit` allows removed and the rule made
  global instead. Five wildcards that execute arbitrary code removed — `node *`,
  `node -e ' *`, `node --input-type=module -e ' *`, `python3 -c ' *`, `python3 -` —
  leaving the named scripts and `npm run *`, which covers all 18 package scripts.
  47 dead one-offs removed (32 `echo`, 15 `awk`); `sed`/`perl` kept at Amit's call.
  One wildcard **narrowed rather than removed**:
  `osascript -e 'tell application "System Events" *` became `… to get *`, which
  still answers every read-only query the paste debugging needs and refuses
  `keystroke`, `key code`, `click` and `delete login item`.
- **Global `ask` 101 → 107.** `git commit` now asks everywhere, in six spellings.
- **`STANDARDS.md` +2 rules**, additions only — see Phase 8.
- **7 memories marked** with a pointer to the governing global section. **0 lines
  deleted** across all 11 files in the folder.
- **`CLAUDE.md` split.** `Architecture map` and `Commands` moved verbatim into new
  `docs/architecture.md` and `docs/commands.md`; the condensed map and command list
  stay. Working rules trimmed 42 → 20, pitfalls 47 → 15. **All 89 remain in `docs/`
  in full** — every dropped line was proved present there before removal.
  `docs/README.md` gained both rows and an honest account of the trade.
- **3 skills**, in `.claude/skills/`: `verify-app` (prove a change reached the
  installed `.app`), `vault-work` (this code writes into a real Obsidian vault),
  `polish-work` (fourteen identical runs once produced five different shapes).

**The trade, stated because it is real:** 22 rules and 32 pitfalls are no longer in
front of a session automatically. Each trimmed section names the document holding
the rest and says to read it first, and the three skills cover the three areas where
a missed rule actually costs something.

### What the cross-check found — and why it is now a fixed step

Amit asked for a cross-check before any of this was recorded. It found **two real
errors in work already reported as done**:

1. **A factual error introduced while rewriting.** The condensed Architecture map
   called eight vault modules "the pure ones". Measured against the code,
   `vaultTree` (3 filesystem references) and `vaultLint` (2) are not. The original
   text had only ever marked `vaultPlan` pure; the generalisation was invented.
   Fixed — the seven with zero references are now named explicitly, and so are the
   five that read or write.
2. **The `git commit` fix was two-thirds of a fix.** `Bash(git commit *)` does not
   match `git -c user.name=… commit`, and **FinNode has exactly that rule saved as
   an allow.** Closed with `git * commit *` in three spellings, tested to catch the
   `-c` and `-C` forms while still letting `git log`, `git status` and `git diff`
   run. `cd X && git commit` still slips — that is the structural limit already
   documented under *Why permissions cannot be made airtight*, not a new hole.

It also found **one miss in the review itself**: the first pass listed five things
worth looking at in Voice-Flow's permissions and did not include the
`System Events` wildcard, which could send keystrokes to any application. It was
narrowed once shown.

**Conclusion: the cross-check is not optional.** Two of the three findings were in
work already called done and verified. A pass is not finished until it has been
re-read against the code by a second method.

### Voice-Flow — open, not acted on

- `docs/architecture.md` says "Eleven files" for the vault modules; there are
  **twelve** on disk. Stale in the original text, moved verbatim, so `CLAUDE.md`
  (twelve) and the document (eleven) now disagree.
- `CLAUDE.md` says `useCopyToClipboard.ts` is "the only place that copies";
  `useDictationPipeline.ts` also calls `clipboard.writeText`, for auto-paste. The
  wording is the original's and reads as absolute.
- The `verify-shipped-bundle-not-source` memory points at
  `/Applications/Voice Flow Pro.app`. The app has been `Voice Flow.app` since the
  19 Aug 2026 rename, so following the memory literally fails. The new
  `verify-app` skill uses the correct path; the memory was left alone.
- `.claude/` is untracked in Voice-Flow's git. `settings.local.json` should stay
  that way; `settings.json` and the three new skills probably should not.
- **Later / unverified, from the 2026-09-29 direct-spelling change.** Recorded, not acted
  on, and not investigated now:
  - The two `--dry-run` `allow` entries — `Bash(node scripts/reset-permissions.js
    --dry-run)` and `Bash(node scripts/uninstall-app.js --dry-run)` — are matched by the
    new patterns and are **predicted** to prompt from now on. Predicted, not observed.
  - Real execution of `install:app`, `compile:vault`, `reset:permissions` and
    `uninstall:app` remains untested, as do the child processes they spawn inside Node
    (`ditto`, `codesign`, `security`, `osascript`, `tccutil`, `pkill`, `lsregister`),
    which are not Bash commands and which no rule was exercised against. Deliberate.
  - `cd scripts && node install-app.js` is **not covered** by the four new rules, nor by
    any rule in the four settings files. Known, not fixed.

### Voice-Flow re-checked 2026-09-20, after the FinNode pass

Asked for directly: was the Voice-Flow pass done well, and does anything transfer
between the two? Checked against both projects' live files.

**What held.** The dangerous rules really were closed. The surviving `node -e` and
`python3 -c` entries there are **fully-specified literal commands**, not wildcards —
`node -e "const p=require('./package.json') …"` is one exact string, not `node -e *`.
The `System Events` wildcard is narrowed to `… to get *` as recorded. And
`verify-shipped-bundle-not-source` already carries a dated "**Renamed since this was
written**" note giving the current `Voice Flow.app` paths, so the plan's open item
saying the memory was "left alone" is out of date — it was annotated. No
`Voice Flow Pro` string survives anywhere in the working tree; `productName` in
`package.json` is the only place the name lives.

**The one real inconsistency between the two passes.** Voice-Flow still holds **180
allow rules to FinNode's 13**, and the split explains it: **127 of the 180 are
fully-literal spent one-offs** — a single exact command from a finished session, 40
of them over 80 characters, the longest **433**. Only 53 are reusable wildcards. The
Voice-Flow pass removed the *dangerous* rules and 47 dead `echo`/`awk` entries; the
FinNode pass removed the dangerous rules **and** every spent one-off. Same method,
applied to different depths. They cost zero tokens either way — the cost is that a
180-line list cannot be audited, which is what Phase 3 exists to make possible.

**Structure — the two projects settled differently, and both are defensible.**

| | Voice-Flow | FinNode |
|---|---|---|
| `CLAUDE.md` | 1,573 words | 2,118 words |
| Rules live in | `docs/working-rules.md` + `docs/known-pitfalls.md` | `CLAUDE.md`, measured as already 62% claim |
| Docs index | `docs/README.md` | root `README.md` |
| Skills | 3, tracked in git | 3, tracked in git |
| `CLAUDE.md` in git | no — gitignored | **yes**, per the 2026-09-20 reversal |

**Nothing needs copying between them.** The rules-ledger split earned its place in
Voice-Flow because its rules sections were narrative; FinNode's were not, and
measuring said so. The one thing that *should* match and does not is where
`CLAUDE.md` lives, and that is now a deliberate asymmetry: Amit reversed the rule,
Voice-Flow was left as it is, and re-tracking its three files is a small separate
action if symmetry is ever wanted.

**Fixed here, because it was actively wrong.** The `claude-md-not-in-git` memory
still instructed the old behaviour in both its body and its `description` — and
`description` is what surfaces during recall, so the next session would have read
"untrack it, don't wait to be asked". Marked **SUPERSEDED**, pointed at
`STANDARDS.md` § *Git*, evidence kept, index line rewritten.

### Carried to the projects they belong to

Found while cross-checking Voice-Flow, deliberately **not** fixed out of order:

- `Bash(python3 -c ' *)` — the same arbitrary-code hole — is now open **only in
  Voice Flow_v1**, which is dropped from the review by Amit's decision. ~~FinNode~~
  closed 2026-09-20 and ~~**Debugger v2**~~ on 2026-09-20, both along with
  `Bash(python3 -)`, the stdin form of the same hole.
- ~~**FinNode** still holds `git -c user.name=Amit … commit -q -m ' *` as an allow.~~
  Removed 2026-09-20. It was already dead by rule-type precedence; it went because a
  dead allow that reads as live misleads whoever opens the file next.
- The 68 `allow` rules inside `node_modules` (60 when re-counted 2026-09-21) — see the counts note at the top and
  Phase 9.

### FinNode  ·  **DONE 2026-09-20**

Backup: `backups/2026-09-20-finnode/` — 18 files, all verified byte-identical with
`cmp`. Committed in FinNode as `725ca2e`.

**Per-turn cost in this project: ~7,363 → ~6,966 tokens** (−396). A 5% cut, against
Voice-Flow's 40% — and that difference is the finding, not a disappointment.

**Stated honestly, the pass also spent.** The `STANDARDS.md` and `RTK.md` edits grew
the global files by 83 words / ~110 tokens, and those are paid **in every project**.
So FinNode is −396 a turn and the other seven are **+110 each**. The net is only
favourable because FinNode is where the work continues; recorded so the global pass
starts from the true number.

| | Before | After |
|---|---|---|
| `CLAUDE.md` | 2,501 words / ~3,302 tokens | **2,118 words / ~2,797 tokens** |
| `allow` rules | 25 | **13** |
| Skills | 0 | **3** |
| Memories marked | 0 | **2** |

**The method correction, which is what this pass is worth remembering for.** The
Voice-Flow pass ended by inventing a shape — *claim in `CLAUDE.md`, evidence in
`docs/`, a skill to reopen it* — and the obvious move was to apply it to FinNode's
`Hard rules`, the largest section at 949 words. Measured bullet by bullet first,
they are **591 words of claim against 358 of evidence**: already 62% claim, with
nothing like Voice-Flow's two never-split narrative sections. Splitting them would
have bought ~470 tokens in exchange for hiding the "why" on the twenty-five rules
this project's defects actually produced. **They were left whole.**

The real duplication was elsewhere and smaller: two sections, 763 words, restating
things that already existed — `STANDARDS.md` and `docs/ROADMAP.md`. That is the
whole saving. *The generalisation from one project is a hypothesis, not a method.*

**What was done.**

- **Permissions, 25 → 13.** Two arbitrary-code holes closed — `python3 -c ' *` and
  `python3 -`, neither covered by any global rule. `rtk brew *` removed: the global
  `ask` list covers `npm`, `pnpm` and `gem` installs and **has no brew rule at all**,
  so brew installed unprompted here. The dead `git -c user.name=… commit` allow
  removed. Eight spent one-offs removed, including an `ln -sfn` that wrote a symlink
  into `/opt/homebrew`. Verified against the backup: 0 added, `ask`/`deny`/
  `additionalDirectories` byte-identical, both files still valid JSON.
- **`CLAUDE.md` 2,501 → 2,118 words.** *How to work on this project* (433 → 211)
  restated four `STANDARDS.md` sections; it now points at them and keeps only the
  FinNode evidence — the per-phase defect counts, the `DiaryDao`/`ReminderDao`/
  `last4Digits` precedent, the BACKLOG routing, "is this required to use the app
  daily?". *Current state* (340 → 179) duplicated `docs/ROADMAP.md`, which the file
  already says to read first. **All 25 hard rules untouched**, verified by count
  before and after.
- **One fact was kept because the cross-check said it wasn't duplicated.** Every
  claim removed from *Current state* was confirmed present in `ROADMAP.md` first —
  the 2d-i numbers, the P95, the test counts, all there. The exception: *why*
  READ_SMS and the notification listener stay undeclared until Phase 3 exists
  nowhere else, so it stayed in `CLAUDE.md`.
- **3 skills**, in `.claude/skills/`: `device-walk` (the gate a change passes
  before it is called done — the four Gradle tasks, `audit.sh`, the propagation
  suite, a real device run), `money-math` (`Long` paise, direction in
  `TransactionType`, only `MoneyMath` derives a figure — the rule broken more often
  than any other here), `live-data` (`observeById` vs `getById`, no snapshots, the
  guard that counts soft-deleted rows).
- **`STANDARDS.md` § *Git* rewritten** — see the decision below. **`RTK.md` +1
  section**, the `--dry-run` gotcha as a two-line claim. **2 memories marked**, 0
  lines deleted.

### FinNode — the decision that reversed an earlier one

**`CLAUDE.md` and `.claude/settings.json` stay tracked in FinNode's git**, and
Amit's view is that untracking Voice-Flow's was the mistake, not the model. The
reasoning he gave: he may switch Claude accounts and wants the project repos
self-contained.

Two facts were put to him before he decided, and they did not change his answer:
`~/.claude/project-rules/` already mirrors every project's `CLAUDE.md` and both
settings files, inside a private GitHub repo — and **switching a Claude account
does not touch GitHub**, where these repos actually live. So nothing was ever at
risk. It is a preference about where files live, not a recovery problem.

`STANDARDS.md` § *Git* was rewritten to match, narrowly: keep them tracked while a
repo is private and solo, and **raise taking them out before it goes public** —
raise it, never do it silently. Amended immediately rather than deferred to the
global pass, because a global rule that is actively wrong causes work in every
session until it is fixed; that is different from deciding early what is universal.

**Voice-Flow is not being reverted** and was not touched. If symmetry is wanted,
re-tracking its three files is a small separate action.

### FinNode — what the cross-check found

- **A dead link in work I had just written.** The three new skills referenced
  `../../docs/SETUP.md`. A skill lives at `.claude/skills/<name>/SKILL.md`, so
  `../../` resolves to `.claude/`, not the project root. Caught by resolving every
  link with `[ -e ]` rather than reading them; fixed to `../../../docs/`. Every
  cited source path and the three `TransactionDao.kt` line numbers were then checked
  against the file. **This is the second pass running where the cross-check found an
  error in work already written — it is not optional.**
- **A pending change nobody had committed.** FinNode's `.claude/settings.json` held
  the 18 Sep cleanup unstaged on `main`, so any `git add -A` in FinNode would have
  swept setup-review work into a project commit. Folded into `725ca2e`.
- **`rtk-proxy-suppresses-dry-run-output` is correct, and the note calling it
  possibly stale is withdrawn** — see *Findings not acted on* #2.

### FinNode — follow-ups done 2026-09-20, after the cross-check

- **`docs/ROADMAP.md` split, 100 KB → 61 KB.** Phases 1a, 0, 1b and 1c — complete and
  device-verified — moved **verbatim** into `docs/ROADMAP-HISTORY.md` (39 KB). Phase 2
  stays whole in the roadmap, completed checkpoints included, because 2d-ii-a needs
  2d-i's numbers beside it. Verified two ways: the moved text is byte-identical to the
  range it came from, and what stayed equals the original minus that range. Only the
  47-word pointer was added. One inbound link repointed (`docs/Design/README.md`);
  `#checkpoints` and the live-data anchor both sit inside Phase 2 and were unaffected.
  `README.md` gained an index row.
- **FinNode's `settings.local.json` deleted** — it held `allow: []` after the pass. Its
  mirror under `project-rules/` went with it; `sync.sh` reports 17 current, 0 stale.
- **Four malformed status-table rows fixed** in this file — they did not terminate with a
  pipe and rendered broken. Pre-existing; confirmed identical in the backup.
- **`STANDARDS.md` § *Stay on the task you were given* bounded.** The "noting, not acting
  on" list is now explicitly observations, not a menu of work — no suggested tasks, no
  "worth checking", no extra verification of what was just built, and another project's
  issues wait for that project's turn. Amit's instruction, given twice; the second time
  because a cross-check report ended with a list of proposed work rather than findings.

### FinNode — open, not acted on

- **`git stash`, `git restore`, `git tag` and `git remote` are on no `ask` rule**,
  global or project. `restore` and `stash` can discard working-tree changes. Global
  `ask` does cover commit, push, reset, clean, checkout, rebase, merge, rm and mv.
  For the global pass.
- **There is no `brew` rule anywhere in the global `ask` list**, though `npm`,
  `pnpm` and `gem` installs are all covered. Removing `rtk brew *` closes it in
  FinNode only. For the global pass.
- **Mirror drift, found 2026-09-29.** `project-rules/drift.sh` reports FinNode's
  `.claude/settings.local.json` as DRIFTED from the copy in this repo. Not opened, not
  investigated and not pulled: the Voice-Flow mirror update that surfaced it was done as a
  single-file copy precisely so `sync.sh --pull` would not sweep this in unreviewed. Needs
  its own review. (Resolved 09-10-2026: the `rtk proxy *` rule was removed in FinNode's
  own session, then `drift.sh` showed 0 drifted — open test 4. Noted 10-10-2026.)

> **Re-checked 2026-09-27 — the handoff was dropped, and the finding was partly
> overstated.** Phase 11 closed as COMPLETE without either item, and re-measured against
> the live `ask` list on 2026-09-27 all five commands still matched no rule. Three need
> none: plain `git stash` is recoverable and is prescribed by `STANDARDS.md` § *Git*,
> `git tag -d` removes a label recreatable from its commit, and `git remote set-url` is
> fronted by `git push`, which already asks. `git tag` and `git remote` are left alone at
> Amit's direction.
>
> **Measured before adding.** Replayed against 6,662 historical Bash calls in 72 sessions,
> the proposed patterns would newly prompt on 5 — three real `brew install` runs and two
> commands that merely quote the patterns — 0.069 per session. `git restore`,
> `git stash drop` and `git stash clear` have never been run here at all.
>
> **Added 2026-09-27**, seven entries, `ask` 51 → 58: `*git restore*`, `*git stash drop*`,
> `*git stash clear*`, `*brew install*`, `*brew uninstall*`, `*brew upgrade*`,
> `*brew reinstall*`. Verified as additions only — `allow` (33) and `deny` (2) byte-identical,
> every other setting unchanged, the file re-parses as valid JSON, and a 35-command corpus
> matched all 15 that must prompt and none of the 20 that must not. **Not runtime-proven:**
> no probe was run, by instruction, so these rest on the offline coverage check as `sudo`
> and `curl` do.
- **`project-rules/manifest.tsv` and `sync.sh` both say the mirrored files are
  "gitignored in the project"**, which stopped being true for FinNode today. The
  comments are stale, not the mechanism — drift detection was proven live again this
  pass (3 drifted, then 0).
- **FinNode's `docs/ROADMAP.md` is 100 KB** and `CLAUDE.md` says to read it before
  starting work. It costs nothing per turn, but it is a large document to open on
  every task and may deserve the same claim/evidence split one day.


---

### vthrudebugger_v1  ·  **DONE 2026-09-20**

Backup: `backups/2026-09-20-vthrudebugger/` — 6 files, all five live files verified
byte-identical with `cmp`, plus one historical memory an earlier session had preserved.

**The headline is that the `CLAUDE.md` was left alone, and that was the right call.**
Measured at **1,087 words / ~1,435 tokens**, it is claim-only throughout — no evidence
inline, no war stories. Per-turn cost in this project is ~4,701 tokens, already cheaper
than Voice-Flow *after* its pass (6,003) and FinNode *after* its (6,966). This is the
FinNode lesson holding a second time: measure before proposing, because the fix that
worked elsewhere had nothing to do here.

| | Before | After |
|---|---|---|
| `CLAUDE.md` | 1,087 words | **unchanged — nothing to trim** |
| `allow` rules | 39 | **19** |

**Permissions: 26 removed, 7 narrow ones added.**

- **7 exact duplicates of global allow** — `rtk --version`, `rtk gain *`, `rtk ls *`,
  `rtk grep *`, `rtk df *`, `rtk wc *`, `rtk ps *`. Zero behavioural effect; removed
  because noise makes the real rules harder to see.
- **2 dead on arrival** — `git commit *` and `git commit -m ' *`, both already
  overridden by the global `ask` list on rule-type precedence.
- **10 Xcode/CocoaPods rules with nothing to run against** — `xcrun simctl *`,
  `xcodebuild *`, `ruby`, `gem`, `pod`, `xcode-select -p`. There is no `ios/` or
  `android/` folder in this repo; it is a `tsc`-built library. Spent session residue.
- **2 spent one-off literals** — `echo "exit: $?"` and an `osascript` one-liner
  checking whether Simulator was running.
- **5 over-broad, replaced by 7 narrow** — `rtk proxy *` → `rtk proxy cmp *`;
  `rtk npx *` → `rtk npx vitest *`; `rtk npm *` → the four scripts that exist;
  `rtk git *` → `rtk git add *`; `rtk gh *` → removed outright. `rtk proxy *` was one
  of the 18 arbitrary-code rules Phase 9 named, and `rtk npm *` allowed `npm publish`
  to GitHub Packages, which cannot be taken back.

Verified against the backup: `ask` and `deny` absent before and after, no other key
touched, still valid JSON.

**Phase 8 step 1 is finished here.** The last two trapped universal rules were promoted
from `vthru_debugger_workflow_preferences` into `STANDARDS.md` § *Git* — *never commit
or push without being asked*, and *one PR per feature on its own branch off `main`*.
Additions only, 0 lines deleted, verified by `diff`.

The memory keeps its body and dated evidence, with a **pointer line at the top** naming
the three governing `STANDARDS.md` sections — the method Voice-Flow's pass established.
Its dangling `[[vthru-debugger-plan]]` link, which pointed at a memory that has never
existed, now points at the repo's `PLAN.md`.

**Deliberately not done:** the stash-and-branch technique (the fifth rule in that
memory) was *not* promoted. It is arguably universal but was never approved as such, so
it stays project-scoped. `CLAUDE.md` is **untracked** in this repo and was left that
way — `STANDARDS.md` § *Git* says it should be in the repo, but the tree is parked
mid-feature on `alert-swipe-to-dismiss` with 9 uncommitted files and adding it would
land in Amit's branch. Both are open, not closed.

**Not verified:** that the tightened rules actually prompt. This session had prompts
disabled, the same gap already recorded for the 20 unproven `ask` rules.

### Debugger v2  ·  **DONE 2026-09-20**

Backup: `backups/2026-09-20-debugger-v2/` — 5 files, all verified byte-identical.

A flat repo — sources at the root, no `src/` — and its permission file is
`.claude/settings.json`, not `settings.local.json` like the others. Clean tree, on
`main`.

| | Before | After |
|---|---|---|
| `CLAUDE.md` | none | **still none — offered, declined** |
| `allow` rules | 17 | **9** |

**Permissions: 13 removed, 4 narrow ones added.**

- **4 exact duplicates of global** — `rtk wc *`, `rtk ls *`, `rtk du *`, `rtk grep *`.
- **1 dead rule** — the pinned `tsc` path under `VS Code/Debugger/node_modules/`. That
  folder does not exist; only `Debugger v2` does. Confirmed dead by `ls`, as Phase 10's
  survey had predicted.
- **3 spent one-off literals** — `echo "IDENTICAL — exit $?"`, a `sed -e` expression
  and `sort -u -t: -k3`.
- **5 over-broad, replaced by 4 narrow** — `rtk proxy *` → `rtk proxy cmp *`;
  **`python3 -c ' *` and `python3 -` removed outright**, closing both arbitrary-code
  holes this project was carrying; `rtk npm *` → `rtk npm run typecheck *` and
  `rtk npm test *`; `rtk git *` → `rtk git add *`.

Verified against the backup: `ask`/`deny` absent before and after, no other key touched,
valid JSON.

**`CLAUDE.md` was offered and declined.** The project's three memories already carry the
real rules — the overlay UI is frozen, the broken imports in `DebugProvider.tsx` are
intentional, and its internal design choices are not to be refactored. A session only
sees those if it recalls them; a `CLAUDE.md` would state them every turn. Amit's call to
leave it.

**Resolved 2026-09-27.** On 2026-09-20 Amit said Debugger v2 is "similar, a copy of
vthrudebugger". The project's own memory `project-debugger-repo-fresh-start`, saved
2026-08-03, reads the opposite way in as many words: *"Fresh start, unrelated to
`vthrudebugger_v1` … deliberately out of scope: don't copy from it or cite it as prior
art."* Both describe different things and both hold: the two trees were seeded from the
same file — V-Thru's `DebugProvider.tsx` — and then kept deliberately independent, so
neither is the other's successor. **Amit is working on `vthrudebugger_v1`; Debugger v2
is parked** — his decision on 2026-09-27, not a comparison of the two trees. Which tree
is furthest ahead is still unknown and was not investigated. None of this affected the
permission work.

**Not verified:** that the tightened rules prompt — same gap as every other pass.

### Emp portal  ·  **DONE 2026-09-20**

Backup: `backups/2026-09-20-emp-portal/` — 4 files, all verified byte-identical.
**Real employee records**, so nothing outside `CLAUDE.md` and `.claude/` was opened;
`server/data/vthru.db` was never read.

| | Before | After |
|---|---|---|
| `CLAUDE.md` | 1,178 words | **unchanged — nothing to trim** |
| `allow` rules | 11 (3 + 8, across two files) | **6** |

**Nothing was promoted to global, and that is the finding.** All 8 of its must-follow
rules are app-specific — cookie/session auth rather than tokens, every mutation through
`lib/api.ts` for the `X-Requested-With` header, `org_id` filtering for tenant isolation,
`ensureColumn()` instead of migrations. None generalises. The third lean `CLAUDE.md` in
a row, after `vthrudebugger_v1`; the trimming problem really was confined to Voice-Flow
and FinNode.

**Permissions: 5 removed, 2 over-broad replaced by 2 narrow.**

- **3 copies of global allow** — `rtk grep *`, `rtk ls *`, `rtk wc *`.
- **2 redundant `lsof` spellings** — ports 4000 and 5173 were each written twice, as
  `-i :PORT -sTCP:LISTEN` and `-iTCP:PORT -sTCP:LISTEN -n -P`. The explicit form kept.
- **`rtk git *` → `rtk git add *`** and **`rtk npm *` → `rtk npm run *`**, which keeps
  every script in `package.json` working while leaving `npm install`/`publish` to the
  global `ask` list.

`launch.json` was not touched, verified byte-identical afterwards. **No arbitrary-code
rule was found here** — the only project of the five where there was none.

**Closed 2026-09-21:** the 5.7 `.gitignore` change was committed as `53c4aba` on branch
`fix/dead-code-cleanup-and-test-fix` and pushed, and a second line ignoring
`.claude/settings.json` followed as `4a5a263`. It adds one line, `CLAUDE.md`, which stops git
storing this project's rules file. Verified 2026-09-20 that `CLAUDE.md` is **not
tracked** here, so the line does take effect. Note it now **contradicts `STANDARDS.md`
§ *Git***, which says `CLAUDE.md` stays in the repo while it is private and solo —
that section was written after this change was made. Amit's call, not resolved.

### End-of-session cross-check  ·  2026-09-20

Run after the last three passes, at Amit's request. Four results.

1. **Project `allow` rules totalled 285** at that point, counted live by walking every
   `.claude/settings*.json` under `VS Code/` rather than by arithmetic. **After the two
   follow-ups below it is 244**: Voice-Flow 180, `vthrudebugger_v1` 19, FinNode 13,
   `Debugger v2` 9, Voice Flow_v1 9, Packbly_web 8, Emp portal 6. **Phase 9 then took
   it to 221 on 2026-09-21** — Voice-Flow 165, FinNode 8, Packbly_web 5, rest unchanged.
2. **D23 holds.** No project grants access to another, and no `additionalDirectories`
   entry reaches outside its own tree.
3. **A defect introduced this session, found and fixed.** Several rules written during
   the `vthrudebugger_v1` and `Debugger v2` passes ended in a trailing ` *` —
   `Bash(rtk npm test *)`, `Bash(rtk npm run build *)`. If the matcher does not treat
   `*` as matching an empty suffix, then plain `rtk npm test` — the normal way to
   invoke it — would not match, and the project's own test command would prompt. **The
   matcher was not verified**; the rules were made robust instead, replaced by
   `Bash(rtk npm run *)` plus both `Bash(rtk npm test)` and `Bash(rtk npm test *)`.
   `vthrudebugger_v1` 20 → 19, `Debugger v2` 8 → 9. **Worth checking the older passes
   for the same shape** — this was not looked for in Voice-Flow or FinNode.
4. **A miss in a pass already marked DONE.** **Voice-Flow still holds
   `Bash(rtk proxy *)` and `Bash(rtk npx *)`** — two of the 18 arbitrary-code rules
   Phase 9 named. Its pass removed 54 rules and did not touch these, and the carry-in
   note only ever tracked `python3 -c` elsewhere, so nothing was watching them.
   **Voice-Flow is an active project.** **Fixed the same day** — see § *Two follow-ups*
   below.

**Not verified, in every pass so far:** that any tightened rule actually prompts. Every
session doing this work has had prompts disabled. Unchanged from the standing note.

### Two follow-ups  ·  2026-09-20, after the cross-check

Both run at Amit's direction, after the cross-check reported them. Neither is a pass —
they are targeted fixes, and the projects keep whatever review status they had.

**Voice Flow_v1 — stripped, 50 → 9 rules.** This reverses the decision to leave the
dropped projects alone; Amit asked for it directly. Backup:
`backups/2026-09-20-voiceflow-v1/`, verified byte-identical before the edit. Removed
**41 rules in six groups**: 4 that run arbitrary code (`rtk proxy *`, `python3 -`,
`python3 -c ' *`, and `osascript -l JavaScript -e ' *`, which can drive any app on the
machine), 4 over-broad (`rtk npm *`, `rtk git *`, `npm run *`, `rtk gh *`), 18 spent
one-off literals, 7 copies of global allow, 7 `WebFetch` domains left from a session
researching Wispr Flow, and 1 already dead by `ask` precedence (`git commit *`).

The 9 kept are the two `/tmp` reads, the npx-cache read, `git add`, `git stash`,
`rtk vitest`, `npm test`, `git remote` and `git ls-remote`. Done by **keeping a named
allow-list and discarding the rest**, rather than by matching 41 removal patterns —
several of the rules contain escaped quotes and regex fragments that would have made
pattern matching the riskier method. Verified against the backup: 41 removed, **0
added**, `ask`/`deny` still absent, no other key touched.

**Voice-Flow — two holes closed, nothing else.** Amit's instruction was "just close
those two holes, leave the rest", so this is *not* a second pass. Backup:
`backups/2026-09-20-voiceflow-holes/` — a **new folder on purpose**, because
`backups/2026-09-20-voiceflow/` is the pre-pass record and overwriting it would destroy
it. `Bash(rtk proxy *)` and `Bash(rtk npx *)` removed; `Bash(rtk npx tsc *)` and
`Bash(rtk npx vitest *)` added in their place, because the project already grants
`npx tsc *` and `npx vitest *` in bare form and the rtk hook rewrites `npx` to
`rtk npx` — without the rtk spellings Amit's own typecheck would have started
prompting. Same access, different spelling; **not** new access. Count unchanged at 141,
`additionalDirectories` untouched, and exactly those two rules removed.

**Voice-Flow's remaining 139 rules were deliberately not touched** and it still wants a
proper pass one day. What was checked and found harmless while looking: `Bash(tccutil)`
is the bare word with no wildcard, so it matches only `tccutil` typed alone, which
prints usage — it was **wrongly reported as dangerous** first time and the correction
belongs here. The three `lsregister -kill` rules rebuild macOS's list of installed apps,
which resets "Open With" menus and nothing else. `codesign --force --deep --sign -` on
the installed app is the one genuinely consequential rule left, since re-signing can
make macOS treat it as a different app and forget its microphone and accessibility
grants. It was left in place by the "leave the rest" instruction.

**Phase 9's headline is now closed.** Its survey found 18 rules that execute arbitrary
code and bypass the entire ask list. **No project holds a broad one any more**, verified
by sweeping every `.claude/settings*.json` under `VS Code/`. Project `allow` rules stood
at **244** then, at **221** after Phase 9 on 2026-09-21, and at **213** after the
2026-09-22 maintenance pass.

## PHASE 11 — The global pass  (COMPLETE — six imported files and the permission list)

**Parked 2026-09-20.** Only `OLLAMA.md` was done, and only because it describes a
local tool that no project pass can have an opinion about. Everything else waits
for § PHASE 10 to finish. **`STANDARDS.md` is last within this phase**, not first:
it is where the universal rules still trapped in `vthrudebugger_v1` must land, and
trimming it beforehand means opening it twice. That mistake was made once already —
see the note in this section.

> **Current state — 2026-10-03: both blockers above are gone.** § PHASE 10 is
> **COMPLETE (2026-09-20, all five projects)**, so nothing is waiting on it. And no
> universal rule is still trapped in `vthrudebugger_v1` — both have been added to
> `STANDARDS.md` § *Git*. The paragraph is kept as the record of why this phase was
> parked and why `STANDARDS.md` was ordered last.

The six files imported by `~/.claude/CLAUDE.md` are loaded **every turn, in every
project**. A word cut here is paid back eight times; a word cut in a project is
paid back once. That ratio is the whole reason this phase exists.

Order reversed 2026-09-20 on Amit's instruction: this runs **now**, and the three
remaining projects are reviewed whenever he next opens them. Each of those needs a
rename first, the rename is his to do, and setup work must not wait on it.

### The method

Same six steps as the project passes, with one difference that matters.

1. **Measure the file section by section before proposing anything.** This is
   FinNode's correction and it is not optional — FinNode's biggest section looked
   exactly like Voice-Flow's problem and measurement said otherwise.
2. **Apply the split test.** A section stays global if it must reach me *before I
   would know to load anything*. It moves to a skill if it is detail I would
   consult only once already engaged on that kind of work.
3. **Show the proposal and the numbers before editing.** Every removal is a
   question, never an inference.
4. **Back up, verified.** Where the file is committed and the tree is clean, git
   *is* the backup — say so rather than making a redundant dated copy.
5. **Move verbatim, prove it verbatim.** Two independent methods, as below.
6. **Re-measure, then record the real figure**, not the estimate.

### Where the weight sits — re-measured 2026-09-20

| File | Words before | Words after |
|---|---|---|
| **`STANDARDS.md`** | **1,621** | **1,600** |
| **`OLLAMA.md`** | **797** | **133** |
| **`PROJECTS.md`** | **376** | **393** |
| **`RTK.md`** | **188** | **140** |
| **`CLAUDE.md`** | **114** | **73** |
| `REPOS.md` | 105 | 105 (left whole) |
| **Total** | **3,201** | **2,444** |
| **~Tokens every turn** | **~4,225** | **~3,226** |

**Two corrections to earlier counts in this file.** The original 3,097 words / 4,089
tokens was wrong by ~42 words. The 2026-09-20 re-measure then recorded `STANDARDS.md` at
1,559; measured again on the same day before the pass, it was **1,621**. Both figures in
this row are now measured, not estimated.

### `OLLAMA.md` — DONE 2026-09-20

**797 → 133 words. ~878 tokens back on every turn, in every project.**

`OLLAMA.md` described `ollama-do`, a script that hands small chores to a local
model. Real and installed — `ollama` at `/usr/local/bin/ollama`, `ollama-do` at
`~/.local/bin/ollama-do`, six models, ~18 GB. But a full instruction manual was
being read before every reply, in every project, for a tool used occasionally.

**What stayed global, and why.** A skill only loads when I decide to reach for it,
so two things could not move:

1. **The trigger** — without it I never know the tool exists, and never load the
   skill.
2. **The hard prohibitions** — secrets, `.env`, credentials, customer and employee
   records, shipped code, code review, anything auth/payment/migration. The failure
   mode is a quick `ollama-do summarize` on an Emp Portal file fired as a shortcut
   without loading anything first. A ban that lives only inside the skill does not
   stop that.

Everything else — the full task list, the reasoning behind each prohibition, the
reporting convention, the facts about this machine — moved to
`~/.claude/skills/ollama/SKILL.md`, which costs nothing until called.

**Verified verbatim, two methods.** `diff` against
`backups/2026-09-20-ollama/OLLAMA.md` (88 lines vs 88, clean), and matching MD5
`d39aa393fd6871b3bb07e78653003fb3` on both. All 7 headings confirmed present.
**Nothing reworded, summarised or dropped.**

**The skill is picked up immediately**, not at next session start — it appeared in
the session's skill list the moment the file was written. The earlier caution in
this file that a hand-written skill might not be reachable until a restart is
wrong, and is corrected here.

### The `.gitignore` hole this pass found

`.gitignore` blocks `skills/` with a stated reason: *account-keyed; regenerate on
login; committing them would carry one account's UUID into another.* True of
`skills/synced/`. **False of a hand-written skill** — it carries no UUID and does
not regenerate, so it would simply be **lost on an account switch**, which is the
one failure this repo exists to prevent. Project skills travel in each project's
own git; a *global* skill had no repo at all.

Fixed by allowing `skills/ollama/SKILL.md` **by name**, matching the file's
block-everything-then-allow design. Proven both directions with `git add
--dry-run`: the skill stages, `skills/synced/` is refused as ignored.

**Note for the account-switch checklist** (§ *Rebuilding on another account*): hand
-written global skills now survive a switch via this repo. Cloud-synced ones still
do not. Each new hand-written global skill must be added to `.gitignore` by name or
it is silently excluded.

### `STANDARDS.md` — DONE 2026-09-20

**1,621 → 1,570 words at the end of the pass; 1,600 after the audit fixes below.**
Measured, not estimated — and far below the ~180 tokens first quoted, because two of the
four changes added words back, and the audit then added 30 more. Net across the whole
sitting: **1,621 → 1,600**, essentially flat.

**The measurement said this was not an `OLLAMA.md`, before anything was cut.** Section by
section: the permission section was 517 words (32%), of which the `tccutil` subsection was
166; everything else runs 48–158 words and is already tight. **Nothing was reworded.**
Every compression candidate — the 300k-context figures, the six-example list in *Build the
smallest thing*, the private-and-solo paragraph in *Git* — measured at 7–18 words each and
put a working rule at risk. All rejected. The honest ceiling was ~7%, not 83%.

**Four changes.**

1. **`tccutil reset` (166 words) moved to Voice-Flow**, into the existing TCC cluster in
   `docs/known-pitfalls.md` — *not* its `CLAUDE.md`, which is a one-line-per-rule index
   the block would not have matched. Voice-Flow is the only project of six that mentions
   macOS privacy, the only one that ever carried a `tccutil` permission rule, and this
   file records exactly one real `tccutil` call ever made. A 36-word rule stays global:
   the *rule* is about explaining a permission request, and only the worked example and
   the re-grant path are Voice-Flow facts. This reverses part of Phase 4, with approval.
2. **The fifth-line `ask` categories were wrong, not merely long.** They named installs,
   downloads, deletions, pushing code, GitHub, `sudo`, Keychain, macOS privacy, `sqlite3`.
   The real list is 107 rules and also covers destructive git (`reset`, `clean`,
   `checkout`, `rebase`, `merge`, `rm`), process kills and `open` — so `git reset --hard`
   got no "Why now" line under the old wording. Fixed at +16 words: a correctness fix that
   costs weight, which is the right trade.
3. **"Stay on the task you were given" now covers investigation.** It banned unrequested
   *fixes*; it did not ban wandering into adjacent *checks*, which costs tokens twice —
   once to run, once to read — and buries the answer.
4. **"Write plainly" promoted to its own section.** The rule already existed twice and
   both were too narrow: scoped to permission prompts inside `STANDARDS.md`, and in a
   per-project memory that cannot travel because **there is no global memory**. Lifted out
   of the permission section so it governs everything. The `keep-explanations-short`
   memory was then deleted, after its buckets-with-counts and two-or-three-questions
   detail was absorbed into the new section.

**Verified verbatim.** The moved example diffed clean once the missing end-of-file newline
was normalised — md5 `95561f01…` on both sides.

**Committed.** `~/.claude` `aa70d4b` on `main`, matching every other setup commit here.
Voice-Flow `ad38b97` on branch `docs/tccutil-explanation`, because § *Git* says nothing
lands on `main` directly. Neither is pushed.

### `RTK.md` — dead pointer fixed 2026-09-20

Its last line read *"Refer to CLAUDE.md for full command reference."* No such reference
exists anywhere: the global `CLAUDE.md` is five `@` imports and two comments, **none** of
the six project `CLAUDE.md` files mention rtk at all, and `ENVIRONMENT.md` § 1 documents
the hook and its permission rules rather than commands. Replaced with `rtk --help`, which
lists all **85** commands on 0.48.0. 188 → 186 words.

**The pass itself followed the same day: 186 → 140 words.**

**Nothing that changes rtk's behaviour was touched.** This file is documentation loaded
into context; it does not configure rtk. The savings come from the `PreToolUse` hook in
`settings.json`, which was not opened — confirmed by the diff. The only risk was
behavioural: removing something that makes Claude *choose* to use rtk. The three things
that do that all stayed — the hook description, `rtk proxy` (which `STANDARDS.md`
§ *Evidence* requires before any delete/move/overwrite decision), and the `--dry-run`
gotcha.

**Cut: `rtk gain`, `rtk gain --history`, `rtk discover` and the three installation-check
commands.** All six are discovery or troubleshooting, and `rtk --help` lists the first
three — verified. The name-collision warning stayed: it is genuinely non-obvious and would
cost an hour if it ever bit.

**The headline number was wrong.** It claimed *"60-90% savings on dev operations"*. Measured
on this machine: **59.9% across 9,491 commands, 7.0M tokens saved**, with the two most-used
wrappers at 22% (`rtk grep`) and 10.5% (`rtk read`). Replaced with the measured figure and
the real 10–98% range.

**Verified after the edit, not assumed.** `rtk hook claude` still rewrites — `git status`
→ `rtk git status`, `grep -rn foo .` → `rtk grep -rn foo .` — and `settings.json` never
appeared in the diff.

**The hook is global and unoverridden.** Checked every project `settings.json` and
`settings.local.json`: none defines hooks, so rtk applies in every project. Two caveats
stand: it only rewrites the 85 commands it wraps, and the one observed non-firing recorded
in § *Findings not acted on* is still unexplained.

### `PROJECTS.md` — DONE 2026-09-20

**376 → 393 words. It got heavier by 17, and that is the honest result** — the estimate
beforehand was ~330. Explaining why SecondBrain schema stays mirrored costs more than the
checkboxes and the stale checkpoint saved. Like `STANDARDS.md`, the return here was
correctness.

**Two wrong facts, both verified against the filesystem before being changed.**

1. **FinNode was stale.** The file said *"Phase 2, checkpoint 2c-i next"*; FinNode's own
   `README.md` lists 2c-i as done and its `CLAUDE.md:174` says **2d-ii-a** is next. The
   checkpoint was removed rather than updated — it went stale within days, and the
   project's own files are the authority. The header now says so explicitly.
2. **SecondBrain schema is not a project.** `~/Documents/SecondBrain Obsidian/schema`
   holds exactly one file — a 229-line `CLAUDE.md` — no code and no git. It is an agent
   brief for an Obsidian vault. Moved to the *Not projects* note. **It stays in
   `project-rules/manifest.tsv` and is still mirrored**, because that mirror exists to
   carry rule files through an account switch and that folder is nothing but a rule file.

**One hedge became a fact.** Packbly v2 was *"likely a design bundle rather than an app"*;
its `package.json` is named `@figma/my-make-file`, so it is a Figma Make export.

**Everything else was verified and left alone.** All 11 paths exist as described, all 7
`CLAUDE.md` claims are right, `~/Documents/Voice-Flow-main` is genuinely gone, and the
"ten stale paths in `~/.claude.json`" claim is exact — 17 entries, 10 dead, matching the
named set. The `[x]`/`[ ]` boxes were dropped as duplicates of the section headings.

### `CLAUDE.md` and `REPOS.md` — DONE 2026-09-20

**`CLAUDE.md` 114 → 73 words. `REPOS.md` 105, left whole on measurement.**

`CLAUDE.md` is five `@` imports — 5 words — and two HTML comments, 109. The comments do two
jobs and both are load-bearing: they name `ENVIRONMENT.md` and `SETUP-PLAN.md` and say when
to read each, and they stop a later session "helpfully" adding them as imports, which would
put two large reference files into every turn. Both jobs kept, said in half the words. The
five imports and both `~/.claude/` paths are untouched, verified after the edit.

**`REPOS.md` was measured and deliberately left whole.** Its job is to surface options that
would otherwise be forgotten, so moving it to a skill defeats it — nothing would ever load
it. It fails the split test in the direction that matters, and 105 words is cheap for that.
One nuance recorded rather than changed: the shadcn entry says *"already used in Voice
Flow"*; Voice-Flow carries the Radix packages shadcn is built on, but has no
`components.json` and never names shadcn itself.

**The six imported files are now done: 3,201 → 2,444 words, ~4,225 → ~3,226 tokens every
turn.** Of that, `OLLAMA.md` alone accounts for 664 words. The five passes on 2026-09-20
moved 2,537 → 2,444, a net 93 words — the return on those was correctness, not weight, and
the records above say so in each case.

### The global permission list — DONE 2026-09-20

**`ask` 107 → 112, `allow` 35 and `deny` 2 unchanged. Nothing was removed.** This list had
already been through 1.2, Phase 3 and the Phase 3 gaps; every rule traced is live. The work
was holes, not weight, and additions only — nothing became more permissive.

**`wget` was unfenced, and had been since 1.2.** The rtk hook rewrites a command *before*
the permission check — which is the whole reason this list carries `rtk ` spellings.
Probed live: `wget …` → `rtk wget …`. `Bash(wget *)` and `Bash(rtk proxy wget *)` existed;
`Bash(rtk wget *)` did not, so the engine never saw a form it could match and downloads ran
without prompting. `curl` had all three and was fine. **Method that found it:** take the 85
commands rtk wraps, intersect with the commands fenced in bare form, subtract those fenced
in `rtk ` form. The answer was exactly one — `wget`.

**Python installers were fenced nowhere.** `gem install`, `npm`, `pnpm`, `yarn` and `npx`
were all fenced; `pip` was not, in any spelling, and it is installed. The hook normalises
`pip3 install …` → `rtk pip install …`, so four spellings were added: `pip install`,
`pip3 install`, `rtk pip install`, `rtk proxy pip install`. **`uv` was deliberately
skipped** — installed, but Amit does not invoke it, and fencing a tool that is never run is
noise.

**Deliberately no rules for** docker, kubectl, oc, aws, cargo, go, bun, deno, psql, prisma,
mvn, gradle. rtk wraps all of them and **none is installed on this machine**, so rules would
be building ahead of need.

**Checked and sound.** `sudo ls` → `sudo rtk ls`, still matched by `Bash(sudo *)`. The only
path-bearing `allow` rule — rtk's tee directory — exists and holds 20 files. `gem`, `kill`,
`killall`, `pkill`, `open`, `rm`, `security`, `sqlite3`, `sudo`, `tccutil`, `ollama` and
`yarn` are fenced bare and rtk does not wrap them, so they need no `rtk ` spelling. Both
`deny` rules stand. The list was sorted before the edit and after it.

**A correction made in the same sitting.** Earlier that day `ENVIRONMENT.md` was updated to
say the 6 `ask` rules beyond Phase 3's recorded 101 were "not accounted for in either
document". They were: the six `git commit` spellings from the Voice-Flow pass, recorded in
the **`ask` rules proven** row above. 101 + 6 = 107. Corrected.

### Still to do in this phase

Nothing. **Phase 11 is complete** — six imported files and the global permission list.

> **Correction, 2026-09-27.** It closed holding two items handed to it — FinNode's pass
> had recorded the `git restore`/`git stash` and `brew` gaps as *"For the global pass"*,
> and neither was added. They were closed separately on 2026-09-27 rather than by
> reopening the phase; see § *FinNode — open, not acted on*.

## Findings not acted on

Listed rather than chased, per `report-findings-dont-chase-them`. Nothing here
is being worked on; they are recorded so they are not lost.

1. **`docs-are-products-not-logs` may apply to this file.** That memory says
   docs should be about the thing, not about their own history, and that
   append-only dated logs are not wanted. This file has a "What I got wrong"
   section and a dated decisions table. Both were asked for explicitly on
   2026-09-18, so they stay — but flagging the tension rather than quietly
   deciding it.
2. **~~`rtk-proxy-suppresses-dry-run-output` may be stale.~~ Withdrawn
   2026-09-20 — the memory is correct.** Re-tested two ways on rtk 0.48.0:
   `rtk git add -A --dry-run` printed **nothing**, and probing the hook directly
   (`echo '{"tool_name":"Bash","tool_input":{"command":"git add -A --dry-run"}}'
   | rtk hook claude`) showed it still rewrites to that form, inside compound
   commands too. The earlier observation was of a **bare** `git add --dry-run`
   that the hook had not rewritten — which is real and still unexplained: in that
   same session the rewrite did not fire for that call. So the rule about rtk
   holds; *whether the hook fires in a given session* was not pinned down, and
   that is the open question, not the memory. The claim now lives in `RTK.md`.
   **Audit switched on 2026-09-20.** `RTK_HOOK_AUDIT=1` added to `settings.json`
   → `env`, so rtk writes one line per hook call to
   `~/.local/share/rtk/hook-audit.log`. It takes effect from the **next** session,
   not the one that set it — `env` is read at start. Chasing it without a
   reproduction was rejected: the failure is benign (the raw command still runs,
   the output is merely bigger) and one instance in 9,491 commands gives nothing
   to work from. If it recurs there will be evidence; if it does not, this closes
   itself. Read with `rtk hook-audit`.
   *Note 01-11-2026 (D45):* the audit is switched **off** again (audit C13); the
   6.7 MB log is kept. Turn it back on for a test by restoring `RTK_HOOK_AUDIT=1`.
3. **~~Two memory folders are duplicates, not just orphans.~~ Closed 2026-09-27 — the
   two orphaned folders are gone.** `Voice-Flow-Pro` and `Debugger-vthrudebugger-v1`
   were confirmed absent by item 5.6 on 2026-09-20 and again on 2026-09-27.
   **`Voice-Flow` itself is live and unaffected** — it is the working folder, not an
   orphan. `projects/` now holds seven folders plus a scratchpad, every one mapping to
   a directory that exists. *The original finding, unchanged:* `Voice-Flow` (11
   files) and `Voice-Flow-Pro` (6) share 4 identical memories.
   `Debugger-vthrudebugger-v1` sits under `/Users/amitjangra/Debugger/`, a path
   that no longer exists.
4. **The `always-recommend-an-option` memory is not being followed in full.** It
   asks for a recommendation *and why not the others*. The "why not" has been
   missing from most option lists in this session.
5. **~~FinNode's `CLAUDE.md` is committed to its repo.~~ Decided 2026-09-20 —
   it stays**, and `STANDARDS.md` § *Git* was rewritten to match rather than the
   project being changed to fit a rule Amit no longer wanted. Tracked while a repo
   is private and solo; raise untracking before it goes public. See § PHASE 10,
   *FinNode — the decision that reversed an earlier one*.
