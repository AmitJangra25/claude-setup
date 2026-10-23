# Setup status

The one current view of where the `~/.claude` setup stands. Pointers, not copies.
Commits, branches, push state and file counts are never recorded here — read them from
git. Updated by every changing setup plan (`.claude/CLAUDE.md`).

**Last verified:** 12-10-2026

## Current phase

**Finish plan, approved 09-10-2026.** T1 open-item review + T2 token baseline →
project checkups in each project's own session (FinNode, Voice-Flow, Emp-Portal), with
T0 — remove `rtk proxy *` — in the first two → T3 drift warning →
T4 Check 2 + about 5 sample `ask` probes → T5 `harness/overview.md` and what "finished"
means → T6 cleanup: sort → update → surgical cleanup, then an independent read-only
check and Amit's review. Reference docs are archived, never deleted. Account switch
(open test 6) deferred until Amit asks. P1B finished 08-10-2026. T1–T5 and the three
project checkups are done; T6 is closed, reviewed and committed (Amit, 11-10-2026).

## Completed

Entries up to and including T6 moved unchanged to
`baselines/status-completed-11-10-2026.md` (11-10-2026), to keep this file to the
current state.

- **Token-saving changes** — 11-10-2026, approved by Amit. Status-line thresholds
  lowered to 200K/300K/400K in `statusline/context.py` and `ENVIRONMENT.md` § *Status
  line*; this section's log moved to `baselines/` (copy checked with `cmp`), with a naming
  exception added to `baselines/README.md`. `drift.sh` 0 drifted and
  `session-check.sh` silent before and after. Cross-check: none — skipped by Amit's
  decision; no rule, permission or hook changed.
  Also, wording only: D17 in `SETUP-PLAN.md` and two spots in `ENVIRONMENT.md` (`63b8b2c`).
- **Model and permission-denial rules** — 12-10-2026, approved by Amit (D39).
  `STANDARDS.md` § *Which model* and a *When I deny a prompt* paragraph; `settings.json`
  `model` → `sonnet`, `switchModelsOnFlag` → `false`; dated note at `SETUP-PLAN.md`
  § *The five systems*, system 3. Cross-check 12-10-2026 · Opus · change, then go ahead ·
  41.6k tokens measured; all its changes taken. Effort on Sonnet 5.5 not known. `drift.sh`
  and `session-check.sh` before and after: the same 2 Voice-Flow lines (`settings.json`,
  `settings.local.json`), present before this change and not caused by it — to resolve in
  a Voice-Flow session.
- **Claude Setup is a global standard, not a project** — 12-10-2026, approved by Amit.
  `STANDARDS.md` § *Claude Setup* defines it and the read-only, chat-only Claude Setup
  cross-check; `.claude/CLAUDE.md` line 3 reworded (still project mode); memory note
  `claude-setup-is-a-global-standard-not-a-project` and its index line. Cross-check
  12-10-2026 · Opus · change · 30.0k tokens measured; all its changes taken except the
  rename to "Claude Setup check" (Amit kept his term, with a clarifier). Not tested:
  whether a project session can read `~/.claude/templates/`.
- **`STANDARDS.md` slimmed, wording only** — 12-10-2026, approved by Amit (D40). Every rule
  kept at the same strength; 3,161 → about 2,570 words, estimated 5.9k → 4.8k tokens, not
  measured. Old text: `git show f6a4c2c:STANDARDS.md`. Cross-check 12-10-2026 · Opus · rule
  by rule · FAIL narrowly, 4 items restored to old strength · 47.8k tokens measured.
  **Next target (Amit):** break the long D-rows in `SETUP-PLAN.md` into short lines.
- **Token trims after D40** — 12-10-2026, approved by Amit piece by piece. (1) D-table and
  (2) both status tables in `SETUP-PLAN.md` turned into short `###` sections, words
  unchanged — checked word by word against git: 4,102 + 4,240 words, 0 mismatches; one
  table escape (`\|` → `|`, D15) is the only character change (`060a8ba`, `28f3776`).
  A search hit now returns one short line instead of a row of up to ~490 words.
  (3) Global `CLAUDE.md` not-imported comment cut to one line per file, every pointer
  kept (`e7dbe41`). (4) `RTK.md` dated figures — skipped by Amit; `RTK.md` untouched.
  (5) New rule in `STANDARDS.md` § *Load a capability*: never read `SETUP-PLAN.md` or
  `ENVIRONMENT.md` whole; the two "read `ENVIRONMENT.md`" lines now say "the relevant
  section". Cross-check 12-10-2026 · Sonnet · pieces 3 and 5 · 2 pointer restorations
  taken, the section wording taken · 21.7k tokens measured. Token savings estimated, not
  measured.
