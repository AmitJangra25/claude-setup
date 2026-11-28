# Phase 16 plan — Full audit and priorities

Purpose: The approved plan for Phase 16 and the Target Architecture v1 that Phases 17–19 build to.
Audience: Claude, helpers and Amit.
Read when: Starting or resuming any Phase 16 session; planning Phases 17–19.
Owner: Setup sessions (changes are Amit's decision).
Update rule: Each Phase 16 session records its result in § *Results*. Archived unchanged to `archive/` when Phase 16 closes. Size limit about 300 lines (§ 1); over it, propose a split.
Related: `harness/status.md` · `harness/doc-structure-plan.md` § 3 *Phases 12–21* (programme brief and checklist) · `harness/backlog.md` B71–B78 · `SETUP-PLAN.md` D59
Status: active
Last reviewed: 28-11-2026

---

## Start cold

- **Branch:** `main` in `~/.claude` (no branches here, `.claude/CLAUDE.md`). Plan approved 28-11-2026 (Amit), after `plan-reviewer` (Opus, full, concerns, 10 findings, all applied).
- **Read first:** this file · `harness/status.md` § *Next gate* · `.claude/current-task.md`.
- **Decisions taken:** D59 (§ *Decisions*). **Open items:** each WP's `Open:` lines. **Blockers:** none.
- **Phase 16 is planning and audit only:** no building, file moves, commits, pushes, installs or permission changes. Only exception: WP0 (B63), its own plan and approval.

## Goal and success measures

**Goal (Amit):** "A simple library: one fact has one home, other places link to it, and Claude can find the right instruction without loading unnecessary material." Phase 16 ends with "an approved P1/P2/P3 repair list for Phases 17–19." After Phase 18 the setup's shape is final and reads as designed once; files never grow big again.

1. Inventory covers all 179 tracked files (`git ls-files`, 28-11-2026) plus the untracked items (WP1 definition); each row one home and a verdict.
2. Coverage tables cover all 58 D-numbers and every rule line in `SETUP-PLAN.md`, `harness/doc-structure-plan.md`, `harness/status.md`, the live rule files and the memory notes; each item one of four outcomes (§ 7).
3. Every section to be archived passes the nothing-lost proof (§ 7).
4. Every live file has a size limit and a rollover rule.
5. 0 items with two homes; every finding cites path + heading.
6. Every-session load estimate ≤ 10.63k (our part, `/context` 27-11-2026).
7. One phase timeline, no phase number twice; one finish definition.
8. Every item agreed for Phases 16–18 has a phase and a P-level in the final list; every Phase 16 checklist line has a work package.
9. Amit approves the list.

## Decisions (D59, Amit, 28-11-2026)

1. **Deciding rule.** If skipping an item now means rewriting the same live file again later, it goes in Phases 16–18. A new capability, a project-specific task, or anything that can wait without another rewrite is future work for Phase 20 or later.
2. **Areas are a tag, not folders.** Layers: Shared (one copy in `~/.claude`: rules, safety, skills, reviewers, templates, never copied per Area) · Office (VT, DB1, DB2, VOS Dashboard, Emp Portal — final) · Professional (FinNode, Voice Flow, AtWorkpe, SecondBrain, a friend's project with a "someone else's data" warning) · Personal (not a project: everyday tasks such as money questions).
3. **Area checkpoint, every task.** Project folder open → its `CLAUDE.md` line `Area: Office` or `Area: Professional` decides. No project → Amit's first message decides. Unclear and the task touches a project → one short question. Claude states the Area in one line before starting. `PROJECTS.md` Area column is a checked index, not a second home. Home of the rule: `STANDARDS.md` step 1 *Orient* (Phase 18).
4. **Office notes off GitHub.** Replace `.gitignore` line `!projects/*/memory/*.md` with named allow-lines for non-Office projects (Phase 17). 9 Office notes already on GitHub (5 DB1, 4 DB2); history removal is B77, Amit's separate decision.
5. **Coverage outcomes:** Kept · Merged · Archived as history (Amit approves by section) · Dropped (Amit's approval and a reason).
6. **Size and archive rule:** a live file over about 300 lines gets a rollover proposed in the same task; Amit approves; a replaced item leaves a one-line pointer; old text moves to `archive/`, never "git history only" (D54 over D49's git-history option). Written into `DOCUMENTATION-STANDARD.md` § *Growth and rollover* in Phase 17; projects adopt it in Phase 20.
7. **Phases renamed:** 17 Rewrite 1 (structure), 18 Rewrite 2 (loaded and reference files), 19 Rewrite 3 (polish and close). P1–P4 keep meaning urgency only. `STANDARDS.md` and `ENVIRONMENT.md` move from 17 to 18.
8. **Phase 16 cost:** 6 sessions, about 0.95–1.3M tokens including helpers (estimate).
9. **Not built:** separate Office Claude setup (Claude's suggestion, not Amit's request; project separation and Office notes off GitHub cover the need today, B75) · prompt library (a prompt used 4 times becomes a skill or template) · new top-level folders.

## Sessions

| Session | Work | Main (est.) | Helpers (est.) |
|---|---|---|---|
| 16.1 | Plan, review, approval, records — **done 28-11-2026** | — | 46,723 measured |
| 16.2 | WP0 B63 (own plan) · WP1 · WP2 · security pass | 120–160K | 80–120K |
| 16.3 | WP3a coverage: `SETUP-PLAN.md`, all D bodies gathered | 120–170K | 80–120K |
| 16.4 | WP3b coverage: `doc-structure-plan.md`, `status.md` · WP3c live-file rule sweep | 150–200K | 80–120K |
| 16.5 | WP4 findings, verdicts, timeline, finish line, size limits | 150–200K | 40–60K |
| 16.6 | WP5 final architecture, P-list, `plan-reviewer`, approval, records | 120–150K | 50K |

Check context at about 220K; handoff at every break; split a piece that will not fit before starting it.

## Work packages

- **WP0 — B63.** `harness/doc-check.sh` parses every `skills/*/SKILL.md` header with a real YAML parser. Own small plan, test (a broken temp copy fails, only it fails; today's 6 skills pass; same warnings), `change-reviewer` Sonnet, Amit's approval. Open: which parser exists (`ruby`, or `python3` with PyYAML).
- **WP1 — Inventory (Sonnet helper; main checks counts).** Every tracked file; untracked items = `git status --short --ignored` minus Claude-managed caches, plus `settings.local.json` files, plugin and MCP config (`~/.claude.json`), `skills/synced/`, `.git/hooks/`; 17 memory folders; every tool Amit uses (VS Code, Antigravity, Android Studio, others). Memory audit: keep, merge into a rule, or archive, incl. the skill-overrides contradiction. Office-notes content check (DB1, DB2, VT, VOS, EP), read-only: company code, client data, credentials — not the company name alone. Done when measure 1 holds and every privacy hit has a verdict.
- **WP2 — Claude Code facts (`claude-code-guide`).** Fixed paths; does `~/.claude/rules/` load by itself; can search skip `archive/`; nested skill folders. Done when each answer has a source.
- **WP3 — Coverage (Sonnet helper drafts in `harness/drafts/phase16/`; main checks every D-row and a sample).** 3a `SETUP-PLAN.md` — gather D54–D58 bodies from `doc-structure-plan.md`, note D15/D17 order. 3b `doc-structure-plan.md`, `status.md`. 3c live rule files (`STANDARDS.md`, `DOCUMENTATION-STANDARD.md`, `WRITING-GUIDE.md`, `ENVIRONMENT.md`, `.claude/CLAUDE.md`, `RTK.md`, `OLLAMA.md`) and memory notes, words: never · always · do not · don't · must · only · needs approval. Plus the nothing-lost proof per section. Done when measures 2, 3 and 5 hold.
- **WP4 — Findings and verdicts.** Every leftover: do · park with trigger or date · drop. Every Phase 16 checklist line (table below). Phase timeline (September series "Early"). One finish line (`harness/overview.md` + the programme's six final checks). Size limits set against real sizes. Target Architecture checked against D53 (seven document types, roles, `DECISIONS.md` shape) and the T31 rebuild outline. Verdicts for B57/L10 (S1.2 gap check), B55/L8, B60, B62. Done when measures 4 and 7 hold.
- **WP5 — Final.** Final Target Architecture, P1/P2/P3 list, `plan-reviewer` Opus full, Amit approves, records. Done when measures 6, 8 and 9 hold.

| Phase 16 checklist line | Package |
|---|---|
| Every file, rule, contradiction, backlog item, test, phase · every tool | WP1, WP3, WP4 |
| Phase timeline · one finish line · three layers (the *Loads* column) | WP4 |
| Old Phase 10 WP4–WP8 (7 files approved for deletion → archive, D54) | WP4 |
| Old Phase 10 WP9 project clean-up prompt | Phase 20 |
| B9 · B11 · B14 · C13 · `sync.sh --pull` guard · B4 · B18 | WP1 facts, WP4 verdicts |
| The 3 known contradictions · TC3, TC6, TC8, TC12 | WP4 |
| Archive `harness/planning-research.md` | WP4 decides; moved in Phase 17 |
| Memory audit incl. skill-overrides | WP1, WP4 |
| Obsidian (Phase 21) earlier? | WP5, question for Amit |
| Case-study home · re-check case-study template | Decided: inside the decision entry (§ 1); template re-check WP4 |
| B63 · B69 · B44/B67 · `plan-reviewer` mismatches · status housekeeping · plan history · "until T30" | WP0 · WP4 verdicts; "until T30" fixed in Phase 17 |

## 1. Target Architecture v1

**Folders.** Root: `CLAUDE.md` (imports only) · `STANDARDS.md`, `RTK.md`, `OLLAMA.md` (every session) · `WRITING-GUIDE.md` · `DOCUMENTATION-STANDARD.md` · `DOCUMENT-MAP.md` (the single router, new *Loads* column) · `DECISIONS.md` (new, in force only) · `PROJECTS.md` (Area column) · `ENVIRONMENT.md` (under 300 lines) · `README.md` (front page and rebuild steps) · `REPOS.md` · `settings.json`. Fixed Claude Code paths, kept flat: `.claude/`, `agents/`, `skills/`, `projects/*/memory/`. `templates/`. `harness/`: status, roadmap, one plan per active phase, backlog, open tests, cross-check, models, agent brief, overview, scripts, `drafts/`. `project-rules/`. `statusline/` (one file; path fixed by settings; accepted exception). `archive/`: `decisions/`, `plans-and-status/`, `test-records/` (old `baselines/`). No new top-level folders; `baselines/` retires.

| Kind | Home |
|---|---|
| Safety, approval, workflow; the Area checkpoint | `STANDARDS.md` |
| Writing | `WRITING-GUIDE.md` |
| Formats, IDs, archiving, size limits | `DOCUMENTATION-STANDARD.md` |
| Setup-only rules | `.claude/CLAUDE.md` |
| Project rules and the `Area:` line | The project's own `CLAUDE.md` |
| Decisions and their case story | `DECISIONS.md` entry, *Reason* field (`templates/case-study.md` becomes its shape; settles B39) |
| Preferences | Memory |
| Current state · phases and timeline · phase detail | `harness/status.md` · `harness/roadmap.md` · `harness/phase-NN-plan.md` |
| Open tests · finish line | `harness/open-tests.md` · `harness/overview.md` |
| Old material | `archive/` |

**Loads.** Every session: `CLAUDE.md` and its three imports, `MEMORY.md`, skill and agent descriptions (setup sessions add `.claude/CLAUDE.md` and the session-check output). On need: everything else, found through the map. Never unless pointed there: `archive/`, `project-rules/` copies, transcripts, `drafts/`.

**Size limits** (confirmed in WP4; re-checked by WP5 review): `status.md` about 60 lines (overwrite; results go to the phase plan) · roadmap one line per phase · phase plan about 300 lines (split by session; archived at close) · `DECISIONS.md` in force only, replaced decisions one line pointing to `archive/decisions/` · backlog about 200 lines (closed rows to the archive) · rule files, guides, skills, agents: today's size or less. Rule: Decision 6. `doc-check.sh` warns at session start (Phase 17).

**IDs and links.** Seven families kept (Phase, WP, D, B, TC, P1–P4, project codes); nothing renumbered. Links: path + heading; `STANDARDS.md` headings stay stable. **Finished:** one list in `harness/overview.md`.

## 2. Work Context

Decisions 2–3. Office: company-repo pattern (Claude files local-only, as VT and VOS Dashboard), notes off GitHub. Professional: data warning on its row. No Area weakens a global rule. Built in Phases 17–18: `PROJECTS.md` Area column (17), Area rule in `STANDARDS.md` *Orient* (18), `Area:` line in `templates/project-claude.md` (18). Phase 20: the line in each existing project, checked against the `PROJECTS.md` column. Load: the `STANDARDS.md` rewrite must save at least what the Area rule adds (measured, Phase 18).

## 3. Folders

No new folders. Later with a trigger: `hooks/` (3 or more own hook scripts), `scripts/` (a script used across several folders), `knowledge/` (Phase 21). Do not create: `agent-config/` (D57 facts file), `examples/` (D55, D58), `rules/` (may auto-load; WP2), `worktree/` (I5). The pre-commit hook becomes a tracked script in `harness/` (Phase 18, with `ENVIRONMENT.md`).

## 4. Agents

Keep `plan-reviewer` and `change-reviewer`; improve `plan-reviewer` (P3, B61, B62, `WRITING-GUIDE.md` mismatches). Do not build: team lead, project manager, DevOps, split frontend/backend coders. Future agents B71–B74 (Phase 20 or later, "Future work — not scheduled"): full rows in `harness/backlog.md` § *Deferred*. Every future agent is light, narrow and independent, gets only the files its job needs, and never approves, commits, pushes, deletes, installs, publishes, deploys, changes permissions or bypasses a box. Each built agent adds about 120 tokens every session.

## 5. Prompt library

Not built (Decision 9).

## 6. Findings so far and provisional list

1. `PROJECTS.md` lists DB2 "Next up" (30-10-2026); `harness/status.md` says "Removed 13-11-2026"; folder exists; still in `project-rules/manifest.tsv`.
2. `.git/hooks/pre-commit` is untracked; its only tracked copy is inside `ENVIRONMENT.md` § *3. Permissions*.
3. `PROJECTS.md` paths last checked 20-09-2026.
4. Phase numbers collide: `SETUP-PLAN.md` PHASE 1–11 (September) vs programme Phases 1–21.
5. "Rewrite: P1" vs `STANDARDS.md` P1 = urgency (fixed by Decision 7).
6. `DOCUMENT-MAP.md` § *Local-only* lists items "kept until WP8"; Phase 10 WP8 never ran.
7. 9 Office notes on GitHub; root cause the wildcard `.gitignore` line (Decision 4).
8. VOS Dashboard (`~/Documents/VS Code/VOS Dashboard`, GitHub `AmitJangra25/V-Thru_VOS-Dashboard-Automation`, tests V-Thru staging) is in no list.
9. Emp Portal is Office; repo on Amit's personal GitHub (noted).
10. `harness/doc-structure-plan.md` header stale; Amit named in shared files (noted only).

Provisional (WP4 confirms). P2: B63 · named allow-lines and untracking Office notes · pre-commit hook home · B69 · B44/B67 wording · DB2 fix · VOS Dashboard row · phase rename. P3: status housekeeping and plan history · `plan-reviewer` mismatches · 3 known contradictions · TC3, TC6, TC8, TC12. P1: none so far.

## 7. Clean cut

Outcomes: Decision 5. **Nothing-lost proof** before a section is archived: every rule, open item, security rule and needed decision in it has a live home · every D, B, TC and C ID in it appears live or is marked closed · security lines listed separately for Amit · a failing section stays live. Archive is not a privacy clean-up: moved files stay tracked, pushed and in git history (C11 before the repo goes public).

## 8. Migration method (Phases 17–19)

Draft beside the old file in `harness/drafts/` (never two live copies; Amit may write the draft from Claude's change brief) → coverage table before and after → link and ID count, incl. live project files read-only and `project-rules/` copies (`doc-check.sh --links-to`) → `change-reviewer` and Amit → one-commit switch with Amit's commit approval → `doc-check.sh`, fresh-session `/context`, box tests for settings or hooks. One document at a time; pilot `status.md`, then stop and check cost and catch rate. Restore tag before Phase 17 with approval. Freeze: no new rules or features in 17–19 unless P1.

## 9. Security and privacy

Checked 28-11-2026: 199 ask, 74 deny, 36 allow (`settings.json`); hooks `rtk hook claude` (TC11 open), `harness/session-check.sh`, untracked pre-commit; one plugin on (`swift-lsp`); `DISABLE_TELEMETRY` not set (B9). WP1 adds: B14, the easel connector's origin, what helpers can read (do deny rules cover `.env` for helpers), the Office-notes check. 199 ask rules stay 199 after any `settings.json` rewrite unless Amit approves.

## 10. Phases 17–20 (provisional; re-planned when each starts)

| Phase | Sessions (est.) | Work |
|---|---|---|
| 17 Rewrite 1: structure | about 6 | Restore tag · archive moves with proof · pilot `status.md` · roadmap and timeline · `DECISIONS.md` split, case-study home, C11 · `DOCUMENT-MAP.md`, `PROJECTS.md` (Area column, VOS row, DB2 fix) · size rule and `doc-check.sh` warning · named allow-lines, Office notes untracked · cross-area read sentence · "until T30" · `WRITING-GUIDE.md` from Amit's draft `harness/drafts/writing-guide-amit-28-11-2026.md` with six fixes, nothing-lost check, review and Amit's approval |
| 18 Rewrite 2: loaded and reference | about 5 | `ENVIRONMENT.md` under 300 with the pre-commit script · `README.md` rebuild steps · `STANDARDS.md` (Area checkpoint) · `.claude/CLAUDE.md` · `templates/project-claude.md` · settings only if approved |
| 19 Rewrite 3: polish and close | about 4 | Skills, agents, templates vs the writing standard · every backlog verdict · six final checks incl. the blind comparison |
| 20 Projects | 1 per project | Each project's `CLAUDE.md` with its `Area:` line (checked against `PROJECTS.md`) · B78 VOS Dashboard setup · drift fixes |

## Risks

| Risk | Impact | Likely | Mitigation (package) |
|---|---|---|---|
| Coverage tables run over budget | Phase 16 slips | Medium | Helpers draft; main checks D-rows and a sample (WP3); split before starting |
| Helper miscounts or misses a rule | A rule lost at archive | Medium | Nothing-lost proof; ID counts (WP3, § 7) |
| Area rule raises every-session load | Measure 6 fails | Medium | Offset in the `STANDARDS.md` rewrite (Phase 18) |
| `rules/` or archive search behaves unexpectedly | Wrong architecture | Low | WP2 before WP5 |

## Results

- **16.1 (28-11-2026):** plans v1–v4 discussed; `plan-reviewer` Opus full review on v3: concerns, 10 findings, all accepted or decided by Amit; 46,723 measured; word count about 590 against 500 (by hand, not `wc`); log check blocked by the permission system (check not run); no shape retry (Claude's choice, reported). Plan approved 28-11-2026 (Amit).
- **16.2 WP0 — B63 (28-11-2026), done and verified:** skill-header check added to `harness/doc-check.sh` (Python 3 + PyYAML, already installed; nothing installed) and named in `DOCUMENTATION-STANDARD.md` § *Format check*. Tests in a temporary clone (`/tmp/b63-test`, kept until Amit approves deleting it): T1 old script misses the real broken `wrap-up` header from `eaaa829`; T2–T3 new script gives exactly one, then two, new warnings at lines 3 and 4, also in `--quiet`; T4 real repo unchanged at 4 warnings (1 in `--quiet`); T5 PyYAML hidden gives "headers not checked"; T6 a non-UTF-8 skill gives one "not readable" warning and later skills are still checked. `change-reviewer` Sonnet: concerns, 4 findings and 1 nit; the unreadable-file guard and the doc wording fixed (Amit); CRLF/BOM, trailing-space and other-exception findings accepted (never seen; still warn or very unlikely); no second round (Amit); 11,860 tokens measured. Added question for WP2: which YAML parser Claude Code uses for skill headers (PyYAML agreed on both real failures).
