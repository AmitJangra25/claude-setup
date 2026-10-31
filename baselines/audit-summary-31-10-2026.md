# Audit — combined summary · 31-10-2026

Step 4 of the read-only audit of Claude Setup (`~/.claude`) approved 31-10-2026
(`.claude/current-task.md`). One place to choose fixes from. Every finding from the three
stage reports is listed here; evidence and detail stay in the stage reports:

- Stage C, security — `baselines/audit-security-31-10-2026.md` (IDs `C1`–`C13`)
- Stage A, clarity — `baselines/audit-clarity-31-10-2026.md` (IDs `CL1`–`CL18`)
- Stage B, cleanup — `baselines/audit-cleanup-31-10-2026.md` (IDs `CB1`–`CB4`)

## 1. In short

**No active leak, exposed secret, or unwanted action was detected within the checked
scope.** The rules in `STANDARDS.md` read cleanly, and nothing needs deleting. The weak
spots are: Bash can read any file on the Mac without asking (C1); reference docs carry
out-of-date facts and too much history (Stage A); and a few outside-traffic switches are
still on (C4–C6, C10).

| Stage | P1 | P2 | P3 | P4 | Fix estimate |
|---|---|---|---|---|---|
| C — security | 0 | 0 | 8 | 5 | ~44k (C2 already fixed) |
| A — clarity | 0 | 0 | 12 | 6 | ~40k |
| B — cleanup | 0 | 0 | 1 | 3 | ~4k |
| **Total** | **0** | **0** | **21** | **14** | **~85k** (35 findings) |

No P2: three security candidates were checked by an independent verifier and all came
down to P3. No finding has happened as a wrong action or is triggered by a named
normal-use step.

**One fix already made:** C2, rtk telemetry turned off on Amit's word (31-10-2026).
Everything else is unfixed.

## 2. The ones that matter most

1. **C1 · P3 · ~10k** — `cat`, `grep`, `find` can read any file on the Mac with no box —
   confirmed in auto mode and through rtk hook dry runs; default-mode behaviour was not
   tested. Exposed: SSH and Ollama keys, `history.jsonl`, `~/.claude.json`, other projects'
   personal data (Emp Portal). Only `STANDARDS.md` prose stops it; harm needs a Claude
   mistake or a prompt injection. Widens the accepted item F3. **Decide F3 again.**
2. **C3 · P3 · ~4k** — the rtk hook says "allow" for any `git add`, even a forced add of
   an ignored private file. Commit and push still box. `ENVIRONMENT.md:224–229` says the
   opposite.
3. **CL1–CL8 + CB1 · ~13k** — nine out-of-date facts in reference docs.
4. **CL18 + CL7 · ~5k** — `SETUP-PLAN.md` (34k words) has no contents list and two
   "start here" blocks, the louder one stale. Biggest readability gain.

## 3. Every finding

Size: small · small-medium · medium · large. Tokens: estimated cost to plan and fix.
"Amit decides" means the fix is a choice, not a correction.

### Security — permissions and reads

| ID | P | Size | Tokens | Finding | Recommendation |
|---|---|---|---|---|---|
| C1 | P3 | small-medium | ~10k | Bash reads any file on the Mac with no box (allow rules + rtk rewrite) | Decide F3 again. If fixing: deny `~/.ssh`, `~/.ollama/id_*`, `history.jsonl`, `.claude.json`, `paste-cache/`, `projects/*/*.jsonl` in every hook spelling plus `Read(...)`; test each |
| C3 | P3 | small | ~4k | rtk hook returns "allow" for `git add` (from `Bash(git add *)` in both `settings.local.json` files); doc says it never matches | Correct `ENVIRONMENT.md` § 3 and FinNode backlog 6 note; optionally remove the two `git add *` rules |
| C8 | P3 | small | ~1k | Allowed test/build commands (`./gradlew *` etc., 4 projects) can run any code | Record as known and accepted |
| C9 | P4 | small | ~1k | Claude Desktop accepted the bypass-mode warning; scheduled tasks on. Available, not used | Amit confirms intended; optionally `"disableBypassPermissionsMode": "disable"` |

### Security — data leaving the Mac