- **Model wording, compact explanation form, global fences** — 23-10-2026, approved by Amit.
  `STANDARDS.md` § *Which model*: quality-first, Opus from the start where difficulty or risk
  warrants it, no forced Sonnet trial, reassess when a model struggles, helper model named in
  one line, other models optional. § *Explaining a permission request*: compact form (named
  reliable undo, no rule or settings files, not on an `ask` list); short and full forms kept.
  `settings.json` `ask` 58 → 90, none removed: git `cherry-pick`, `revert`, `filter-*`,
  `update-ref`, `reflog`, `tag -d|-f`, `remote add|set-url` (two patterns each), `npm publish`,
  `ssh`/`scp`/`rsync`. `ENVIRONMENT.md` § 3 count and fence note corrected. Broad
  `Bash(rtk git *)` removed from Voice-Flow, FinNode and Packbly local/project settings and
  `Bash(rtk proxy *)` from Voice-Flow; two exact `npm run doctor:vault` allows added in
  Voice-Flow after its code was read and found read-only (reads the vault, writes nothing).
  **One-time exception:** the `STANDARDS.md` edits ran on Sonnet 5.5, not Opus — approved by
  Amit as small and fully specified. Saved default model, effort and mode untouched.
  Cross-check 23-10-2026 · Opus · CHANGE · 35.1k tokens measured; its findings taken.
  Re-verification the same day · Opus · KEEP · 39.4k tokens measured; five minor notes
  not acted on.
  **Left open:** permission-box frequency (cause unknown); the token and workflow
  investigation; older git `ask` patterns miss an option before the subcommand
  (`git -C path push`); `git remote remove|rename|set-head` unfenced, `remote -v add`
  untested; Voice-Flow `project-rules/` mirror drifted further, not synced; 9 `ask` rules
  duplicated in Voice-Flow `settings.json`; `git add` may now prompt in FinNode and Packbly
  (hook rewrites it to `rtk git add`).
- **Reading and searching rule** — 23-10-2026, approved by Amit. One paragraph added to
  `STANDARDS.md` § *Reuse what is already there*: read part of a file with Read and a line
  range plus context, not `sed -n`; use `grep`, `jq` or Read before a `python3` script.
  Applied by a fresh Opus helper (19.2k tokens measured), exactly as approved; no permission
  rule changed. Basis: Voice-Flow, three sessions — 50 `sed -n` and 56 `python3` of 324
  clicked commands; FinNode and Emp Portal samples too small to add. Effect on prompts not
  measured: compare click shapes after the next two or three sessions. Cross-check · Opus ·
  KEEP · 20.7k tokens measured; one optional word ("new script") not applied.

## Open

- **Setup tests** — `baselines/global-open-tests.md` owns the list. Not repeated here.
- **Rejected 10-10-2026 (Amit, T6): a per-project `SessionStart` check** comparing a
  project's settings with its mirror copy. It would have a project session reach into
  `~/.claude`, which D23 and D31 avoid; the setup-session check already catches drift at
  the next setup session. Revisit if drift is found to have gone unnoticed in between.

## Blocked

None.

## Known contradictions

None. All three settled 10-10-2026 (T6): `PROJECTS.md`'s progress wording fixed; D23
reworded by **D38**; `SETUP-PLAN.md` § *Standing context* given a dated correction. The
original entries are in `baselines/t6-removals.md` entry 6.

## Decisions in force

D33 (this harness) and the D-rows in `SETUP-PLAN.md`; the rules in `STANDARDS.md`.

## Next gate

**Now:** nothing in progress — the finish plan is done. The setup is finished when every
line of `harness/overview.md` § *What "finished" means* is true. Deferred until Amit asks:
the account switch (open test 6) and open test 3's replay (Amit, 09-10-2026).

## Source of truth

| Question | Owner |
|---|---|
| Global rules | `STANDARDS.md` |
| Setup-only rules | `.claude/CLAUDE.md` |
| Current setup status | this file |
| The task in progress — scope, progress, next step; never setup status | `.claude/current-task.md` (gitignored; *Status: none* between tasks) |
| Decisions and history | `SETUP-PLAN.md` |
| Setup tests | `baselines/global-open-tests.md` |
| Machine facts, measurement method | `ENVIRONMENT.md` |
| Cross-check procedure | `harness/cross-check.md` |
| Project status and tests | the project's own files, read in its own session |
| Git and recovery | git; `archive/README.md`; `SETUP-PLAN.md` § *Rebuilding on another account* |
