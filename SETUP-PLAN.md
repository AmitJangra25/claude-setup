# Claude Code setup — specification, repair plan, and rebuild runbook

Written 2026-09-18. Owner: Amit (amit@v-thru.com). Machine: this Mac.

---

# ► START HERE — resuming in a new session

**Read this whole file before doing anything.** It is the complete state. The
session that produced it was ended deliberately to save tokens, so there is no
conversation to refer back to — this file is the handoff.

## Status at handoff (2026-09-18)

| | Step | State |
|---|---|---|
| ✅ | 1.1 Back up 27 files | **DONE**, verified byte-identical with `cmp` |
| ✅ | 6.1 `git init` + `.gitignore` + baseline commit | **DONE**, commit `14883fa`, 38 files, 90 KB |
| ✅ | Read all 27 memory files | **DONE** — produced D13, D14 and Phase 7 |
| ✅ | 1.2 Close the holes in the global ask list | **DONE**, 35 rules added, `ask` 52 → 87 |
| ✅ | 1.3 Add two global entries rtk needs | **DONE**, 3 rules added, `allow` 32 → 35 |
| ⬅ | **Phase 2a + 2b Permission cleanup** | **ANALYSED, AWAITING APPROVAL.** 142 rules listed in `PHASE2-REMOVALS.md`. Nothing removed yet |
| | Phase 2c Group B one-off leftovers | not analysed — needs per-rule reading |
| ✅ | Phase 7a Repair where memories are stored | **DONE**, 3 orphaned dirs fixed, 18 memories reachable |
| ✅ | Phase 7b Promote working preferences to STANDARDS.md | **DONE**, 5 sections + 3 edits, +626 tokens/turn |
| | Phase 3 The deliberate set | |
| | Phase 4 Make the prompts readable | |
| | Phase 5 Structure (Voice Flow split, etc.) | |
| ✅ | 6.2 Private GitHub remote + push | **DONE**, `AmitJangra25/claude-setup`, verified private |

## The git repo — where it lives

- **Local:** `~/.claude` is a git repository (4 commits).
- **Remote:** `https://github.com/AmitJangra25/claude-setup` — **private**,
  owned by GitHub account `AmitJangra25`. Pushed 2026-09-18.

**Verified after every push:** GitHub holds byte-for-byte the same file list as
`git ls-files` locally — no more. The count has moved as work landed: 40 at 6.2,
34 after 7a removed six duplicate memory files, 35 once `PHASE2-REMOVALS.md` was
added. Check it against `git ls-files | wc -l`, not against a number in this file. Zero matches for any excluded
pattern (`.claude.json`, `history.jsonl`, `*.jsonl` transcripts, credentials,
`backups/`, `plugins/`, `skills/`, `file-history`, `paste-cache`). Confirmed
against GitHub's own file listing, not the local `.gitignore`.

To resume on another machine: `git clone` it into `~/.claude`. That covers
everything in the "survives account switch" table below.

## Verify that state rather than trust it

```bash
# backup exists, 27 files
ls -1 ~/.claude/backups/2026-09-18-setup/global | wc -l      # expect 10
find ~/.claude/backups/2026-09-18-setup -type f | wc -l      # expect 27

# git repo exists, both commits present, tree clean
git -C ~/.claude log --oneline                               # newest first; 14883fa is the baseline
git -C ~/.claude status --porcelain                          # expect empty
git -C ~/.claude ls-files | wc -l                            # expect 35

# settings.json after 1.2. It NO LONGER matches the 1.1 backup — that is
# expected. The real proof is that the change was additions only:
git -C ~/.claude diff 885c1d4 -- settings.json | grep -c '^-[^-]'   # expect 0
python3 -c "import json;p=json.load(open('$HOME/.claude/settings.json'))['permissions'];print(len(p['allow']),len(p['ask']),len(p['deny']))"
                                                             # expect 35 87 2

# 1.2 marker: `tccutil` now appears TWICE — `Bash(tccutil *)` and
# `Bash(rtk proxy tccutil *)`. Do NOT grep for `gh repo` — `Bash(gh repo view*)`
# is a pre-existing ALLOW rule and gives a false positive.
grep -c tccutil ~/.claude/settings.json                      # expect 2
```

If `tccutil` returns 0, 1.2 has been reverted — check `git log` and
`git diff 885c1d4 -- settings.json`.

## How to work on this, in one line each

- **Nothing is removed or blocked without explicit approval.** This is D4 and it
  governs everything. List it, explain it, wait.
- **Explain every permission request in four lines** before the prompt appears:
  what it does · what changes · risk and why · how to undo. This is D3.
- **Verify with a command and its output, or do not claim it.** Four claims in
  the first session turned out to be wrong; see "What I got wrong".
- **Re-run anything through `rtk proxy`** if it feeds a decision to delete, move
  or overwrite a file. rtk rewrites command output. This is D12.
- **List incidental findings at the end, do not chase them.** Amit sets the pace.
- **Recommend one option and say why — including why not the others.**
- **Amit dictates his prompts.** Read through transcription errors rather than
  asking what he meant. "bs4" meant "VS Code".

---

## Why this file exists

Three reasons, in order of importance.

**1. It is the rebuild spec.** The setup must survive switching Claude accounts
— logging out of account A and into account B — and must be reproducible on a
different machine. This file plus the git repo in Phase 6 are what make that
possible. Section "Rebuilding on another account" is the runbook.

**2. It records what is actually there.** The setup grew by accident over ~120
sessions: rules written in one project, permissions granted by clicking "allow"
in the moment, skills arriving from the cloud on their own. Nobody designed it.

**3. It is the standing record.** As the setup changes with how the work is
actually done, this file is what gets updated — so the reasoning behind each
choice is still here in six months, and so the next change is made against a
known state rather than a guess.

## What I got wrong while surveying it, and why

Recorded so the same mistake is not repeated.

