# Stage A+B tests — after · 01-11-2026

"After" record for the Stage A+B fix pass, compared against
`doc-test-before-01-11-2026.md` (same questions, verbatim).

**Setup state:** `main` at `18b8573` (Commit 1, facts) plus the uncommitted Commit 2
changes (structure and history moves). Always-loaded words 3,967.

## G1 — Git commit vs push

Run by Amit in a fresh session after the Commit 2 changes · `~/.claude` · Claude Code
2.1.316 · Opus 5.5 · 12:14 · **guided** · supplied by Amit. Effort and mode not shown.

**Prompt** — verbatim as in the before record.

**Reply**

```
A commit saves a snapshot of your changes to your local repository, on your own machine only. A push sends those local commits to a remote repository like GitHub, so other people can see them.
```

**Observed** — Pass, matches the before run: two sentences, conclusion first, no plan, no
tools. Wording differs by two words ("those local commits", "so other people"); same
behaviour.

## Doc-lookup test — the same 10 questions

Fresh Sonnet agent, read-only, `~/.claude` only, 01-11-2026. Measured 38.1k tokens.
Questions verbatim as in the before record. Line numbers are as of the Commit 2 working
tree.

| Q | Answer | Locations |
|---|---|---|
| 1 | 6 (jq): D36 two stash rules; D44 four `git add`/`git stage` rules; D41 removed the other two of D36's four. `README.md:29` now agrees (six) | `ENVIRONMENT.md:199-203`; `SETUP-PLAN.md:1537`; `README.md:29` |
| 2 | deny 68, ask 191 (jq); allow 37 (docs) | `ENVIRONMENT.md:169-171`; `SETUP-PLAN.md:1536` |
| 3 | D36 (10-10-2026): setup sessions ask before pull, switch, stash pop, stash apply; partly superseded by D41, stash rules stay | `SETUP-PLAN.md:1396-1407`; index row `:68`; `ENVIRONMENT.md:200` |
| 4 | D44 (01-11-2026): Stage C fixes — deny 34 → 68, ask 188 → 191, setup `git add`/`git stage` asks, Ollama cloud off, secret scan | `SETUP-PLAN.md:1530-1544`; index row `:76`; `ENVIRONMENT.md:173, 236`; `harness/status.md:32` |
| 5 | grey under 200K, amber to 300K, red to 400K, then `/compact`; constants at the top of `statusline/context.py` | `ENVIRONMENT.md:143-146, 637`; `STANDARDS.md:164` |
| 6 | `status-completed-11-10-2026.md` (to T6) and `status-completed-23-10-2026.md` (11-10 to 23-10); a third file, `status-completed-01-11-2026.md`, holds 29-10 to 31-10 | `harness/status.md:43-47` |
| 7 | 87 `ask` rules; ~4.5 interruptions per session (5,188 commands, 49 sessions), ~24 if the left-out rules were added — both now labelled 18-09-2026 | `ENVIRONMENT.md:268-274, 352-353, 652-653` |
| 8 | 52 → 87 → 101 → 107 → 112 → 51 → 58 → 90 → 96 → 188 → 191 | `baselines/environment-history-01-11-2026.md` § A (via pointer at `ENVIRONMENT.md:205`); `ENVIRONMENT.md:170, 192` |
| 9 | F3: more `.env`/`~/.ssh` read denies; accepted 30-10, widened by C1, mostly fixed by D44 | `harness/status.md:67-70`; `baselines/audit-security-31-10-2026.md:51-54` |
| 10 | `harness/status.md` (`.claude/CLAUDE.md`); for rule changes, `SETUP-PLAN.md`'s *Contents and decisions index* (`README.md:18, 37`) | `.claude/CLAUDE.md:5`; `README.md:18, 37-38` |

## Comparison with the before record

**Every answer matches.** The three allowed differences appeared as expected: Q1 (`README.md`
now says six), Q7 (dating label), Q10 (`README.md` points at the new index). Two answers
also changed location only, as the moves intended: Q6 names the third moved log, and Q8's
count chain is now reached through the pointer to the history file — same sequence.

## Cross-check of the moves

Fresh Opus agent, read-only, 01-11-2026, 78.3k tokens measured. Verdict: change, then
keep. All five moved blocks byte-for-byte identical to `18b8573` (`cmp`); no fact lost;
no current fact moved by mistake; `SETUP-PLAN.md` insert-only; no always-loaded file
changed. Its two required changes (a pointer date; two index rows citing where a
supersession is stated) and two optional ones (a history pointer; a `README.md` line)
were made before commit. Noted, not acted on: `SETUP-PLAN.md`'s older pointer to
`harness/status.md` § *Completed* for the 09-10-2026 checkups was already stale before
this pass (the entries are in `status-completed-11-10-2026.md`).
