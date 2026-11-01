# Stage C fix report · 01-11-2026

Fixes for Stage C (security) of the 31-10-2026 audit, approved by Amit 01-11-2026.
Decision `SETUP-PLAN.md` D44. Audit: `baselines/audit-security-31-10-2026.md`; wording
corrections: `baselines/audit-corrections-31-10-2026.md`. Nothing committed or pushed.

## 1. In short

Claude can no longer read SSH keys, Ollama files, the GitHub CLI login, prompt history,
transcripts, the paste cache or Claude's backups through Bash or Read. `git add` asks in
setup sessions, and gists and Ollama cloud models ask everywhere. Ollama cloud is off,
`ollama-do` cannot be pointed off the Mac, and `drift.sh` now scans for secrets.
Always-loaded words unchanged at 3,967.

## 2. Every finding

| ID | Status | What was done |
|---|---|---|
| C1 | **fixed** (known limits in `ENVIRONMENT.md` § 3) | 34 deny rules, `settings.json` |
| C2 | **fixed 31-10-2026**, recorded now | rtk telemetry off; note in `ENVIRONMENT.md` § 1 |
| C3 | **fixed** | local `git add` allows removed; 4 setup-only ask rules; docs corrected |
| C4 | **fixed** | ask `gh gist create|edit`; `gist` token scope kept — **needs Amit's decision** |
| C5 | **fixed** | cloud disabled, `ollama-do` guard, ask `ollama run *cloud*` |
| C6 | **fixed, verified 01-11-2026** | turned off by Amit in `/plugin` 01-11-2026; it wrote no change to any of the four setup settings files. Verified at the next session start: Amit's `/context all` shows no `pdf-viewer` MCP tools or plugin skills, and `pgrep -lf server-pdf` finds nothing |
| C7 | **fixed** | secret scan in `drift.sh`; no git pre-commit hook (needs separate approval) |
| C8 | **accepted** | recorded, `harness/status.md` § *Open* |
| C9 | **needs decision** | recorded; Desktop unchanged |
| C10 | **needs decision** | recorded; no change |
| C11 | **deferred** | before the repo goes public |
| C12 | **deferred** | bundle untouched |
| C13 | **needs decision** | `RTK_HOOK_AUDIT=1` and logs kept |

## 3. Rule-by-rule map

**`settings.json` deny, 34 → 68 (C1).** Old: none of these existed. New, each as
`Bash(<pattern>)`:

| Protects | Bash patterns | Read rule |
|---|---|---|
| SSH | `*.ssh/*` `*.ssh` `*.ssh *` `*.ssh"*` `*.ssh'*` | `Read(//Users/amitjangra/.ssh/**)` |
| Ollama folder | `*.ollama/*` `*.ollama` `*.ollama *` `*.ollama"*` `*.ollama'*` | `Read(//Users/amitjangra/.ollama/**)` |
| GitHub CLI login | `*.config/gh/*` `*.config/gh` `*.config/gh *` `*.config/gh"*` `*.config/gh'*` | `Read(//Users/amitjangra/.config/gh/**)` |
| Prompt history | `*history.jsonl*` | `Read(//Users/amitjangra/.claude/history.jsonl)` |
| Account file and copies | `*.claude.json*` | `Read(//Users/amitjangra/.claude.json*)` |
| Paste cache | `*paste-cache*` | `Read(//Users/amitjangra/.claude/paste-cache/**)` |
| Transcripts | `*projects/*.jsonl*` | `Read(//Users/amitjangra/.claude/projects/**/*.jsonl)` |
| Claude backups | `*.claude/backups*` | `Read(//Users/amitjangra/.claude/backups/**)` |
| `.netrc` | `*.netrc*` | `Read(//Users/amitjangra/.netrc)` |
| `.git-credentials` | `*.git-credentials*` | `Read(//Users/amitjangra/.git-credentials)` |
| `.npmrc` | `*.npmrc*` | `Read(//Users/amitjangra/.npmrc)` |