| I claimed | The truth | Why I got it wrong |
|---|---|---|
| A stray rules file at `Documents/Voice-Flow-main/` | It is at `Documents/extra/Voice-Flow-main/` | rtk rewrote my search output and dropped a path segment. I did not re-verify. |
| A project's `allow` overrides a global `ask`, so the git safety rule was cancelled | **Backwards.** Rules are evaluated deny → ask → allow, and rule type beats file location. The global `ask` wins. | I assumed instead of reading the documentation. |
| 350 saved permissions | 560 | 350 was Voice Flow alone, not the total. |
| 8 rules ran without prompting | 40 | My risk categories put arbitrary-code and Keychain access in the "low risk" bucket. |
| `ENVIRONMENT.md` never loading was a problem to fix | **Deliberate and already documented.** A comment in `CLAUDE.md` explains it: reference material, and every `@import` is re-read every turn. | I read `CLAUDE.md`'s imports but not the file itself. |
| Voice Flow's `CLAUDE.md` being gitignored was an oversight | A standing preference from 2026-08-11, recorded in memory as `claude-md-not-in-git` | Did not read the memory files before recommending. Fixed by D14. |
| `sudo` ran 2× and `killall` 3× in history, so both needed fencing | **Neither has ever been run.** Every hit was the *word* inside a python regex or a `grep -n "a\|killall\|b"` pattern | My probe split compound commands on `\|` and matched heredoc contents. Fixed by replaying with full-token glob matching, which is what the permission system actually does. |

**Root cause:** each answer came from a fresh narrow query instead of one
complete inventory. Fixed by completing the inventory before planning — this
file is that inventory.

---

## The five systems

Only system 2 was deliberately authored. The rest accumulated.

```
1. CLOUD          claude.ai account — arrives on its own, cannot be edited here
   18 synced skills, 13 synced plugins, 4 MCP connectors
   (ClickUp, Figma, Sentry, Claude Docs)

2. GLOBAL RULES   ~/.claude/*.md — 13 KB, loads in every session
   CLAUDE.md imports STANDARDS, PROJECTS, RTK, REPOS, OLLAMA
   ENVIRONMENT.md (15 KB) exists but is NOT imported — never loads

3. SETTINGS       ~/.claude/settings.json + .claude/ in each project
   model opus[1m], effort high, 1 hook (rtk on every Bash), statusline script
   562 permission rules across 8 projects / 12 files (measured 2026-09-18;
   all 562 are `allow` — there is not one project-level `ask` or `deny`)

4. PROJECT RULES  CLAUDE.md per project — 6 of 8 projects have one
   Voice-Flow 110 KB · FinNode 16 KB · rest 2-6 KB

5. MEMORY         ~/.claude/projects/<path>/memory/
   27 memory files across 5 folders — 2 folders orphaned by path changes
```

Desktop app is separate (`~/Library/Application Support/Claude/`) and out of
scope for now.

## Scope

Projects inside `~/Documents/VS Code/` only — 8 of them. Everything else in
`~/Documents` is ignored, including `extra/Voice-Flow-main`.

| Project | Rules | Permissions | Memory | Git |
|---|---|---|---|---|
| FinNode | 238 lines | 32 | 3 | CLAUDE.md committed |
| Voice-Flow | 1446 lines | 350 | 11 | CLAUDE.md gitignored |
| Voice Flow_v1 | 83 | 55 | — | |
| vthrudebugger_v1 | 91 | 56 | 3 | |
| Packbly_web | 59 | 8 | — | |
| Emp portal | 86 (wrong folder) | 15 | — | not committed |
| Debugger v2 | none | 23 | 4 | |
| Packbly_v2 | none | — | — | |

---

## Decisions already made

| # | Decision | Made |
|---|---|---|
| D1 | Goal is to make consequential actions **visible**, not to build a lock | 2026-09-18 |
| D2 | Always ask before git push and anything that can destroy unsaved work — every project | 2026-09-18 |
| D3 | Permission prompts get four short lines: what it does · what changes · risk and why · how to undo | 2026-09-18 |
| D4 | **Never block or remove anything without explicit approval** | 2026-09-18 |
| D5 | `tccutil reset` → ask with full detail. Do not block it. | 2026-09-18 |
| D6 | Dated backup folder before the first edit, kept permanently | 2026-09-18 |
| D7 | Voice Flow rules: split into short rules + separate docs, trim what is stale | 2026-09-18 |
| D8 | ENVIRONMENT.md stays unloaded; add a pointer to it from PROJECTS.md | 2026-09-18 |
| D9 | Remove the dead and one-off permission rules, after per-rule impact check | 2026-09-18 |
| D10 | `python3 -c` / `node -e` / `awk` / `osascript` stay allowed. Accepted as arbitrary code execution; fencing them costs many daily prompts and blocks nothing real | 2026-09-18 |
| D11 | Voice Flow + Emp portal rules get committed to git, but **after** the Voice Flow split (5.1), so the repo gets the clean version | 2026-09-18 |
| D12 | rtk stays. The fault was my verification, not rtk: anything feeding a decision to delete, move or overwrite a file must be re-run through `rtk proxy` first | 2026-09-18 |
| D13 | **Supersedes D11.** Project `CLAUDE.md` files stay out of their own project repos (August preference holds). A copy lives in the private `~/.claude` repo under `project-rules/<project>/` so they still travel | 2026-09-18 |
| D14 | Read the memory files before recommending anything that touches a project | 2026-09-18 |
| D17 | Session size is managed at the **task boundary, not a number**. Past ~300k finish the current piece, then suggest a fresh session. Never clear mid-task — measured 3% saving there against 45–54% at a boundary | 2026-09-18 |
| D18 | Priority is **P1** broken/blocking/losing data · **P2** works but wrong, or blocks the next piece · **P3** everything else. Assign before dividing the work | 2026-09-18 |
| D19 | Before writing code: state what the change is for, find what depends on it, and say what it cannot affect | 2026-09-18 |
| D20 | A rule already in `STANDARDS.md` is **not** restated in different words. Four of Amit's 2026-09-18 rules were already covered; re-adding them would double the file and let two phrasings drift apart | 2026-09-18 |
| D15 | **`npx` stays out of `ask`.** Confirms the existing `ENVIRONMENT.md` exclusion against a fresh measurement: 231 of 235 calls are build/test. Only `npx --yes|-y` is fenced | 2026-09-18 |
| D16 | Every new `ask` rule is written in all three spellings — bare, `rtk `, `rtk proxy ` — because four projects blanket-allow `Bash(rtk proxy *)` | 2026-09-18 |

