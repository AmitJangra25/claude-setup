# Stage A+B tests — before · 01-11-2026

"Before" record for the Stage A+B fix pass (audit `baselines/audit-summary-31-10-2026.md`),
taken before any Stage A or B change. The "after" record goes in
`doc-test-after-01-11-2026.md` and is compared against this one.

**Setup state:** `main` at `862b736` (Stage C), clean tree. Always-loaded words 3,967.

## G1 — Git commit vs push (re-run of `2026-09-28.md` G1)

Run by Amit in a fresh session · `~/.claude` · Claude Code 2.1.316 · Opus 5.5 · 11:55 ·
**guided** · supplied by Amit. Effort and mode not shown.

**Prompt**

```
“In one or two sentences, explain the difference between a Git commit and a Git push. Don’t open files or use tools.”
```

**Reply**

```
A commit saves a snapshot of your changes to your local repository, on your own machine only. A push sends those commits to a remote repository like GitHub, where other people can see them.
```

**Observed** — Pass, same as 28-09-2026: two sentences, conclusion first, no plan, no
tools. Limit as recorded there: it measures writing style well and task order weakly.

## Doc-lookup test — 10 fixed questions

Fresh Sonnet agent, read-only, `~/.claude` only, 01-11-2026. Measured 42.4k tokens.
Answers from the docs, counts confirmed with `jq`. Line numbers are as of `862b736`.

**Allowed differences after the pass (Amit, 01-11-2026), exactly three:** Q1 — `README.md`
"four" ask rules becomes "six"; Q7 — the dating label is corrected; Q10 — the `README.md`
pointer changes. Every other answer must match.

### Questions, verbatim

1. How many `ask` rules does `.claude/settings.json` hold, and which decision numbers (D-numbers) account for them? (Check the docs, then confirm the count with jq.)
2. How many `deny` and `ask` rules does the global `settings.json` hold? (Docs, then jq.)
3. What does decision D36 decide, and where is it recorded?
4. What does decision D44 decide, and where is it recorded?
5. What are the status line's warning thresholds, and which file defines them?
6. Where is the old `harness/status.md` § Completed log kept for work before 23-10-2026?
7. What were the global permission-list size and the interruptions-per-session figure measured on or around 18-09-2026?
8. What are the global `ask` rule counts in the dated chain of changes in ENVIRONMENT.md § 3 Permissions (list the sequence of counts in order)?
9. What is known-and-accepted item F3, and where is it described?
10. Where should a fresh setup session in ~/.claude start reading, according to the docs?

### Answers

| Q | Answer | Locations |
|---|---|---|
| 1 | 6 (jq): D36 two stash rules; D44 four `git add`/`git stage` rules. Docs disagree: `README.md:29` still says four (stale) | `ENVIRONMENT.md:204-207`; `SETUP-PLAN.md:1465`; `README.md:29` |
| 2 | deny 68, ask 191 (jq); allow 37 | `ENVIRONMENT.md:166-168`; `SETUP-PLAN.md:1464` |
| 3 | D36 (10-10-2026): setup sessions ask before `git pull`, `git switch`, `git stash pop`, `git stash apply`; partly superseded by D41 (30-10-2026), pull and switch removed, stash rules stay | `SETUP-PLAN.md:1323-1334` |
| 4 | D44 (01-11-2026): Stage C fixes — private-store denies (34 → 68), gist and `ollama run *cloud*` asks (188 → 191), setup `git add`/`git stage` asks, Ollama cloud off, secret scan in `drift.sh` | `SETUP-PLAN.md:1457-1470`; `ENVIRONMENT.md:170-186, 248-259`; `harness/status.md:32`; `baselines/stage-c-fix-report-01-11-2026.md` |
| 5 | grey under 200K, amber to 300K, red to 400K, then suggests `/compact`; constants at the top of `statusline/context.py`. Superseded values at `ENVIRONMENT.md:148-150, 512-520` | `ENVIRONMENT.md:140-143, 642`; `STANDARDS.md:164` |
| 6 | `baselines/status-completed-11-10-2026.md` (to T6) and `baselines/status-completed-23-10-2026.md` (11-10 to 23-10-2026) | `harness/status.md:41-44` |
| 7 | 87 `ask` rules (52 → 87 on 18-09-2026); ~4.5 interruptions per session (5,188 commands, 49 sessions). Docs partly disagree: `:217-218` says such figures were dropped, `:362` and `:657` still carry 4.5 (audit CL6) | `ENVIRONMENT.md:281-285, 361-362, 657, 217-218` |
| 8 | 52 → 87 (18-09) → 101 → 107 → 112 → 51 (20-09) → 58 (27-09) → 90 (23-10) → 96 (29-10) → 188 (30-10, S4, D41) → 191 (01-11, D44) | `ENVIRONMENT.md:167, 188-189, 196-219, 281` |
| 9 | F3: more `.env`/`~/.ssh` read denies; known and accepted 30-10-2026, widened by audit C1, mostly fixed 01-11-2026 (D44); remaining limits in `ENVIRONMENT.md` § 3. (A different "F3" in `audit-29-10-2026.md:165` is another series) | `harness/status.md:172-176`; `ENVIRONMENT.md:177-184` |
| 10 | `harness/status.md` first, then the `SETUP-PLAN.md` sections it lists. Stale pointer: `README.md:18, 37` still send readers to the historical `► START HERE` block (`SETUP-PLAN.md:7-12`, audit CL7) | `SETUP-PLAN.md:167-173`; `.claude/CLAUDE.md:2` |
