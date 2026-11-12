# This machine

Purpose: How Claude Code is set up on this machine, and why each choice was made — each tool's current setting, how to check it, how to change it, and its known gaps.
Audience: Claude and Amit.
Read when: About to change settings, permissions, hooks or thresholds — the relevant section only, not on every session.
Owner: Setup sessions (changes are Amit's decision).
Update rule: When a setting or tool changes. Replace superseded text; history goes to a dated record in `baselines/`. Every figure states its date and method. Split by topic at about 300 lines.
Related: `settings.json` · `.claude/settings.json` · `RTK.md` · `statusline/context.py` · `PROJECTS.md` · `SETUP-PLAN.md` (D-numbers) · `baselines/global-open-tests.md`
Status: current
Last reviewed: 12-11-2026

---

## Contents

Everything below lives in `~/.claude/` and applies to every project automatically — existing ones, new ones, VS Code, Android Studio, and cloud sessions alike.

- § *The two kinds of rule* — enforced settings against guidance.
- § *1. RTK* — the hook that rewrites commands; telemetry; version policy.
- § *2. Status line* — live context size and its thresholds.
- § *3. Permissions* — what stops and asks, the local settings files, the pre-commit secret check.
- § *4. Effort on Opus 5.5* — which effort keys are known to apply.
- § *What every session loads* — startup cost, and what was switched off to get there.
- § *How numbers are measured* — the commands behind every figure here.
- § *The project trees on this machine* — the branch-state sweep, duplicate trees, project descriptions.
- § *Older records* — history moved out of this file.

Figures below include measurements, estimates and projections. Each states its date and method — the commands are in § *How numbers are measured*. Where a date or method was never recorded, the figure says so.

**Backups** — git is the backup; this folder's history holds every committed state. Pre-repo copies are in `archive/`.

## The two kinds of rule

This matters more than anything else in this file.

| | Where | What it does |
|---|---|---|
| **Enforced** | `settings.json` | Claude Code blocks or prompts before the tool runs. Cannot be talked out of. |
| **Guidance** | `CLAUDE.md`, `STANDARDS.md` | Shapes what Claude tries. Not a boundary. |

From the Claude Code docs, on putting rules in `CLAUDE.md`: *"This shapes what Claude tries but doesn't enforce a boundary."*

So anything that must hold goes in `settings.json`. Anything about how to work well goes in `STANDARDS.md`. Writing an enforcement rule as prose is the most common way to end up with a protection that was never actually on.

## 1. RTK

### What it is

Token compression. `settings.json` → `hooks.PreToolUse` runs `rtk hook claude`, which rewrites commands before they run: `git status` → `rtk git status`. This is where the token saving comes from. Rules for using it: `RTK.md`. Full command list: `rtk --help`.

It is **not fully separate from permissions.** rtk 0.48.0's hook returns `"permissionDecision": "allow"` on some rewrites — seen on `rtk gh run list` and `rtk tree` (**D35**, `baselines/t6-removals.md` entry 3). `ask` and `deny` rules still apply whatever the hook returns — the docs: *"Deny and ask rules are still evaluated regardless of what the hook returns."* (`baselines/global-open-tests.md` TC11).

### Current setting

- **Version and policy (Amit, 05-11-2026).** Keep rtk (no better free replacement found, 05-11-2026). Stay on the latest **stable, free** version, and move only when a newer one is shown to be better than the installed 0.48.0. Recheck around 05-01-2027: `harness/backlog.md` B18.
- **rtk telemetry is off (31-10-2026, Amit's approval, audit C2).** `rtk telemetry status` reports consent no, enabled no (`~/Library/Application Support/rtk/config.toml`). Past data was not erased: `rtk telemetry forget` was not requested. This is rtk's own configuration, outside `~/.claude` and outside git.
- **Hook auditing is off again from 01-11-2026 (audit C13, D45).** `RTK_HOOK_AUDIT=1` was removed from `settings.json` → `env`; the 6.7 MB log (date not recorded) is kept.
- **Savings — 09-10-2026:** `rtk gain` reports **60.9% over 12,104 commands, 8.5M tokens saved** (59.0% over 11,496 on 03-10-2026). The overall percentage drifts with the mix of work — it fell from 59.6% to 59.0% during a single docs-heavy session, because grep and read save least. **Treat the overall number as "roughly 60%" and read the live value from `rtk gain`**; the per-command figures below are the stable and useful part. `RTK.md` deliberately copies no total.
- **Savings are lopsided by command**, measured 26-09-2026 over 10,017 commands (59.6% overall, historical): `ps aux` 98.3%, `eslint` 95.2%, `gradlew` 95.9%, `vitest` 89.4% — but `grep` 22.0% and `read` 10.9%. The low figures are correct. rtk saves by stripping redundancy, and a file read or a grep hit is signal, not boilerplate. `ps aux` saved 2.6M tokens in 49 runs; 2,694 greps saved 473K (method not recorded). **Do not read a low percentage as a fault.**
- **GitHub CLI telemetry set off ahead of time (06-11-2026, B8)** — gh, not rtk. `gh config set telemetry disabled`; installed gh 2.83.2 has no telemetry and warned "not a known configuration key", but saved it (`gh config get telemetry` → `disabled`). gh 2.91.0+ turns telemetry on by default; not verified that it reads this key.

### How to check

- Live savings: `rtk gain`. **Name collision:** if `rtk gain` fails, reachingforthejack/rtk (Rust Type Kit) may be installed instead.
- Whether one command is rewritten: `rtk hook check` (used 10-10-2026 — § *Known gaps* below).
- rtk telemetry: `rtk telemetry status`. **After any gh update,** run `gh config get telemetry` and check gh's own docs for the off switch.
- The hook log, when auditing is on: `rtk hook-audit` reads `~/.local/share/rtk/hook-audit.log`.
- **`git add --dry-run` through rtk.** Through rtk, `git add --dry-run` prints nothing. Preview with `rtk proxy git add -A --dry-run`; verify real staging with `git diff --cached --name-only`.

### How to change

- **Hook auditing:** restore `RTK_HOOK_AUDIT=1` in `settings.json` → `env` to switch it back on for a test (it takes effect at the next session start). `env` is read at session start, so it never covers the session that set it. It is there to catch the one observed case where the hook did **not** rewrite a command — see `SETUP-PLAN.md` § *Findings not acted on*.
- **Updating rtk:** before any update, check open issues #4644 and #3673, the licence (1.x changed the default binary's licence), that telemetry stays off, and run box tests before and after.
- **A new permission fence** needs every spelling the hook can produce: § *3. Permissions* → *How to change*.

### Known gaps

**What the hook actually rewrites, tested 26-09-2026.** It handles a plain command and the `&&` and `;` chain operators. Nearly every other shell construct makes the *whole line* run raw — redirects are the exception noted in the table:

| shape | result |
|---|---|
| `grep -rn foo .` · `cd /tmp && git log` · `cat a; cat b` | rewritten |
| `grep foo . \| head` — any pipe | **raw** |
| `cat a > /tmp/x` — a redirect | **usually raw** — not always: on 10-10-2026 `rtk hook check` rewrote `tree . > /tmp/x`, and the hook log holds one real redirect rewritten inside a chained line |
| `echo $(cat a)` — any subshell | **raw** |
| `for f in a b; do cat $f; done` · `f(){ cat $1; }` | **raw** |
| `python3 …` · `sed …` — not handled in any form | **raw** |

**This is why adoption was 26%**, not because rtk failed: `rtk session` reported 24–34% across four sessions on 26-09-2026, and `rtk discover` found ~36.3K tokens (date not recorded) left on the table over 279 scanned commands — mostly `grep -B` (21), `gh api` (13) and `git log` (11). The habit that closes it is in `RTK.md`: prefer the plain form over piping into `head` when the output is small enough to read anyway.

**Treat 36.3K as a floor.** `rtk discover` said it scanned 279 commands over 30 days while `rtk session` counted 555 on 26-09-2026 alone, so the two disagree about their own window.

**The catch worth knowing.** Claude Code has a built-in list of commands that never prompt: `ls`, `cat`, `echo`, `pwd`, `head`, `tail`, `grep`, `find`, `wc`, `which`, `diff`, `stat`, `du`, `cd`, and read-only `git`. RTK renames them to `rtk ls`, `rtk grep` and so on, and the built-in list no longer recognises them — so they start prompting.

That is why 615 permission entries (date not recorded) had accumulated across the projects: safe commands were being approved by hand, one project at a time. The global `allow` list now covers the read-only `rtk` wrappers, so this stops happening.

## 2. Status line

### What it is

Live context size. `statusline/context.py` reads the real token counts from the session transcript and prints the current context size. It never estimates. Thresholds and the data behind them are documented at the top of that file.

**It costs nothing in tokens.** The status line is a shell command the terminal renders; its output never enters the model's context. Changing it is free, so tune it freely.

**What it's for.** Claude re-reads the whole conversation on every step, so a long session pays for its entire history on every small action. Sessions start around 48K and grow ~1,200 tokens per turn; the deepest recorded is 588K (50 sessions, 12,623 turns, measured 15-09-2026 — top of `statusline/context.py`).

**What to do about it:** `/clear` when you finish one task and start an unrelated one. Not mid-task — clearing during a long single task saved only 3% in the measured sessions, versus 45–54% for sessions with several distinct tasks (date and method not recorded here). The boundary is what saves tokens, not the number.

### Current setting

Grey under 200K, amber to 300K, red to 400K, then suggests `/compact`. These fit the 250K plan limit in `STANDARDS.md` § *Plan before building* (checked 06-11-2026, kept): amber is "near 250K" — weigh the 80% rule; 300K is act at the next task boundary.

**Lowered to 200K/300K/400K on 11-10-2026** at Amit's request, to save tokens: a session past 250K costs more per turn and uses more of the usage limit, so the nudge now comes sooner; 150K was considered and judged too early. The warning exists to nudge a clear at a **task boundary**, where it saves 45–54%, rather than mid-task, where it saves about 3% — it was never about running out of room.

### How to check

The constants at the top of `statusline/context.py` are the live values.

### How to change

Edit those constants. Earlier values and why they changed: the top of `statusline/context.py`; this file's old notes are in `baselines/environment-history-01-11-2026.md` § D and § E.

### Known gaps

None yet

## 3. Permissions

What stops and asks.

### What it is

- **`allow`** — stops a prompt. Purely additive: permission lists merge across files, so a global allow entry can only ever remove a prompt, never add one.
- **`ask`** — An `ask` rule prompts in **every** permission mode, including auto mode, and it overrides any `allow` rule that also matches. That is why the session can stay in auto mode without losing control of the dangerous commands.
- **`deny`** — refused. Note the **two** leading slashes in `Read(//**/.env)`. A single slash in user settings anchors at `~/.claude/`, not at your projects — `Read(/secrets/**)` in this file would protect `~/.claude/secrets`, which is almost certainly not what was wanted. Deny was chosen over ask because only a deny rule stops the IDE from passing an open `.env` tab to Claude as context; an ask rule can't intercept something Claude never requested.

### Current setting

    allow   36 rules    read-only things stop prompting
    ask    191 rules    all on things that change something, plus gist and Ollama cloud
    deny    74 rules    .env (34), private stores (34), project private data (6); not airtight

Counted with `jq` on `settings.json`; re-checked 12-11-2026.

**Read everywhere, write only here (D46, 10-11-2026).** `blockReadsOutsideWorkingDirectories` is **false** and `blockWritesOutsideWorkingDirectories` is **true**, globally. Any session reads `~/Documents/VS Code/**` and `~/.claude/**` with no box (other folders ask); Claude's Edit and Write tools cannot write outside the working folder — `/add-dir` a folder to change it. Denied for every session, Read and Bash: FinNode `private/`, Emp Portal `vthru.db*`, the Packbly folder.

**`allow`** — read-only `rtk` wrappers (`rtk tree` among them), `gh run list`, `WebSearch`, and docs domains. `tree *` and `xxd *` were removed on 30-10-2026 (**D41**): the hook turns `tree` into `rtk tree`, so the bare rule never fired, and `xxd in out` writes a file. Global `allow` also reads rtk's tee directory, because that folder sits outside every project: before it was made global (18-09-2026), rtk could write overflow logs everywhere but read them back only in Voice-Flow. A rule that can never fire is a file claiming a permission it does not grant — remove it (22-09-2026).

**`git branch` is allowed only as a listing.** The hook turns every `git branch …` into `rtk git branch …`, so this file's rule decides for every project. It allows only `--show-current`, `--list *` and `-a --list *`. **Narrowed 06-11-2026 (B20):** rtk reads an exact allow rule as a prefix (rtk issue #3673), so `rtk git branch`, `-a` and `-vv` were removed — on a scratch clone `git branch -a -m main x` renamed a branch and `-a -u` / `-a --unset-upstream` changed tracking, and plain `git branch x` creates one. `--show-current` refuses or ignores every changing flag (tested the same day). Box tests in default mode: `git branch -a -m zz-none zz-other` → "This command requires approval"; `git branch --list` → no box. To list, use `git branch --list` or `git branch -a --list`. The wide `rtk git branch *` it replaced let `git branch -vv -D x` delete a branch and `git branch -vv -f x` move one with no prompt: git accepts a verbose flag beside a changing one, and the `*git branch -D*` ask rule only matches the flag in first place. `--list` takes a trailing wildcard safely because git refuses or ignores every changing flag beside it (`-c -C -m -M -d -D -u --edit-description --unset-upstream` give a usage error; `-f`, `-t` and `--create-reflog` only list). `-vv` must stay exact. Tested on a scratch clone, 15-10-2026.

**`ask`** — git operations that publish or discard work (`push`, `reset`, `rebase`, `clean`, `rm`, `merge`, `checkout`, `restore`, `stash drop`, `stash clear`), `git commit` (`*git commit*` and `*git * commit*`), dependency installs including brew's `install`, `uninstall`, `upgrade` and `reinstall`, `npx --yes`, `rm`, `curl`, `wget`, `pkill`, `kill`. Since the 20-09-2026 merge most are one pattern with a leading `*`, which covers the bare, `rtk` and `rtk proxy` spellings at once; `rm`, `kill`, `killall`, `pkill` and `open` keep explicit spellings, because they sit inside ordinary words (`SETUP-PLAN.md`'s **`ask` list merged** row). **Added 23-10-2026:** `git cherry-pick`, `revert`, `filter-branch`, `filter-repo`, `update-ref`, `reflog expire|delete`, `tag -d|-f` and `remote add|set-url` — each as `*git X*` and `*git * X*`, so an option before the subcommand (`git -C path revert`) still matches — plus `npm publish`, and `ssh`, `scp`, `rsync` in bare, `rtk` and `rtk proxy` spellings (explicit, like `rm`). Plain `git stash`, `git tag` and `git remote` (listing) stay out — see `SETUP-PLAN.md` § *FinNode — open, not acted on*. **Closed 30-10-2026 (D41):** the older git patterns (`push`, `reset`, `rebase`, `merge`, `checkout`, `clean`, …) had only the `*git X*` form, so `git -C path push` was not matched; each now also has a `*git -* X*` form (live test: `git -C … merge --abort` boxed). `git remote remove|rm|rename|set-head` are now fenced too.

**Re-measured 30-10-2026 (S4, D41)** (`jq`): `allow` **39 → 37** (`tree *`, `xxd *` out) and `ask` **96 → 188**. Read forms of `gh pr|repo|auth|api`, `git merge-base`, `security` and words inside grep or echo text no longer ask; the writing forms of those commands do, and so do the `git -<opt> …` spellings of dangerous git commands (`git -C dir push` matched no rule before), `git … --output`, `--upload-pack`, forced or discarding `switch` and `pull --rebase|--force`. Replayed against past Bash history: boxed calls 2,241 → 1,722. Record and the full rule list: `baselines/s4-permissions-30-10-2026.md`.

**Asks added 01-11-2026 (audit C4, C5):** `*gh gist create*`, `*gh gist edit*`, `*ollama run *cloud*`. The `gist` token scope stays: the GitHub CLI cannot remove it (D45).

**Setup-only `ask` rules.** Sessions started in `~/.claude` also load six setup-only `ask` rules from `.claude/settings.json`: `git stash pop` and `git stash apply` (**D36**; four until S4 removed the blanket `git pull` and `git switch`, **D41**), and `git add`, `git -* add`, `git stage`, `git -* stage` (**D44**, 01-11-2026); they are not in the counts above.

**`git add` asks in setup sessions (01-11-2026, D44, audit C3).** The 30-10-2026 note here said `Bash(git add *)` in both local files "never matches anything". That was wrong: rtk's hook returned `"permissionDecision": "allow"` for `git add …`, `-f` and `-A` included, taking it from those rules (dry runs 31-10-2026), so a forced add of an ignored private file was staged with no box. Both rules are removed (backups in `~/.local/share/claude-setup-backups/01-11-2026/`), and the dry run now returns no `allow`. `.claude/settings.json` asks for `*git add*`, `*git -* add*`, `*git stage*` and `*git -* stage*`, so `git add` boxes in every `~/.claude` session — every setup commit is two boxes. Commit and push still ask everywhere. The docs say ask and deny rules apply whatever a hook returns (`baselines/global-open-tests.md` TC11); default mode is covered by the Stage C test report. Projects are unchanged.

**`deny`** — `.env` (34, Bash and Read, including `Read(//**/.env)` and `Read(//**/.env.*)`), private stores (34, D44) and project private data (6, D46 — the three folders above). The `.env` rules also block `.env.example`, which is harmless but occasionally inconvenient.

**Private stores blocked, 01-11-2026 (audit C1, D44).** Deny rules match the path wherever it appears in a command, so one rule covers `cat`, `rtk read`, `rtk grep`, `rtk find` and `rtk proxy …` before and after the hook rewrite: `.ssh`, `.ollama` and `.config/gh` (folder, contents and quoted forms), `history.jsonl`, `.claude.json*`, `paste-cache`, `projects/*.jsonl` transcripts, `~/.claude/backups`, `.netrc`, `.git-credentials`, `.npmrc`, plus a `Read(...)` rule for each. Tested on made-up paths: 19/19 Bash spellings and 3/3 Read-tool reads denied; memory files and normal reads still work.

**Bypass mode is off (01-11-2026, D45).** `permissions.disableBypassPermissionsMode: "disable"` — no Claude Code session can enter bypass mode or use `--dangerously-skip-permissions`. Claude Desktop has its own "Allow bypass permissions mode" toggle, left unchanged (Amit, Team plan, 01-11-2026); the key is not documented to cover it. `env` → `DISABLE_ERROR_REPORTING=1`; telemetry stays on because `DISABLE_TELEMETRY` also stops feature-flag fetching, which claude.ai skill sync and Remote Control need, and automatic updates stay on.

**Deliberately left out of `ask`.** These look risky but were measured and excluded. Prompting on them would produce ~24 interruptions a session instead of ~4.5 (both measured 18-09-2026 against the 87-rule `ask` list; not re-measured since), and a prompt you see twenty times a session is one you stop reading — which is worse than not having it.

| Command | Per session | Why it's out |
|---|---|---|
| `npx vite` / `npx vitest` | 11.3 | Routine build and test. `npx --yes`, the form that installs an arbitrary package, *is* in `ask` and costs 0.2/session. |
| `./gradlew` | 6.3 | The project's own build. FinNode's own rules require running it before every change. |
| `adb` | 3.9 | Your own emulator. |

**`rtk proxy`.** `Bash(rtk proxy *)` should exist nowhere, but it keeps coming back in `settings.local.json` files, which git ignores — so sweep those, not just the tracked files. What re-adds it is unproven (`baselines/global-open-tests.md` TC2). Global `allow` carries only the four read-only inner forms — `rtk proxy cat`, `find`, `grep`, `ls` — and a project adds a named spelling when it genuinely needs one, as `rtk proxy cmp *` was added for backup verification. The dangerous inner forms stay named individually in `ask`: `rtk proxy rm`, `rtk proxy git push`, `rtk proxy git reset`, `rtk proxy npm install`, and the rest.

**Pre-commit secret check (D45, 01-11-2026).** `~/.claude/.git/hooks/pre-commit` runs `project-rules/drift.sh` and blocks a commit if its secret scan prints a `SECRET PATTERN` line, or if the scan did not run. Mirror drift alone does not block. Git does not track hooks, so a fresh clone lacks it — recreate it from the copy below and `chmod +x` it. It covers this repo only, not projects; `git commit --no-verify` skips it (and `git commit` already asks).

```bash
#!/bin/bash
# Pre-commit secret check (audit C7, D45, 01-11-2026). Runs drift.sh's secret scan and
# blocks the commit if it finds a pattern, or if the scan did not run (fail closed).
# Mirror drift alone does not block. Untracked by git: documented in ENVIRONMENT.md § 3.
out=$(bash "$(git rev-parse --show-toplevel)/project-rules/drift.sh" 2>&1)
if printf '%s\n' "$out" | grep -q '^SECRET PATTERN'; then
  printf '%s\n' "$out" | grep '^SECRET PATTERN'
  echo "pre-commit: secret pattern found, commit blocked."
  exit 1
fi
if ! printf '%s\n' "$out" | grep -q '^secret scan: '; then
  echo "pre-commit: secret scan did not run (drift.sh failed), commit blocked."
  exit 1
fi
exit 0
```

**The mirror has two scripts, because of auto mode's self-modification classifier.** `project-rules/sync.sh` once held both a read-only drift report and a `--pull` that copies. Auto mode classified the combined script as self-modification and blocked it, so the mirror's only guard could not be run at all. A permission rule would not have fixed that honestly — `--pull` is just an argument, and argument-constrained `Bash(...)` patterns do not hold. The report path was split out into `project-rules/drift.sh`, which has no `cp`, `rm`, `mkdir` or output redirect and can therefore be granted safely; `sync.sh` keeps `--pull`, now required, and stays behind a prompt. Split 29-09-2026, and the first run of the separated reporter found real drift. **No new permission rule was added.**

**Current state — 03-10-2026: the two local settings files.** Two files named `settings.local.json` exist under `~/.claude`. Both are **ignored by git**, so neither is in this repo and **GitHub cannot show their contents**. Their rules **do not travel** to another machine or account. Counts change whenever Amit clicks allow on a prompt, so treat the numbers below as of this date only.

| File | allow / ask / deny | Status |
|---|---|---|
| `~/.claude/.claude/settings.local.json` | 14 / 0 / 0 (01-11-2026, `git add *` removed; 15 on 30-10-2026; 13 on 29-10-2026; 9 on 03-10-2026) | **Active** — confirmed |
| `~/.claude/settings.local.json` | 0 / 0 / 0 (01-11-2026, `git add *` removed; 1 before) | Present; **undocumented location**. `/skills` is recorded writing here; whether Claude Code reads it is **unverified** |

The nested file is the project-level overlay for `~/.claude` itself, because the setup repo lives at the path Claude Code also uses for its config. It is confirmed active: rules that exist **only** in it — `Bash(git ls-remote *)`, `Bash(git check-ignore *)`, `Bash(git fetch *)` among them — appear in the live `/permissions` allow list. `Bash(git ls-remote *)` was narrowed on 30-10-2026 to its three `origin` forms (**D41**).

The top-level file carried a single rule, `Bash(git add *)`, and an empty `skillOverrides` block; since 01-11-2026 its `allow` list is empty. **That rule was also present in the nested file**, so nothing observable proved the top-level file is read. It is recorded here as present, with its contents as read, and nothing more. Do not state that it is loaded without evidence that separates the two. **Undocumented, 10-10-2026:** a docs lookup, from search summaries rather than quoted text, found `settings.local.json` documented only inside a project's `.claude/` — for this folder, the nested file. Left in place by Amit's decision (T6). On 30-10-2026 `/permissions` listed `Bash(git add *)` once, sourced "Local settings"; that still does not separate the two files.

### How to check

- `/permissions` inside a session shows every rule and which file it came from.
- Counts: `jq` on the `permissions` lists in `settings.json`.
- What would prompt, against real history rather than a guess: § *How numbers are measured* → *Prompt volume*.
- `Bash(rtk proxy *)` coming back: `harness/session-check.sh` looks for it at every setup session start (TC2).

### How to change

- `/permissions` edits apply from the next tool call. Or edit `settings.json` directly. Read this section first (`STANDARDS.md` § *Explaining a permission request*).
- **Prompt volume feels wrong** — measure before changing. The replay (§ *How numbers are measured* → *Prompt volume*) tells you exactly what would prompt, against real history rather than a guess.
- **Why the `rtk ` spellings exist — and the hole that proved it.** The rtk hook rewrites a command *before* the permission check, so fencing `wget *` alone fences nothing: the engine only ever sees `rtk wget …`. `curl` carried all three spellings; `wget` carried the bare and `rtk proxy` forms but **not** `rtk `, so downloads ran unprompted until 20-09-2026. Probed live rather than reasoned — `wget …` → `rtk wget …`, and `pip3 install …` → `rtk pip install …`. **Any new fence needs every spelling the hook can produce.**

### Known gaps

- **An organisation policy is loaded remotely** (`claude doctor` shows it, from `api.anthropic.com`). It currently disables Remote Control. Its full contents aren't readable locally. If it ever sets `allowManagedPermissionRulesOnly`, the personal `allow` list stops applying — `ask` and `deny` would survive, because those only restrict.
- **Bash rules are not a security boundary.** They match the command text Claude writes. `/bin/rm`, `sh -c 'rm ...'`, and similar forms are not matched. The rules are there to catch the ordinary case and make you stop and look, not to contain an adversary.
- **`curl` and `rm` are the noisiest ask rules**, ~1.1 and ~1.2 prompts a session (date and method not recorded here). Most `curl` calls are the local Ollama health check on `127.0.0.1`, and most `rm` calls are scratchpad cleanup. Both were kept because narrowing a rule by argument is fragile — the docs are explicit that argument-constrained Bash patterns don't hold.
- **Write-only-here limits (D46):** shell commands can still write anywhere — default mode boxes them ("sensitive file" for `~/.claude`), auto mode may approve them silently; the Write tool is blocked from `/private/tmp` in Voice-Flow despite its `additionalDirectories` (cause not found; shell use of `/tmp` works). A recursive search can still walk into personal data not named here.
- **Private-store limits (D44):** a recursive search from a parent folder (`grep -rn x .` inside `~/.claude`, `grep -r x ~`) walks these files without naming them — in `~/.claude` use `git grep` or the Grep tool; globs and variables (`.ss?`, `${d}`); folder *names* via `|`, `;` or `$(…)` (contents still need a `/` and are denied); relative `backups/…` from `~/.claude`; other projects' personal data is not covered. Side effects: any command containing these words is refused — a commit message or doc grep must avoid them or use the Grep tool; a project command naming `.npmrc` is refused. Grep and Glob tools were not tested (not available in the testing session).
- **`git add`:** `git -c alias.x=add` is not fenced (F1).
- **`git remote`:** still untested whether `git remote -v add` matches.

## 4. Effort on Opus 5.5

### What it is

The effort level Claude runs at. The docs (`code.claude.com/docs/en/model-config`, fetched 10-10-2026): *"Opus 5.5 starts at `medium` unless one of the sources above sets a level for it, and a top-level `effortLevel` in your user settings file doesn't count for Opus 5.5."*

### Current setting

`settings.json` sets `"effortLevel": "high"` and `"modelSettings": {"claude-opus-5": {"effortLevel": "high"}}`. Both keys stay; Amit sets Opus 5.5 effort himself with `/effort` (T6, 10-10-2026).

### How to check

None yet

### How to change

`/effort` in the session (Amit).

### Known gaps

The old keys are not known to apply: whether the `claude-opus-5` key also covers `claude-opus-5-5` is **not documented**.

## What every session loads

**Not imported by `CLAUDE.md` on purpose.** The three files that *are* imported cost **about 7.6k tokens** on every turn of every session (last measured 01-11-2026; not re-measured since `STANDARDS.md` changed (12-11-2026)) — `/context all` in a fresh session from `~/.claude`, 01-11-2026, Opus 5.5, Claude Code version not recorded, run by Amit. `STANDARDS.md` 6.7k + `RTK.md` 641 (before `c808989` shortened `RTK.md` the same day; the table below is after it) + `OLLAMA.md` 214; the 7.6k is the sum of those three, and the 6.7k is rounded by `/context`. `CLAUDE.md` itself is a further 34 and is **not** one of the three — it is the file doing the importing.

A file explaining why a threshold is 200K doesn't change how work gets done, so it stays out of that budget. `PROJECTS.md` and `REPOS.md` joined this file and `SETUP-PLAN.md` outside the import list on 22-09-2026, for the same reason — reference, not rules.

**Startup: 25.2k (last measured 01-11-2026; not re-measured since `STANDARDS.md` changed (12-11-2026)).** `/context all` in a fresh session from `~/.claude`, run by Amit, **Opus 5.5**, Claude Code 2.1.316, `Messages` 10 tokens, after `aca6d86`. **Measured, not estimated.**

| Bucket | 01-11-2026 (earlier) | 01-11-2026 (now) |
|---|---|---|
| System prompt | 2.5k | 2.5k |
| System tools | 14.3k | 14.3k |
| Memory files | 7.8k | 8.2k |
| Skills | 261 | 261 |
| **Total** | **24.8k** | **25.2k / 1m** |

The earlier column is after the token pass (`c808989`) and three skills name-only (`3fa82b8`), down from 25.5k that morning; the rise to 25.2k is the rules added in `2657315` and `aca6d86`. Memory files by file now: `STANDARDS.md` 6.7k, `RTK.md` 404, `.claude/CLAUDE.md` 547, `MEMORY.md` 324, `OLLAMA.md` 214, `CLAUDE.md` 34. **The 8.2k is a setup-session figure:** it includes `.claude/CLAUDE.md`, which loads only in sessions started in `~/.claude`, so a project session carries about 7.7k. Always-loaded words, the everyday files without `.claude/CLAUDE.md`: **3,874** (method not recorded).

**No fixed target (Amit, 01-11-2026).** 23k was a past baseline, not a target. The goal is fewer tokens for the whole task; keep lowering where it helps.

**Current state — 03-10-2026: project-work token cost.** **149,112 tokens per assistant turn** — 1,018,735,369 tokens over 6,832 turns. Method: sum `input_tokens + cache_creation_input_tokens + cache_read_input_tokens + output_tokens` across every session transcript under `projects/*/`, dated after 17-09-2026, with `~/.claude` sessions excluded so only real project work counts. The comparable figure for the same work before that date is **215,251** over 9,680 turns. **Measured and reproducible** — re-running the sum returned the identical figure.

Two limits, both real. It is cost per **turn**, not per finished task: nothing in the transcripts marks task boundaries, so it does not show whether a task now takes more turns than it used to. And the work differed between the two periods, so the drop is **not** proof the setup caused it.

### What is switched off to get there

Five changes, each reversible. Four are lines in `settings.json`; the fifth was written by the `/plugin` menu.

| Change | What it did | Undo |
|---|---|---|
| `enableArtifact: false` | The single largest cut. Removes the Artifact tool, and with it the three `artifact-*` skills | delete the line |
| `disableClaudeAiConnectors: true` | Turned the claude.ai connectors off wholesale — no per-connector setting exists | delete the line |
| `browser-use@synced` disabled | Its cost was MCP **server instructions**, which `skillOverrides` cannot reach | re-enable in `/plugin` |
| `engineering@synced` disabled | −0.9k of skill catalogue (26-09-2026), and its 16 MCP auth tools cost nothing either way. An upgrade took the same amount back the same hour (history table: `baselines/environment-old-12-11-2026.md` § *How the numbers moved*). Causation is inferred, not proven | re-enable in `/plugin` |
| `skillOverrides: name-only`, 33 entries | Keeps a skill working and suggestable at under 20 tokens instead of its full cost | delete an entry |

**Plugins now: `swift-lsp` enabled, `pdf-viewer` turned off by Amit in `/plugin` (01-11-2026, audit C6 — it ran an unpinned `npx` package at every session start; verified off at the next session start: no `pdf-viewer` tools or skills in `/context all`, no `server-pdf` process), 12 disabled in `settings.json`.**

**What the 33 `skillOverrides` entries are.** 30 bare keys. **18 were confirmed working by measurement on 26-09-2026.** The 12 added on 30-09-2026 are the heaviest remaining skills, ~2.1k between them. `claude-api` was deliberately left at full cost: its description is an auto-trigger, and `name-only` would delete it. The 5 `pdf-viewer` skills cannot be reached at all.

**Current state — 03-10-2026: the 12 are verified.** The first-turn `/context` reads Skills **1.1k**, against ~3.0k before the keys were added and a prediction of ~1.1k. Skills is reported on its own `/context` line, so this check does not depend on the total and is untouched by the deferred-tools caveat (in `baselines/environment-history-01-11-2026.md` § C). 3 `artifact-*` keys naming skills that no longer load at all since `enableArtifact: false` — harmless, kept at Amit's direction. There were 36: the other 15 were plugin keys, removed on 26-09-2026 once `/skills` confirmed they never could work. `user-invocable-only` was confirmed working too, on a separate skill: the skill count went 49 → 48 (date not recorded) and the skill left the list entirely, still typable as `/doc-coauthoring`.

**`/skills` writes to `~/.claude/settings.local.json`, which is gitignored** (memory note `skill-overrides-name-only`). Its `skillOverrides` block **merges** with the one in `settings.json` rather than replacing it — verified 26-09-2026. **Which file held the entries during that check is not recorded**, so it does not prove the top-level file is read — see the local-settings table in § *3. Permissions*. And because the file is gitignored it is **not in this repo and does not travel to a second account.**

### What holds, whatever the numbers do

- **Caching changes what a number means.** Across 14,048 model calls, 98.3% of input tokens were cache reads, billed at 0.1× (date not recorded here). Effective input cost is about **12% of raw**. The saving is real but compounds slowly — worth doing once, not worth chasing in 200-token increments.
- **The rule files were never the load.** The savings came from turning off plugins and connectors, not from editing prose — and `STANDARDS.md` is the part that decides how work gets done.
- **A plugin's catalogue cost is not its skill bodies.** `claude plugin details <name>` splits them: `engineering` cost 871 tokens always-on for 10 skills (date not recorded), while each body — `code-review` 1,200, `debug` 1,200, `incident-response` 1,700 — loaded only when that skill fired. A skill you keep is already lazy; disabling it does not make it lazier, it makes it undiscoverable.
- **`skillOverrides` cannot reach plugin skills at all.** `/skills` shows them as *"locked by plugin · Plugin skills are managed via /plugin"*, and saved twice without writing an entry. Bare names are reliable; a plugin key is a silent no-op in any format. The only lever is `/plugin`, whole-plugin on or off. **D28.**
- **Ask the menu, never guess the key.** `/skills` and `/plugin` write the correct key by definition. `/skills` produced `anthropic-skills:doc-coauthoring`, a prefix `/context` never prints, so a key cannot be derived from what `/context` shows. `/plugin` produced `engineering@synced`, where the suffix was otherwise a coin-flip. **D29.**
- **A rule file's token cost can be estimated from its character count**, good to about 1% at this size: `RTK.md` at 915 → 1,190 chars was predicted at ~486 and measured 491 (26-09-2026). Confirm with `/context` anyway when the change is large.
- **Hold the conditions fixed before comparing anything** — version, model, effort, mode, folder and prompt. The system prompt alone moved 2.2k → 3.2k on the change from Opus 5.5 to Opus 5 (date not recorded).
- **The session that makes a change cannot measure it.** Settings load at session start. Always open a new one.

`SETUP-PLAN.md`'s decision table holds the full history behind **D28** and **D29**.

### What was deliberately not cut

- **Memory files** — most of it `STANDARDS.md`; sizes in the 01-11-2026 table above. Per **D26**, a rule file is not trimmed.
- **The system prompt** — 2.4k on Opus 5.5 (10-10-2026). Not settable.
- **FinNode's `CLAUDE.md`** — 3,748 tokens (date not recorded here). Splitting its rule claims from their evidence looked like a 41% win on paper. Reading it showed most of that prose is operative: which of `observeById` / `getById` fails which way, that moving the device clock does *not* fire a pending sweep. Only ~600 tokens are genuinely historical, in one project, at 0.1× — about 70 effective tokens a turn. **The Voice-Flow 110 KB diagnosis has now failed to transfer to FinNode twice.** Measure the sections before proposing the fix.

## How numbers are measured

All from the session transcripts in `~/.claude/projects/*/*.jsonl`, which record the real `usage` counts and every tool call:

- **Context size** — sum `input_tokens` + `cache_creation_input_tokens` + `cache_read_input_tokens` from the last assistant message.
- **Prompt volume** — replay every historical `Bash` tool call against the `ask` rules, splitting compound commands on `&& || ; | &` and stripping the documented wrappers. Measured 4.5 per session across 5,188 commands in 49 sessions (18-09-2026, against the 87-rule `ask` list; S4's 30-10-2026 replay in § *3. Permissions* is the newer method).
- **Command frequency** — count matches per tool call, divided by distinct sessions.
- **Startup breakdown — use this one.** `/context all` in a fresh session, nothing typed: it itemises every tool, skill and rule file with its own size, so a change can be attributed rather than guessed. Settings load at startup, so **the session that makes a change cannot measure it** — always open a new one. Record model and folder with the figure; the system prompt alone moved 1k between Opus 5.5 and Opus 5 (date not recorded).
- **Startup baseline** — the older first-reply method, kept because the 22-09-2026 and 25-09-2026 figures use it. Fresh sessions only: new Terminal window, `cd ~`, bare `claude`, the prompt `Reply with the single word: ok`, then `/exit`. Sum the three fields above on that session's **first** assistant reply. A log counts only if it is new and its first user message is that prompt — an attached or resumed session fails this. Record version, model, effort, mode and folder with the figure.

**The two startup methods are not directly comparable.** The first-reply sum adds the `usage` fields on a session's first assistant reply, which includes the first user message and the system reminders around it. `/context` is read with nothing typed. On the same day (not recorded), before any change, the two differed by about 10k. Which is the better proxy for a real session is **not settled**. `/context` is used from here on, because it itemises and repeats.

Re-run these before changing a threshold or a rule. Every measured number in this file came from them, and a guess that replaces a measurement is how the 150K threshold and the "122 prompts per session" figure both turned out wrong the first time.

**Retention.** `cleanupPeriodDays` is 60, set 22-09-2026. Transcripts are not junk: every first-reply figure in this file came from them. Nothing was deleted when it was set — the oldest transcript was 21 days old.

## The project trees on this machine

Surveyed 15-09-2026. `PROJECTS.md` is the index; this is the state behind it, kept here so the index doesn't have to carry it into every turn's context. Verify against the filesystem rather than against the previous version of the file.

### Branch state — read it from git, not from here

This section used to hold a table of each project's branch and last commit date. It was accurate on the day it was written and wrong within weeks, which is the same defect `SETUP-PLAN.md` § *Git state is not recorded here* exists to prevent. One command answers it properly, and is never out of date. This is the one copy of the sweep; anywhere else that needs it points here:

```bash
for r in ~/.claude ~/Documents/VS\ Code/{Voice-Flow,FinNode,vthrudebugger_v1,Debugger\ v2} \
         ~/Documents/VS\ Code/Emp\ portal/Vthru_Emp_v2.1_jun26; do
  printf '%-22s %-46s %s\n' "$(basename "$r")" \
    "$(git -C "$r" status -sb | head -1)" "$(git -C "$r" log -1 --format=%ad --date=short)"
done
```

**What is worth knowing, and does not rot:** a project parked on a feature branch for months is worth a question before starting anything new in it — was that work finished, merged, or abandoned? Which projects those are changes; that it is worth asking does not.

### Duplicate trees

**One Voice Flow tree remains:** `~/Documents/VS Code/Voice-Flow`. The older copies `Voice Flow_v1` and `Voice-Flow-main` are deleted, confirmed absent 31-10-2026; their names in older records and `~/.claude.json` are history.

**Two Packbly trees exist**, `~/Documents/VS Code/Packbly_web/v1.1-Packbly` and an older copy at `~/Documents/extra/v1.1-Packbly`. Both are detached from Claude Setup (30-10-2026); the folders and their data stay on disk.

**Two Debugger trees exist.** Amit chose `~/Documents/VS Code/vthrudebugger_v1` as the tree to work on, 27-09-2026; `Debugger v2` is next up and may become an npm package (30-10-2026). A further copy under `~/Debugger` is gone, and whether `vthrudebugger_v1` holds its work is unknown — see § *Project-tree decisions*.

### Project-tree decisions

**Both are answered**, each dated below. They were settled by Amit's decisions and by one folder disappearing — not by opening the projects — so where something is still unknown, the entry says so rather than rounding it up.

- ~~**Which Debugger tree is current?**~~ **Settled by decision on 27-09-2026, not by a check.** Amit is working on `~/Documents/VS Code/vthrudebugger_v1`; `Debugger v2` is parked. *State on 30-10-2026 (audit CL3):* `Debugger v2` is no longer parked — it is next up (§ *Two Debugger trees exist* above; `PROJECTS.md`). Neither replaced the other — both were seeded from V-Thru's `DebugProvider.tsx` and then kept deliberately independent, so "successor" was never right. **Unknown, and not investigated:** whether `vthrudebugger_v1` is the newest or most complete Debugger tree. The 03-08-2026 memory `project-debugger-repo-fresh-start` says `~/Debugger/vthrudebugger_v1` was the furthest-ahead clone — mocks, storage, filter, InfoPanel, report — and `~/Debugger` is gone. Amit deleted a tree and does not recall which; whatever survives is either in `~/Documents/VS Code/vthrudebugger_v1` or on GitHub. No tree was opened to find out, and whether that work survived is not known.
- ~~**Is `Packbly v2` a real project?**~~ **Amit's decision, 27-09-2026.** Yes, it is. He is not working on it and the entry stays exactly as it is; someone else may pick it up. *State on 30-10-2026 (audit CL3):* Packbly v2 is detached from Claude Setup, with Packbly Web and Voice Flow v1 (`harness/status.md` § *Open*).

### Sensitive data

Two projects hold real personal records, and `OLLAMA.md` has the standing rule about what may be sent to a local model:

- **Emp Portal** — employee records
- **Packbly Web** — customer and courier records. Detached from Claude Setup 30-10-2026; the data is still on disk, so the `OLLAMA.md` rule still applies.

### Full project descriptions

`PROJECTS.md` carries a one-line version of each of these so it stays cheap to load. The detail lives here.

- **FinNode** — `~/Documents/VS Code/FinNode` — offline-first personal Android finance tracker for Indian users. Kotlin + Compose, Room + SQLCipher, **regex bank-SMS parsing**, **diary linked to transactions**. Progress lives in its own `docs/ROADMAP.md`, not here. Has `CLAUDE.md` and a `docs/` set indexed from `README.md`.
- **Voice Flow** — `~/Documents/VS Code/Voice-Flow` — personal macOS dictation app: floating mic widget callable from anywhere, global hotkey, real speech-to-text, an AI cleanup pass, and auto-paste **into whatever app is focused**. Electron + React + Vite. Also runs as a plain web app (`npm run dev`) for development, but the desktop build is the real product.
- **Debugger** (vthrudebugger) — `~/Documents/VS Code/vthrudebugger_v1` — drop-in in-app debugger library for React Native. **TypeScript + RN peer deps, RN Gesture Handler/Reanimated**. **Auto-captures network, console and errors**; **QA-facing alert toasts**, network inspector, **client-side mocks**. **The Debugger tree Amit is working on** — his decision, 27-09-2026, not a check of which tree is furthest ahead.
- **SecondBrain schema** — `~/Documents/SecondBrain Obsidian/schema` — schema for an Obsidian vault. **The vault itself is the parent directory**, which holds `raw`, `wiki` and `schema`.
- **Emp Portal** (Vthru-Emp) — `~/Documents/VS Code/Emp portal/Vthru_Emp_v2.1_jun26` — multi-tenant HR portal. React 18 + Vite **frontend**, Express 5 + better-sqlite3 **backend**, role-based dashboards. Holds real employee records.
- **Debugger v2** — `~/Documents/VS Code/Debugger v2` — in-app debug overlay for React Native, built so **a developer can drop it into an app**. GitHub: `github.com/AmitJangra25/vthrudebugger_v2`. **A separate project from `vthrudebugger_v1`, not a successor**; parked 27-09-2026, **next up and may become an npm package** (Amit, 30-10-2026) — the history is in § *Project-tree decisions*. **Carries its own** `ARCHITECTURE.md`, `INTEGRATION.md`, `PLAN.md`, `DEPENDENCIES.md`.
- **AtWorkpe** — `github.com/AmitJangra25/AtWorkpe`, **on GitHub only, not cloned** — multi-tenant company portal: leave management, attendance tracking, goals, documents, salary slips, onboarding and role-based dashboards (Admin, HR, Manager, Team lead, Employee). Production-ready multi-tenant HRMS SaaS, React + Vite client and Express + SQLite server.
- `~/Documents/extra/v1.1-Packbly` — a Next.js tree, apparently an older copy of Packbly Web. Last commit 23-06-2026.
- `~/Documents/Skils/PM-skills-Amit` — **a clone of the public `phuryn/pm-skills` repository. Reference material, not your code.**

## Older records

Read one only when a pointer here sends you there.

- `baselines/environment-old-12-11-2026.md` — the whole of this file before T21, word for word. Everything moved out in T21 is there, by its old section: earlier import readings and the last full reviews (top of file); rtk's monthly savings, the 20-09-2026 hook-audit note and its "recurs or closes itself" line, and the "Moved from `RTK.md`" notes of 01-11-2026 and 05-11-2026 (§ *1. RTK*); the permission changes of 18-09-2026 and 22-09-2026 (§ *3. Permissions*, *Changed 18-09-2026*); the original `rtk proxy` decision, its 30-09-2026 sweep and the `git commit` row (§ *Deliberately left out of `ask`*); the 11-10-2026 startup readings and 23k baseline, the 30-09-2026 note on the 12 unverified keys, the "Block 4's runbook needs this" note and the failed `skillOverrides` prediction (§ *What every session loads*); the 22-09-2026 to 26-09-2026 startup table (§ *How the numbers moved*); the 15-09-2026 `PROJECTS.md` corrections (§ *Corrections made on 15-09-2026*).
- `baselines/environment-history-01-11-2026.md` — moved out 01-11-2026: permission count changes to 29-10-2026 (§ A), startup readings of 26-09-2026 (§ B), notes on the 03-10-2026 column (§ C), status-line threshold changes (§ D, § E).
- `baselines/s4-permissions-30-10-2026.md` — the S4 permission pass and its full rule list.
- `baselines/t6-removals.md` — the T6 removals, with their original text.
- `SETUP-PLAN.md` — the decisions (D-numbers), incl. the 18-09-2026 phases 1.2 and 1.3.
