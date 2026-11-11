# Setup task history — 11-11-2026

Purpose: The setup task file as it stood before T15 — handoffs and task records from 31-10-2026 to 11-11-2026, including the rest-of-wave-3 plan approved 06-11-2026 (frozen snapshot; live status in `harness/backlog.md`).
Date: 11-11-2026
Status: record
From: `.claude/current-task.md` (git-ignored), whole file, before the T15 reshape. Below the line: the file word for word. Inside it, "this file" means the old task file.

---

# Handoff / current task — claude-setup · 01-11-2026

> **Current task (11-11-2026): documentation structure — Pass 2A committed (`4f468e6`); next: build Pass 2B from `harness/doc-structure-plan.md` § *Pass 2B plan*.**
> Goal, success measure, all 9 phases, 34 tasks and formats: `harness/doc-structure-plan.md` — read it first.
> Everything below this note is older work, not the current task; sorting it is T15 (Phase 2).

Live task record for the `~/.claude` setup repo (D31, `templates/handoff.md`). Gitignored
and untracked: git is not an undo for it.

## Handoff — Sessions 1 and 2 (pre-wave 2), approved by Amit 06-11-2026 (read this first)

- **Goal (Amit):** do backlog items 16, 20, 17, 10, 13, 8 before wave 2; then wave 2
  (item 4), then the rest of wave 3; monitor everything together afterwards. Same wider
  goal as wave 1: cheaper and safer, surgically, no workaround fixes.
- **The 12-11-2026 wait is dropped (Amit, 06-11-2026):** the 05-11 ccusage run already
  covered a past week (29-10 to 04-11). Limit: that baseline predates wave 1, so later
  token checks show the combined effect, not each change alone.
- **Monitoring:** one combined review 15 days after the last trial starts. Keep item 4's
  weekly checks and FinNode write-block dates (check 20-11, decide 05-12-2026).
- **Plan cross-check (Opus, 56.7k measured, 06-11-2026):** "change" — three fixes taken:
  item 20 narrows allow rules (ask rules only match a flag in first place,
  `ENVIRONMENT.md:308-317`, and wider ones box listings like `--merged`, `--contains`);
  item 17 uses made-up files only; item 16 rule line trialled in FinNode `CLAUDE.md`, not
  `STANDARDS.md`.
- **Session 1 — fresh `~/.claude` session, Opus (~45k):**
  - Item 16 (P3, small, ~12k): create `templates/project-map.md` — folder-level map shape
    (main folders, entry points, key flows) + the 7 staleness guards from backlog
    § *Item 16 in full*. Add `!templates/project-map.md` to `.gitignore` after line 100.
    Rule line in FinNode `CLAUDE.md` and its `project-rules/FinNode/` copy: "If the
    project has `PROJECT-MAP.md`, read it before searching code; when you add, move,
    rename or delete files, update it in the same commit. How:
    `templates/project-map.md`." FinNode edit left uncommitted (FinNode's next PR); report
    its path. `STANDARDS.md` untouched; promote only if the FinNode trial works. Guard 7
    (warn-only pre-commit) decided at rollout. FinNode's map itself: later, FinNode session.
  - Item 20 (P3, small, ~12k): read `ENVIRONMENT.md` § 3 first. On a scratch clone, test
    whether `git branch --show-current`, `-a`, `-vv` accept changing flags after them
    (rtk #3673 reads exact allow rules as prefixes). Then narrow `settings.json:17-22` to
    `--list *` and `-a --list *` (plus any form git proves safe). Own commit. Update
    `ENVIRONMENT.md:308-317` and rule counts (~:187-188). Box tests one per message, Amit
    reports box text: branch rename on a throwaway branch → box; `git branch --list` → no box.
  - Item 17 (P4, small, ~15k): tell Amit first it is a box test; no retries. ~8 probes
    against deny rules on **made-up files only** (creating them is a write — ask). Skip
    gaps already in `ENVIRONMENT.md:198-205`; probe Grep and Glob tools, `git -c` alias
    (:297). Pass/fail per probe; findings P-rated to `harness/backlog.md`; no fixes unless
    P1. Any Bash command containing `.ssh ` is refused (incl. commit text) — record with Edit.
  - Records (~5k): `harness/status.md`, `harness/backlog.md`, this file.
  - **Success:** template exists; always-loaded words stay 3,536 (`STANDARDS.md` 3,386 +
    `RTK.md` 150); branch rename boxed, `git branch --list` not; every probe has a result;
    session check silent. Commits: (a) item 16 + 17 results + records; (b) item 20 settings alone.
- **Session 2 — fresh `~/.claude` session, Sonnet (~25k):**
  - Item 10 (P3, small, ~12k): `templates/new-project.md` — add short lines: key decisions
    with trade-offs; design (parts, data, APIs); licences (free only); go-live checklist and
    rollback. `templates/roadmap.md` — "still on goal?" check at each phase end. Ideas only,
    no plugins.
  - Item 13 (P3, small, ~3k): keep 200K/300K/400K; one sentence in `ENVIRONMENT.md` § 2
    (~:164): amber 200K = near the 250K plan limit; 300K = act at next task boundary. No
    script change.
  - Item 8 (P3, small, ~5k): `gh config set telemetry disabled`, verify `gh config get
    telemetry` (gh 2.83.2 lists no such key; reading the gh config file is denied). If
    rejected, record in `ENVIRONMENT.md`: run it right after any gh update.
  - **Success:** template lines present; `ENVIRONMENT.md` line present; gh shows disabled
    or the update note is recorded; no always-loaded file touched. Records + one commit.
- **Not in scope:** wave 2 (item 4), items 9, 11, 12, 14, 15, 18; any other file.
- **Item 15:** Amit recalls a real example lost with an unwritten handoff; not found in
  setup docs or memory (06-11-2026). Open: Amit describes it, or a read-only search of
  setup-session transcripts (may be blocked, C9).
- **Session 1 done 06-11-2026** (run in the planning session, Opus): item 16 template +
  `.gitignore` line + FinNode trial line (live and mirror identical, `cmp`); item 20 allow
  rules 37 → 34, box tests passed in default mode; item 17 7/8 blocked, git alias got
  through (backlog row 21). Records updated. Details: `harness/backlog.md`.
- **Errors and fixes:** (1) FinNode rule first pointed to `~/.claude/templates/…`, which
  FinNode sessions cannot read — the map now carries its own guards. (2) First box test
  ran in auto mode (no box) and then from `/tmp` (read-block box) — redone in default mode
  inside `~/.claude`. (3) Write tool cannot create a `.env` (Read deny) — Amit created the
  fake file with `!`.
- **Uncommitted project-side edit:** `~/Documents/VS Code/FinNode/CLAUDE.md` (one rule
  line) — goes in with FinNode's next PR.
- **Committed and pushed 06-11-2026** on Amit's word: `7d3c3f8` (docs, template,
  records), `1945c96` (settings alone); `f19514a..1945c96`, `main` = `origin/main`. Test leftovers `~/.claude/zz-probe/` and
  `/tmp/zz-branch-test/` deleted (each confirmed two ways first).