Of the last four paths, only `~/.config/gh` exists today (checked by existence only).

**`settings.json` ask, 188 → 191 (C4, C5):** `Bash(*gh gist create*)`,
`Bash(*gh gist edit*)`, `Bash(*ollama run *cloud*)`. Old: none.

**`.claude/settings.json` ask, 2 → 6 (C3):** old `git stash pop`, `git stash apply`;
added `Bash(*git add*)`, `Bash(*git -* add*)`, `Bash(*git stage*)`, `Bash(*git -* stage*)`.

**Allow removed (C3):** `Bash(git add *)` from `~/.claude/settings.local.json` (1 → 0)
and `~/.claude/.claude/settings.local.json` (15 → 14). Both untracked; backups below.

**Unchanged:** allow 37 in `settings.json`; every existing rule.

## 4. Files changed

| File | Change |
|---|---|
| `settings.json` | 34 deny + 3 ask rules added |
| `.claude/settings.json` | 4 ask rules added |
| `settings.local.json`, `.claude/settings.local.json` (untracked) | `Bash(git add *)` removed |
| `project-rules/drift.sh` | secret scan added; usage comment |
| `harness/session-check.sh` | message "mirror drift found" → "drift or secret pattern found" |
| `ENVIRONMENT.md` | § 1 C2 note; § 3 counts, private-store paragraph with limits, setup ask rules, local-file table and paragraph, `git add` paragraph rewritten (old text in § 8) |
| `harness/status.md` | *In progress*; F3 line; `git add` line corrected; C8–C13 and pending `STANDARDS.md` proposals |
| `SETUP-PLAN.md` | D44 appended after D43; nothing else touched |
| `baselines/audit-*-31-10-2026.md` (2), `audit-corrections-31-10-2026.md` (new) | G0 corrections |
| `~/.ollama/server.json` (outside git) | `disable_ollama_cloud` false → true, mode 644 kept |
| `~/.local/bin/ollama-do` (outside git) | host guard: whole-string match, `@` refused; mode 755 kept |
| `.claude/current-task.md` (untracked) | task record |

Backups: `~/.local/share/claude-setup-backups/01-11-2026/` — `server.json`, `ollama-do`,
`top-settings.local.json`, `setup-settings.local.json`.

## 5. Tests (made-up paths only; no real private file opened)

| Test | Result |
|---|---|
| Bash denies on `/tmp/zz/…`: `.ssh` ×6 spellings (`cat`, `test -d`, `[ -d ]`, quoted, `rtk proxy cat`, `grep`), `.ollama` ×3, `.config/gh` ×2, `history.jsonl`, `.claude.json.backup`, `paste-cache`, `projects/…jsonl`, `.claude/backups`, `.netrc`, `.git-credentials`, `.npmrc` | **19/19 denied** |
| Read tool on non-existent names in `paste-cache/`, `projects/…/*.jsonl`, `backups/` | **3/3 denied** |
| Controls: memory `MEMORY.md` via Read and Bash, grep a tracked doc, `git log`, `ls templates` | **all ran** |
| Box tests, auto mode, Amit declined: `git -C … add`, `git add -f` ignored file, `git -C … stage`, `gh gist create`, `ollama run zz-dummy-cloud` | **5/5 boxed**, each naming its rule ("Ask rule … overrides auto mode"). The first `git add` run was approved by mistake on a `/tmp` dummy; re-run boxed |
| rtk dry run `git add zz.txt` after removal | rewrite only, **no "allow"** (was "allow") |
| `ollama-do` refused hosts (`@zz.invalid`, external, `https`, look-alikes, `0.0.0.0`, uppercase, no scheme) | **9/9 refused** before any network call |
| `ollama-do` accepted hosts (localhost, 127.0.0.1, `[::1]`, trailing `/`, no port, unset) | **6/6 passed the guard**; one local dummy prompt answered "OK" |
| Ollama restarted after the change | process started 10:11:40, file changed 10:11:12; `server.json` still true |
| Secret scan, scratch repo: 1 clean file, fake GitHub token (file name with a space), fake `Bearer` header, fake JSON `"token"` | **3/3 caught**, clean not flagged, exit 1, fake value printed **0 times** |
| Secret scan, real repo | 104 text files, **0 matches**, 3 archives not scanned as text; 0.18 s |
| Default mode, 3 repeat tests: `cat /tmp/zz/.ssh/zz`, `rtk proxy cat /tmp/zz/history.jsonl`, `grep -n x "/tmp/zz/.ollama"/zz` | **3/3 denied** |

