# Audit — Stage A, clarity and overviews · 31-10-2026

Read-only clarity audit of Claude Setup (`~/.claude`), stage A of the three-stage audit
approved 31-10-2026 (`.claude/current-task.md`). Opus, main session, no helper agents.
Finding IDs are `CL1`… so they do not collide with the 29-10-2026 audit's `A1`–`A9` or
Stage C's `C1`–`C13`.

## 1. Summary

**The rules are clear; the reference docs carry stale facts and too much history.**
`STANDARDS.md` reads cleanly and has no contradiction that changes what Claude does. The
problems sit in `ENVIRONMENT.md`, `README.md`, `PROJECTS.md` and `SETUP-PLAN.md`'s top
block: eight stale or self-contradicting facts, four overlapping "what is where" maps,
and two long history chains a reader must walk to reach the current figure.

**0 P1, 0 P2, 12 P3, 6 P4.** No finding has happened as a wrong action or is triggered by
a named normal-use step, so none is P2. Rough total to fix everything: **~40k tokens**;
the stale facts alone (CL1–CL7): **~12k**.

| Bucket | Count | IDs |
|---|---|---|
| Stale or contradicting facts | 8 | CL1–CL8 |
| Duplicates and overlapping maps | 3 | CL9–CL11 |
| Hard to read (history in current-state docs) | 2 | CL12–CL13 |
| Rules readable two ways | 3 | CL14–CL16 |
| Quiet rules (prose that must always hold) | 1 | CL17 |
| Contents lists needed | 1 | CL18 |

## 2. Files read

All in scope, all readable.

| File | How |
|---|---|
| `STANDARDS.md`, `CLAUDE.md`, `RTK.md`, `OLLAMA.md`, `.claude/CLAUDE.md`, `MEMORY.md` | whole (always loaded) |
| `harness/status.md`, `harness/overview.md`, `harness/cross-check.md` | whole |
| `README.md`, `PROJECTS.md`, `templates/deferred-improvements.md` | whole |
| `ENVIRONMENT.md` | whole — the approved scope listed it; see CL15 |
| the six setup memory notes | whole |
| `SETUP-PLAN.md` | lines 1–205 (START HERE block, *Next session*, *How a pass is run*), every heading, and the D40–D43 locations. Not read whole, per `STANDARDS.md:116` |

Facts checked against live files: `settings.json` counts (`jq`: allow 37, ask 188, deny
34); `.claude/settings.json` ask rules (`jq`: 2); `statusline/context.py:29` thresholds
(200K/300K/400K); `SETUP-PLAN.md` section anchors cited elsewhere (all exist);
`baselines/global-open-tests.md` item 2; word counts (`SETUP-PLAN.md` 34,152,
`ENVIRONMENT.md` 7,798, `STANDARDS.md` 3,419).

## 3. Findings

Size: small · small-medium · medium · large. Tokens are the estimated cost to plan and fix.

### Stale or contradicting facts

**CL1 · P3 · small · ~1k** — `README.md:29` says `.claude/settings.json` holds "four
`ask` rules (D36)". It holds two (`jq`); S4 removed the other two (D41), as
`ENVIRONMENT.md:182` already says. *Fix:* change "four" to "two", add D41.

**CL2 · P3 · small · ~2k** — `ENVIRONMENT.md:300` says deny is `Read(//**/.env)` and
`Read(//**/.env.*)` — two rules. The same file at `:163` and `jq` say 34 (Bash `.env`
denies added 29-10-2026). A reader of § *deny* gets the old picture. *Fix:* one line
listing what the 34 cover, pointing at `:163`.

**CL3 · P3 · small · ~2k** — `ENVIRONMENT.md` § *Project-tree decisions* (`:689–706`)
says "Debugger v2 is parked" (`:695`) and "Packbly v2 … the entry stays exactly as it is"
(`:704–705`). Newer facts: Debugger v2 is "next up" (`:682`, `PROJECTS.md:34`), and Packbly
v2 is detached from Claude Setup (`harness/status.md:154`). *Fix:* mark both entries with
the 30-10-2026 state.

**CL4 · P3 · small · ~2k** — `ENVIRONMENT.md:6–12` gives "about 6.3k tokens" per turn for
the imported files (10-10-2026), and `:572` says memory files "6.8k at the latest
reading". The 31-10-2026 baseline in the task record is 3,967 words (~5.3k est.). Different
methods, so not a proven drop, but the file presents a 21-day-old figure as current.
*Fix:* Amit runs `/context all` in a fresh setup session; replace both lines with that
reading.

**CL5 · P3 · small · ~1k** — `harness/status.md:109–113` states as fact that
`Bash(rtk proxy *)` came back when a wrapped commit was approved with "don't ask again".
`baselines/global-open-tests.md:46–47` and `ENVIRONMENT.md:345–346` say that mechanism is
**not proven**. *Fix:* status line says "observed after", not "returned when", or the test
file is closed with that evidence. Amit decides which is true.