- **Session 2 done 06-11-2026** (run here on Opus, Amit's choice): items 10, 13, 8;
  details in `harness/backlog.md`. Committed and pushed `c8d22de` on Amit's word
  (`1945c96..c8d22de`).
- **Wave 2 skipped 06-11-2026 (Amit):** item 4 deferred (Voice Flow on TypeScript 7.0.2,
  no `tsserver.js`; backlog § *Deferred*). Item 12 no longer waits on it.
- **Noting:** Voice Flow `.claude/settings.json:93-98` has the same `git branch` allow
  rules in plain-git form; probably harmless (rtk rewrites first), not verified inside
  Voice Flow. For Voice Flow's turn.
- **Rest of wave 3 — plan approved by Amit 06-11-2026.** Cross-check (Opus, 37.5k
  measured): change — all points taken below. Not started.
  - **Session 3 — Opus (~40k):**
    - Item 21 (P3, small, ~20k): ASK rules (not deny) in global `settings.json`:
      `*git -c *`, `*git -C * -c *`, `*GIT_CONFIG_*`, `*git *--exec-path*`, `*git config *`
      (+ `-C` form). Not `*git * -c *` (would box `git switch -c`, `git log -c`). Own
      commit. Box tests: Amit creates a made-up `.env` with `!`; alias read must box in
      **default and auto mode**; `git switch -c`, `git log -c`, `git -C <dir> status` must
      not box; one probe that git rejects attached `-cX`. `ENVIRONMENT.md` § 3: rule counts
      (~:196-198), close F1 "Known gap" (~:306-307), record remaining limit (Edit tool on
      `.git/config`). Delete the probe file after (two-way check, approval).
    - Item 14 (P3, small, ~8k): Ollama 0.40.14 network behaviour — read-only via
      `ollama --help`, env vars, docs; `.ollama` folder is denied, do not read it. Any
      switch-off proposed separately.
    - Item 9 (~2k): close — 01-11-2026 decision stands (`ENVIRONMENT.md:222-224`).
    - Records: backlog, status, this file; reword row 12 (no longer waits on #4).
  - **Session 4 — Sonnet (~15k):** item 11 markitdown — licence, network, telemetry from
    source; `pipx` install with pdf + docx extras only (ask-list: five-line explanation
    incl. *Why now*); one test conversion on a non-personal doc; trial start, review day
    15–30.
  - **Not now:** item 12 deferred (FinNode has no lint tool, no observed miss); item 15
    waits for Amit's example.
  - **Success:** alias trick boxed in both modes, normal git not; Ollama facts recorded;
    markitdown converts one test file; session check silent; always-loaded words 3,536.
- **Exact next step (when Amit chooses):** `~/.claude` session on Opus: "run Session 3".

## Handoff — wave 1 plan, approved by Amit 05-11-2026 (superseded by the section above)

- **Goal / success measure:** make the setup cheaper and safer, surgically, without
  breaking what works (Amit). Wave 1 is done when items 1, 2, 3, 5, 6, 7, 19 of
  `harness/backlog.md` are done; always-loaded words (`STANDARDS.md` + `RTK.md`) not
  higher than before; session check silent at the end (a drift warning during Session C
  is expected until the mirror sync); boxes behave as before; no workaround fixes.
- **Latest measured result:** starting tokens 25.2k (01-11-2026). Words 05-11-2026:
  3,572 before Session A → 3,529 after (`STANDARDS.md` 3,379, `RTK.md` 150) — meets the
  measure. ccusage baseline: 48.2M tokens, $20.88 per day (29-10 to 04-11-2026).
- **Plan cross-check (Opus, 47.5k measured, 05-11-2026):** "change first" — all 9
  points taken into the steps below.
- **Status:** **wave 1 complete 05-11-2026** — items 1, 2, 3, 5, 6, 7, 19 done, committed
  and pushed (`dac718f`, `e7a7bfb`, `fb1616d`, `9b0e172`, `f19514a`). Next: wave 2 plan,
  not before 12-11-2026.
  Cross-check (Opus, 47.2k measured): change; B1–B3, B5 fixed. § *Git* "goes public"
  move dropped by Amit (README pointer would loop; reason only in `STANDARDS.md`).
  **Verified 05-11-2026** in a fresh session: `printenv CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY`
  printed 1 (Amit's own `!` run); no settings error shown.
- **Errors and fixes:** a `grep` containing the word `paste-cache` (as an exclude) was
  blocked by the deny rule `*paste-cache*`; used `git grep` on tracked files instead.
- **Approved scope (05-11-2026):** wave 1 only. Excluded: waves 2 and 3, any other file,
  anything not below. Confirm scope at session start.
- **Project and folder:** Claude Setup, `~/.claude`; FinNode for Session C.
- **Session A — fresh `~/.claude` session, Opus (~80k incl. cross-check):**
  - Item 2: one line "**Errors and fixes:** what failed, why, the fix" in
    `templates/handoff.md`.
  - Item 1: rewrite `STANDARDS.md` § *Which model* (lines 119–135) shorter: keep picking
    rule, Opus/Sonnet/Haiku limits, cost compare; replace the "Part complete… switch
    back" sentence with the 27k test (switch only if chat < ~27k, else a helper finds the
    cause and the session fixes it). `harness/models.md`: **replace** its model bullets
    (lines 11–19 and 32–34) with one merged table built from backlog § *Item 1 in full*;
    keep lines 21–30 and 36 unless they conflict with it. Update `harness/status.md:63`,
    which quotes the old "Part complete" line.
  - Item 19: one sentence in `STANDARDS.md` § *Load a capability*: before adopting any
    tool, repo, skill or plugin, check network calls, telemetry, licence; free only;
    telemetry off first or tell Amit. Paid for by the item 1 cut.
  - Item 5: `"CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY": "1"` in `settings.json` `env`
    (variable name confirmed on Anthropic's data-usage page, 05-11-2026).
  - Name + one-liner moves (Amit, 05-11-2026), moved verbatim, nothing deleted,
    rule-by-rule map of what moved where:
    - `STANDARDS.md` § *Claude Setup*: keep the definition sentence; move the cross-check
      detail to `harness/cross-check.md`; one pointer line. Update the memory file
      `claude-setup-is-a-global-standard-not-a-project.md` lines 3 and 13 to point the
      cross-check to `harness/cross-check.md`.
    - § *Git* "before the repo goes public": already in `project-rules/README.md:11–12`;
      replace with one line that keeps the trigger ("raise it before going public") and
      points there. No duplicate.
    - `RTK.md` `git add --dry-run` note → `ENVIRONMENT.md` § 1; one pointer line.
    - **Dropped:** the macOS-privacy move — `SETUP-PLAN.md:3466–3470` already moved the
      detail to Voice-Flow and kept a 36-word rule global on purpose.
    - After the moves, grep the repo for pointers to moved text ("§ Claude Setup",
      "Part complete", "dry-run") and fix any that break. Any new file needs a
      `.gitignore` allow line.
  - Structure check (Amit, 05-11-2026): the cross-check also reads all always-loaded
    files (`STANDARDS.md`, `CLAUDE.md`, `RTK.md`, `OLLAMA.md`, `MEMORY.md`,
    `.claude/CLAUDE.md`) for clear structure: logical order, no duplicates, no rule
    readable two ways, quick to scan. Findings are proposed to Amit, not applied; any
    restructure needs his approval and its own rule-by-rule map. Builds on the 31-10-2026
    clarity audit (`baselines/audit-clarity-31-10-2026.md`); does not redo it.
  - Tests (important only, Amit): word count of `STANDARDS.md` + `RTK.md` before/after;
    pointer grep above; one Opus cross-check "any rule lost or changed?" plus the
    structure check; next fresh session shows no settings error and `printenv
    CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY` prints 1 (proves it is set, not that the survey
    is gone — accepted). Small doc lines: look only.
  - Commits: (1) items 1, 2, 19, the moves, `RTK.md`, `ENVIRONMENT.md`,
    `harness/cross-check.md`, memory pointer, backlog + status; (2) item 5 alone.
- **Item 3 — ccusage (~5k):** first check ccusage 20.0.48's published code for network
  calls beyond the npm download; then Amit runs `! npx ccusage@20.0.48 daily --offline`.
  Record numbers in backlog item 3; the 1-week clock for wave 2 starts. Limit: whole-Mac
  figures unless ccusage can split by project (not confirmed).
- **Session C — FinNode session, Opus (~35k):**
  - Item 6: first apply item 19 — check gitleaks' source for network calls (licence MIT,
    checked 05-11-2026). Then install (box), scan FinNode read-only with `--redact`;
    report counts and file names only; findings to FinNode's backlog, not fixed.
  - Item 7: `permissions.blockWritesOutsideWorkingDirectories: true` in FinNode's
    `.claude/settings.local.json` (confirm the key works from that file, docs first).
    Test: a write outside refused, inside works, removing it restores. Day-1 check:
    FinNode's memory (`~/.claude/projects/-Users-amitjangra-Documents-VS-Code-FinNode/
    memory/`) and plan files sit outside FinNode and may be blocked — if so, stop and
    report, no workaround. Trial: start date; check at day 15; keep or remove at day 30
    (remove if it wastes tokens or blocks real work).
  - Mirror: the FinNode edit makes `drift.sh` warn at `~/.claude` session start (expected).
    In the same session, on Amit's approval of that exact change: run `drift.sh` (only
    FinNode's `settings.local.json` should differ — stop if anything else does), then
    `project-rules/sync.sh --pull` (Bash; the write block does not cover it), `drift.sh`
    clean, one commit in `~/.claude`.
  - Item 3/6 note: Claude may suggest when to run ccusage or gitleaks again (backlog).
- **Decisions:** 27k test for switch vs helper; group small fixes per commit; test only
  important changes; skills copied as name + one line only; project map stays wave 3,
  FinNode first (backlog § *Item 16 in full*).
- **Blockers:** none.
- **Committed 05-11-2026, local, not pushed:** `dac718f` (Session A docs), `e7a7bfb`
  (survey setting). `main` ahead of origin by 2.
- **Item 3 done 05-11-2026** (same session): baseline in `harness/backlog.md`, 48.2M
  tokens and $20.88 per day (29-10 to 04-11). Uncommitted: backlog + status lines.
- **Item 3 committed `fb1616d`.** `/tmp/ccusage-check` deleted. **Pushed 05-11-2026**
  on Amit's word: `aaece68..fb1616d`, `main` = `origin/main`.
- **Session C, part 1 done 05-11-2026 (FinNode session, Opus):**
  - Item 6 done: gitleaks 8.30.1 source checked (no telemetry, no outbound calls; only
    opt-in `--diagnostics` serves on localhost), installed via brew. Scans with `--redact`,
    `private/` never scanned: git history of `phase3/sms` 55 commits, 0 leaks; tracked
    folders 0 leaks in code and docs; 37 hits only in git-ignored phone logcats under
    `app/build/walk/`. Recorded as FinNode `docs/BACKLOG.md` row 7 (P4, known and accepted).
  - Item 7: key confirmed in docs (any scope's `true` applies; file tools only, not Bash;
    plan files and project memory `.md` exempt). Set `true` in FinNode
    `.claude/settings.local.json`; trial starts 05-11-2026 (check 20-11, decide 05-12).
    Tested: write to `/tmp` refused ✅, write inside FinNode (.txt and plain .json)
    works ✅. Found: while on, Claude cannot edit any Claude Code settings file — Amit
    edits FinNode settings by hand during the trial. Switch-off test: Amit set it to
    `false`; the running session **still blocked** `/tmp` (no other settings file sets
    it, all four grepped) — switching on applied live, switching off apparently needs a
    restart (not confirmed). Test files deleted. Docs agent cost 69k (over the ~35k plan).
  - **Setting is `false` now.** Mirror not run — waits for the final `true` file.
  - **05-11-2026, second FinNode session:** with the key at `false` and a fresh restart,
    the `/tmp` write was **still refused**, and the error named this setting. No other
    settings file sets the key (checked all; reading `~/.claude.json` was denied, not
    retried). Amit is restarting once more to check. If it is still blocked, he deletes
    the line completely (not `false`), restarts, and we test again. Steps 2–5 wait.
- **Session C (wave 1, items 6–7) — DONE 05-11-2026, FinNode, Opus** (copied from the
  FinNode session's report):
  - Item 6: gitleaks 8.30.1 — 0 leaks in history and tracked files; 37 hits only in
    git-ignored `app/build/walk/` logs; FinNode BACKLOG row 7.
  - Item 7 off-test: key set to `false` (not removed) + restart → `/tmp` Write worked.
  - Item 7 on-test: key `true` (`settings.local.json:7`) → `/tmp` Write refused, error
    names the setting.
  - Memory check: key on → write to FinNode memory folder worked.
  - Not tested: plan-mode files. Earlier "refused at false" not seen again; cause unknown.
  - Cleanup: `/tmp` and memory test files deleted.
  - Mirror: drift → `sync.sh --pull` → drift 13/13 clean; commit `9b0e172`.
  - Trial: start 05-11-2026, check 20-11-2026, keep/remove 05-12-2026.
  - Checked from `~/.claude` 05-11-2026: `drift.sh` 13 current, 0 drifted;
    `session-check.sh` silent.
- **Errors and fixes (Session C):** the FinNode handoff was written to
  `~/.claude/.claude/current-task.md`, which a FinNode session cannot read
  (`blockReadsOutsideWorkingDirectories`), so a restart looked like lost context. Fix:
  Amit pasted the steps in. Lesson: a session's handoff goes where that session can read it.
- **Wave 1 complete.** Next: wave 2, not before 12-11-2026 (one week of ccusage numbers).
- **Pushed 05-11-2026** on Amit's word: `fb1616d..f19514a` (`9b0e172` mirror,
  `f19514a` Session C record + `/add-dir` rule). `main` = `origin/main`.
- **Superseded 06-11-2026 (wait dropped):** fresh `~/.claude` session on Opus: "plan wave 2".
  Wave 2 = P1/P2 medium = backlog item 4 (TypeScript code helper, 4-week trial in Voice
  Flow). The plan is made here; the trial runs in a Voice Flow session. First a second
  ccusage run to compare with the baseline. Also due: FinNode write-block check
  20-11-2026, decide 05-12-2026.
- **Superseded next step:** Amit opens a fresh FinNode session on Opus, **without**
  `/add-dir ~/.claude`, and types "continue Session C: test switch-off after restart,
  memory check, then mirror". Steps: (1) Write tool to `/tmp/finnode-writeblock-test.txt`
  should work (switch-off confirmed after restart); (2) Amit sets the key back to `true`;
  (3) same write refused; (4) memory check — a write to FinNode's memory folder works
  (else stop and report, no workaround); (5) mirror as approved: `drift.sh` (only FinNode
  `settings.local.json` may differ), `sync.sh --pull`, `drift.sh` clean, one local commit
  in `~/.claude`, no push. Clean up `/tmp/finnode-writeblock-test.txt` if created.

## History below — superseded, kept for reference

## Current task — Stage C fixes (started 01-11-2026)

- **Standing instruction (Amit, 01-11-2026) — how to work next session:** do not waste
  time. Work efficiently; avoid unnecessary questions, repeated checks, long
  explanations, or small step-by-step updates. Follow this record and do only what is
  needed to: (1) verify the PDF viewer is off; (2) show the Stage C report and a short
  summary; (3) wait for approval and "send it" before committing Stage C locally;
  (4) then prepare Stage A and Stage B together as one controlled pass. Batch work where
  safe, run checks only when required, and pause only for a real decision, approval,
  unexpected result, or before any commit or push. Keep replies short unless asked for
  detail. Do not repeat information already recorded.

- **Approved by Amit 01-11-2026:** the Stage C fix plan, groups G0–G7, one group at a time,
  checks after each, pause on anything unexpected. Order: G0 → G4 → G1 → G2 → G3 → G5 →
  G6 → G7. No commit or push until "send it"; no git pre-commit hook; Ollama restarted
  once, before G1, after explaining it. `/add-dir ~/.local/bin` only for G4. PDF viewer off
  via `/plugin`. Caution, not a standing rule (Amit, 01-11-2026): shorten only where it
  improves clarity; never remove a rule just to save words
  (`baselines/audit-corrections-31-10-2026.md`).
- **Done:** G0 audit corrections (3 files in `baselines/`, uncommitted; amend `dc92b44` on
  "send it"). Cross-check 1 (Opus, 70.5k measured): change, then go ahead — 7 changes
  taken, 1 rejected (block all of `projects/`, would block memory).
- **G4 done 01-11-2026 except the restart:** backups in
  `~/.local/share/claude-setup-backups/01-11-2026/` (`server.json` 644, `ollama-do` 755);
  `disable_ollama_cloud` true (mode kept); `ollama-do` host guard now a whole-string
  match, `@` refused; 9 bad hosts refused, loopback accepted, one local dummy prompt OK.
  Cross-check 2 (Opus, 32.2k measured): keep, 3 small changes.
- **Stage C complete 01-11-2026** — report `baselines/stage-c-fix-report-01-11-2026.md`.
  All tests passed (default mode 3/3). C6 PDF viewer off via `/plugin` — **verified
  01-11-2026** at the next session start: no `pdf-viewer` MCP tools or skills in Amit's
  `/context all`, `pgrep -lf server-pdf` finds nothing.
- **CL4 figures, measured by Amit 01-11-2026** (fresh `~/.claude` session, `/context all`,
  before any Stage A change): total 25.5k / 1m; memory files 8.5k; skills 871 tokens.
  Always-loaded words 3,967 (measured earlier). Use only these for CL4, and state that
  the 8.5k memory figure is from a `~/.claude` setup session (includes
  `.claude/CLAUDE.md`, 547 tokens, which project sessions do not load).
- **Approved by Amit 01-11-2026:** Stage C report. On "send it": amend `dc92b44` with only
  the 3 audit-correction files in `baselines/`, then a separate new local commit for
  Stage C. No push. Stage A+B starts only after he approves the commits.
- **Committed 01-11-2026, local, not pushed:** audit commit amended `dc92b44` → `6f914b0`
  (+3 audit-correction files); Stage C commit `862b736`. `main` ahead of origin by 2.
  First A+B commit must update `harness/status.md` (still says Stage C uncommitted).
- **A+B Commit 1 done 01-11-2026:** `18b8573`, local, not pushed (facts CL1–CL6, CL8,
  CB1, CB2; before-test `baselines/doc-test-before-01-11-2026.md`; G1 passed).
  Next: Commit 2 (structure and history moves) on Amit's approval — plan in chat:
  status Completed log → `baselines/status-completed-01-11-2026.md` + link fixes;
  ENVIRONMENT history → `baselines/environment-history-01-11-2026.md` (keep :204–207
  current fact, fix above/below pointers); SETUP-PLAN contents + D1–D44 index, keep
  START HERE heading; README :18/:37 → index; second Opus cross-check; after-test
  (3 allowed diffs: Q1, Q7, Q10); Amit reruns G1.
- **Commit 2 built 01-11-2026, uncommitted:** moves verbatim (`cmp`), cross-check 2 (Opus,
  78.3k) change-then-keep, all 4 points applied; after-test (Sonnet, 38.1k) matches;
  `baselines/doc-test-after-01-11-2026.md` has a G1 "pending" line to fill in. Waiting:
  Amit's G1 after-run, then his approval to commit.
- **Commit 2 done 01-11-2026:** `eaf4026`, local, not pushed; G1 after passed. `main`
  ahead of origin by 4 (`6f914b0`, `862b736`, `18b8573`, `eaf4026`). Waiting: Amit's
  review of the A+B final report. No push, no new work until he says.
- **A+B report accepted by Amit 01-11-2026.** Keep the four commits as they are. Not
  started, by his instruction: `STANDARDS.md` pass, 23k investigation, Stage C decisions
  (C4, C9, C10, C13, pre-commit hook). **Exact next step:** wait. Only on "push": show
  `git status`, `git log --oneline -4`, the remote branch and the commits to be pushed,
  and confirm no unrelated local changes; then push the four.
- **Status commit 01-11-2026 (Amit asked):** `cbf21a0` — A+B marked done, last verified
  01-11-2026. Now **five** local commits to push on "push" (`6f914b0`, `862b736`,
  `18b8573`, `eaf4026`, `cbf21a0`); use `git log --oneline -5`.
- **Accepted by Amit 01-11-2026: `cbf21a0`.** Keep all five as they are. On "push": show
  the four checks, then **wait for his explicit approval** before pushing — "push" alone
  is not approval to push.
- **Pushed 01-11-2026 on Amit's explicit approval:** normal push, `58e9f40..cbf21a0`,
  `main` and `origin/main` in sync at `cbf21a0`, 22 files. Task closed; no new work until
  Amit asks.
- **D45 applied 01-11-2026, uncommitted** (Amit approved): C9 bypass off, C10 error
  reports only, C13 audit log off, pre-commit hook (untracked, copy in ENVIRONMENT § 3);
  C4 no change; `/tmp/zz-*` deleted. Docs: ENVIRONMENT, status, SETUP-PLAN D45 + index.
  Waiting: Amit's "send it" (one local commit, 4 files, no push); Amit to switch off
  Desktop's "Allow bypass permissions mode"; fresh session: confirm hook-audit.log stops
  growing (6.7 MB now) and `claude --dangerously-skip-permissions` is refused.
- **D45 committed 01-11-2026:** `a5b0ec0`, local, not pushed (ahead 1); the pre-commit
  hook ran and passed. Push only on Amit's word, with the usual preview.
- **Amit 01-11-2026:** Desktop bypass toggle — ignore (Team plan); rtk log growth check —
  leave for now. Push preview shown; still waiting for his explicit OK.
- **Stage C approved by Amit 01-11-2026.** Committed `862b736` and pushed 01-11-2026 (line kept for history).
- **Next fresh session, in this order (Amit, 01-11-2026):**
  1. Verify the PDF viewer is off: `pgrep -lf server-pdf` finds nothing.
  2. Show the Stage C report and a short summary: fixed, tested, needs his decision
     (C4 gist scope, C9, C10, C13, optional pre-commit hook).
  3. After he approves it, prepare **Stage A and Stage B together as one controlled
     pass** (replaces the earlier "separate sessions" order). Rules: approved findings
     only; delete no file; never shorten for its own sake; keep all detail, history,
     recovery material, archives, templates and tests; dated history moves intact to
     `baselines/`; `SETUP-PLAN.md` gets only a contents list and the decisions-in-force
     index; nothing added to always-loaded files if it raises everyday tokens;
     `drift.sh` and `session-check.sh` before and after; always-loaded words (3,967)
     measured before and after and must not rise; pause before any commit or push.
  - **Confirmed by Amit 01-11-2026:** the index covers **D1–D44**. For CL4 Amit will run
    `/context all` in the fresh session before the token figures change. "Send it"
    commits Stage C locally only — no push.
  - **Agreed with Amit 01-11-2026, add to the A+B plan:**
    1. Commit Stage C first: ask for "send it" (amend `dc92b44`, local, no push) after
       step 2 and before any Stage A change, so each stage can be undone on its own.
    2. Any rewrite or history move gets an independent read-only cross-check and a
       re-run of the saved `baselines/` test prompts before and after (31-10-2026 rule).
    3. CL1/CB1: `.claude/settings.json` now has **six** ask rules (D36, D41, D44) — fix
       `README.md:29` and `.gitignore:110` to "six", not "two". CL4: ask Amit to run
       `/context all` in the fresh session; without it, mark the old figures as dated.
- **Checks so far:** `drift.sh` 13 current, 0 drifted; `session-check.sh` silent.

## Previous task — read-only audit (done 31-10-2026)

- **Goal / success measure:** Amit: make the setup simple to read for him and for Claude,
  without missing anything — no cut just to cut, only dead, duplicate or untrue, and only
  with his OK — while staying secure and not raising token use. This task is the
  **read-only audit** only. Done when, per stage: (1) every in-scope file listed as read,
  or unreadable with the reason; (2) every finding has file:line evidence, P1–P4, size,
  fix-token estimate and recommendation, and every P2 states its real case; (3) every P1
  and P2 independently verified by an agent given the evidence, not the conclusion;
  (4) `git status` shows only the audit report, `harness/status.md` and this file changed;
  `drift.sh` "13 current, 0 drifted" and `session-check.sh` silent before and after.
- **Latest measured result:** baseline 31-10-2026 — always-loaded words 3,967
  (`STANDARDS.md` 3,419, `RTK.md` 246, `CLAUDE.md` 108, `OLLAMA.md` 97, `MEMORY.md` 97;
  ~5.3k tokens est.). No fix may raise this. `drift.sh` 13 current, 0 drifted;
  `session-check.sh` silent.
- **Status:** in progress — Stage C done 31-10-2026
  (`baselines/audit-security-31-10-2026.md`: 0 P1, 0 P2, 8 P3, 5 P4; agents 92.6k +
  43.0k measured). Reviewed by Amit. C2 fixed on his word: rtk telemetry off
  (`rtk telemetry status`: "enabled: no"); `rtk telemetry forget` not run. Report and
  `harness/status.md` are not committed (the rtk config is outside git). Commit waits for
  "send it". **Stage A done 31-10-2026** (`baselines/audit-clarity-31-10-2026.md`:
  0 P1, 0 P2, 12 P3, 6 P4; ~75k tokens est., no agents). `drift.sh` 13 current,
  0 drifted and `session-check.sh` silent, before and after. Not yet reviewed by Amit.
  **Stage B done 31-10-2026** (`baselines/audit-cleanup-31-10-2026.md`: 0 P1, 0 P2,
  1 P3, 3 P4; nothing to delete; helper 78.0k measured, main ~25k est.). `drift.sh`
  13 current, 0 drifted and `session-check.sh` silent, before and after. Not yet
  reviewed by Amit.
- **Approved scope (31-10-2026):** the audit below. Read-only, except the dated audit
  reports and minimal `harness/status.md` and this file. **Excluded:** any rule, setting,
  script, project file or history file change; opening `.env` files or secrets (check
  protection and exposure paths only); any fix; any commit until Amit says "send it";
  project code and folders. Confirm scope still applies at session start.
- **Project and folder:** Claude Setup, `~/.claude`.
- **Phase and task:** audit, three stages, pause after each:
  1. **Stage C — security** → `baselines/audit-security-<DD-MM-YYYY>.md`, pause.
     Settings (global, both setup files): deny/ask/allow gaps. Hooks and scripts
     (`session-check.sh`, `drift.sh`, `sync.sh`, rtk hook). `.gitignore`: can session
     logs, `history.jsonl`, `paste-cache/`, memory or `.env` patterns reach GitHub — what
     is tracked, not contents. `project-rules/` mirrors: secrets or personal data. Ollama
     rules and skill. Outside data flows: web, `gh`, MCP, plugins. Own Claude: auto mode,
     bypass rules. Goal: no outside user, agent or model, nor Amit's own, can do unwanted
     things, leak or keep his private information, or send it out. One fresh Opus agent,
     read-only, ~45k + ~15k verify.
  2. **Stage A — clarity and overviews** → `baselines/audit-clarity-<DD-MM-YYYY>.md`,
     pause. `STANDARDS.md`, `harness/status.md`, `ENVIRONMENT.md`, `SETUP-PLAN.md`,
     `CLAUDE.md`, `RTK.md`, `OLLAMA.md`, `.claude/CLAUDE.md`, memory files,
     `harness/overview.md`, `harness/cross-check.md`, `README.md`, `PROJECTS.md`,
     `templates/deferred-improvements.md`. Find: hard wording, contradictions, duplicates,
     stale facts, rules readable two ways, quiet rules (prose that must always hold —
     needs a setting), which files need a contents list. Opus, main session, ~50k.
  3. **Stage B — cleanup** → `baselines/audit-cleanup-<DD-MM-YYYY>.md`, pause.
     `baselines/`, `archive/`, `jobs/`, `paste-cache/`, `templates/`, loose top-level
     files, dead or stale rules from A. Label each: dead, junk, duplicate, test/dummy
     (keep a one-line summary), or keep (supports the system, future use, recovery or
     history). `paste-cache/` and `jobs/` may hold private text: classify by name and date
     first, read only if unclear; nothing to Ollama. Sonnet helper for inventory, Opus
     judges labels, ~30k.
  4. **Combined summary** across C, A, B. 5. **Amit chooses** what to fix.
  Total ~140k est.; report real token use per stage where measurable.
- **Done:** plan approved 31-10-2026. Earlier the same day: deleted Voice Flow copies
  cleared from docs, `58e9f40`, pushed.
- **Changed files:** `baselines/audit-security-31-10-2026.md`,
  `baselines/audit-clarity-31-10-2026.md`, `baselines/audit-cleanup-31-10-2026.md` and
  `baselines/audit-summary-31-10-2026.md` (new, uncommitted),
  `harness/status.md` (§ *In progress*), this file.
- **Tests and checks:** Stage C before and after: `drift.sh` 13 current, 0 drifted;
  `session-check.sh` silent.
- **Decisions (31-10-2026, Amit) — to carry into the fix plans, not done yet:**
  - **Report format, now:** every finding/suggestion mid-task gives priority, size
    (small, small-medium, medium, large) and token estimate to plan and fix.
  - **P1–P4 scale** (proposed `STANDARDS.md` change, replaces P1–P3; also
    `templates/deferred-improvements.md`): P1 blocks Amit or a project, fix now;
    P2 important but not blocking, must state its real case (has happened, a normal
    step triggers it, or blocks the next piece) — no P2 without that line; P3 limited
    impact, normal work; P4 nice to have. Use it in audit reports now.
  - **Explanations** (proposed `STANDARDS.md` change): simple 1–3 line summary first,
    then technical detail separately when useful.
  - **Pushback** (proposed `STANDARDS.md` change): only when risky, wastes time/tokens,
    a clearly better way exists, or it conflicts with Amit's rules. One-line reason,
    Amit decides. Not on every request.
  - **Overviews:** a contents list at the top of big files, not separate overview files.
    Three overlapping maps today (`harness/overview.md`, `ENVIRONMENT.md` § *What's in
    this file*, `harness/status.md` § *Source of truth*) — merge, don't add a fourth.
  - **`SETUP-PLAN.md`:** never rewrite history; add only a contents list and a
    "decisions in force" index (D1–D43) at the top.
  - **`harness/status.md`:** move the *Completed* log out to `baselines/`, as twice before.
  - **`ENVIRONMENT.md`:** current state only; dated history out.
  - **Any rewrite:** rule-by-rule map — every old rule/fact kept, moved, dropped with
    Amit's approval, or converted to an enforced setting; independent cross-check;
    re-run saved `baselines/` test prompts before and after; stop if behaviour changes.
  - **Token guard:** no fix may raise everyday project-session token use; audit cost
    reported separately.
- **Fix order after the audit (separate plans, not in this task):** fix C in a fresh
  session → restart → fix A → restart if needed → fix B. Each: own plan, rule-by-rule
  map, independent cross-check, tests, commit only after "send it". Commit the audit
  reports before the first fix, when Amit says so.
- **Blockers:** none.
- **Pending elsewhere:** none.
- **Exact next step:** audit finished 31-10-2026 — combined summary in
  `baselines/audit-summary-31-10-2026.md` (35 findings; fix groups in its § 7). All four
  reports and `harness/status.md` committed locally as `dc92b44` on Amit's "send it";
  **not pushed** — Amit is reviewing by hand first. Push only when he says so; if he wants
  changes, amend before pushing. Then fixes in a fresh session, one fix group at a time
  (summary § 7, C first: group 1 permissions, Opus), each with its own plan and approval. Stage C's C1 and C3–C13, Stage A's CL1–CL18 and Stage B's
  CB1–CB4 wait for the fix plans. Note: `session-check.sh` is not executable; run it
  with `bash`, as the hook does.
- **Pushed 01-11-2026 (Amit: "fix and push"):** `a5b0ec0` (D45) and `f794097` (docs: Desktop
  toggle left, rtk log check left). `main` = `origin/main` at `f794097`. Nothing in
  progress. On hold by Amit: `STANDARDS.md` pass, 23k target. Next session: start fresh.
- **Amit 01-11-2026, session end:** ignore for now — `STANDARDS.md` pass, 23k target, C11,
  C12. Nothing pending. Safe to exit.
- **Later 01-11-2026:** 23k target dropped — no fixed target, fewer tokens per whole task
  (Amit). C12 and other project items moved out of setup status to
  `baselines/status-completed-01-11-2026.md`. C11 stays (setup repo).

## Done 01-11-2026 — `STANDARDS.md` pass

Done: `2657315` (Plan 2), token pass `c808989`, skills `3fa82b8`; item 9 settled by
measurement, item 10 covered by existing rules. Original list kept below.

### Original list — `STANDARDS.md` pass (Amit, 01-11-2026)

Amit lifted the hold: fix `STANDARDS.md` next session. Lesson (Amit, 01-11-2026): it was
skipped whole because of the token guard, and the decided rules were never named as
unimplemented — say plainly what a skipped scope leaves undone.

Items (priority · size · est. tokens to plan and fix):
1. P2 · small · ~3k — **Report format**: every task, finding or mid-task item gives
   priority, size and token estimate when planned. Has happened: applied unevenly 01-11.
2. P2 · small · ~2k — **Say what a skipped scope leaves undone**: when a plan excludes
   decided work, list the decided rules that stay unimplemented and their effect. Has
   happened: 01-11-2026.
3. P3 · small · ~3k — **P1–P4 scale** replaces P1–P3 (P2 must state its real case); also
   `templates/deferred-improvements.md`.
4. P3 · small · ~2k — **Explanations**: 1–3 line simple summary first, technical detail
   after, separately.
5. P3 · small · ~2k — **Pushback**: only when risky, wasteful, clearly worse, or against
   Amit's rules; one-line reason; Amit decides.
6. P3 · small · ~1k — CL14: name which status-line level means "finish the piece"
   (`STANDARDS.md:162`).
7. P3 · small · ~1k — CL15: "never read whole" — unless an approved plan says so
   (`:116`).
8. P3 · small · <1k — CL16: declined box — "do not retry until the denial rules below
   allow it" (`:319`).
9. Decide first — **word budget**: `STANDARDS.md` 3,419 words; always-loaded 3,967. Amit
   chooses: a small capped rise, or same size by rewording (never cutting a rule).
10. Candidate, Amit's call — standing "work efficiently: batch safe work, short updates,
    pause only for a real decision, approval, unexpected result or commit/push".

Method: rule-by-rule map, one Opus cross-check, G1 + doc test before and after,
`drift.sh`/`session-check.sh`, words before/after, local commit on "send it". Total est.
~50–60k with checks.