| ID | P | Size | Tokens | Finding | Recommendation |
|---|---|---|---|---|---|
| C2 | P3 | small | ~3k | rtk sent daily usage telemetry; no doc mentioned it | **Fixed 31-10-2026** — disabled. Not done: `rtk telemetry forget`. Still to do: record it in `ENVIRONMENT.md` |
| C4 | P3 | small | ~3k | `gh gist create` not boxed; token has `gist` scope | Box `gh gist create`/`edit`, or drop the scope |
| C5 | P3 | small | ~5k | Ollama cloud not disabled; `ollama-do` loopback guard bypassable with `@` in `OLLAMA_HOST` | `disable_ollama_cloud: true`; guard rejects `@`; box `ollama run *:cloud` |
| C6 | P3 | small | ~2k | pdf-viewer plugin runs unpinned `npx` package every session start, outside permissions | Turn the plugin off unless PDFs are used, or accept |
| C7 | P3 | small | ~4k | Mirror and memory copies reach GitHub with no secret check (clean today) | Add the secret-pattern grep to `drift.sh` |
| C10 | P4 | small | ~2k | Claude Code telemetry and nonessential traffic not switched off | Amit decides, with C2 |
| C11 | P4 | small | ~2k | Account/org UUIDs and Amit's emails in tracked `SETUP-PLAN.md` | Raise before going public (already a `STANDARDS.md` rule); optionally mask UUIDs |
| C12 | P4 | small-medium | ~5k | Voice-Flow git bundle contents never secret-scanned (needs a scratch write) | With Amit's OK: clone to `/tmp`, scan, delete scratch |
| C13 | P4 | small | ~2k | rtk keeps a 20 MB history DB (90 days) and a 6.6 MB untrimmed hook audit log (`RTK_HOOK_AUDIT=1`) | Decide if the audit log is still needed; if not, unset |

### Clarity — out-of-date or contradicting facts

| ID | P | Size | Tokens | Finding | Recommendation |
|---|---|---|---|---|---|
| CL1 | P3 | small | ~1k | `README.md:29` "four `ask` rules" — there are two | "two", add D41 |
| CB1 | P3 | small | ~1k | `.gitignore:110` same stale "four ask rules" | Fix with CL1 |
| CL2 | P3 | small | ~2k | `ENVIRONMENT.md:300` lists 2 `.env` denies; there are 34 | One line, point at `:163` |
| CL3 | P3 | small | ~2k | `ENVIRONMENT.md:695,704` — Debugger v2 "parked", Packbly v2 "stays"; both changed | Mark with 30-10-2026 state |
| CL4 | P3 | small | ~2k | `ENVIRONMENT.md:6–12,572` token figures 21 days old | Amit runs `/context all`; replace |
| CL5 | P3 | small | ~1k | `harness/status.md:109–113` states as fact an rtk-rule mechanism two other docs call unproven | Amit decides which is true |
| CL6 | P3 | small | ~2k | `ENVIRONMENT.md:333–335,626` interruption counts from 18-09-2026 | Date them or use S4's figures |
| CL7 | P3 | small | ~2k | `SETUP-PLAN.md:7` "START HERE" is historical; `README.md` still points there | Folds into CL18 |
| CL8 | P4 | small | <1k | `PROJECTS.md:6` "verified 20-09-2026", edited since | Date last check or drop |

### Clarity — duplicates, maps, history

| ID | P | Size | Tokens | Finding | Recommendation |
|---|---|---|---|---|---|
| CL9 | P3 | medium | ~8k | Four "what is where" maps (`README.md`, `status.md` § *Source of truth*, `CLAUDE.md` comment, `overview.md`) | Merge per Amit's decision; keep the `CLAUDE.md` comment |
| CL10 | P4 | small | ~1k | Status-line thresholds written three times | Keep script header; one line in `ENVIRONMENT.md` |
| CL11 | P4 | small | <1k | "Start from `~/.claude`" in three places | Leave; don't drop the memory copy in CL9 |
| CL12 | P3 | medium | ~10k | `ENVIRONMENT.md` §§ 3 and *What every session loads* bury current figures in dated chains | Current figure + pointer; chains move verbatim to `baselines/` |
| CL13 | P4 | none | — | `SETUP-PLAN.md:29,85–131` very long cell and list item | History; covered by CL18 only |
| CB2 | P4 | small | ~2k | `baselines/README.md` doesn't name audit, handoff or S4 records | One line naming them |
| CB3 | P4 | small | <1k | S4 `.json`/`.py` local-only, embedded in the tracked S4 report (stated there, not re-checked) | Keep |
| CB4 | P4 | none | — | `archive/PHASE2C-REMOVALS.json` same content as its `.md` | Known and accepted |

### Clarity — rules readable two ways, quiet rules, contents lists

| ID | P | Size | Tokens | Finding | Recommendation |
|---|---|---|---|---|---|
| CL14 | P3 | small | ~1k | `STANDARDS.md:162` "when the status line warns" — which of three levels? | Name the level |
| CL15 | P3 | small | ~1k | `STANDARDS.md:116` "never read whole" vs an approved plan that lists the file | "…unless an approved plan says so" |
| CL16 | P4 | small | <1k | `STANDARDS.md:319` vs `:328` on retrying a denial | "…until the denial rules below allow it" |
| CL17 | P4 | none | — | "Only reads without asking" holds by guidance only in auto mode | Known and accepted |
| CL18 | P3 | small-medium | ~5k | `SETUP-PLAN.md` needs a contents list and D1–D43 index; others don't (`STANDARDS.md` no — token guard) | Add to `SETUP-PLAN.md` only |