**CL6 · P3 · small · ~2k** — `ENVIRONMENT.md:333–335` ("~24 interruptions a session
instead of ~4.5") and `:626` ("4.5 per session") were measured against the 87-rule list of
18-09-2026. `:193–195` says such figures were dropped because never re-measured, and S4's
30-10-2026 replay has current numbers (`:170–171`). *Fix:* mark both as 18-09-2026 figures
or replace with S4's.

**CL7 · P3 · small · ~2k** — `SETUP-PLAN.md:7` "► START HERE" heads a block that its own
`:11–12` calls historical since 29-09-2026. `README.md:18` and `:37` still send readers
there first. `SETUP-PLAN.md:167` ("Next session: start here, not at the top") correctly
says `harness/status.md` first. Two "start here"s, the louder one stale. *Fix:* folds into
CL18 — the contents list at the top names the real entry point; `README.md` points at it.

**CL8 · P4 · small · <1k** — `PROJECTS.md:6` "Verified against the filesystem
20-09-2026", but entries were changed 30-10 and 31-10-2026. *Fix:* date the last check, or
drop the line.

### Duplicates and overlapping maps

**CL9 · P3 · medium · ~8k** — Four places describe what each file is or owns:
`README.md` § *What is in here* (`:9–29`), `harness/status.md` § *Source of truth*
(`:208–221`), the `CLAUDE.md:5–11` comment, and `harness/overview.md:3–5` (pointers to
the first two). `README.md` and `status.md` overlap most. Amit's decision (task record):
merge, do not add a fourth. *Recommendation:* `README.md` keeps the file table;
`status.md` keeps only the "who owns which fact" table; `overview.md` keeps its pointers;
the `CLAUDE.md` comment stays (it is the only map loaded every turn, 34 tokens).

**CL10 · P4 · small · ~1k** — Status-line threshold history is written three times:
`ENVIRONMENT.md:138–145`, `:481–490`, and `statusline/context.py:10–25`. *Fix:* keep the
script header (it sits beside the values); `ENVIRONMENT.md` keeps one line and points
there.

**CL11 · P4 · small · <1k** — "Start setup sessions from `~/.claude`" is in `README.md:24`,
`SETUP-PLAN.md:17–21` and memory `claude-setup-status`. The memory note is the one that
loads; the others are fine as reference. *Recommendation:* leave; listed only so the
merge in CL9 does not drop the memory copy.

### Hard to read

**CL12 · P3 · medium · ~10k** — `ENVIRONMENT.md` § *3. Permissions* (`:165–195`) walks a
30-line chain of dated count changes (87 → 101 → 107 → 112 → 51 → 58 → 90 → 96 → 188)
around the current figure. § *What every session loads* (`:376–426`) has three
"historical / superseded / do not compare" paragraphs around its one current table, and
`:481–490` repeats superseded status-line values. Amit's decision: `ENVIRONMENT.md` holds
current state only. *Fix:* current figure plus one pointer per section; the chains move
verbatim to a dated `baselines/` file.

**CL13 · P4 · none here** — `SETUP-PLAN.md:29` is a ~150-word table cell, and `:85–131`
one ~650-word list item. History; Amit's rule is never rewrite it. Covered by CL18's
contents list only.

### Rules readable two ways

**CL14 · P3 · small · ~1k** — `STANDARDS.md:162` "When the status line warns" — the
script has three levels (`context.py:14–16`: 200K first warning, 300K act at the next task
boundary, 400K compact). Which one triggers "finish the current piece"? *Fix:* name the
level in `STANDARDS.md` (a few words; no token rise worth counting).

**CL15 · P3 · small · ~1k** — `STANDARDS.md:116` "Never read `SETUP-PLAN.md` or
`ENVIRONMENT.md` whole", while this audit's approved scope lists `ENVIRONMENT.md` as a
file to audit. This session read it whole (~12k tokens est.) on the plan's word. The rule
does not say whether an approved plan overrides it. *Fix:* "…whole unless an approved plan
says so", or audits read by section.

**CL16 · P4 · small · <1k** — `STANDARDS.md:319` "if it was declined, do not retry it"
and `:328` "A mistake: … try once more". `:319` ends "The denial rules below are
unchanged", which settles it, but only on a careful read. *Fix:* "…do not retry until the
denial rules below allow it."

### Quiet rules — prose that must always hold

Checked: no-commit (`*git commit*` asks), push and main (every push asks), `rtk proxy`
for reads only (dangerous inner forms ask), `.env` (34 denies; not airtight, known),
deletion (`rm` asks), `git checkout` (asks). Ollama data and cloud: Stage C, C5. Each is
enforced or already recorded.

**CL17 · P4 · none · known** — `STANDARDS.md` § *What may happen without asking*: "Only
reads … no edit". In auto mode the Edit and Write tools run with no box, so this holds by
guidance only. A setting would box every approved edit too. Listed so it is a choice, not
a surprise. *Recommendation:* known and accepted; no change.

### Contents lists needed

**CL18 · P3 · small-medium · ~5k** — By size and heading count:
- `SETUP-PLAN.md` — 34,152 words, 59 top-level headings, no contents list, two competing
  "start here" blocks (CL7). Needs one, plus the D1–D43 "decisions in force" index Amit
  already chose. Largest gain of any finding here.
- `ENVIRONMENT.md` — has one (`:24–35`); accurate apart from subsections. Keep.
- `STANDARDS.md` — 3,419 words, always loaded. A contents list would raise per-turn
  tokens, which the token guard forbids. No.
- All other in-scope files are short enough not to need one.

## 4. Checks before and after

| Check | Before | After |
|---|---|---|
| `project-rules/drift.sh` | 13 current, 0 drifted | 13 current, 0 drifted |
| `harness/session-check.sh` | silent | silent |

## 5. Cost

Estimated ~75k tokens for this stage, main session only; not measured — no helper agent
ran, and the main session's own use between measurements is Unknown. Over the ~50k
estimate, mostly from reading `ENVIRONMENT.md` whole (CL15).
