# Doc-test after Phase 3 — 11-11-2026

Purpose: "After" doc-test record for Phase 3 (T16–T19), taken after the rule-file edits and linked updates; compared against `doc-test-before-11-11-2026.md`. Also holds the step 6 checks.
Date: 11-11-2026
Status: record
From: Go 2 step 6, `harness/doc-structure-plan.md` § 3 *Phase 3 plan*; method and questions from `baselines/doc-test-before-01-11-2026.md`

<!-- Content below, word for word. Never edited, except to redact a leaked secret or
     personal data: [REDACTED DD-MM-YYYY, D<n>] (DOCUMENTATION-STANDARD.md § Data and security). -->

**Setup state:** `main` at `dd76666` plus the Go 2 edits, uncommitted. Always-loaded words 4,030.

## G1 — Git commit vs push

Run by Amit in a fresh session · `~/.claude` · supplied by Amit, 11-11-2026. Version, model, effort and mode not shown.

**Prompt**

```
In one or two sentences, explain the difference between a Git commit and a Git push. Don't open files or use tools.
```

**Reply**

```
A commit saves a snapshot of your staged changes in your local repository's history, on your machine only. A push sends the commits you've made locally to a remote repository, such as GitHub, so others can see them.
```

**Observed** — Pass: two sentences, conclusion first, no plan, no tools. Same as before.

## `/context` — same fresh session (supplied by Amit)

```
- Session loaded normally.
- Total context: 30.1k tokens.
- Memory files: 6 files, 8.3k tokens.
- Skills: 31 skills, 261 tokens.
- The three imports still load; no settings error appeared.
```

## Doc-lookup test — 10 fixed questions

Fresh Sonnet agent, read-only, `~/.claude` only, 11-11-2026. Questions word for word as in the before record.

### Answers (agent's report)

| Q | Answer | Locations |
|---|---|---|
| 1 | 6 `ask` rules (jq 6). D36 gives 2 (`git stash pop`, `git stash apply`); D44 gives 4 (`git add`, `git -* add`, `git stage`, `git -* stage`). D41 removed D36's `git pull` and `git switch`. | `ENVIRONMENT.md:270-274`; `SETUP-PLAN.md:1405-1414`, `:1546-1548`; `.gitignore:126-127`; jq |
| 2 | deny 74, ask 191 (jq agrees); docs also list allow 36. | `ENVIRONMENT.md:196-198`; jq |
| 3 | D36 (10-10-2026): setup sessions ask before `git pull`, `git switch`, `git stash pop`, `git stash apply`; partly superseded by D41 (30-10-2026), pull and switch removed, stash rules stay. | `SETUP-PLAN.md:1403-1414`, `:68`; `ENVIRONMENT.md:270-274` |
| 4 | D44 (01-11-2026): Stage C fixes — private-store denies (34 → 68), `gh gist create\|edit` and `ollama run *cloud*` asks (188 → 191), setup `git add`/`git stage` asks (2 → 6), two local `git add *` allows removed, Ollama cloud off, `drift.sh` secret scan. | `SETUP-PLAN.md:1539-1552`, `:76`; `ENVIRONMENT.md:211-228`, `:307-318`; `baselines/stage-c-fix-report-01-11-2026.md` |
| 5 | Grey under 200K, amber to 300K, red to 400K, then suggests `/compact`; `QUIET, WARN, HIGH = 200_000, 300_000, 400_000` in `statusline/context.py`; prose in `ENVIRONMENT.md` § 2. | `statusline/context.py:29`; `ENVIRONMENT.md:164-180`, `:718` |
| 6 | `baselines/status-completed-11-10-2026.md` (to old T6) and `baselines/status-completed-23-10-2026.md` (11-10 to 23-10); later files `-01-11-2026` and `-11-11-2026` also exist. | `harness/status.md:68-73`; `baselines/README.md:27-28`, `:37`, `:43` |
| 7 | 18-09-2026, 87-rule `ask` list (52 → 87); ~4.5 interruptions per session (5,188 commands, 49 sessions); ~24 if the excluded commands prompted. | `ENVIRONMENT.md:346-347`, `:431`, `:733-734` |
| 8 | Live § 3: 96 → 188 (30-10, S4/D41) → 191 (01-11, D44). Full chain: 52 → 87 (18-09) → 101 → 107 → 112 → 51 (20-09) → 58 (27-09) → 90 (23-10) → 96 (29-10) → 188 (30-10) → 191 (01-11). | `ENVIRONMENT.md:197`, `:262-263`, `:276-278`; `baselines/environment-history-01-11-2026.md:15-38` |
| 9 | F3: more `.env`/`~/.ssh` read denies; accepted 30-10-2026, widened by audit C1, mostly fixed by D44 (01-11-2026); remaining limits in `ENVIRONMENT.md` § 3; bundled in B27. | `baselines/status-completed-11-11-2026.md:117-122`; `harness/backlog.md:107`; `ENVIRONMENT.md:211-225`; `baselines/audit-security-31-10-2026.md:51-54` |
| 10 | Start at `DOCUMENT-MAP.md` (D47); for setup work, at Orient read `harness/status.md` first, and tell Amit about any Session-start check warning first; read the `SETUP-PLAN.md` decisions index before changing a rule, permission or hook. | `README.md:32-42`; `.claude/CLAUDE.md:6-9`; `DOCUMENT-MAP.md:31` |

**Agent's notes:** no live doc disagrees with jq. Older records carry superseded facts (`baselines/t6-removals.md:93`; `baselines/audit-security-31-10-2026.md:51` cites an old `harness/status.md` line). Nothing refused by a permission rule; parallel calls held by auto mode were re-run singly.

## Comparison with `doc-test-before-11-11-2026.md`

| Q | Result |
|---|---|
| 1–9 | Match in substance. Some answers add detail (Q4 allows removed, Q6 later files, Q7 the 52 → 87 step, Q8 live vs moved chain); none contradicts the before answer. Line numbers outside the rule files unchanged. |
| 10 | Allowed difference: cites `.claude/CLAUDE.md:6-9` (the new *At session start* section) and now also names the session-start warning. Not repeated from before: "start setup sessions from `~/.claude` (memory per starting folder)", which comes from `README.md`, unchanged by Phase 3 — agent variation, not a lost rule. |

## Step 6 checks

| Check | Result |
|---|---|
| Words ≤ 4,030 | 4,030 — pass |
| `doc-check.sh` | 1 known warning, no new — pass |
| TC2 → `RTK.md` § *`rtk proxy`* | resolves (`RTK.md:10`) — pass |
| Three imports load | Amit's `/context`: 6 memory files, no error — pass |
| No rule lost | fresh Sonnet agent, 34.6k: no rule lost; four wording tweaks inside the approved text; `SETUP-PLAN.md` comment entry carried by its `DOCUMENT-MAP.md` row less the "not status" pointer (covered by the status rows) — pass |
| Doc-test before vs after | match, allowed differences only — pass |
