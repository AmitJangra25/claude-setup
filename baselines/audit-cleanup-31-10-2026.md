# Audit — Stage B, cleanup · 31-10-2026

Read-only cleanup audit of Claude Setup (`~/.claude`), stage B of the three-stage audit
approved 31-10-2026 (`.claude/current-task.md`). A Sonnet helper took the inventory; the
main session (Opus) judged the labels. Finding IDs are `CB1`… so they do not collide with
`A1`–`A9` (29-10-2026), `C1`–`C13` (Stage C) or `CL1`–`CL18` (Stage A).

## 1. Summary

**Nothing needs deleting.** Every in-scope item supports the system, is history, or is
Claude Code's own runtime data. No dead file, no junk, no test or dummy file that has
outlived its use. Two small format duplicates exist; both are harmless and never loaded.

**0 P1, 0 P2, 1 P3, 3 P4.** Rough total to fix everything: **~4k tokens.**

| Bucket | Count | IDs |
|---|---|---|
| Stale fact Stage A missed | 1 | CB1 |
| Incomplete index | 1 | CB2 |
| Format duplicates (keep) | 2 | CB3–CB4 |

Labels across all in-scope items: **keep** 54 files (18 in `baselines/`, 6 in `archive/`,
4 templates, 26 loose) plus two runtime folders · **duplicate** 3 files (CB3, CB4) · **dead** 0 · **junk** 0 · **test/dummy** 0.

## 2. What was covered

| Area | How |
|---|---|
| `baselines/` (20 files) | listed; first lines read; references searched by filename |
| `archive/` (7 files) | listed; `archive/README.md` read |
| `templates/` (4 files) | listed; references searched |
| `jobs/`, `paste-cache/` | names, counts, dates and git status only — **contents not read**, nothing to Ollama |
| loose top-level files (26) | listed; tracked `.md` purpose read; runtime files size and date only |
| dead or stale rules from Stage A | Stage A report re-read; cross-checked below |

**Not in scope, not inventoried:** `backups/`, `cache/`, `daemon/`, `feedback/`,
`file-history/`, `ide/`, `plugins/`, `session-env/`, `sessions/`, `shell-snapshots/`,
`skills/`, `state/`, `tasks/`, `telemetry/`, `tmp/` — all Claude Code runtime or covered
by Stage C's tracked-files check.

## 3. Labels

### `baselines/` — keep (history and the before/after test set)

`baselines/README.md` defines the folder: dated run records, read only to compare runs.
Amit's rewrite rule (task record) re-runs these saved test prompts before and after any
rewrite, so the probe runs are in active use, not leftovers.

| File | Label | One line |
|---|---|---|
| `2026-09-28.md`, `-run2.md` | keep | behaviour baseline runs 1–2 |
| `2026-09-29.md`, `-run2`…`-run4.md` | keep | FinNode and Voice-Flow probes |
| `03-10-2026.md` | keep | check session 30-09 and 03-10; no doc cites it by name, covered by the README's "one file per run" |
| `09-10-2026.md` | keep | Check 2 runs; same, no citation by name |
| `09-10-2026-run2.md` | keep | T4 permission-mode runs |
| `audit-29-10-2026.md`, `audit-*-31-10-2026.md` | keep | audit reports |
| `global-open-tests.md` | keep | live index of open items |
| `project-handoffs-29-10-2026.md` | keep | open project follow-ups |
| `s4-permissions-30-10-2026.md` | keep | S4 record; embeds the two files below |
| `s4-proposal-30-10-2026.json`, `s4-replay-30-10-2026.py` | **duplicate** | see CB3 |
| `status-completed-*.md` (2) | keep | moved-out status logs |
| `t6-removals.md` | keep | T6 manifest |

No two files share a size; no exact duplicate.

### `archive/` — keep

All seven tracked. Three items cannot be recovered from git (the Voice-Flow bundle and two
`.tar.gz` originals) — the reason `archive/` exists. `PHASE2-REMOVALS.md` and
`PHASE2C-REMOVALS.md` are recoverable but kept for readability (`archive/README.md`).
`PHASE2C-REMOVALS.json` is a **duplicate** — CB4.