## 4. Cleanup result (Stage B)

Nothing to delete. **Keep** 54 files plus `jobs/` and `paste-cache/` (Claude Code's own
runtime) · **duplicate** 3 (CB3, CB4, keep) · **dead / junk / test-dummy** 0. Stage A
found no dead rule. `jobs/` and `paste-cache/` were classified by name and date only —
never opened, nothing sent to Ollama.

## 5. What could not be checked

From Stage C (none of these are in Stage A or B):
- Default-mode permission behaviour for C1 and C3: all live tests ran in auto mode, plus
  rtk hook dry runs. For C3, Claude Code's docs say ask and deny rules still apply
  whatever a hook returns (`baselines/global-open-tests.md` item 11); not tested live.
- The Voice-Flow bundle's contents were not scanned (C12).
- The real rtk telemetry payload was not captured (needs a network capture).
- `~/.claude.json` was checked only by key names (off limits).
- Claude Desktop session folders (transcripts) were not inspected.

Stage B did not re-check CB3's "byte for byte" claim, and did not inventory folders
outside its scope (`backups/`, `tmp/`, `feedback/` and other runtime folders).

Already known and accepted, unchanged: T1, T2, T3, F1, F2, F4, F6 (`harness/status.md`
§ *Open*). F3 is widened by C1.

## 6. Decisions Amit already made (31-10-2026) — carry into the fix plans

None done yet. Kept here so they are not lost:
- **P1–P4 scale** replaces P1–P3 in `STANDARDS.md` and `templates/deferred-improvements.md`.
  Every P2 states its real case.
- **Explanations:** simple 1–3 line summary first, technical detail after.
- **Pushback:** only when risky, wasteful, clearly worse, or against Amit's rules; one
  line; Amit decides.
- **Report format:** every finding gives priority, size and token estimate.
- **Overviews:** a contents list at the top of big files; merge the overlapping maps, no
  fourth (CL9).
- **`SETUP-PLAN.md`:** never rewrite history; add only a contents list and a D1–D43
  "decisions in force" index (CL18).
- **`harness/status.md`:** move the *Completed* log out to `baselines/`.
- **`ENVIRONMENT.md`:** current state only; dated history out (CL12).
- **Any rewrite:** rule-by-rule map, independent cross-check, re-run saved `baselines/`
  test prompts before and after; stop if behaviour changes.
- **Token guard:** no fix may raise everyday session tokens. Baseline 3,967 always-loaded
  words (~5.3k tokens est.).

## 7. Suggested fix order

As already planned: **C first, then A, then B**, each in a fresh session with its own plan,
rule-by-rule map, independent cross-check, tests, and commit only after "send it". Commit
the four audit reports before the first fix, when Amit says so.

Recommended groups:
1. **Security — permissions** (C1, C3, C4, C5 box rule): one settings plan, Opus,
   ~22k. Touches `settings.json`; needs every hook spelling tested.
2. **Security — switches and records** (C2 record, C5 Ollama, C6, C7, C9, C10, C13;
   C8 accept): ~17k. Mostly Amit's yes/no each.
3. **Facts** (CL1–CL8, CB1): ~13k, Sonnet-sized, bounded edits.
4. **Structure** (CL9, CL12, CL18, CL7, CL10, CB2, and the *Completed* log move): ~25k+,
   Opus, needs the rule-by-rule map.
5. **`STANDARDS.md` wording** (CL14, CL15, CL16 + the decisions in § 6): one plan,
   token guard checked before and after.
6. **Before going public only:** C11. **Optional:** C12 (needs a scratch write).

## 8. Audit cost

| Stage | Measured | Estimated (main session) | Plan said |
|---|---|---|---|
| C | 135.6k (reviewer 92.6k + verifier 43.0k) | not measurable | ~60k |
| A | — (no agents) | ~75k | ~50k |
| B | 78.0k (inventory helper) | ~25k | ~30k |
| **Total** | **213.6k** | **~100k** | **~140k** |

Roughly **~310k against ~140k planned**. The overrun came from agents (C, B) and reading
`ENVIRONMENT.md` whole (A).

## 9. Checks

`project-rules/drift.sh` 13 current, 0 drifted and `harness/session-check.sh` silent,
before and after every stage. `session-check.sh` is not executable; it runs with `bash`,
as the hook does.