**D4 governs everything below.** Every removal is listed individually and waits
for a yes.

---

## Why permissions cannot be made airtight

From Claude Code's documentation:

> "A Bash rule matches the command text Claude writes... It doesn't match the
> same program invoked in a different form, so a deny or ask rule covers the
> invocation Claude usually produces and isn't a security boundary around the
> program."

Blocking `python3 -c` while `node -e` is allowed achieves nothing. Blocking both
while `bash script.sh` is allowed achieves nothing. So the aim is not to stop a
determined action — it is to make the consequential ones *visible*, and to catch
honest mistakes. Anything stronger is theatre.

## The precedence rule that makes this work

> "Rules are evaluated in order: deny, then ask, then allow. The first match in
> that order determines the outcome, and rule specificity doesn't change the
> order."

**Rule type beats file location.** A global `ask` wins over a project `allow`.
This is the key to the whole plan: a broad project rule can be made visible by
adding a global `ask`, **without removing the project rule**. Nothing breaks,
nothing is deleted, and the action starts prompting. That satisfies D4 and is
more durable than deleting, because it also covers projects that do not exist yet.

---

## PHASE 1 — Safety net and the real fix  (HIGH)

### 1.1 Back up  ·  **DONE 2026-09-18**
27 files copied to `~/.claude/backups/2026-09-18-setup/`, folder structure
preserved: 8 global `.md` + global `settings.json` + `statusline/context.py`
+ 6 project `CLAUDE.md` + 11 project settings files.
**Verified:** all 27 confirmed byte-identical to their originals with `cmp`.
**Undo:** n/a, nothing was changed.

### 1.2 Close the holes in the global ask list  ·  **DONE 2026-09-18**

> **PREREQUISITE — do this first.** `~/.claude/CLAUDE.md` carries an instruction
> in a comment: *"Read ~/.claude/ENVIRONMENT.md before changing settings.json or
> the thresholds."* `ENVIRONMENT.md` is 15 KB and holds the measurements behind
> the current permission and rtk choices. Read it before editing `settings.json`,
> and check whether anything in it already covers or contradicts the additions
> below.
Add to `permissions.ask` in `~/.claude/settings.json`. Each makes an action
visible that currently runs silently in at least one project.

| Add to ask | Why | Currently silent in |
|---|---|---|
| `Bash(tccutil *)` | Can wipe mic/camera permissions for every app on the Mac | Voice-Flow |
| `Bash(gh api *)` | Any GitHub API call, including delete | Debugger v2, Voice Flow_v1, Voice-Flow |
| `Bash(gh repo *)` | Includes `gh repo delete` | Debugger v2, Voice-Flow, vthrudebugger |
| `Bash(gh pr *)` | Opens/merges/closes pull requests | vthrudebugger |
| `Bash(gh auth *)` | Changes which GitHub account is used | 3 projects |
| `Bash(rtk gh *)` | Same via rtk | 3 projects |
| `Bash(security *)` | Reads macOS Keychain | Voice-Flow |
| `Bash(sudo *)` | Runs as administrator — no rule exists today | Voice-Flow |
| `Bash(killall *)` | Force-stops programs by name | Voice-Flow |
| `Bash(npx *)` | Downloads and runs a package (only `--yes`/`-y` covered today) | Voice-Flow |
| `Bash(rtk npx *)` | Same via rtk | Voice-Flow, vthrudebugger |
| `Bash(ollama pull *)`, `Bash(ollama rm *)`, `Bash(ollama signin *)` | Multi-GB downloads, deletions, account change | Voice-Flow |
| `Bash(gem install *)` | Installs Ruby packages | vthrudebugger |
| `Bash(git mv *)` | Renames tracked files | Voice-Flow |
| `Bash(sqlite3 *)` | Arbitrary SQL on any database file | Voice-Flow |
| `Bash(open *)` | Opens any file or app | vthrudebugger |

Not added, deliberately: `python3 -c`, `node -e`, `awk`, `osascript`. These are
how routine inspection work gets done — including the analysis that produced
this file. Fencing them costs many prompts a day and stops nothing, per the
"not a security boundary" note above. **Flagged for your call, not decided.**

**Impact:** a handful of extra prompts, only for the actions listed.
**Undo:** `git -C ~/.claude checkout settings.json`, or delete the added lines.

#### What was actually added, and how it differs from the table above

35 rules, `ask` 52 → 87. Verified: 35 insertions, **0 deletions**; `allow` (32),
`deny` (2), `hooks`, `statusLine` and every other key byte-identical.

15 commands — `tccutil` · `sudo` · `security` · `killall` · `sqlite3` · `open` ·
`git mv` · `gem install` · `ollama pull|rm|signin` · `gh api|pr|auth|repo` —
each in bare and `rtk proxy` spelling, plus `rtk ` for `git mv` and the four `gh`
forms.

Three deliberate departures from the table above, all found by the
`ENVIRONMENT.md` prerequisite:

1. **`npx *` and `rtk npx *` were NOT added.** Of 235 `npx` calls in history, 231
   are `vitest` (165), `tsc` (55), `vite` (7) and `asar` (4) — routine build and
   test. Only 4 are `--yes`, which `ask` already catches. The rule would have
   added ~231 prompts and caught nothing new. `ENVIRONMENT.md` had already
   excluded these deliberately; the 1.2 table had silently reversed that.
