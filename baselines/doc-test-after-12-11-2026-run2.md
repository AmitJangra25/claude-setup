# Doc-test after Phase 5 — 12-11-2026 (run 2)

Purpose: "After" doc-test record for Phase 5 (T21 `ENVIRONMENT.md`), taken after the rewrite and linked updates; compared against `doc-test-after-12-11-2026.md` (Phase 4's result, reused as "before"). Also holds the step 5 checks and Amit's Go 2 decisions.
Date: 12-11-2026
Status: record
From: Go 2 step 5, `harness/doc-structure-plan.md` § 3 *Phase 5 plan*; questions from `baselines/doc-test-before-01-11-2026.md`

<!-- Content below, word for word. Never edited, except to redact a leaked secret or
     personal data: [REDACTED DD-MM-YYYY, D<n>] (DOCUMENTATION-STANDARD.md § Data and security). -->

**Setup state:** `main` at `596db59` plus the Go 2 edits, uncommitted. `ENVIRONMENT.md` 396 lines, 7,680 words (was 888 / 8,801). Named `-run2` because `doc-test-after-12-11-2026.md` (Phase 4) already existed and is this run's "before" (Amit, 12-11-2026).

## G1 — Git commit vs push

Run by Amit in a fresh session · `~/.claude` · supplied by Amit, 12-11-2026. Version, model, effort and mode not shown.

**Prompt**

```
In one or two sentences, explain the difference between a Git commit and a Git push. Don't open files or use tools.
```

**Reply**

```
A commit saves a snapshot of your changes in your local repository, on your own machine only. A push sends those commits to a remote repository such as GitHub, so other people can see them.
```

**Observed** — Pass: two sentences, conclusion first, no plan, no tools. Same as before.

## `/context` — same fresh session (supplied by Amit)

```
- Session loaded normally.
- Total context: 30k tokens.
- Memory files: 6 files, 8.1k tokens.
- Skills: 31 skills, 261 tokens.
- The three imports load; no settings error appeared.
```

Against before (29.9k, 6 files 8.1k, 31 skills 261): same. `ENVIRONMENT.md` is not imported, so its rewrite does not change startup.

## Doc-lookup test — 10 fixed questions

Fresh Sonnet agent, read-only, `~/.claude` only, 12-11-2026, 52.4k tokens measured. Questions word for word as in the before record. Run before the 11 figure labels and the `RTK.md` note (below); those add words only and change no answer.

### Answers (agent's report)

| Q | Answer | Locations |
|---|---|---|
| 1 | 6 `ask` rules (jq: ask 6, deny 0). D36 gives 2 (`git stash pop`, `git stash apply`); D44 gives 4 (`git add`, `git -* add`, `git stage`, `git -* stage`). | `ENVIRONMENT.md:157`; `SETUP-PLAN.md:1403-1414`, `:1546-1548` |
| 2 | ask 191, deny 74 (jq agrees); docs also list allow 36 (not jq-checked). | `ENVIRONMENT.md:139-143`, `:161` |
| 3 | D36 (10-10-2026): setup sessions ask before `git pull`, `git switch`, `git stash pop`, `git stash apply`; partly superseded by D41 (30-10-2026), pull and switch removed, stash rules stay. | `SETUP-PLAN.md:1403-1414`, `:68`; `ENVIRONMENT.md:157` |
| 4 | D44 (01-11-2026): Stage C fixes — private-store denies (34 → 68), `gh gist create\|edit` and `ollama run *cloud*` asks (188 → 191), setup `git add`/`git stage` asks; in force. Record: `baselines/stage-c-fix-report-01-11-2026.md`. | `SETUP-PLAN.md:1539-1552`, `:76`; `ENVIRONMENT.md:159-163` |
| 5 | 200K grey, 300K amber (act at the next task boundary), 400K red, then suggests `/compact`; constants `QUIET, WARN, HIGH = 200_000, 300_000, 400_000`. | `statusline/context.py:10-29`; `ENVIRONMENT.md:111` |
| 6 | `baselines/status-completed-11-10-2026.md` (to 11-10-2026) and `baselines/status-completed-23-10-2026.md` (11-10 to 23-10-2026); later `-01-11-2026` and `-11-11-2026`. | `harness/status.md:75-78` |
| 7 | 87 `ask` rules (52 → 87, 18-09-2026); ~4.5 interruptions per session (5,188 commands, 49 sessions); ~24 if the left-out commands asked. The 52 → 87 step is now only in `baselines/environment-old-12-11-2026.md`. | `ENVIRONMENT.md:167`, `:323`; the old-text record |
| 8 | 52 → 87 (18-09) → 101 → 107 → 112 → 51 (20-09) → 58 (27-09) → 90 (23-10) → 96 (29-10) → 188 (30-10, D41) → 191 (01-11, D44). Live § 3 gives 96 → 188 → 191; the earlier steps are in `baselines/environment-history-01-11-2026.md:15-38` and the old-text record, pointed to from § *Older records*. | `ENVIRONMENT.md:140`, `:153`, `:155`, `:393`; the two records |
| 9 | F3: more `.env`/`~/.ssh` read denies; accepted 30-10-2026, widened by audit C1, mostly fixed by D44 (01-11-2026); remaining limits in `ENVIRONMENT.md` § 3; bundled in B27. | `harness/backlog.md:107`; `ENVIRONMENT.md:229`; `baselines/audit-security-31-10-2026.md:51-54`; `baselines/status-completed-11-11-2026.md:117-122` |
| 10 | Start from `~/.claude`; read `DOCUMENT-MAP.md` first (the one map); for setup work, `.claude/CLAUDE.md` says read `harness/status.md` at Orient. | `README.md:22-23`, `:32-36`; `DOCUMENT-MAP.md:1-8`; `.claude/CLAUDE.md` (At session start) |

**Agent's notes:** no doc disagrees with jq. `SETUP-PLAN.md:1546` (deny 68) against 74 now is history — the 6 project-data denies came with D46. A different "F3" exists in `baselines/audit-29-10-2026.md:165`. No pointer led to a missing section. Two calls held by auto mode were re-run singly; nothing refused by a deny rule; nothing edited.

## Comparison with `doc-test-after-12-11-2026.md`

| Q | Result |
|---|---|
| 1–6, 9, 10 | Match in substance. Differences are line numbers and section names inside `ENVIRONMENT.md` (allowed). |
| 7, 8 | Match in substance — same figures and sequence. Their older steps now come from the old-text records, not the live file, because T21 moved that history out as planned; § *Older records* points to them. **Counted as a match (Amit, 12-11-2026).** |

## Amit's Go 2 decisions (12-11-2026)

- **Precondition:** HEAD `596db59` (the Go 1 commit), not `df18bdb` as first written; `ENVIRONMENT.md` identical at both, so the plan's line map held.
- **After-record name:** `-run2`, so Phase 4's record is not overwritten.
- **Word limit 7,300 → 7,636:** the Go 1 figure was an estimate — the private-store deny rule blocked counting the draft; the approved text measured 7,636.
- **Word limit 7,636 → 7,690:** labelling the 11 undated figures adds about 30–50 words. Line limit stays ≤ 400.
- **Checker fix:** `harness/doc-check.sh` empty-section test skips lines inside ``` code blocks — the `#` comment lines in the pre-commit script inside `ENVIRONMENT.md` were read as headings (2 false warnings). Change: two lines in the awk — `/^```/ { fence=!fence; open=0; next }` and `fence { next }`. A fence counts as content, so a heading followed by a code block is not empty. Tested on sample input: real empty sections still warn. Whole output before and after the fix differed only by the 2 false warnings.
- **11 figures labelled** (no-content-lost check, success check 4): 6.7 MB hook log — date not recorded · `ps aux`/grep savings — method not recorded · `rtk discover` ~36.3K — date not recorded · 615 permission entries — date not recorded · 3,874 always-loaded words — method not recorded · `engineering` −0.9k — 26-09-2026 (old record's table) · skills 49 → 48 — date not recorded · `engineering` 871 tokens — date not recorded · `RTK.md` 915 → 1,190 chars, 491 measured — 26-09-2026 (old record's table) · system prompt 2.2k → 3.2k and the later "1k" — date not recorded · "about 10k on the same day" — day not recorded.
- **`RTK.md` 641 against 404:** both kept. 641 is part of the 7.6k sum (6.7k + 641 + 214); 404 fits the table's 8.2k. `c808989` shortened `RTK.md` on 01-11-2026, and the table is after it. Note added at the 641: "before `c808989` shortened `RTK.md` the same day; the table below is after it". Inferred from git history, not measured. No rtk setting, hook or `RTK.md` change.

## No content lost

Fresh Sonnet agent, read-only, 89.9k tokens measured: old-text record and `baselines/environment-history-01-11-2026.md` against the new file. **Pass:** no current rule, warning, limitation, safety note or setting lost or weakened; every moved item is history, superseded or a duplicate and is covered by § *Older records*; every `§` pointer in the new file resolves; nothing contradicts the 01-11-2026 history record. Judgement call noted: the 18-09-2026 list of newly fenced commands (`tccutil`, `sudo`, `sqlite3`, `gem install` …) is no longer named in the live file — classed as history by the approved plan; live rules are in `settings.json`. Its findings on undated figures and the `RTK.md` mismatch were fixed as above.

## Step 5 checks

| Check | Result |
|---|---|
| 1. Section order; tool subsections | `doc-check.sh` with `ENVIRONMENT.md` in CHECKED finds them — pass |
| 2. No content lost | fresh Sonnet agent — pass |
| 3. Old-text record against old `ENVIRONMENT.md` | `tail -n +10` `cmp` identical, before any edit — pass |
| 4. Every figure dated with method, or "not recorded" | 11 labelled after the agent's check — pass |
| 5. ≤ 400 lines, ≤ 7,690 words | 396 / 7,680 — pass |
| 6. `doc-check.sh` | known warning + `ENVIRONMENT.md` size warning; not in format 3 → 2 — pass |
| 7. Link grep | `harness/overview.md:23` updated; every other live pointer resolves; memory note `skill-overrides-name-only.md:40` known stale, out of scope — pass |
| 8. Doc-test and `/context` | match (Q7, Q8 by Amit's decision); three imports load — pass |
| `ENVIRONMENT.md` against the approved block | `cmp` identical when written; the 11 labels and the `RTK.md` note were added afterwards on Amit's approval |
