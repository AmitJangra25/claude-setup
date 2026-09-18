# Claude Code setup — specification, repair plan, and rebuild runbook

Written 2026-09-18. Owner: Amit. Status: **awaiting approval on Phase 1.**

This file is not loaded automatically. It is a working document and it is meant
to outlive the work. Nothing in it has been done yet unless a line says DONE
with a date.

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
   560 permission rules across 7 projects / 11 files

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

### 1.2 Close the holes in the global ask list  ·  ADD ONLY, remove nothing
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
**Undo:** delete the added lines. Nothing else is touched.

### 1.3 Add two global entries rtk needs  ·  ADD ONLY
- `Read(//Users/amitjangra/Library/Application Support/rtk/tee/**)` — rtk writes
  overflow output there and refers to it. Currently granted in Voice-Flow only,
  while the rtk hook runs in every project. This is why output went missing
  during the survey.
- `Bash(rtk gain*)`, `Bash(rtk discover*)`, `Bash(rtk --version)` — already
  partly present; confirm all three.

**Undo:** delete the lines.

---

## PHASE 2 — Permission cleanup  (HIGH, needs line-by-line approval)

Four groups. Group D is the important one and involves **no deletion**.

| Group | Count | Action | Behaviour change |
|---|---|---|---|
| A — Dead | 41 | Remove | **None.** All 41 point at session folders verified gone. They cannot match any command. |
| B — One-off debugging leftovers | 53 | Remove | Small. Each was saved during one session. If one is needed again you get a prompt. |
| C — Redundant | 18 | Remove | **None.** Global `ask` already overrides them, so they have no effect today. |
| D — Broad and currently silent | 40 | **Keep. Fence via 1.2 instead.** | They start prompting. Nothing is deleted. |
| E — Narrow and safe | ~408 | Keep | None. These are what stop constant prompting. |

Groups A, B and C total **112 rules removed**, and by the reasoning above,
A and C (59 rules) change nothing at all about how anything behaves.

**Before removing:** print every rule with its project, file, and the reason it
is in that group. You approve the list. Nothing goes without that.
**Undo:** restore from 1.1.

### Still to check before Phase 2 runs
- [ ] Re-count B by hand. 53 came from a pattern match, not a reading of each one.
- [ ] Confirm no group-B rule is load-bearing for a build or test script.
- [ ] Confirm each file stays valid JSON after editing.

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
| 5.1 | Voice Flow 110 KB rules → short `CLAUDE.md` + `docs/` | MEDIUM | `Known pitfalls` is lines 759-1446 and `Working rules` 161-646. Those two are 80% of the file and are reference, not rules. Nothing deleted without approval; stale entries listed for your call. |
| 5.2 | Voice Flow `Read(//Documents/VS Code/**)` + 5 extra dirs | MEDIUM | Grants a Voice Flow session read access to Packbly (customer records) and Emp portal (employee records). Narrow to what it needs. |
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

1. **Before logging out** — commit and push the dotfiles repo (Phase 6). This is
   the only step that cannot be done afterwards.
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

### Steps

1. `git init` in `~/.claude`, write the `.gitignore` above **first**.
2. `git status` and read every file it proposes to add, by name, before the
   first commit. Approval required (D4).
3. Confirm the repo is **private** before the first push.
4. Optional: a shell function to pull on open and push on close. Not in scope
   until Phases 1-2 are done.

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