2. **`gh auth *` and `gh repo *` were kept broad**, knowing they override the
   existing `Bash(gh auth status*)` and `Bash(gh repo view*)` allow rules. Cost
   is 7 prompts across 56 sessions. The alternative — 11 narrow subcommand rules
   — costs the same to avoid and `ENVIRONMENT.md` warns argument-constrained
   patterns are fragile. **Those two allow rules are now dead letters.** Left in
   place, not removed; removing them is a Phase 2 decision.
3. **`rtk proxy` spellings were added**, which the table omitted. Confirmed by
   `find`: four project files carry blanket `Bash(rtk proxy *)` —
   `vthrudebugger_v1`, `Voice-Flow`, `Voice Flow_v1`, `Debugger v2`. Without the
   third spelling, `rtk proxy sudo …` would still run silently in those four.

**Measured cost:** replaying 5,734 historical Bash calls across 56 sessions,
**+26 prompts total = +0.46 per session**. 25 of the 35 rules never fire against
history at all — they are pure fences. The only real `tccutil` call ever made was
`tccutil reset All …` against the Claude install directory, which is exactly the
case D5 wanted visible.

### 1.3 Add two global entries rtk needs  ·  **DONE 2026-09-18**
- `Read(//Users/amitjangra/Library/Application Support/rtk/tee/**)` — rtk writes
  overflow output there and refers to it. Currently granted in Voice-Flow only,
  while the rtk hook runs in every project. This is why output went missing
  during the survey.
- `Bash(rtk gain*)`, `Bash(rtk discover*)`, `Bash(rtk --version)` — already
  partly present; confirm all three.

**Undo:** `git -C ~/.claude checkout settings.json`, or delete the three lines.

#### What was added, and the root cause it fixes

3 rules, `allow` 32 → 35. Verified: 3 insertions, **0 deletions**; `ask` (87),
`deny` (2) and every non-permission key byte-identical.

```
Bash(rtk --version)
Bash(rtk discover*)
Read(//Users/amitjangra/Library/Application Support/rtk/tee/**)
```

`Bash(rtk gain*)` was already present, so only two of the three Bash entries
were actually missing.

**Root cause of the missing output, now confirmed.** `permissions` sets
`blockReadsOutsideWorkingDirectories: true`. rtk's tee directory sits outside
every project, so reading it was blocked in **every** project except Voice-Flow,
which was the only file granting the path. The rtk hook itself is global — it is
`hooks.PreToolUse` → `rtk hook claude` in this same file, and applies to every
project automatically. So the hook wrote overflow logs everywhere and could read
them back in exactly one place.

**Verified, not assumed:** the directory exists with 20 log files, mode 700; the
newest were written by rtk during the session that made this change; and a real
file path was matched against the rule prefix. `find` confirmed Voice-Flow's
`settings.json` was the only project file granting it.

**Note the two leading slashes** in the `Read(...)` rule. A single slash anchors
at `~/.claude/`, not at the filesystem root — see the deny-rule note in
`ENVIRONMENT.md`. The spelling here is copied from Voice-Flow's working rule.

**Portability caveat for an account or machine switch:** this rule hardcodes
`/Users/amitjangra`. There is no home-relative spelling for an absolute path in
a permission rule, so on a different machine or username this one line must be
edited by hand after cloning. The rtk **binary** does not travel in this repo
either — it is at `~/.local/bin/rtk` (0.48.0); install rtk first, then clone.

---

## PHASE 2 — Permission cleanup  (HIGH, needs line-by-line approval)

### Measured 2026-09-18 — supersedes the estimates below

**Nothing has been removed. This is analysis awaiting approval.**

The single most important fact: **all 562 project rules are `allow`. Zero `ask`,
zero `deny`.** Removing any of them can only ever *add* a prompt — it cannot
remove a protection or unblock anything. That is what makes 2a and 2b safe.

| Group | Measured | Action | Behaviour change |
|---|---|---|---|
| A — Dead | **53** | Remove (2a) | **None, provably.** The path each names is gone; it can never match again |
| C — Redundant | **93** | Remove (2b) | **None today.** A global `ask` rule already overrides it |
| A ∩ C | 4 | — | counted once |
| **Union proposed** | **142** | | 562 → ~413 rules |
| Exact duplicates | 7 | Remove (2b) | Same 7 rules listed twice in Voice-Flow `settings.json` |
| Dormant — **excluded** | 1 | **Keep** | `release/mac-arm64/Voice Flow.app` is build output: gone now, returns on the next build |
| B — One-off leftovers | not analysed | 2c | Needs reading each rule; different work from A and C |
| D — Broad and silent | 40 | **Keep.** Fenced by 1.2 | |

**Why 142 and not the 112 estimated:** group C grew from 18 to 93 when 1.2
expanded the global `ask` list from 52 to 87. Every project `allow` rule that a
new `ask` rule covers became a dead letter. Four were live until 1.2 landed
(`security`, `sqlite3`, `open`, `gh`) — a consequence of an approved change, not
a pre-existing condition.

**Evidence for group A:** 6 distinct session scratchpad directories referenced,
**0 still exist**. Plus 10 literal paths tested individually and confirmed gone:
`~/vthrudebugger_v1`, `~/Debugger/vthrudebugger_v1`, `~/vthru-debugger-demo`,
`Voice_Flow_v2.1`, four `/tmp/vf_*.cjs` scripts, a rotated rtk tee log, and a
SecondBrain subfolder.

**Nine rules that looked dead are live and stay:** the Android SDK symlink,
`com.apple.TCC/TCC.db` ×3, the Whisper model ×2, and Voice-Flow's own
`git -C` commands ×2.

> **Warning for whoever runs this.** Two classifier passes wrongly flagged those
> nine. Both bugs were the same: a regex that split paths at spaces, turning
> `/Users/amitjangra/Documents/VS Code/…` into `/Users/amitjangra/Documents/VS`
> and calling it missing. **Do not classify by parsing paths out of rule text.**
> The only unambiguous signal is the session-scratchpad UUID pattern, which
> contains no spaces. Everything else was confirmed by testing the literal path.

