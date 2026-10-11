# Setup status — Completed log, 03-10-2026 to 11-10-2026 — preserved record

Moved unchanged on 11-10-2026 from `harness/status.md` § *Completed*, everything from
that heading to the line before § *Open*, to keep the current status short. Nothing below
the rule has been edited. Current status lives in `harness/status.md`. Inside the copy,
"this file" and section names such as § *Open* mean the original `harness/status.md`.

---

## Completed

- The read-only setup audit and the Part 2 cleanup review, 03-10-2026.
- Parts 1, 2A, 2B — the small-change path and permission forms, stale-status
  corrections, backup cleanup and the open-tests index.
- **P1A** — harness control desk (D33). Built, reviewed, approved by Amit and committed
  08-10-2026. Cross-check 08-10-2026 · Opus · final diff in scope · 2 fixed (D33 reason,
  a step-4 contradiction) · 33.4k tokens measured. Before the commit: Opus diff review,
  Amit's review, `/context all` before and after (setup 22.6k → 22.9k, FinNode 28.4k →
  28.6k, measured), setup-only load test passed.
- **P1B-1** — reviewed by Amit and committed 08-10-2026. Done after the cold Orient gate
  passed; Amit's approval of P1B-1 in direction, 08-10-2026, replaced the earlier
  requirement for two P1A setup sessions first, and the cold Orient gate sessions do not
  count as P1A usage. The history in
  `.claude/current-task.md` is copied unchanged to `baselines/03-10-2026.md` (checked
  with `cmp`); the status copies in `SETUP-PLAN.md` § *START HERE* and the
  `claude-setup-status` memory note are retired and now point here; the open-tests
  index points at the tracked copy; D32 records the Part 2B decisions.
  `.claude/current-task.md` was not changed (same SHA-256 before and after).
  Cross-check: none — skipped by Amit's decision, as the approved handoff says.
- **P1B-2** — done 08-10-2026 after its own plan approval. `.claude/current-task.md` is
  now only a live task record
  on the `templates/handoff.md` shape, at *Status: none*. Its history was removed after
  two checks against `baselines/03-10-2026.md` (`cmp` and SHA-256), and every other
  fact in it was first confirmed to have a tracked owner. It stays gitignored (D31).
  Cross-check: none — skipped by Amit's decision.
- **Check 2 runs** — 09-10-2026. The blanket `Bash(rtk proxy *)` allow rule had come
  back; Amit approved removing it again. Check 2 is partly answered — open-tests item 1.
- **Mirror drift run** — 09-10-2026. 2 of 18 files drifted, both the `rtk proxy *`
  allow rule in a project `settings.local.json`; not synced — open-tests items 2 and 4.
  Cross-check: none — read-only run.
- **T1 open-item review** — 09-10-2026. Test 7 closed (the hook rewrote it —
  `hook-audit.log`), test 6 deferred, decisions recorded for tests 3 and 5, the
  `archive/README.md` order fixed, sorted by whether git can recover it — Amit's call,
  09-10-2026. Cross-check: none — reads and doc edits only.
- **T2 token baseline** — 09-10-2026. `rtk gain` 60.9% over 12,104 commands; fresh-session
  `/context all` 22.9k (Opus 5.5, 2.1.295), with memory files 6.8k, of which
  `STANDARDS.md` 5.5k. Both in `ENVIRONMENT.md`. Cross-check: none — measurement and doc
  edits only.
- **FinNode checkup + T0** — 09-10-2026, in FinNode's own session. `Bash(rtk proxy *)`
  removed from `settings.local.json`; `drift.sh` shows FinNode 0 drifted, no sync needed.
  No contradictions with `STANDARDS.md`. Deferred items in FinNode's `docs/BACKLOG.md`
  § *Setup and tooling — deferred*. Uncommitted there, by design.
- **Voice-Flow checkup + T0** — 09-10-2026, in Voice-Flow's own session. `Bash(rtk proxy *)`
  removed from `settings.local.json`; broad `settings.json` allows narrowed (`rtk git *`
  → four read/add forms, `rtk gh *` removed, `rtk npm *` → `rtk npm run *`); mirror
  pulled with `sync.sh --pull`, `drift.sh` 0 drifted. Then the dead
  `screencapture … __TRACKED_VAR__` rule removed from `settings.local.json`, pulled the
  same way. Core rules: `CLAUDE.md` and `settings.json` are gitignored there, against
  `STANDARDS.md` § *Git*; logged as a decision in its backlog. Deferred items in
  Voice-Flow's `docs/backlog.md`. Uncommitted there, by design.
- **Emp-Portal checkup** — 09-10-2026, in its own session; rules, config and structure
  only, no data files opened. No `rtk proxy *` there. `settings.json`: `rtk lint *`,
  `rtk git add *` and `rtk npm run *` replaced by six exact lint/typecheck/test commands;
  builds and `git add` are no longer allowed. Mirror pulled with `sync.sh --pull`,
  `drift.sh` 0 drifted. No backlog entry. Structure and core-rules results were not in
  the session's summary.
  Cross-check of all three checkup records: 09-10-2026 · Opus · 5-file set correct,
  3 overstatements fixed, 2 stale sentences fixed · 35.5k tokens measured.
