# Audit corrections · 31-10-2026 audit, corrected 01-11-2026

Accuracy fixes to the 31-10-2026 audit reports, approved by Amit 01-11-2026 (G0 of the
Stage C fix plan). Wording only: no setting, permission, script, project file or history
file changed. The original wording is quoted below, so nothing is lost.

## Caution (Amit, 01-11-2026) — not a standing rule

Clarified by Amit 01-11-2026: shorten only where it improves clarity; never remove a rule
just to save words.

> Do not make files small for their own sake. Shorten only duplication, stale facts, or
> unclear text. Preserve useful detail, history, recovery material, archives, tests, and
> future-use files. Move history intact to baselines/ where needed; never delete it
> silently.

## Corrections

### 1. Summary verdict — `audit-summary-31-10-2026.md` § 1

- **Original:** "**The setup is safe, clear in its rules, and has nothing to delete.** No
  leak, no exposed secret, no unwanted action found. The rules in `STANDARDS.md` read
  cleanly."
- **Corrected:** "**No active leak, exposed secret, or unwanted action was detected within
  the checked scope.** The rules in `STANDARDS.md` read cleanly, and nothing needs
  deleting."
- **Reason:** "safe" claimed more than was checked. The two other parts of the sentence
  are kept, not dropped.
- **Evidence / limit:** the scope limits are listed in the summary's § 5.

### 2. Secret-scan result — `audit-security-31-10-2026.md` § 1 and § 4

- **Original (§ 4):** "Scanned: tracked working tree (0 files), …"
- **Corrected:** "the tracked working tree — 102 tracked files at scan time, 0
  secret-pattern matches; … Compressed files cannot be searched as text: the tarballs
  were streamed separately, the Voice-Flow bundle was not scanned (C12). These patterns
  do not catch every possible secret format." Plus the 01-11-2026 re-run line.
- **Original (§ 1):** "Scans of every tracked file, the full git history and both tarballs
  found no secret-shaped strings."
- **Corrected:** "Scans of every tracked text file, … found no secret-shaped strings; the
  Voice-Flow bundle's contents were not scanned (C12)." The § 1 heading gains "within the
  checked scope".
- **Reason:** "(0 files)" read as "no files were scanned". It meant 0 matches. A text scan
  also cannot see inside the three compressed files.
- **Evidence:** re-run 01-11-2026 with `git grep -lI` and the audit's pattern families,
  printing file names only: **106 tracked (102 + the four audit reports added since), 103
  text files searched, 3 compressed skipped (the bundle and two tarballs), 0 matches** in
  either the strict families or the `key/secret/token/password = …` family.
- **Limit:** the exact count scanned on 31-10-2026 was not re-checked; 102 is the tracked
  count the report gives for that day.

### 3. C1 — "in every mode"

- **Files:** `audit-security-31-10-2026.md` C1 heading; `audit-summary-31-10-2026.md`
  § 2, item 1 (same claim).
- **Original:** "Bash reads any file on the Mac with no box, in every mode." / "… with no
  box, in every mode: SSH and Ollama keys, …"
- **Corrected:** "… with no box — confirmed in auto mode and through rtk hook dry runs;
  default-mode behaviour was not tested."
- **Reason:** both agents ran in auto mode. Default mode was never tested.

### 4. C3 — "with no box in any mode"

- **File:** `audit-security-31-10-2026.md` C3.
- **Original:** "Neither is true: a forced add of an ignored private file is staged with no
  box in any mode." and "**Not tested live:** whether Claude Code lets a hook's "allow"
  override its own ask or deny rules."
- **Corrected:** "The first is not true. On the second: rtk returns allow for `git add`;
  whether Claude Code lets that hook allow override its own ask or deny rules in default
  mode was not tested live." Plus a "What the docs say" line: ask and deny rules are still
  evaluated whatever the hook returns (`baselines/global-open-tests.md` item 11).
- **Reason:** default mode was not tested. Open test 11 already records the documented
  answer, so the report now cites it instead of leaving the question bare.

### 5. What could not be checked — `audit-summary-31-10-2026.md` § 5

- **Original:** six bullets, including "Whether `rtk read <outside path>` boxes in default
  mode" and "Whether a hook "allow" overrides Claude Code's own ask or deny rules (C3)."
- **Corrected:** five explicit bullets: default-mode permission behaviour for C1 and C3
  (with the docs answer for C3); Voice-Flow bundle contents not scanned; real rtk telemetry
  payload not captured; `~/.claude.json` checked only by key names; Claude Desktop session
  folders not inspected. The two default-mode bullets are merged into the first; nothing
  else was dropped. The matching list in `audit-security-31-10-2026.md` § 4 is aligned.

## Checks

| | Before | After |
|---|---|---|
| `project-rules/drift.sh` | 13 current, 0 drifted, 0 stale, 0 missing; exit 0 | 13 current, 0 drifted, 0 stale, 0 missing; exit 0 |
| `harness/session-check.sh` | silent, exit 0 | silent, exit 0 |

Files changed: `audit-summary-31-10-2026.md`, `audit-security-31-10-2026.md`, and this
file (new). Not committed; it goes into the amended `dc92b44` only when Amit says
"send it".