**The list to approve:** `PHASE2-REMOVALS.md` in this directory — 144 rows, each
with project, file, group and reason. It is committed, so it survives a restart.

### Still to check before Phase 2 runs
- [x] Group A re-derived by measurement, not pattern guess — 53, evidence above.
- [x] Group C recomputed against the **current** 87-rule global ask list — 93.
- [ ] **Amit's approval of the 142.** D4 — nothing goes without it.
- [ ] Re-count B by hand. The old figure of 53 came from a pattern match.
- [ ] Confirm no group-B rule is load-bearing for a build or test script.
- [ ] Confirm each file stays valid JSON after editing.
- [ ] Back up the 12 project settings files before the first edit (D6).

### Non-Bash permissions — surveyed, no action proposed yet

The 560 count is Bash rules. These are the rest, and they were not examined
until late in the survey.

| Project | Grant | Note |
|---|---|---|
| Voice-Flow | `Read(//Users/amitjangra/Documents/VS Code/**)` | Reads **every** project, incl. Packbly and Emp portal — 5.2 |
| Voice-Flow | `Read(//private/tmp/**)`, `Read(//tmp/**)` | Whole temp directories |
| Voice-Flow | `Read(//Applications/Voice Flow.app/**)` ×3 | The installed app bundle |
| Voice-Flow | `Read(//Users/amitjangra/.continue/**)`, `.claude/**`, SecondBrain ×3 | Other tools' config and the Obsidian vault |
| Voice-Flow | `Read(.../rtk/tee/**)` | rtk's overflow logs — **should be global**, see 1.3 |
| Voice-Flow | `Skill(claude-api)`, `Skill(claude-api:*)` | Pre-approves that skill |
| Voice-Flow | 5 × `additionalDirectories`: the project, `.continue`, `.local/bin`, `.claude`, `/private/tmp` | Widens the working directory |
| FinNode | `Read(//Users/amitjangra/.claude/**)` + `additionalDirectories: ~/.claude` | Can read global config |
| FinNode | `Edit(docs/**)`, `Write(docs/**)`, `Edit(CLAUDE.md)` | Write access, scoped |
| FinNode | `WebFetch(github.com)`, `WebFetch(kotl.in)` | |
| Voice Flow_v1 | `Read(//private/tmp/**)`, `Read(//tmp/**)`, `Read(~/.npm/_npx/**)` | |
| Voice-Flow `.local` | `WebSearch` + 7 `WebFetch` domains (github, morphllm, promptquorum, ollama ×2, continue) | Accumulated, harmless |
| Voice Flow_v1 `.local` | `WebSearch` + 8 `WebFetch` domains (wisprflow ×4, wikipedia, substack, alternativeto, github) | Research leftovers from competitor work |

Nothing here is urgent. 5.2 is the only one worth changing, and the rtk read
grant is worth promoting to global (1.3).

---

## PHASE 3 — The deliberate set  (MEDIUM)

Replace "whatever got clicked" with three written lists in global settings, in
plain English, so it can be read back and argued with.

- **Always fine** — reading, searching, building, running tests, git read-only,
  rtk read-only commands.
- **Always ask** — installs, downloads, deletions, pushing code, anything
  touching GitHub, macOS privacy or the Keychain, anything run as administrator.
- **Never** — reading `.env` files (already in place).

Written into `~/.claude/settings.json` with a short companion note in this file
explaining each choice. After this, clicking "allow, don't ask again" on
something consequential cannot create a silent hole, because the global `ask`
outranks it.

---

## PHASE 4 — Make the prompts readable  (MEDIUM)

`STANDARDS.md` already specifies four lines: what it does · what changes · risk
and why · undo. It is not reliably happening. Per D3 and D5, strengthen it:

- State it as a hard rule rather than guidance.
- For an `ask` rule, say **why this command is needed right now**, in the user's
  own terms, not the command restated.
- For `tccutil reset` specifically, spell out exactly which apps lose which
  permissions and that they must be re-granted by hand.

**Undo:** revert `STANDARDS.md` from 1.1.

---

## PHASE 5 — Structure  (MEDIUM / LOW)

| # | Item | Priority | Notes |
|---|---|---|---|
| 5.1 | Voice Flow 110 KB rules → short `CLAUDE.md` + `docs/` | MEDIUM | `Known pitfalls` is lines 759-1446 and `Working rules` 161-646. Those two are 80% of the file and are reference, not rules. **Per `dont-delete-reference-docs`: relocate and mark stale, never delete.** Move the reference half into `docs/`, prepend a header splitting "still authoritative" from "superseded", with evidence for each. |
| 5.2 | Voice Flow `Read(//Documents/VS Code/**)` + 5 extra dirs | MEDIUM | Grants a Voice Flow session read access to Packbly (customer records) and Emp portal (employee records). Narrow to what it needs. Full list in "Non-Bash permissions" below. |
| 5.3 | Emp portal `.claude/CLAUDE.md` → `CLAUDE.md` | LOW | Works where it is; it is just the odd one out. |
| 5.4 | Add pointer to ENVIRONMENT.md from PROJECTS.md | LOW | D8. One line. |
| 5.5 | Update PROJECTS.md — 9 folders opened that it does not list | LOW | Includes home and `~/Documents` themselves. |
| 5.6 | Merge 2 orphaned memory folders | LOW | `-Users-amitjangra-Debugger-vthrudebugger-v1` and `Voice-Flow-Pro`. Notes are stranded under paths that changed. |
| 5.7 | Decide: commit Voice Flow + Emp portal rules to git? | LOW | Currently gitignored/untracked, so cloud sessions run those projects with no rules at all. Your call — the files may contain things you do not want in a repo. |
| 5.8 | Two cloud plugins fail to connect | LOW | `browser-use` needs `uvx` installed; `data:definite` has a bad endpoint URL. Both are cloud-side. |

