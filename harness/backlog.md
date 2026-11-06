# Backlog — Claude Setup

Agreed improvements and open items for `~/.claude`. Nothing here is built without a plan
and Amit's approval. Priority: P1–P4 as in `STANDARDS.md` § *Plan before building*.
Tokens are rough estimates to plan, build and check.

**How we work through it (Amit, 05-11-2026):**
- Waves: (1) P1 and P2 small → (2) P1 and P2 medium → (3) everything else together.
- Group small related fixes in one commit; a settings change gets its own commit.
- Test only important or medium changes (rules, settings, permissions); small doc
  lines get a look only.
- Files that load every session stay lean: name + one line, detail in a file read only
  when needed. Skills copied as name + one line; nothing built without approval.
- Think big picture: one fix must not cause another problem; no workaround fixes.

Source: Stage 1 checks, 05-11-2026 (C1–C8; C9 closed — no to-do list survived from the
02/03-11-2026 repo-review session, and the transcripts could not be read).

## To build

**Done 05-11-2026 (wave 1, Session A):** items 1, 2, 5, 19. Rows kept for reference.

**Items 6 and 7 done 05-11-2026 (Session C, FinNode):** gitleaks scan, 0 leaks in
history and tracked files; write block on in FinNode, trial check 20-11-2026, keep or
remove 05-12-2026. Not tested: plan-mode files. Seen once, not again, cause unknown: a
write refused with the key at `false`. **Wave 1 complete.**

**Item 3 done 05-11-2026 — ccusage baseline.** Code check of 20.0.48 (MIT): the npm
wrapper only starts a native binary (`@ccusage/ccusage-darwin-arm64`); the binary holds
two price-list URLs (LiteLLM on GitHub, `models.dev`) and no telemetry markers; `--offline`
uses built-in prices. Limit: a text search of a binary is not proof; not confirmed that
`--offline` also skips `models.dev`. Run by Amit: `npx --yes ccusage@20.0.48 daily
--offline`. **Baseline, Claude Code only, 7 calendar days 29-10 to 04-11-2026:** 337.3M
tokens (≈97% cache reads), $146.18 API-equivalent (not the Team-plan bill); per day
48.2M tokens, $20.88. Busiest day 29-10: 154.4M, $63.77. Whole-Mac figures, not split by
project. Wave 2 clock starts 05-11-2026; earliest wave 2 start 12-11-2026.

**Order changed 06-11-2026 (Amit):** no wait before wave 2 — the 05-11 ccusage run already
covered a past week. Order: Session 1 (items 16, 20, 17) → Session 2 (10, 13, 8) → wave 2
(item 4) → rest of wave 3. One combined review 15 days after the last trial starts; item
4's weekly checks and item 7's dates stay. Limit: the baseline predates wave 1, so later
token checks show the combined effect.

**Session 1 done 06-11-2026 (Opus):**
- Item 16: `templates/project-map.md` (shape + 7 guards; the map carries its own guards,
  since project sessions cannot read `~/.claude`). Rule line trialled in FinNode
  `CLAUDE.md` § *Use what already exists* — not `STANDARDS.md` until the trial works.
  FinNode's map itself: a FinNode session.
- Item 20: allow rules narrowed to `--show-current`, `--list *`, `-a --list *`. A scratch
  clone showed `git branch -a -m` renames and `-a -u` changes tracking. Box tests passed
  (`ENVIRONMENT.md` § 3).
- Item 17: 8 probes on a made-up `.env`. 7 blocked (`nl`, `base64`, `sort`, `diff`, `od`,
  `strings`, `cut` — none on the deny list; cause not confirmed: the Read rule applied to
  Bash, or auto mode). **1 got through: `git -c alias.zz='!cat' zz <file>`** → row 21.
  Also: the Read deny rule blocks the Write tool from creating a `.env`. Grep and Glob
  tools still untested (not available in the session).

