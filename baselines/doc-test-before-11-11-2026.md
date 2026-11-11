# Doc-test before Phase 3 — 11-11-2026

Purpose: "Before" doc-test record for Phase 3 (T16–T19), taken before any rule-file edit. Compared against `doc-test-after-11-11-2026.md`.
Date: 11-11-2026
Status: record
From: Go 2 step 2, `harness/doc-structure-plan.md` § 3 *Phase 3 plan*; method and questions from `baselines/doc-test-before-01-11-2026.md`

<!-- Content below, word for word. Never edited, except to redact a leaked secret or
     personal data: [REDACTED DD-MM-YYYY, D<n>] (DOCUMENTATION-STANDARD.md § Data and security). -->

**Setup state:** `main` at `dd76666`; uncommitted only the known Voice-Flow and vthrudebugger_v1 files. Always-loaded words 4,101. `doc-check.sh`: 1 known warning.

## G1 — Git commit vs push

Run by Amit in a fresh session · `~/.claude` · supplied by Amit, 11-11-2026. Version, model, effort and mode not shown.

**Prompt**

```
In one or two sentences, explain the difference between a Git commit and a Git push. Don't open files or use tools.
```

**Reply**

```
A commit saves a snapshot of your changes in your local repository's history. A push sends those commits to a remote repository, such as GitHub, so others can see them.
```

**Observed** — Pass: two sentences, conclusion first, no plan, no tools.

## Doc-lookup test — 10 fixed questions

Fresh Sonnet agent, read-only, `~/.claude` only, 11-11-2026. Measured 44.4k tokens, 22 tool uses.
Questions word for word from `baselines/doc-test-before-01-11-2026.md` § *Questions, verbatim*. Line numbers are as of `dd76666`.

### Answers (agent's report)

| Q | Answer | Locations |
|---|---|---|
| 1 | 6 `ask` rules (docs and jq agree). D36 gives two (`git stash pop`, `git stash apply`); D44 gives four (`git add`, `git -* add`, `git stage`, `git -* stage`). D36 once had four; D41 removed `git pull` and `git switch`. | `ENVIRONMENT.md:270-274`; `SETUP-PLAN.md:1403-1414`, `:1546-1547`; `baselines/old-document-maps-11-11-2026.md:32`. jq: 6 |
| 2 | deny 74, ask 191 (jq matches docs). Docs also list 36 `allow`, not checked with jq. | `ENVIRONMENT.md:196-198`; `SETUP-PLAN.md:1546`. jq: deny 74, ask 191 |
| 3 | D36 (10-10-2026): setup sessions ask before `git pull`, `git switch`, `git stash pop`, `git stash apply`. D41 (30-10-2026) removed pull and switch; the two stash rules remain. | `SETUP-PLAN.md:1403-1414`, `:68`; `ENVIRONMENT.md:270-272` |
| 4 | D44 (01-11-2026): Stage C security fixes — private-store denies (34 → 68), `gh gist create\|edit` and `ollama run *cloud*` asks (188 → 191), setup `git add`/`git stage` asks (2 → 6), Ollama cloud off, `drift.sh` secret scan. | `SETUP-PLAN.md:1539-1552`, `:76`; `ENVIRONMENT.md:211-228`, `:307-318` |
| 5 | Grey under 200K, amber to 300K, red to 400K, then suggests `/compact`; `QUIET, WARN, HIGH = 200_000, 300_000, 400_000` in `statusline/context.py`; repeated in `ENVIRONMENT.md`. | `statusline/context.py:10-29`; `ENVIRONMENT.md:164-180` |
| 6 | `baselines/status-completed-11-10-2026.md` (to old T6) and `baselines/status-completed-23-10-2026.md` (11-10 to 23-10). | `harness/status.md:66-71` |
| 7 | 87-rule `ask` list; prompt-on-everything would be ~24 interruptions per session against ~4.5 for the actual list (5,188 commands, 49 sessions). | `ENVIRONMENT.md:428-433`, `:733`, `:346-351` |
| 8 | 52 → 87 (18-09) → 101 → 107 → 112 → 51 (20-09) → 58 (27-09) → 90 (23-10) → 96 (29-10) → 188 (30-10, S4/D41) → 191 (01-11, D44). `ENVIRONMENT.md` now keeps only the later steps; earlier detail moved to the baselines file. | `ENVIRONMENT.md:196-197`, `:262-263`, `:276-278`; `baselines/environment-history-01-11-2026.md:15-38` |
| 9 | F3: more `.env` / `~/.ssh` read denies; known and accepted 30-10-2026, widened by audit C1, mostly fixed 01-11-2026 (D44); remaining limits in `ENVIRONMENT.md` § 3. | `baselines/status-completed-11-11-2026.md:117-122`; `harness/backlog.md:107` (B27); `baselines/audit-security-31-10-2026.md:51-54`; `ENVIRONMENT.md:218-225` |
| 10 | Start setup sessions from `~/.claude` (memory is per starting folder); read `README.md` § *Start here*, which points to `DOCUMENT-MAP.md`; read the `SETUP-PLAN.md` *Contents and decisions index* before changing a rule, permission or hook; per `.claude/CLAUDE.md`, read `harness/status.md` at Orient for setup work. | `README.md:22-23`, `:32-42`; `.claude/CLAUDE.md` (Orient bullet); `harness/status.md:55-64` |

**Agent's notes:** no count disagreements between docs and jq. Older baselines carry superseded counts (e.g. `doc-test-after-01-11-2026.md:37` deny 68; live 74) — records, not live docs. No command refused by a permission rule; one parallel batch was held by auto mode and re-run singly.

### Against 01-11-2026 (information only)

- Q1, Q10: the 01-11 allowed differences have landed (`README.md` says six; `README.md` pointer no longer stale).
- Q2: deny 68 → 74; ask 191 unchanged.
- Q7: same figures (87, ~4.5).
- Other answers match in substance; line numbers and some locations moved (Phase 1–2 restructuring).