- **T3 drift warning** — 09-10-2026. `harness/session-check.sh`, run by a `SessionStart`
  hook in `.claude/settings.json`, so only sessions started in `~/.claude`. Runs
  `drift.sh` and searches this repo's settings and every mirror copy for
  `Bash(rtk proxy *)` or `:*`; prints nothing when clean, warns and changes nothing
  otherwise. `.claude/CLAUDE.md` makes Claude raise a warning first. Verified: search
  line on test files, silent at 0 drift, warning on a deliberate break (then undone,
  `drift.sh` 0); fresh sessions — warning raised first with drift, silent at 0, no
  check in FinNode (Amit). Cross-check 09-10-2026 · Opus · 1 blocking (script was
  gitignored) + 4 changes, all taken · 33.0k tokens measured.
- **T4 permission-mode runs** — 09-10-2026. 17 runs across manual, accept edits and auto
  (Shift+Tab, no settings change), three of them void — two mistaken Yes clicks, re-run,
  and one in the wrong mode. Five never-probed `ask` rules (`rm`, `sudo`, `curl`,
  `git rebase`, `kill`) all stopped auto mode and named their rule. Unmatched commands:
  manual and accept edits prompt, auto lets them through; one discrepancy with the
  morning run remains; Amit decided it does not trigger open test 3's replay. The
  "don't ask again" option on an unmatched `rtk proxy` command offers `rtk proxy *`. Detail:
  `baselines/09-10-2026-run2.md`; open tests 1, 3, 5. Cross-check: none — harmless
  commands and doc edits only.
- **T5 overview** — 10-10-2026. `harness/overview.md`: how the pieces fit in a session,
  and what "finished" means (D34, superseding only D33's rejection of `overview.md`).
  Open tests: item 2's stale test line replaced with the T4 result, item 1 trimmed to a
  pointer, item 8 decided (deferred with test 3's replay). `README.md` harness row now
  names `overview.md` and `session-check.sh`. Cross-check 10-10-2026 · Opus · 5 changes,
  all taken · 46.9k tokens measured.
- **T6 audit and cleanup** — 10–11-10-2026, batches 0–9, plan approved by Amit 10-10-2026.
  Every change and its original text: `baselines/t6-removals.md`. Settings: fixes A and B
  (D35), four `ask` rules in `.claude/settings.json` (D36), tested live; fix D dropped.
  `.gitignore` G1–G4 (D37). D23 reworded (D38). Open tests 1 closed, 2 accepted, 11 added
  and closed, 12 added and deferred (Amit, 11-10-2026). The per-project `SessionStart` idea
  rejected (§ *Open*); § *Known contradictions* emptied. Hooks and scripts all working, no
  fix. Wording, dated-note and pointer fixes in `CLAUDE.md`, `PROJECTS.md`, `STANDARDS.md`
  (one sentence), `README.md`, `skills/ollama/SKILL.md`, `ENVIRONMENT.md` (the git-state
  loop's one home, § *Branch state* — Amit), `SETUP-PLAN.md` (31: 30 in batch 7, the D32 note in batch 9), and the harness,
  baselines and project-rules docs. Found: Opus 5.5 ignores the user-settings
  `effortLevel` (docs, quoted) — Amit sets effort with `/effort`; old keys left.
  Cross-checks, Opus unless named, measured:
  - Plan, 10-10-2026 · two runs: kept with 7 changes, all taken · 33.3k; at Amit's
    request, 1 wrong fact and 8 missed items, all taken · 63.3k — that agent wrote one
    scratch file against its brief, since deleted.
  - C2, 10-10-2026 · keep, with doc changes, all taken · 26.5k. Docs lookup · model not
    recorded · read-only, docs sites only · 45.5k, from search summaries, not quotes.
  - Batch 2 · self-check only (Amit agreed). Batch 4 · records and wording only, no agent.
    Batch 8 · level 1, no agent.
  - `.gitignore` G1–G4, 10-10-2026 · keep all four · 33.0k.
  - F2, 10-10-2026 · Sonnet · one word added · 19.5k.
  - Batch 6 items 13–14, 10-10-2026 · keep both, one rewording taken · 33.5k.
  - Batch 7 S1 and Q1, 10-10-2026 · S1 keep with one rewording, Q1 changed (three more
    misses named), all taken · 44.0k. Full re-check at Amit's request · 2 wrong notes and
    5 tightenings, all fixed · 74.7k.
  - Batch 9 draft of this entry and the full T6 diff, 11-10-2026 · change: 4 draft fixes,
    3 log gaps (C2 originals, open test 8, item 14) and D37's headline, all taken · 96.7k.
  - Final full-diff check, 11-10-2026 · keep, 4 small fixes, all taken · 75.3k.
  `/context all`, fresh setup session, Claude Code 2.1.296: 23.1k at the start, 23k at the
  finish (11-10-2026). The baseline moved 22.9k → 23k (Amit, 11-10-2026): the 0.1k is
  Claude Code's system tools, not this setup's files (`ENVIRONMENT.md`). `/hooks` in the
  same session listed both hooks (`PreToolUse` rtk, `SessionStart` `session-check.sh`), and
  the session started with no drift warning.