## 6. Pending Amit

- Done by Amit 01-11-2026: PDF viewer off in `/plugin` (C6, verified at the next session
  start);
  `~/.local/bin` access removed in `/permissions`; default mode switched on for the
  repeat tests.
- Review this report; then "send it" for the commit (amend `dc92b44`).
- Decisions: C4 `gist` token scope, C9, C10, C13; git pre-commit hook (C7, separate).

## 7. Checks and tokens

| | Before (01-11-2026) | After every group |
|---|---|---|
| `drift.sh` | 13 current, 0 drifted | 13 current, 0 drifted; new line "secret scan: 104 text files, 0 matches, 3 not scanned as text" |
| `session-check.sh` | silent, exit 0 | silent, exit 0 |
| Always-loaded words | 3,967 | **3,967** (`STANDARDS.md` 3,419, `RTK.md` 246, `CLAUDE.md` 108, `OLLAMA.md` 97, `MEMORY.md` 97) |

Cross-checks (Opus): plan · change, 7 of 8 taken (rejected: block all of `projects/`, it
would block memory) · **70.5k measured**; changed rules · keep, 2 of 3 taken (skipped: 12
rules for folder-name leaks via `|`/`;`/`$(…)`, names only) · **32.2k measured**. Main
session: Unknown.

**Remaining limits:** recursive search from a parent folder; globs and variables;
folder names via pipes and subshells; relative `backups/…`; `git -c alias`; other
projects' personal data; Grep and Glob tools untested (not available in the session);
whether the top-level `settings.local.json` is read at all (unproven, as before).

**Confirmed:** no project folder touched; no secret, key, `.env`, transcript,
`history.jsonl`, paste-cache file or bundle opened; nothing sent outside the Mac except
the earlier read-only `gh` checks of the audit; nothing committed or pushed; no file
shortened for brevity.

## 8. Replaced text, kept verbatim

`ENVIRONMENT.md` § 3, as it read until 01-11-2026:

> **`git add` is decided by the mode, not a rule (30-10-2026).** The hook turns every
> `git add …` into `rtk git add …` (`rtk rewrite`), so `Bash(git add *)` in both local files
> never matches anything. No `allow` or `ask` rule matches `rtk git add`. In auto mode the
> classifier lets it through with no box (tested on a scratch repo in `/tmp`); in default
> mode a box is expected but untested. Amit accepted no box in auto mode — staging is
> undoable and `commit`/`push` are fenced — and the two dead rules stay (FinNode backlog 6).
>
> Neither file is merged, moved or changed by this note.

`harness/status.md` § *Open*, as it read until 01-11-2026:

> **Known, accepted:** `git add` runs with no box in auto mode; no rule matches it, because
> the hook rewrites it to `rtk git add`. Recorded in `ENVIRONMENT.md` § 3 (FinNode backlog
> 6, 30-10-2026). The FinNode backlog row itself waits for a FinNode session.

`ollama-do` host guard, as it read until 01-11-2026 (also in the backup):

> `http://127.0.0.1:*|http://localhost:*|http://[::1]:*|http://127.0.0.1|http://localhost) ;;`
