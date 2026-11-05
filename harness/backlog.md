# Backlog — Claude Setup

Agreed improvements and open items for `~/.claude`. Nothing here is built without a plan
and Amit's approval. Priority: P1–P4 as in `STANDARDS.md` § *Plan before building*;
order of work agreed with Amit: P1 first, then P2, then P3 and P4 together.
Tokens are rough estimates to plan, build and check.

Source: Stage 1 checks, 05-11-2026 (C1–C8; C9 closed — no to-do list survived from the
02/03-11-2026 repo-review session, and the transcripts could not be read).

## To build

| # | Tool / area | What it fixes or adds | Pri | Size | Tokens |
|---|---|---|---|---|---|
| 1 | Model rule | One merged table (Opus / Sonnet / Haiku). Choose the model at session start; switch at session boundaries via the handoff note, not `/model` mid-chat. Hard bug in a long chat: an independent helper finds the cause, the session fixes it. Haiku only as a helper or a fresh tiny session. Full text in `harness/models.md`, one line in `STANDARDS.md` | P1 | small | ~15k with cross-check |
| 2 | Handoff template | Add an "Errors and fixes" line to `templates/handoff.md` (idea from Planning-with-Files; not installed) | P1 | small | ~3k |
| 3 | ccusage (free, MIT) | Token-use baseline before the trials. Manual only, always `--offline`; Claude may suggest when to run it. Check on first run whether it still fetches anything | P1 | small | ~10k |
| 4 | TypeScript code helper | 4-week trial in **Voice Flow** after one week of ccusage baseline, in a Voice Flow session on its own branch. Turn off npm type lookup (`disableAutomaticTypingAcquisition`) if the plugin allows. Weekly 5-minute check; keep if nothing broke, tokens flat or lower, and it caught a real problem | P1 | medium | ~40k + ~5k/week |
| 5 | Claude Code survey | Set `CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY=1`. Case: clicking "Yes" on the follow-up uploads the whole transcript, and projects hold personal data | P2 | small | ~5k |
| 6 | gitleaks | Manual secret scan of **FinNode** first; no hook yet. Claude may suggest when to run it | P2 | small | ~15k |
| 7 | Block writes outside project | `permissions.blockWritesOutsideWorkingDirectories` (Claude Code 2.1.314+; installed 2.1.318). Projects only, never global; trial in **FinNode**. 15–30 day trial. Covers Claude's file tools only, not shell commands | P2 | small | ~10k |
| 8 | GitHub CLI telemetry | `gh config set telemetry disabled` before any `gh` update: 2.91.0+ turns it on by default; installed 2.83.2 has none | P3 | small | ~3k |
| 9 | Claude Code usage metrics | Decide: keep on if Remote Control or claude.ai skill sync is used, else `DISABLE_TELEMETRY=1`. Metrics carry no code, prompts or paths (Anthropic docs) | P3 | small | ~5k |
| 10 | Planning ideas (engineering + product-management plugins) | We lack these; copy the ideas into `templates/new-project.md`, do not enable the plugins: `write-spec` (goals, non-goals, acceptance criteria, phases), `architecture` (decisions with trade-offs), `system-design` (APIs, data, parts), `deploy-checklist` (go-live checks, rollback). Plus our own: licence check and a mid-project "still on goal" check (no plugin has either) | P3 | medium | ~25k |
| 11 | markitdown | On-demand command only, no startup cost; no Azure or AI options. Keep the PDF/DOCX skills; never both on one document. 15–30 day trial | P3 | small | ~10k |
| 12 | Own post-edit checker | Kotlin, lint and project-specific checks; must not clash with the TypeScript helper. Start after week 2 of #4. Same trial method as #4 | P3 | medium | ~30k |
| 13 | Statusline thresholds | Warnings at 200K/300K/400K vs the 250K plan limit in `STANDARDS.md`. Decide which is right and align | P3 | small | ~3k |
| 14 | Ollama | Check its own update checks / network calls (not covered in Stage 1). Cloud models already off (D45) | P3 | small | ~5k |
| 15 | Acting without approval | Wording fix only once a real example is seen; the rule already exists in `STANDARDS.md`, auto mode may be the cause | P3 | small | ~5k |
| 16 | Graphify idea | Copy the idea, do not install: a hand-kept project map file that `CLAUDE.md` points to | P4 | small | ~10k |
| 17 | Deny-rule bypass test | Focused security test; do last | P4 | small | ~15k |
| 19 | New-tool rule | Standing rule: before adopting any repo, tool, skill or plugin, check its network calls and telemetry (turn telemetry off before use; if it can't be, report and ask) and that it is free — no paid tools (Amit, 05-11-2026) | P1 | small | ~5k |
| 20 | rtk exact allow rules | rtk issue #3673 (open, critical, all versions incl. 0.48): rtk reads an exact allow rule as a prefix. `Bash(rtk git branch)` therefore lets `git branch -f/-m/-c …` run without a box. Deletes stay boxed (ask rules `*git branch -D*` etc.). Add ask rules for the other branch-changing flags, or narrow the allow rules | P3 | small | ~10k with box tests |

## Item 1 in full — model rule (agreed with Amit, 05-11-2026)

- **Opus:** setup, rules, global standards, settings, permissions, hooks, security,
  data-loss or hard-to-undo work, unclear bugs, architecture, new projects, big plans,
  review of security-sensitive or hard-to-undo changes.
- **Sonnet:** building approved plans (including long ones that are not too complex),
  clear bugs, tests, code review, docs that need judgement, commit and PR text, search
  helpers that judge code.
- **Sonnet first, Opus if unclear or risky:** large codebase reading and impact analysis.
- **Stop and suggest Opus:** when a task turns unclear, risky or security-related.
- **Haiku or a local command, no model switch:** simple document conversion and reading prep.
- **Haiku only if cost-effective, as a helper or a fresh tiny session:** status checks,
  finding files, counts, summaries, formatting, commit *messages* (not the commit
  itself), find-only search helpers. Never permissions, security, settings, hooks,
  secrets or multi-step work.
- **When to pick:** choose the model at session start, by the task. When the task ends,
  update the handoff note. Switch models between sessions using that note, not with
  `/model` mid-chat (a switch re-reads the whole chat uncached).
- **Hard bug in a long chat** (past ~30k): an independent helper (e.g. Opus) finds the
  root cause and the session applies the fix. Helper start-up ~15–27k; its brief must
  include the exact failure. In a short chat, switching is cheaper.
- **Cost rule:** before suggesting a switch or helper, compare start-up plus remaining
  work against continuing here, say the numbers, and don't suggest it if it costs more
  than it saves.
- **Replace** the current hand-back line ("Part complete. Switch back to Opus with
  /model.") — it assumes mid-session switching.
- **Where:** full text in `harness/models.md`; one short line in `STANDARDS.md`
  § *Which model*, so starting tokens don't rise.

## Deferred — recheck around 05-01-2027

| # | Tool | Why deferred | Recheck |
|---|---|---|---|
| 18 | rtk update | Policy (Amit, 05-11-2026): stay on the latest **stable, free** version; move only when a version is shown to be better than the one installed. 1.x: major version, breaking changes (`rtk proxy` renamed `rtk bypass`, alias kept), default binary licence changed (free "rtk-oss" edition alongside). Candidate: **0.52.0** (last 0.x, 13-10-2026, Apache-2.0) — fixes "three permission-gate holes" in the hook, but also rewrites more commands (`sh -c` wrappers), had no point release, and 0.49–0.51 notes were not read; not shown better yet. Open in every version: #4644, #3673. Nothing broken on 0.48 | Is #4644 / #3673 fixed; read 0.49–0.52 notes; what the 1.x licence says and whether rtk-oss is the free one; does an update keep telemetry off (add `RTK_TELEMETRY_DISABLED=1`); box tests before and after |

## Known and accepted — not doing

- Statusline simplification: 84 lines, no network, no token cost; not worth it (C6).
- Re-read change (Claude Code 2.1.317): re-reading an unchanged file now returns the
  whole file. No setting; Claude avoids re-reading unchanged files (C5).
- Checker Helper: already exists as the cross-check agent (`harness/cross-check.md`);
  use sparingly for security, permissions or large risky changes.
- Engineering skills not copied: `testing-strategy`, `tech-debt`, `incident-response`,
  `standup`, `code-review`, `debug`, `documentation` — covered by existing rules or not
  needed repeatedly.
- Not verified, checked when each tool's trial starts: gitleaks and markitdown network
  behaviour from source code.
