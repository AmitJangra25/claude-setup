# Doc-test after Phase 4 — 12-11-2026

Purpose: "After" doc-test record for Phase 4 (T20 `STANDARDS.md`), taken after the rewrite and linked updates; compared against `doc-test-after-11-11-2026.md` (reused as "before", Amit 12-11-2026). Also holds the step 5 checks.
Date: 12-11-2026
Status: record
From: Go 2 step 5, `harness/doc-structure-plan.md` § 3 *Phase 4 plan*; questions from `baselines/doc-test-before-01-11-2026.md`

<!-- Content below, word for word. Never edited, except to redact a leaked secret or
     personal data: [REDACTED DD-MM-YYYY, D<n>] (DOCUMENTATION-STANDARD.md § Data and security). -->

**Setup state:** `main` at `c14b5c0` plus the Go 2 edits, uncommitted. `STANDARDS.md` 3,386 words (was 3,391); always-loaded words 4,025 (was 4,030).

## G1 — Git commit vs push

Run by Amit in a fresh session · `~/.claude` · supplied by Amit, 12-11-2026. Version, model, effort and mode not shown.

**Prompt**

```
In one or two sentences, explain the difference between a Git commit and a Git push. Don't open files or use tools.
```

**Reply**

```
A commit saves a snapshot of your changes in your local repository's history, on your machine only. A push sends those commits to a remote repository, such as GitHub, so other people can see them.
```

**Observed** — Pass: two sentences, conclusion first, no plan, no tools. Same as before.

## `/context` — same fresh session (supplied by Amit)

```
- Session loaded normally.
- Total context: 29.9k tokens.
- Memory files: 6 files, 8.1k tokens.
- Skills: 31 skills, 261 tokens.
- The three imports load; no settings error appeared.
```

## Doc-lookup test — 10 fixed questions

Fresh Sonnet agent, read-only, `~/.claude` only, 12-11-2026, 44.4k tokens measured. Questions word for word as in the before record.

### Answers (agent's report)

| Q | Answer | Locations |
|---|---|---|
| 1 | 6 `ask` rules (jq 6). D36 gives 2 (`git stash pop`, `git stash apply`); D44 gives 4 (`git add`, `git -* add`, `git stage`, `git -* stage`). D41 removed D36's `git pull` and `git switch`. | `ENVIRONMENT.md:270-274`; `SETUP-PLAN.md:1405-1414`, `:1546-1547`; jq |
| 2 | deny 74, ask 191 (jq agrees); deny 74 = .env 34 + private stores 34 + project private data 6. | `ENVIRONMENT.md:196-198`; `SETUP-PLAN.md:1546`; jq |
| 3 | D36 (10-10-2026): setup sessions ask before `git pull`, `git switch`, `git stash pop`, `git stash apply`; partly superseded by D41 (30-10-2026), pull and switch removed, stash rules stay. | `SETUP-PLAN.md:1403-1414`, `:68`; `ENVIRONMENT.md:270-272` |
| 4 | D44 (01-11-2026): Stage C fixes — private-store denies (34 → 68), `gh gist create\|edit` and `ollama run *cloud*` asks (188 → 191), setup `git add`/`git stage` asks (2 → 6), two local `git add *` allows removed, Ollama cloud off, `drift.sh` secret scan. | `SETUP-PLAN.md:1539-1552`, `:76`; `ENVIRONMENT.md:211-228`, `:307`; `baselines/stage-c-fix-report-01-11-2026.md` |
| 5 | Grey under 200K, amber from 200K, 300K act at the next task boundary, 400K suggests `/compact`; defined in `statusline/context.py`; `ENVIRONMENT.md` § 2 summarises them and ties them to the 250K plan limit. | `statusline/context.py:10-16`; `ENVIRONMENT.md:170-177` |
| 6 | `baselines/status-completed-11-10-2026.md` (to old T6) and `baselines/status-completed-23-10-2026.md` (11-10 to 23-10); later files `-01-11-2026` and `-11-11-2026` also exist. | `harness/status.md:68-73`; the two record files, line 1 |
| 7 | 87-rule `ask` list (52 → 87, 18-09-2026); ~4.5 interruptions per session (5,188 commands, 49 sessions); ~24 if the left-out commands were added. | `ENVIRONMENT.md:733-734`, `:430-431`, `:346-352` |
| 8 | 52 → 87 (18-09) → 101 → 107 → 112 → 51 (20-09) → 58 (27-09) → 90 (23-10) → 96 (29-10) → 188 (30-10, S4/D41) → 191 (01-11, D44). | `ENVIRONMENT.md:197`, `:262-263`, `:276-278`, `:346-347`; `baselines/environment-history-01-11-2026.md:15-38` |
| 9 | F3: more `.env`/`~/.ssh` read denies; accepted 30-10-2026, widened by audit C1, mostly fixed by D44 (01-11-2026); remaining limits in `ENVIRONMENT.md` § 3; bundled in B27. | `baselines/status-completed-11-11-2026.md:117-122`; `harness/backlog.md:107`; `ENVIRONMENT.md:211-225`; `baselines/audit-security-31-10-2026.md:51-54` |
| 10 | Start setup sessions from `~/.claude`; read `DOCUMENT-MAP.md` first (the one map); before changing a rule, permission or hook, read the `SETUP-PLAN.md` decisions index; for setup work, `.claude/CLAUDE.md` says read `harness/status.md` at Orient. | `README.md:22-23`, `:32-42`; `.claude/CLAUDE.md` (At session start) |

**Agent's notes:** no doc disagrees with jq. `SETUP-PLAN.md:1546` (D44, deny 68) against 74 now is not a conflict — the 6 project-data denies came later (D46). A different "F3" exists in `baselines/audit-29-10-2026.md:165`. Nothing refused by a permission rule; two calls held by auto mode were re-run singly.

## Comparison with `doc-test-after-11-11-2026.md`

| Q | Result |
|---|---|
| 1–4, 6–9 | Match in substance. Q2 adds the deny breakdown; line numbers outside `STANDARDS.md` unchanged. |
| 5 | Match: same thresholds (200K, 300K, 400K) and same defining file. Wording and the cited line range (`:10-16` against `:29`) differ — agent variation; `statusline/context.py` was not changed in Phase 4. |
| 10 | Match in substance. Adds "start from `~/.claude`" (present in the 01-11 before run); does not repeat the session-start warning from `.claude/CLAUDE.md`, which Phase 4 did not change — agent variation, not a lost rule. |

No answer cites `STANDARDS.md`, so the allowed differences (line numbers and section names inside it) did not arise.

## Step 5 checks

| Check | Result |
|---|---|
| `STANDARDS.md` words ≤ 3,391 | 3,386 — pass |
| Always-loaded words ≤ 4,030 | 4,025 — pass |
| `STANDARDS.md` against the approved block | `cmp` identical — pass |
| Old-text record against old `STANDARDS.md` | `cmp` identical, before any edit — pass |
| `doc-check.sh` | 1 known warning; not in format 4 → 3 — pass |
| Link grep | the 4 pointer lines updated; every cited section name is a heading in the new file — pass |
| Three imports load | Amit's `/context`: 6 memory files, no error — pass |
| No rule lost | fresh Sonnet agent, 43.8k: only D1–D5, R1–R4, S1–S4 changed; nothing lost or weakened; every drop covered — pass |
| Doc-test before vs after | match, agent variation only — pass |