**Session 2 done 06-11-2026 (run on Opus at Amit's choice):**
- Item 10: `templates/new-project.md` — key decisions, design, licences, go-live and
  rollback; `templates/roadmap.md` — "still on goal?" at each phase end.
- Item 13: thresholds kept 200K/300K/400K; one sentence in `ENVIRONMENT.md` § 2.
- Item 8: `gh config get telemetry` → `disabled` (gh 2.83.2 warned the key is unknown but
  saved it). Not verified that gh 2.91+ reads it — check after any gh update.

| # | Tool / area | What it fixes or adds | Pri | Size | Tokens |
|---|---|---|---|---|---|
| 1 | Model rule | One merged table (Opus / Sonnet / Haiku). Choose the model at session start; switch at session boundaries via the handoff note, not `/model` mid-chat. Hard bug in a long chat: an independent helper finds the cause, the session fixes it. Haiku only as a helper or a fresh tiny session. Full text in `harness/models.md`, one line in `STANDARDS.md` | P1 | small | ~15k with cross-check |
| 2 | Handoff template | Add an "Errors and fixes" line to `templates/handoff.md` (idea from Planning-with-Files; not installed) | P1 | small | ~3k |
| 3 | ccusage (free, MIT) | Token-use baseline before the trials. Manual only, always `--offline`; Claude may suggest when to run it. Check on first run whether it still fetches anything | P1 | small | ~10k |
| 4 | TypeScript code helper | 4-week trial in **Voice Flow** after one week of ccusage baseline, in a Voice Flow session on its own branch. Turn off npm type lookup (`disableAutomaticTypingAcquisition`) if the plugin allows. Weekly 5-minute check; keep if nothing broke, tokens flat or lower, and it caught a real problem | P1 | medium | ~40k + ~5k/week |
| 5 | Claude Code survey | Set `CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY=1`. Case: clicking "Yes" on the follow-up uploads the whole transcript, and projects hold personal data | P2 | small | ~5k |
| 6 | gitleaks | Manual secret scan of **FinNode** first; no hook yet. Claude may suggest when to run it | P2 | small | ~15k |
| 7 | Block writes outside project | `permissions.blockWritesOutsideWorkingDirectories` (Claude Code 2.1.314+; installed 2.1.318). Projects only, never global; trial in **FinNode**. Check at day 15, decide at day 30: keep if all good; remove if it wastes tokens or blocks real work. Covers Claude's file tools only, not shell commands | P2 | small | ~10k |
| 8 | GitHub CLI telemetry | `gh config set telemetry disabled` before any `gh` update: 2.91.0+ turns it on by default; installed 2.83.2 has none | P3 | small | ~3k |
| 9 | Claude Code usage metrics | Decide: keep on if Remote Control or claude.ai skill sync is used, else `DISABLE_TELEMETRY=1`. Metrics carry no code, prompts or paths (Anthropic docs) | P3 | small | ~5k |
| 10 | Planning ideas (engineering + product-management plugins) | We lack these; copy the ideas into `templates/new-project.md`, do not enable the plugins: `write-spec` (goals, non-goals, acceptance criteria, phases), `architecture` (decisions with trade-offs), `system-design` (APIs, data, parts), `deploy-checklist` (go-live checks, rollback). Plus our own: licence check and a mid-project "still on goal" check (no plugin has either) | P3 | medium | ~25k |
|  |  | Any skill idea copied: **name and one line only** in our files; build nothing unless approved (Amit, 05-11-2026) |  |  |  |
| 11 | markitdown | On-demand command only, no startup cost; no Azure or AI options. Keep the PDF/DOCX skills; never both on one document. 15–30 day trial | P3 | small | ~10k |
| 12 | Own post-edit checker | Kotlin, lint and project-specific checks; must not clash with the TypeScript helper. Start after week 2 of #4. Same trial method as #4 | P3 | medium | ~30k |
| 13 | Statusline thresholds | Warnings at 200K/300K/400K vs the 250K plan limit in `STANDARDS.md`. Decide which is right and align | P3 | small | ~3k |
| 14 | Ollama | Check its own update checks / network calls (not covered in Stage 1). Cloud models already off (D45) | P3 | small | ~5k |
| 15 | Acting without approval | Wording fix only once a real example is seen; the rule already exists in `STANDARDS.md`, auto mode may be the cause | P3 | small | ~5k |
| 16 | Project map (Graphify idea) | Copy the idea, do not install. Global: one rule in `STANDARDS.md` + `templates/project-map.md`; each project writes its own `PROJECT-MAP.md` in its own session. Try in FinNode first, measure with ccusage, then roll out. Design and staleness guards: § *Item 16 in full* | P3 | medium | ~15k + ~10k per project |
| 17 | Deny-rule bypass test | Focused security test; do last | P4 | small | ~15k |
| 19 | New-tool rule | Standing rule: before adopting any repo, tool, skill or plugin, check its network calls and telemetry (turn telemetry off before use; if it can't be, report and ask) and that it is free — no paid tools (Amit, 05-11-2026) | P1 | small | ~5k |
| 20 | rtk exact allow rules | rtk issue #3673 (open, critical, all versions incl. 0.48): rtk reads an exact allow rule as a prefix. `Bash(rtk git branch)` therefore lets `git branch -f/-m/-c …` run without a box. Deletes stay boxed (ask rules `*git branch -D*` etc.). Add ask rules for the other branch-changing flags, or narrow the allow rules | P3 | small | ~10k with box tests |
| 21 | git alias reads secrets | `git -c alias.x='!cat' x .env` printed a made-up `.env` (06-11-2026, item 17); same root as F1. Security risk, unlikely in normal use (needs a deliberate odd command). Possible fix: deny `*git*-c*alias*` in every rtk spelling, box-tested | P3 | small | ~10k |

## Item 1 in full — model rule (agreed with Amit, 05-11-2026)

- **Opus:** setup, rules, global standards, settings, permissions, hooks, security,
  data-loss or hard-to-undo work, unclear bugs, architecture, new projects, big plans,
  review of security-sensitive or hard-to-undo changes.
- **Sonnet:** building approved plans (including long ones that are not too complex),
  clear bugs, tests, code review, docs that need judgement, commit and PR text, search
  helpers that judge code.
- **Sonnet first, Opus if unclear or risky:** large codebase reading and impact analysis.
- **Stop and suggest Opus:** when a task turns unclear, risky or security-related.
- **Haiku or a local command, no model switch:** simple document conversion and reading prep.
- **Haiku only if cost-effective, as a helper or a fresh tiny session:** status checks,
  finding files, counts, summaries, formatting, commit *messages* (not the commit
  itself), find-only search helpers. Never permissions, security, settings, hooks,
  secrets or multi-step work.
- **When to pick:** choose the model at session start, by the task. When the task ends,
  update the handoff note. Switch models between sessions using that note, not with
  `/model` mid-chat (a switch re-reads the whole chat uncached).
- **Switch or helper — the 27k test** (Amit, 05-11-2026): a helper costs ~27k to start;
  a `/model` switch costs about the whole chat so far. Switch only if the chat is under
  ~27k; otherwise use an independent helper (e.g. Opus finds the root cause, the session
  applies the fix). The helper's brief must include the exact failure.
- **Cost rule:** before suggesting a switch or helper, compare start-up plus remaining
  work against continuing here, say the numbers, and don't suggest it if it costs more
  than it saves.
- **Replace** the current hand-back line ("Part complete. Switch back to Opus with
  /model.") — it assumes mid-session switching.
- **Where:** full text in `harness/models.md`; one short line in `STANDARDS.md`
  § *Which model*, so starting tokens don't rise.

## Item 16 in full — project map (agreed with Amit, 05-11-2026)

- **What:** `PROJECT-MAP.md` at each project root — main folders, entry points, key
  flows, folder level only (short, cheap to keep current). Not in `CLAUDE.md`, so it costs
  tokens only when read. Read it before searching code.
- **Staleness guards — ways it can go stale, and the line that stops each:**
  1. *Claude forgets after a change* → any change that adds, moves, renames or deletes a
     file, or changes an entry point or flow, updates the map **in the same commit**;
     part of "Before calling anything done".
  2. *Changes made outside Claude* (Amit's edits, a merge or pull, another tool) → the map
     stores no commit ID (a file cannot hold its own commit's ID). At session start, git
     finds the last commit that changed the map (`git log -1 -- PROJECT-MAP.md`) and lists
     files added, deleted or renamed since; if any, refresh the map before relying on it.
  3. *Claude trusts the map over the code* → the map is a pointer, not proof: confirm in
     the code before acting; if they disagree, the code wins and the map is fixed now.
  4. *Dead paths after a rename or delete* → when reading the map, a listed path that does
     not exist is fixed on the spot.
  5. *Lost across sessions or compaction* → the handoff note says "map updated: yes/no".
  6. *Too detailed to keep up* → folder level only; file-level detail is left to search.
  7. *Prose rules get missed* → a warn-only pre-commit check per project: if the commit
     adds, deletes or renames files and `PROJECT-MAP.md` is not in it, print a warning.
     Warn, never block. Decide at rollout. First check each project's existing hooks
     (e.g. husky) and add to them, never alongside them.
- **Where (name + one-liner rule):** one line in `STANDARDS.md` — "Before searching code,
  read `PROJECT-MAP.md`; when you add, move, rename or delete files, update it in the
  same commit. How: `templates/project-map.md`." The seven guards live in the template,
  read only when needed. The map itself in each project.
- **Setup-wide (only if the project trial works):** no new file. `~/.claude` already has
  three overlapping maps (`harness/overview.md`, `ENVIRONMENT.md` § *What's in this
  file*, `harness/status.md` § *Source of truth*); the 31-10-2026 audit decided to merge,
  not add a fourth. The setup map = `harness/overview.md` brought under the same rules.

## Deferred — recheck around 05-01-2027

| # | Tool | Why deferred | Recheck |
|---|---|---|---|
| 18 | rtk update | Policy (Amit, 05-11-2026): stay on the latest **stable, free** version; move only when a version is shown to be better than the one installed. 1.x: major version, breaking changes (`rtk proxy` renamed `rtk bypass`, alias kept), default binary licence changed (free "rtk-oss" edition alongside). Candidate: **0.52.0** (last 0.x, 13-10-2026, Apache-2.0) — fixes "three permission-gate holes" in the hook, but also rewrites more commands (`sh -c` wrappers), had no point release, and 0.49–0.51 notes were not read; not shown better yet. Open in every version: #4644, #3673. Nothing broken on 0.48 | Is #4644 / #3673 fixed; read 0.49–0.52 notes; what the 1.x licence says and whether rtk-oss is the free one; does an update keep telemetry off (add `RTK_TELEMETRY_DISABLED=1`); box tests before and after |

## Known and accepted — not doing

- Statusline simplification: 84 lines, no network, no token cost; not worth it (C6).
- Re-read change (Claude Code 2.1.317): re-reading an unchanged file now returns the
  whole file. No setting; Claude avoids re-reading unchanged files (C5).
- Checker Helper: already exists as the cross-check agent (`harness/cross-check.md`);
  use sparingly for security, permissions or large risky changes.
- Engineering skills not copied: `testing-strategy`, `tech-debt`, `incident-response`,
  `standup`, `code-review`, `debug`, `documentation` — covered by existing rules or not
  needed repeatedly.
- Not verified, checked when each tool's trial starts: gitleaks and markitdown network
  behaviour from source code.
