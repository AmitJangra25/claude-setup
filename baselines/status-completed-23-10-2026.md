# Setup status — Completed log, 11-10-2026 to 23-10-2026 — preserved record

Moved unchanged on 29-10-2026 from `harness/status.md` § *Completed*, the entries dated
11-10-2026 to 23-10-2026, to keep the current status short. Nothing below the rule has
been edited. Current status lives in `harness/status.md`. Inside the copy, "this file"
and section names such as § *Open* mean the original `harness/status.md`.

**Correction, 29-10-2026:** the compact, short and full explanation forms in the
23-10-2026 entry no longer exist. C1 (approved by Amit, 29-10-2026) replaced them with one
full form for risky boxes only — `STANDARDS.md` § *Explaining a permission request*.

---

## Completed

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
  Amit as small and fully specified. Effort and mode untouched; the default model was set to `opus` the same day (`0e47a4f`).
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
  KEEP · 20.7k tokens measured; the optional word ("new script") applied the same day.
- **Simple commands rule** — 23-10-2026, wording approved by Amit. The "Reading and
  searching" paragraph in `STANDARDS.md` § *Reuse what is already there* is now **Simple
  commands**: one simple command per step; Read, `grep` or `jq` instead of `sed -n`,
  `python3`, heredocs or loops; avoid unnecessary redirects and `cd … &&` chains; prefer
  the plain form of read-only commands. Global; no permission rule, setting, model, effort
  or mode changed. Basis: clicked commands in Voice-Flow (3 sessions), FinNode, Emp Portal
  and `~/.claude` — 681 Bash clicks; 363 began with `cd`, heredocs and loops were far more
  common among clicked than auto-approved commands. Effect not measured: after 2–3
  sessions re-run the same click count across projects and compare. Applied by Sonnet
  (Amit's instruction); independent Opus review returned KEEP (two optional wording points
  not applied).