### `templates/` — keep

All four are named in `STANDARDS.md` § *How a task runs*. `handoff.md` and
`deferred-improvements.md` are in use; `new-project.md` and `roadmap.md` are for the next
new project (future use).

### `jobs/` and `paste-cache/` — keep (Claude Code runtime, not the setup's)

- `jobs/`: 46 hash-named folders (04-09 to 17-10-2026) and a 2-byte `pins.json`.
- `paste-cache/`: ~401 `.txt` files, 4.4 MB, 25-09 to 31-10-2026, each mode 600.

Both are gitignored and untracked. Claude Code writes them; the setup does not own their
lifetime, and deleting by hand could break what it expects. Their privacy exposure was
Stage C's question; it found them untracked and mode 600 (`audit-security-31-10-2026.md:199–202`).

### Loose top-level files — keep

- **Tracked (11):** `CLAUDE.md`, `STANDARDS.md`, `RTK.md`, `OLLAMA.md`, `ENVIRONMENT.md`,
  `SETUP-PLAN.md`, `README.md`, `PROJECTS.md`, `REPOS.md`, `settings.json`, `.gitignore`.
  All in use. `REPOS.md` (unchanged since 06-08-2026) lists outside GitHub repos to
  consider; no overlap with `PROJECTS.md`; cited by `CLAUDE.md`, `README.md` and
  `ENVIRONMENT.md`. Keep — future use.
- **Ignored runtime (15):** `history.jsonl`, `daemon.log`, `gh-pr-status-cache.json`,
  `stats-cache.json`, `settings.local.json`, `.last-cleanup`, `.last-update-result.json`,
  `policy-limits.json*` (4), `remote-settings.json*` (4). Written by Claude Code; not read.

### Dead or stale rules from Stage A

Stage A found **no dead rule**. Its stale facts CL1–CL8 stay in Stage A's fix plan; Stage B
does not re-list them. One more copy of CL1's stale fact turned up here — CB1.

## 4. Findings

Size: small · small-medium · medium · large. Tokens are the estimated cost to plan and fix.

**CB1 · P3 · small · ~1k** — `.gitignore:110` says `.claude/settings.json` holds "four ask
rules". It holds two (Stage A, CL1, checked with `jq`). Same stale fact as `README.md:29`;
Stage A did not have `.gitignore` in scope. *Fix:* change both lines in CL1's fix.

**CB2 · P4 · small · ~2k** — `baselines/README.md` says "one file per run" and names four
exceptions. The folder now also holds audit reports (3), a handoff list and the S4 record
with its two local files — none named. A reader cannot tell them from run records.
*Fix:* one line naming audit and follow-up records as a further kind.

**CB3 · P4 · small · <1k** — `baselines/s4-proposal-30-10-2026.json` (9 KB) and
`s4-replay-30-10-2026.py` (11 KB) are gitignored, so they live only on this Mac.
`s4-permissions-30-10-2026.md:147` and `:290` say both are embedded in it — the JSON
rewrapped, the script byte for byte (stated there, not re-checked here). **Duplicate.**
*Recommendation:* keep — the `.py` is the runnable form, they cost no tokens, and the
tracked copy survives the Mac. Delete only if Amit wants the folder tidy.

**CB4 · P4 · none** — `archive/PHASE2C-REMOVALS.json` holds the same content as
`PHASE2C-REMOVALS.md` in another format; both recoverable from git. **Duplicate.**
*Recommendation:* known and accepted — never loaded, deliberately archived.

## 5. Checks before and after

| Check | Before | After |
|---|---|---|
| `project-rules/drift.sh` | 13 current, 0 drifted | 13 current, 0 drifted |
| `harness/session-check.sh` (run with `bash`, as the hook does) | silent | silent |

## 6. Cost

Helper (Sonnet, inventory): **78.0k tokens measured**, against a ~15k estimate — it ran
26 tool calls over 20+ folders and files. Main session: Unknown, ~25k est. Stage total
~100k against the ~30k plan estimate.