---

## Explicitly not doing

- **Adding another tool.** Nothing here needs one. A sixth system to maintain
  would make this worse, not better.
- **Touching the cloud skills and plugins.** They are account-side; edits here
  get overwritten. A tour of what they are is worth doing — that is reading,
  not fixing.
- **Reaching an "expert" setup.** Fix what exists, improve it gradually.

## Open questions

All three original open questions are now answered — see D10, D11, D12.

Nothing is currently open. New questions get added here as they come up, with
the decision recorded in the table above once made.

---

## Rebuilding on another account

### The short answer

**Same Mac, different email: you lose very little.** Almost everything is files
on disk, and files do not care which account is logged in.

| What | Survives account switch? | Why |
|---|---|---|
| All 6 global `.md` rules files | **Yes** | Plain files in `~/.claude/` |
| `settings.json` — model, effort, hook, permissions | **Yes** | Plain file |
| All 8 projects' `CLAUDE.md` and `.claude/settings.json` | **Yes** | Plain files in the project |
| The 27 memory files | **Yes** | Plain files under `~/.claude/projects/` |
| rtk, ollama-do, statusline script | **Yes** | Installed in `~/.local/bin` and `~/.claude/statusline/` |
| The 18 cloud skills | **No** | See below |
| The 13 cloud plugins | **No** | See below |
| 4 MCP connectors (ClickUp, Figma, Sentry, Claude Docs) | **No** | Authorised per account |
| Artifacts and Claude Docs you have made | **No** | Live in the account |

### Why the cloud skills and plugins do not survive — verified

They are stored in folders **named after the account**:

```
~/.claude/skills/synced/<organizationUuid>_<accountUuid>/
~/.claude/plugins/synced/<organizationUuid>_<accountUuid>/

current: 26df45ac-a0b9-4c23-a8bd-b39351292679_30b66a9c-25e5-4e24-bdfe-8ebf23b886cb
                    ^ organization (v-thru.com)      ^ account (amit@v-thru.com)
```

Account B has a different `accountUuid`, so Claude Code creates a new empty
folder and syncs whatever **B's** account has. A's folder stays behind doing
nothing. If B is in the same organisation the org half matches, but the account
half still differs — so the folder is still new.

**This cannot be fixed by copying the folder.** Renaming A's folder to B's UUID
would be overwritten on the next sync. The skills and plugins have to be
present on account B's claude.ai side. That is a web-side action, not a file.

### The switch checklist

Run in this order. Steps 1-3 need no work if the git repo from Phase 6 exists.

1. **Before logging out** — `git -C ~/.claude add -A && git commit && git push`.
   This is the only step that cannot be done afterwards. The remote exists
   (6.2 DONE), so this now works.
2. `/logout`, then `/login` with account B.
3. **Verify the files are untouched** — `/status`, then check `~/.claude/CLAUDE.md`
   still loads and one project's `CLAUDE.md` is still read. Nothing should have
   moved.
4. **Re-enable the marketplace plugin**: `/plugin install swift-lsp@claude-plugins-official`.
   `settings.json` already lists it under `enabledPlugins`, but the plugin files
   install per account.
5. **Re-authorise the 4 MCP connectors** on claude.ai for account B: ClickUp,
   Figma, Sentry, Claude Docs.
6. **Check which cloud skills and plugins arrived.** Compare against the list in
   the "Five systems" section above. Anything missing has to be added on
   claude.ai for account B — it cannot be copied across.
7. **Delete the stranded folders** once B is working:
   `~/.claude/skills/synced/<A's uuid>/` and the same under `plugins/`. Only
   after confirming B is healthy, and only with approval (D4).

### What to do on a *different* machine

Steps above, plus: install Claude Code, clone the dotfiles repo into `~/.claude`,
install rtk (`~/.local/bin/rtk`, v0.48.0), install `ollama-do` and Ollama, and
re-clone the 8 projects. The projects carry their own `CLAUDE.md` and
`.claude/settings.json` in their own repos — except two, see 5.7.

---

## PHASE 6 — Put it in git  (HIGH — do before any account switch)

**Suggested reorder, not yet approved:** run `git init` and the `.gitignore`
*before* Phase 1.2 rather than here. Every phase then becomes its own commit,
giving a restore point per step instead of the single snapshot from 1.1. Same
work, better safety net. D6 (dated backup folder) stays either way — it is
already done.

A private git repo for `~/.claude`. No third-party tool: git and a `.gitignore`
are enough. This is also the standard approach for the same problem — see
"Tools considered" below.

### Commit — roughly 60 KB total

```
CLAUDE.md  STANDARDS.md  RTK.md  REPOS.md  PROJECTS.md  OLLAMA.md
ENVIRONMENT.md  SETUP-PLAN.md
settings.json
statusline/context.py
projects/*/memory/**          <- the 27 memory files ONLY
README.md                     <- new: how to rebuild, points at this file
```

### Never commit — and why each one matters

| Excluded | Size | Why |
|---|---|---|
| `.claude.json` | 92 KB | Account UUIDs, machine ID, every folder you have opened, all cached state |
| `history.jsonl` | 348 KB | **Every prompt you have typed, plus pasted content** |
| `projects/**/*.jsonl` | ~158 MB | 61 full session transcripts — entire conversations |
| `backups/` | 460 KB | Copies of `.claude.json` |
| `plugins/`, `skills/synced/` | 24 MB | Account-keyed; regenerate on login. Committing them would carry A's UUID into B |
| `file-history/`, `paste-cache/` | 6 MB | Snapshots of your files and clipboard |
| `shell-snapshots/`, `session-env/`, `sessions/`, `cache/`, `tmp/`, `jobs/`, `tasks/`, `ide/`, `downloads/`, `feedback/`, `daemon*` | — | Machine state, no value elsewhere |
| `*.bak`, `policy-limits.json*`, `remote-settings.json`, `mcp-needs-auth-cache.json` | — | Stale or account-side |

**Checked:** no `.credentials.json` and no `buddy-tokens.json` in `~/.claude` —
your login lives in the macOS Keychain, so the repo cannot leak it. That is
worth re-checking before the first push, because the file appears if the
Keychain is ever unavailable.

### 6.1 Local repo  ·  **DONE 2026-09-18**
`git init`, deny-by-default `.gitignore` written first, 3 commits, tree clean,
40 files, 90 KB. Verified: no `.claude.json`, no `history.jsonl`, no session
transcripts, no credentials staged — 14 danger patterns checked, all clean.

### 6.2 Remote  ·  **DONE 2026-09-18**

```
repo       AmitJangra25/claude-setup
visibility PRIVATE  (confirmed via gh repo view before pushing)
branch     main, tracking origin/main
commits    4
files      40, verified identical to local git ls-files
```

Approved explicitly before running, as an outward-facing action. `gh` was
authenticated as `AmitJangra25` with `repo` scope.

**For any future push, check three things:**

1. **The repo is private.** This folder holds your rules, your working
   preferences and 27 memory files about your projects and how you work. Not
   secret, but not public either.
2. **`git status` shows nothing unexpected.** The `.gitignore` is
   deny-by-default, so it should hold — but verify rather than trust, because a
   push cannot be undone once GitHub has it. Content sent to GitHub may be
   cached or indexed even if the repo is deleted afterwards.
3. **Which GitHub account.** See the identity note below.

### Git identity is your personal Gmail, not your work address

```
user.name  : AmitJangra25
user.email : amitjangra044@gmail.com
```

Your Claude account is `amit@v-thru.com`. The two commits so far are authored by
the Gmail address, because that is the global git config on this Mac. Left as
found — changing it was not asked for. Worth a decision before adding a remote,
since it determines which GitHub account owns the repo and whose name is on
every commit.

### 6.3 Project rules into this repo  ·  NOT DONE — next git step
Per D13, copy each project's `CLAUDE.md` to `project-rules/<project>/CLAUDE.md`
in this repo, so they travel without going into the project's own repo. Needs a
sync step so the copy does not drift from the live file. Do after Phase 5.1, so
Voice Flow's copy is the cleaned version.

### 6.4 Optional  ·  NOT DONE
A shell function to pull on open and push on close. Out of scope until Phases
1-2 are done.

### Project rules are separate
The 8 projects' `CLAUDE.md` and `.claude/settings.json` belong in each
project's own repo, not in this one. Two are not committed today (5.7) — which
means on a new machine or account those projects would start with no rules.

---

## Tools considered, and the decision

Asked for explicitly. Honest assessment.

| Tool | Licence | Verdict |
|---|---|---|
| **rtk** (in use) | — | Keep for now. It saves tokens. It also corrupted a file path and hid output twice during this survey, so open question 3 stands. |
| **claude-mem** (`thedotmack/claude-mem`) | Apache 2.0, not MIT | **No.** Claude Code already has a native memory system and you are using it — 27 files across 5 folders. claude-mem would be a second, parallel memory system, and it wants its own model provider key. Two memory systems is worse than one imperfect one. |
| **claude-memory-skill** (`hanfang/claude-memory-skill`) | MIT | No, same reason. It is a lighter version of something you already have. |
| **claude-code-dotfiles** (`Povaz/claude-code-dotfiles`) | — | **Read it, do not install it.** It solves exactly this problem — "across machines and subscriptions" — with symlinks and git. Worth reading for its `.gitignore`. But Phase 6 is about 15 lines of git; a dependency is not warranted. |
| **`import-memory`** (built-in skill) | — | Not applicable. It imports memories from ChatGPT or Gemini into claude.ai's web memory. Not account-to-account, not Claude Code. |

**The principle:** every tool added is a system that has to be understood,
updated and debugged. You have five already and only one was deliberate. The
answer to "how do I make this portable" is a git repo, and that is not a tool.

Sources: [claude-mem](https://github.com/thedotmack/claude-mem) ·
[claude-memory-skill](https://github.com/hanfang/claude-memory-skill) ·
[claude-code-dotfiles](https://github.com/Povaz/claude-code-dotfiles)

---

## PHASE 7 — Fix where the working preferences live  (HIGH)

Found while reading the 27 memory files, 2026-09-18. This is a root-cause fix,
not a workaround.

### The problem

Memory is stored **per project folder**. Most memories are not about a project
at all — they are standing instructions about how the work should be done. They
only load in the one project they happen to be filed under.

**Measured 2026-09-18** (the earlier "11 of 16" was an estimate): 23 memory
files, **18 unique**, across 6 directories. Nine are cross-project working
preferences filed under a single project.

| Preference | Loads only in | Should apply |
|---|---|---|
| `always-recommend-an-option` — name a recommendation and say why, **including why not the others** | FinNode | everywhere |
| `report-findings-dont-chase-them` — list incidental findings at the end; Amit sets the pace | Voice-Flow, Voice-Flow-Pro | everywhere |
| `fix-root-cause-flag-workarounds` — always label a fix workaround vs root-cause | Voice-Flow | everywhere |
| `dont-delete-reference-docs` — relocate and mark stale, don't delete | Voice-Flow-Pro | everywhere |
| `docs-are-products-not-logs` — write docs about the thing, not about their own history | Voice-Flow | everywhere |
| `claude-md-not-in-git` | Voice-Flow-Pro | everywhere |
| `amit-uses-voice-input` — Amit dictates; read through transcription errors | Voice-Flow | **everywhere** — this is a `type: user` memory sitting in one project |

So: working in Packbly or Emp portal today, none of the above is in context.
`always-recommend-an-option` loads in FinNode only. `amit-uses-voice-input`
explains "bs4" meaning "VS Code" — and it was not loaded in this session.

### 7a — Repair where memories are stored  ·  **DONE 2026-09-18**

A worse problem sat underneath the filing one, found by checking each memory
directory against the filesystem. **Three of the six directories pointed at
project folders that no longer exist**, so 10 of the 23 files could never load
at all:

| Orphaned directory | Files | Sessions | Fate |
|---|---|---|---|
| `…VS-Code-Voice-Flow-Pro` | 6 | 0 | **Deleted.** All 5 memories byte-identical to live Voice-Flow copies; its index was a strict subset |
| `…VS-Code-Debugger` | 4 | 0 | **Migrated** to `…VS-Code-Debugger-v2` |
| `…Debugger-vthrudebugger-v1` | 3 | 0 | **Migrated** to `…VS-Code-vthrudebugger-v1` |

`~/Debugger/` and `~/Documents/VS Code/Debugger/` do not exist anywhere under
`~` — searched, not assumed. The projects moved; the memories stayed behind.

**The sharpest example:** `vthru_debugger_workflow_preferences` holds *"share a
written plan, let the user review, only then implement"* — the plan-first rule
Amit asked for on 2026-09-18 as if it were new. It was already recorded, and had
been unable to load since the folder moved.

Also: `Debugger v2` had no `CLAUDE.md` **and** no reachable memories — the least
instructed project on the machine. It now has 3 memories.

**Method:** copy → `filecmp` verify → only then remove. Deletions confined to
files with a proven identical live counterpart.
**Result:** 5 memory directories, all mapping to a project folder that exists;
18 unique memories, none lost.
**Undo:** `git -C ~/.claude checkout -- projects/` — all 29 memory files are
tracked and were already pushed.

### 7b — The fix for where preferences live

Promote the universal ones into `~/.claude/STANDARDS.md`, which loads in every
project and is already in the git repo. Leave genuinely project-specific
memories where they are:

**Stays as project memory:** `verify-shipped-bundle-not-source`,
`check-history-json-before-chasing-polish`, `history-must-be-unlimited`,
`recorder-page-becomes-chat`, `project-debugger-ui-frozen`,
`project-debugger-repo-fresh-start`, `feedback-debugger-overlay-intentional`,
`vthru-customer-app-debug-toggle`, `vthru-debugger-workflow-preferences`.

**Moves to STANDARDS.md:** the seven in the table above.

Originals are not deleted — per D4 nothing is removed without approval, and a
memory that also exists in STANDARDS.md is harmless duplication until you say
otherwise.

**Undo:** revert `STANDARDS.md` from the git repo or the 1.1 backup.

#### 7b — what was actually written  ·  **DONE 2026-09-18**

`STANDARDS.md` 85 → 145 lines, **60 insertions, 3 deletions**. Five new sections
and three edits to existing ones, in this order:

| Section | Source |
|---|---|
| **Plan before building** *(new)* | Amit's rules 1, 10, 11, 12, 13 + D17, D18 |
| **Evidence, not assumption** *(+1 para)* | rtk rewrites output — re-verify via `rtk proxy` (D12) |
| **Fix the cause** *(+1 para)* | label a fix workaround vs root-cause — `fix-root-cause-flag-workarounds` |
| **Reuse what is already there** *(new)* | Amit's rules 4, 9 |
| **Know what the change touches** *(new)* | Amit's rules 7, 8 + blast radius, per D19 |
| **Stay on the task** *(1 para reworded)* | reconciled with `report-findings-dont-chase-them` |
| **When something is unclear** *(new)* | Amit's rule 14 + `always-recommend-an-option` + `amit-uses-voice-input` |
| **Docs are products** *(new)* | `docs-are-products-not-logs` + `dont-delete-reference-docs` |

**Deliberately not added:** Amit's rules 2, 3, 5 and 6 — already covered by
§ *Fix the cause* and § *Build the smallest thing*. Restating them would have
doubled the file and let two phrasings drift apart. This is D20.

**The one deletion** was the paragraph *"...do not end a task by talking me into
a list of other things to fix"*, which contradicted the
`report-findings-dont-chase-them` memory. The memory's version won, because it
was given directly. Flagged before the edit, not after.

**Cost:** +626 tokens per turn, `STANDARDS.md` ~988 → ~1,614. The always-loaded
set goes from ~3,469 to ~4,095. **My pre-write estimate was +340 — wrong by
most of a factor of two.** The wording was reviewed and approved as written, so
the content is what was wanted; the estimate was the error. If the per-turn cost
proves too high, § *When something is unclear* and § *Docs are products* are the
two most compressible.

**Originals kept.** The nine promoted memories still exist in their project
folders — per D4 nothing is removed without approval, and duplication between a
memory and `STANDARDS.md` is harmless.

---

## Findings not acted on

Listed rather than chased, per `report-findings-dont-chase-them`. Nothing here
is being worked on; they are recorded so they are not lost.

1. **`docs-are-products-not-logs` may apply to this file.** That memory says
   docs should be about the thing, not about their own history, and that
   append-only dated logs are not wanted. This file has a "What I got wrong"
   section and a dated decisions table. Both were asked for explicitly on
   2026-09-18, so they stay — but flagging the tension rather than quietly
   deciding it.
2. **`rtk-proxy-suppresses-dry-run-output` may be stale.** It says rtk prints
   nothing for `git add --dry-run`. On rtk 0.48.0 today it printed all 38 paths.
   Verified independently with `git ls-files`, which also returned 38.
3. **Two memory folders are duplicates, not just orphans.** `Voice-Flow` (11
   files) and `Voice-Flow-Pro` (6) share 4 identical memories.
   `Debugger-vthrudebugger-v1` sits under `/Users/amitjangra/Debugger/`, a path
   that no longer exists.
4. **The `always-recommend-an-option` memory is not being followed in full.** It
   asks for a recommendation *and why not the others*. The "why not" has been
   missing from most option lists in this session.
5. **FinNode's `CLAUDE.md` is committed to its repo**, which contradicts
   `claude-md-not-in-git`. Not resolved by D13 either way — worth a decision
   when Phase 5 reaches it.
