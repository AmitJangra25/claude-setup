# This machine

How Claude Code is set up here, and why each choice was made. Reference material —
read it when you're about to change something, not on every session.

**Not imported by `CLAUDE.md` on purpose.** The three files that *are* imported cost
**about 6.3k tokens** on every turn of every session — `/context all` in a fresh session
from `~/.claude`, 10-10-2026, Claude Code 2.1.296. `STANDARDS.md` 5.5k + `RTK.md` 570 +
`OLLAMA.md` 266; the 5.5k is rounded by `/context`. `CLAUDE.md` itself is a further 34
and is **not** one of the three — it is the file doing the importing. Earlier readings:
~5,355 on 30-09-2026 (2.1.285) and ~3,166 on 22-09-2026; `STANDARDS.md` grew between
them (**D27**, **D30**), so the rise is real, not a measurement change.

A file explaining why a threshold is 200K doesn't change how work gets done, so it stays
out of that budget.
`PROJECTS.md` and `REPOS.md` joined this file and `SETUP-PLAN.md` outside the import list
on 22-09-2026, for the same reason — reference, not rules.

Last full review: 10-10-2026 (T6, batch 6). The one before was 22-09-2026.

Figures below include measurements, estimates and projections. Each should state its date
and method — the commands are in § *How the numbers were measured*.

## What's in this file

- § *The two kinds of rule* — global rules against project rules.
- § *What's set up globally* — settings, permission counts, the local settings files, the
  hook, the status line, skills, effort on Opus 5.5.
- § *Deliberately left out of `ask`* — what was not fenced, and why.
- § *What every session loads before you type* — startup cost, and what was switched off
  to get there.
- § *Known gaps* — what this setup does not protect against.
- § *Changing any of this* — the method to follow before adding or removing a rule.
- § *How the numbers were measured* — the commands behind every figure here.
- § *The project trees on this machine* — the project list and the duplicate trees.

---

## The two kinds of rule

This matters more than anything else in this file.

| | Where | What it does |
|---|---|---|
| **Enforced** | `settings.json` | Claude Code blocks or prompts before the tool runs. Cannot be talked out of. |
| **Guidance** | `CLAUDE.md`, `STANDARDS.md` | Shapes what Claude tries. Not a boundary. |

From the Claude Code docs, on putting rules in `CLAUDE.md`: *"This shapes what Claude
tries but doesn't enforce a boundary."*

So anything that must hold goes in `settings.json`. Anything about how to work well goes
in `STANDARDS.md`. Writing an enforcement rule as prose is the most common way to end up
with a protection that was never actually on.

---

## What's set up globally

Three things, all in `~/.claude/`, all applying to every project automatically —
existing ones, new ones, VS Code, Android Studio, and cloud sessions alike.

### 1. RTK — token compression

`settings.json` → `hooks.PreToolUse` runs `rtk hook claude`, which rewrites commands
before they run:

    git status   →   rtk git status

This is where the token saving comes from. It is **not fully separate from
permissions.** rtk 0.48.0's hook returns `"permissionDecision": "allow"` on some
rewrites — seen on `rtk gh run list` and `rtk tree` (**D35**, `baselines/t6-removals.md`
entry 3). `ask` and `deny` rules still apply whatever the hook returns — the docs:
*"Deny and ask rules are still evaluated regardless of what the hook returns."*
(`baselines/global-open-tests.md` item 11).

> **What the hook actually rewrites, tested 26-09-2026.** It handles a plain command
> and the `&&` and `;` chain operators. Nearly every other shell construct makes the
> *whole line* run raw — redirects are the exception noted in the table:
>
> | shape | result |
> |---|---|
> | `grep -rn foo .` · `cd /tmp && git log` · `cat a; cat b` | rewritten |
> | `grep foo . \| head` — any pipe | **raw** |
> | `cat a > /tmp/x` — a redirect | **usually raw** — not always: on 10-10-2026 `rtk hook check` rewrote `tree . > /tmp/x`, and the hook log holds one real redirect rewritten inside a chained line |
> | `echo $(cat a)` — any subshell | **raw** |
> | `for f in a b; do cat $f; done` · `f(){ cat $1; }` | **raw** |
> | `python3 …` · `sed …` — not handled in any form | **raw** |
>
> **This is why adoption was 26%**, not because rtk failed: `rtk session` reported
> 24–34% across four sessions on 26-09-2026, and `rtk discover` found ~36.3K tokens
> left on the table over 279 scanned commands — mostly `grep -B` (21), `gh api` (13)
> and `git log` (11). The habit that closes it is in `RTK.md`: prefer the plain form
> over piping into `head` when the output is small enough to read anyway.
>
> **Treat 36.3K as a floor.** `rtk discover` said it scanned 279 commands over 30 days
> while `rtk session` counted 555 on 26-09-2026 alone, so the two disagree about their
> own window.
>
> **Current state — 09-10-2026:** `rtk gain` reports **60.9% over 12,104 commands, 8.5M
> tokens saved** (59.0% over 11,496 on 03-10-2026). The
> overall percentage drifts with the mix of work — it fell from 59.6% to 59.0% during a
> single docs-heavy session, because grep and read save least. **Treat the overall number
> as "roughly 60%" and read the live value from `rtk gain`**; the per-command figures below
> are the stable and useful part. `RTK.md` deliberately copies no total.
>
> **Savings are lopsided by command**, measured 26-09-2026 over 10,017 commands (59.6%
> overall, historical):
> `ps aux` 98.3%, `eslint` 95.2%, `gradlew` 95.9%, `vitest` 89.4% — but `grep` 22.0%
> and `read` 10.9%. The low figures are correct. rtk saves by stripping redundancy, and
> a file read or a grep hit is signal, not boilerplate. `ps aux` saved 2.6M tokens in 49
> runs; 2,694 greps saved 473K. **Do not read a low percentage as a fault.**
>
> Monthly: Jul 539K saved (63.3%), Aug 5.3M (65.7%), Sep 1.3M (42.3%). September is
> lower because the work was docs and setup — grep and read — not test runs.

**The catch worth knowing.** Claude Code has a built-in list of commands that never
prompt: `ls`, `cat`, `echo`, `pwd`, `head`, `tail`, `grep`, `find`, `wc`, `which`,
`diff`, `stat`, `du`, `cd`, and read-only `git`. RTK renames them to `rtk ls`, `rtk grep`
and so on, and the built-in list no longer recognises them — so they start prompting.

That is why 615 permission entries had accumulated across the projects: safe commands
were being approved by hand, one project at a time. The global `allow` list now covers
the read-only `rtk` wrappers, so this stops happening.

**Hook auditing is on, from 20-09-2026.** `settings.json` → `env` sets
`RTK_HOOK_AUDIT=1`, so rtk writes one line per hook call to
`~/.local/share/rtk/hook-audit.log`; read it with `rtk hook-audit`. `env` is read at
session start, so it never covers the session that set it. It is there to catch the one
observed case where the hook did **not** rewrite a command — see `SETUP-PLAN.md`
§ *Findings not acted on*. Either it recurs with evidence, or it closes itself.

### 2. Status line — live context size

`statusline/context.py` reads the real token counts from the session transcript and
prints the current context size. It never estimates. Thresholds and the data behind them
are documented at the top of that file.

Short version: grey under 200K, amber to 300K, red to 400K, then suggests `/compact`.
**Lowered to 200K/300K/400K on 11-10-2026** at Amit's request, to save tokens: a session
past 250K costs more per turn and uses more of the usage limit, so the nudge now comes
sooner; 150K was considered and judged too early. The warning exists to nudge a clear at
a **task boundary**, where it saves 45–54%, rather than mid-task, where it saves about 3% — it was
never about running out of room. Earlier values: 250K/400K/600K, lowered to
220K/300K/450K on 26-09-2026, raised to 250K/400K/550K on 30-09-2026 because against a 1M
window 220K fired while roughly 94% of it was still free.

**It costs nothing in tokens.** The status line is a shell command the terminal renders;
its output never enters the model's context. Changing it is free, so tune it freely.

**What it's for.** Claude re-reads the whole conversation on every step, so a long
session pays for its entire history on every small action. Sessions start around 48K and
grow ~1,200 tokens per turn; the deepest recorded is 588K.

**What to do about it:** `/clear` when you finish one task and start an unrelated one.
Not mid-task — clearing during a long single task saved only 3% in the measured sessions,
versus 45–54% for sessions with several distinct tasks. The boundary is what saves
tokens, not the number.

### 3. Permissions — what stops and asks

    allow   37 rules    read-only things stop prompting
    ask    188 rules    all on things that change something
    deny    34 rules    .env blocked for Read and 10 shell commands; not airtight

**Re-measured 30-10-2026 (S4, D41)** (`jq`): `allow` **39 → 37** (`tree *`, `xxd *` out)
and `ask` **96 → 188**. Read forms of `gh pr|repo|auth|api`, `git merge-base`, `security`
and words inside grep or echo text no longer ask; the writing forms of those commands do,
and so do the `git -<opt> …` spellings of dangerous git commands (`git -C dir push`
matched no rule before), `git … --output`, `--upload-pack`, forced or discarding `switch`
and `pull --rebase|--force`. Replayed against past Bash history: boxed calls 2,241 →
1,722. Record and the full rule list: `baselines/s4-permissions-30-10-2026.md`.

**Counts measured against the live file 15-10-2026** (`jq`); `ask` re-measured 23-10-2026,
58 → 90 (see *Added 23-10-2026* below). On 29-10-2026 `ask` went **90 → 96** (`find`
`-delete`, `-exec`, `-ok`, `-fprint`, `-fls`; `xargs … rm`) and `deny` **2 → 34** (`.env`
for `rtk read`, `rtk grep`, `rtk rg`, `xxd`, `cat`, `less`, `awk`, `sed`, `head`, `tail`,
three patterns each, plus two `rtk proxy` patterns); every rule tested in `/tmp`. `allow` went **34 → 39** on
23-10-2026: `rtk git branch *` became six listing forms (see *`git branch` is allowed only as a
listing* below). Before that, **33 → 34** on 10-10-2026 (**D35**: `rtk git rev-parse *`
out, `rtk gh run list*` and `rtk tree *` in). Sessions
started in `~/.claude` also load two setup-only `ask` rules from `.claude/settings.json`,
`git stash pop` and `git stash apply` (**D36**; four until S4 removed the blanket
`git pull` and `git switch`, **D41**); they are not in the counts above. On 27-09-2026 `ask` went **51 → 58**:
seven rules closing the `git restore`, `git stash drop`/`clear` and brew gaps — see
`SETUP-PLAN.md` § *FinNode — open, not acted on* for the measurement and what was not
fenced. Before that, two corrections this block carried
for a while: it read `ask 87` until 20-09-2026, and then `ask 112` until 22-09-2026,
having missed the merge that took **112 → 51** on 20-09-2026 (one pattern per command
instead of up to three spellings — `SETUP-PLAN.md`'s **`ask` list merged** row). `allow` went
**35 → 33** on 22-09-2026. The path before that: **87 → 101** when Phase 3's gaps were
closed, **→ 107** with the six `git commit` spellings added by the Voice-Flow pass (see
`SETUP-PLAN.md`'s **`ask` rules proven** row), **→ 112** when the permission-list pass added
`rtk wget` and four `pip` spellings. The old "~5.0 prompts per session" figure was
measured against 87 rules and has been dropped rather than carried forward, because it
was never re-measured.

**Current state — 03-10-2026: the two local settings files.** Two files named
`settings.local.json` exist under `~/.claude`. Both are **ignored by git**, so neither is
in this repo and **GitHub cannot show their contents**. Their rules **do not travel** to
another machine or account. Counts change whenever Amit clicks allow on a prompt, so
treat the numbers below as of this date only.

| File | allow / ask / deny | Status |
|---|---|---|
| `~/.claude/.claude/settings.local.json` | 15 / 0 / 0 (30-10-2026; 13 on 29-10-2026; 9 on 03-10-2026) | **Active** — confirmed |
| `~/.claude/settings.local.json` | 1 / 0 / 0 | Present; **undocumented location**. `/skills` is recorded writing here; whether Claude Code reads it is **unverified** |

The nested file is the project-level overlay for `~/.claude` itself, because the setup
repo lives at the path Claude Code also uses for its config. It is confirmed active:
rules that exist **only** in it — `Bash(git ls-remote *)`, `Bash(git check-ignore *)`,
`Bash(git fetch *)` among them — appear in the live `/permissions` allow list.
`Bash(git ls-remote *)` was narrowed on 30-10-2026 to its three `origin` forms (**D41**).

The top-level file carries a single rule, `Bash(git add *)`, and an empty
`skillOverrides` block. **That rule is also present in the nested file**, so nothing
observable proves the top-level file is being read. It is recorded here as present, with
its contents as read, and nothing more. Do not state that it is loaded without evidence
that separates the two. **Undocumented, 10-10-2026:** a docs lookup, from search summaries
rather than quoted text, found `settings.local.json` documented only inside a project's
`.claude/` — for this folder, the nested file. Left in place by Amit's decision (T6).
On 30-10-2026 `/permissions` listed `Bash(git add *)` once, sourced "Local settings";
that still does not separate the two files.

**`git add` is decided by the mode, not a rule (30-10-2026).** The hook turns every
`git add …` into `rtk git add …` (`rtk rewrite`), so `Bash(git add *)` in both local files
never matches anything. No `allow` or `ask` rule matches `rtk git add`. In auto mode the
classifier lets it through with no box (tested on a scratch repo in `/tmp`); in default
mode a box is expected but untested. Amit accepted no box in auto mode — staging is
undoable and `commit`/`push` are fenced — and the two dead rules stay (FinNode backlog 6).

Neither file is merged, moved or changed by this note.

**Why the `rtk ` spellings exist — and the hole that proved it.** The rtk hook rewrites a
command *before* the permission check, so fencing `wget *` alone fences nothing: the
engine only ever sees `rtk wget …`. `curl` carried all three spellings; `wget` carried
the bare and `rtk proxy` forms but **not** `rtk `, so downloads ran unprompted until
20-09-2026. Probed live rather than reasoned — `wget …` → `rtk wget …`, and
`pip3 install …` → `rtk pip install …`. **Any new fence needs every spelling the hook
can produce.**

**`git branch` is allowed only as a listing.** The hook turns every `git branch …` into
`rtk git branch …`, so this file's rule decides for every project. It allows exactly
`rtk git branch`, `--show-current`, `-a`, `-vv`, `--list *` and `-a --list *`. The wide
`rtk git branch *` it replaced let `git branch -vv -D x` delete a branch and
`git branch -vv -f x` move one with no prompt: git accepts a verbose flag beside a
changing one, and the `*git branch -D*` ask rule only matches the flag in first place.
`--list` takes a trailing wildcard safely because git refuses or ignores every changing
flag beside it (`-c -C -m -M -d -D -u --edit-description --unset-upstream` give a usage
error; `-f`, `-t` and `--create-reflog` only list). `-vv` must stay exact. Tested on a
scratch clone, 15-10-2026.

**Changed 18-09-2026** (phases 1.2 and 1.3 — `SETUP-PLAN.md` has the full record).
`ask` went 52 → 87: 15 commands that ran silently in at least one project are now
fenced — `tccutil`, `sudo`, `security`, `killall`, `sqlite3`, `open`, `git mv`,
`gem install`, `ollama pull|rm|signin`, `gh api|pr|auth|repo` — each in bare and
`rtk proxy` spelling, plus `rtk ` for `git mv` and the four `gh` forms. Measured cost
by replaying 5,734 historical Bash calls: **+0.46 prompts per session**; 25 of the 35
never fire against history at all.

`allow` went 32 → 35: `rtk discover`, `rtk --version`, and read access to rtk's tee
directory. That last one matters — `blockReadsOutsideWorkingDirectories` is true and
rtk's tee directory sits outside every project, so until this was made global, rtk
could write overflow logs everywhere but read them back only in Voice-Flow.

Two consequences followed: `Bash(gh auth status*)` and `Bash(gh repo view*)` became
**dead letters**, because the broader `ask` rules override them. They were left in place
until **22-09-2026, when both were removed** — a rule that can never fire is a file
claiming a permission it does not grant. Removing an `allow` rule can only ever add a
prompt, and these already prompted. The same sweep removed two more in Voice-Flow
(`GIT_EDITOR=true git rebase --continue`, `tccutil`), four exact duplicates, and one
`lsregister` rule naming a `release/mac-arm64` path that no longer exists.

**`allow`** — read-only `rtk` wrappers (`rtk tree` among them), `gh run list`,
`WebSearch`, and docs domains. `tree *` and `xxd *` were removed on 30-10-2026 (**D41**):
the hook turns `tree` into `rtk tree`, so the bare rule never fired, and `xxd in out`
writes a file. Purely additive: permission lists merge across files, so a global allow
entry can only ever remove a prompt, never add one.

**`ask`** — git operations that publish or discard work (`push`, `reset`, `rebase`,
`clean`, `rm`, `merge`, `checkout`, `restore`, `stash drop`, `stash clear`), dependency
installs including brew's `install`, `uninstall`, `upgrade` and `reinstall`, `npx --yes`,
`rm`, `curl`, `wget`, `pkill`, `kill`. Since the 20-09-2026 merge most are one pattern
with a leading `*`, which covers the bare, `rtk` and `rtk proxy` spellings at once; `rm`,
`kill`, `killall`, `pkill` and `open` keep explicit spellings, because they sit inside
ordinary words (`SETUP-PLAN.md`'s **`ask` list merged** row). **Added 23-10-2026:** `git cherry-pick`, `revert`, `filter-branch`, `filter-repo`,
`update-ref`, `reflog expire|delete`, `tag -d|-f` and `remote add|set-url` — each as `*git X*`
and `*git * X*`, so an option before the subcommand (`git -C path revert`) still matches —
plus `npm publish`, and `ssh`, `scp`, `rsync` in bare, `rtk` and `rtk proxy` spellings
(explicit, like `rm`). Plain `git stash`, `git tag` and `git remote` (listing) stay out — see
`SETUP-PLAN.md` § *FinNode — open, not acted on*. **Closed 30-10-2026 (D41):** the older
git patterns (`push`, `reset`, `rebase`, `merge`, `checkout`, `clean`, …) had only the
`*git X*` form, so `git -C path push` was not matched; each now also has a `*git -* X*`
form (live test: `git -C … merge --abort` boxed). `git remote remove|rm|rename|set-head`
are now fenced too. Still untested: whether `git remote -v add` matches.

An `ask` rule prompts in **every** permission mode, including auto mode, and it overrides
any `allow` rule that also matches. That is why the session can stay in auto mode without
losing control of the dangerous commands.

**`deny`** — `Read(//**/.env)` and `Read(//**/.env.*)`.

Note the **two** leading slashes. A single slash in user settings anchors at
`~/.claude/`, not at your projects — `Read(/secrets/**)` in this file would protect
`~/.claude/secrets`, which is almost certainly not what was wanted. Deny was chosen over
ask because only a deny rule stops the IDE from passing an open `.env` tab to Claude as
context; an ask rule can't intercept something Claude never requested. This also blocks
`.env.example`, which is harmless but occasionally inconvenient.

**Auto mode's self-modification classifier, and why the mirror has two scripts.**
`project-rules/sync.sh` once held both a read-only drift report and a `--pull` that copies.
Auto mode classified the combined script as self-modification and blocked it, so the
mirror's only guard could not be run at all. A permission rule would not have fixed that
honestly — `--pull` is just an argument, and argument-constrained `Bash(...)` patterns do
not hold. The report path was split out into `project-rules/drift.sh`, which has no `cp`,
`rm`, `mkdir` or output redirect and can therefore be granted safely; `sync.sh` keeps
`--pull`, now required, and stays behind a prompt. Split 29-09-2026, and the first run of
the separated reporter found real drift. **No new permission rule was added.**

### Effort on Opus 5.5 — the old keys are not known to apply

`settings.json` sets `"effortLevel": "high"` and `"modelSettings": {"claude-opus-5":
{"effortLevel": "high"}}`. The docs (`code.claude.com/docs/en/model-config`, fetched
10-10-2026): *"Opus 5.5 starts at `medium` unless one of the sources above sets a level
for it, and a top-level `effortLevel` in your user settings file doesn't count for Opus
5.5."* Whether the `claude-opus-5` key also covers `claude-opus-5-5` is **not
documented**. Both keys stay; Amit sets Opus 5.5 effort himself with `/effort` (T6,
10-10-2026).

---

## Deliberately left out of `ask`

These look risky but were measured and excluded. Prompting on them would produce ~24
interruptions a session instead of ~4.5, and a prompt you see twenty times a session is
one you stop reading — which is worse than not having it.

| Command | Per session | Why it's out |
|---|---|---|
| `npx vite` / `npx vitest` | 11.3 | Routine build and test. `npx --yes`, the form that installs an arbitrary package, *is* in `ask` and costs 0.2/session. |
| `./gradlew` | 6.3 | The project's own build. FinNode's own rules require running it before every change. |
| `adb` | 3.9 | Your own emulator. |
| `git commit` | 2.0 | **Superseded — `git commit` is now in `ask`; the live list holds two commit patterns (`*git commit*` and `*git * commit*`).** The original reasoning, kept as the record: local and reversible, while `git push`, which publishes, is in `ask`. |

**`rtk proxy` — superseded 20-09-2026. `Bash(rtk proxy *)` should exist nowhere, but it
keeps coming back** in `settings.local.json` files, which git ignores — so sweep those,
not just the tracked files. What re-adds it is unproven (`baselines/global-open-tests.md`
item 2). The reasoning below is kept as the record of why it was left in place for as
long as it was; it no longer describes the machine.

What replaced it: global `allow` carries only the four read-only inner forms —
`rtk proxy cat`, `find`, `grep`, `ls` — and a project adds a named spelling when it
genuinely needs one, as `rtk proxy cmp *` was added for backup verification. The
dangerous inner forms stay named individually in `ask` exactly as described below; that
part did not change. Verified by sweeping every `.claude/settings*.json` under
`VS Code/`: zero occurrences of the wide rule. **Scope, added 30-09-2026: that sweep
covered the project trees only. It did not cover `~/.claude` itself, where the wide rule
was still present in `.claude/settings.local.json` and was removed that day.**

> **The original decision, 18-09-2026 — `rtk proxy` is in `allow`, not removed.**
> `rtk proxy <cmd>` runs any command it's given, so `Bash(rtk proxy *)` is effectively a
> blanket approval — but it's used 230 times for real work (`grep` 81, `sed` 67,
> `git` 41, `npx` 15). Removing it would have caused 230 prompts. Instead the dangerous
> inner forms are named individually in `ask`: `rtk proxy rm`, `rtk proxy git push`,
> `rtk proxy git reset`, `rtk proxy npm install`, and the rest. The wide rule still
> exists in four project files; it is not promoted globally, so new projects don't
> inherit it.
>
> **Why it was reversed.** The 230-prompts figure was the cost of removing it *without
> replacing it*. Naming the four read-only inner forms globally covers almost all of
> that usage at no prompt cost, which was not considered at the time.

---

## What every session loads before you type

**Historical — the 26-09-2026 reading was 22.0k. Superseded by *Current state —
03-10-2026* below; it is no longer the latest figure and must not be quoted as current.**
`/context` in a fresh session from `~/.claude`, Opus 5, auto mode, nothing typed. Two
readings that day both returned 22.0k:
one after `RTK.md` grew, on a version that was not recorded, and one on Claude Code
2.1.283 after the `engineering` plugin was disabled.

The last complete category breakdown before that was recorded at 21.9k, ahead of later
changes. A complete breakdown of the **current** setup was missing until 03-10-2026 —
it is now recorded immediately below, so that gap is closed.

**Current state — 11-10-2026: 23k.** First-turn `/context all` from `~/.claude`,
**Opus 5.5**, Claude Code **2.1.296**, `Messages` at 10 tokens; effort and mode not shown.
Pasted by Amit at the end of T6 (`baselines/t6-removals.md`); the 10-10-2026 reading was
taken at its start, on the same model and version. The 09-10-2026 reading
was Opus 5.5 on 2.1.295, effort and mode not recorded; the 03-10-2026 reading was Opus 5
at high effort, auto mode, 2.1.288. **Measured, not estimated.**

| Bucket | 03-10-2026 | 09-10-2026 | 10-10-2026 | 11-10-2026 |
|---|---|---|---|---|
| System prompt | 3.4k | 2.4k | 2.4k | 2.4k |
| System tools | 12.6k | 12.7k | 12.8k | 12.8k |
| Memory files | 5.7k | 6.8k | 6.8k | 6.8k |
| Skills | 1.1k | 1.1k | 1.1k | 1.1k |
| **Total** | **22.8k** | **22.9k** | **23.1k** | **23k** |

**Not a like-for-like set:** the model and Claude Code version changed between the first
two columns, and the version again between the second and third — the +0.1k in system
tools on 10-10-2026 came with 2.1.296, not from this setup. The system prompt has moved
with the model before. The last two columns are like for like. `/context` printed the
11-10-2026 total as "23k", without a decimal, so the drop from 23.1k is under the
display's rounding and not a measured amount. Memory files is the bucket this setup
controls. On 11-10-2026 it was `STANDARDS.md` **5.4k** (5.5k on 10-10-2026, 4.3k on
26-09-2026), `RTK.md` 570, `MEMORY.md` 318, `OLLAMA.md` 266, `.claude/CLAUDE.md` 178
(151 on 09-10-2026, before T3 added its warning line), `CLAUDE.md` 34.

**Setup-session baseline: 23k** (Amit, 11-10-2026), replacing 22.9k. The 0.1k over the
old figure is Claude Code's system tools on 2.1.296, not this setup's files, so the
target moved instead of the files being cut. `harness/overview.md` § *What "finished"
means* checks against this figure.

The 03-10-2026 column fills the gap described in the paragraph above: it is the first complete bucket
breakdown **of the current setup**. It is not the first ever recorded here — the 21.9k
breakdown came earlier, before later changes.

**Do not compare this total with the 22.0k above.** That reading was taken on 2.1.283,
and this file carries no record of deferred tools. The 03-10-2026 `/context` lists
deferred tools separately — MCP 3.3k, system tools 17.3k — and does **not** count them in
the 22.8k. Whether the 22.0k reading counted them the same way is **unverified**. The two
numbers may be measuring different things, so the buckets above stand on their own and
any difference between the two totals does not.

**Current state — 03-10-2026: project-work token cost.** **149,112 tokens per assistant
turn** — 1,018,735,369 tokens over 6,832 turns. Method: sum `input_tokens +
cache_creation_input_tokens + cache_read_input_tokens + output_tokens` across every
session transcript under `projects/*/`, dated after 17-09-2026, with `~/.claude` sessions
excluded so only real project work counts. The comparable figure for the same work before
that date is **215,251** over 9,680 turns. **Measured and reproducible** — re-running the
sum returned the identical figure.

Two limits, both real. It is cost per **turn**, not per finished task: nothing in the
transcripts marks task boundaries, so it does not show whether a task now takes more
turns than it used to. And the work differed between the two periods, so the drop is
**not** proof the setup caused it.

### What is switched off to get there

Five changes, each reversible. Four are lines in `settings.json`; the fifth was written by
the `/plugin` menu.

| Change | What it did | Undo |
|---|---|---|
| `enableArtifact: false` | The single largest cut. Removes the Artifact tool, and with it the three `artifact-*` skills | delete the line |
| `disableClaudeAiConnectors: true` | Turned the claude.ai connectors off wholesale — no per-connector setting exists | delete the line |
| `browser-use@synced` disabled | Its cost was MCP **server instructions**, which `skillOverrides` cannot reach | re-enable in `/plugin` |
| `engineering@synced` disabled | −0.9k of skill catalogue, and its 16 MCP auth tools cost nothing either way. See the history table: an upgrade took the same amount back the same hour | re-enable in `/plugin` |
| `skillOverrides: name-only`, 33 entries | Keeps a skill working and suggestable at under 20 tokens instead of its full cost | delete an entry |

**Plugins now: `pdf-viewer` and `swift-lsp` enabled, 12 disabled.**

**What the 33 `skillOverrides` entries are.** 30 bare keys. **18 were confirmed working by
measurement on 26-09-2026; 12 more were added on 30-09-2026 and are NOT yet verified** — a
wrong key is a silent no-op, so they need `/context all` in a fresh session. The 12 are the
heaviest remaining skills, ~2.1k between them. `claude-api` was deliberately left at full
cost: its description is an auto-trigger, and `name-only` would delete it. The 5 `pdf-viewer`
skills cannot be reached at all.

**Current state — 03-10-2026: the 12 are verified.** The first-turn `/context` recorded
above reads Skills **1.1k**, against ~3.0k before the keys were added and a prediction of
~1.1k. Skills is reported on its own `/context` line, so this check does not depend on the
total and is untouched by the deferred-tools caveat. The sentence above is kept as the
record of what was still unknown on 30-09-2026.
3 `artifact-*` keys naming skills that no longer load at all since `enableArtifact:
false` — harmless, kept at Amit's direction. There were 36: the other 15 were plugin keys,
removed on 26-09-2026 once `/skills` confirmed they never could work. `user-invocable-only`
was confirmed working too, on a separate skill: the skill count went 49 → 48 and the skill
left the list entirely, still typable as `/doc-coauthoring`.

**`/skills` writes to `~/.claude/settings.local.json`, which is gitignored** (memory note
`skill-overrides-name-only`). Its `skillOverrides` block **merges** with the one in
`settings.json` rather than replacing it — verified 26-09-2026. **Which file held the
entries during that check is not recorded**, so it does not prove the top-level file is
read — see the local-settings table above. And because the file is gitignored it is **not in this repo and does not travel
to a second account.** Block 4's runbook needs this.

**Also changed on 26-09-2026, at no token cost:** the status-line thresholds, 250K/400K/600K
→ 220K/300K/450K. See § *Status line* — the status line is a shell command the terminal
renders, and its output never enters context.

**Superseded 30-09-2026:** raised again to **250K/400K/550K**. The 26-09-2026 change above
is kept as the record of why they were lowered at the time; it no longer describes the
machine. See § *Status line*.

**11-10-2026: lowered again** to **200K/300K/400K**, to save tokens. The 30-09-2026 values
above no longer describe the machine either. See § *Status line*.

### How the numbers moved

**Two methods are in this table and they are not directly comparable.** The first-reply sum
adds the `usage` fields on a session's first assistant reply, which includes the first user
message and the system reminders around it. `/context` is read with nothing typed. On the
same day, before any change, the two differed by about 10k. Which is the better proxy for a
real session is **not settled**. `/context` is used from here on, because it itemises and
repeats.

| Date | Figure | Method | What it was |
|---|---|---|---|
| 22-09-2026 | ~58,300 | first-reply sum | Before any cut. n = 1. Of it: ~30,000 Claude Code's own system prompt, tool schemas and built-in skills (not settable), 4,214 the imported rule files, 20,480 ten plugin catalogues, 2,359 account-level synced skills |
| 22-09-2026 | ~36,800 | **arithmetic** | A projection, not a measurement — the before figure minus component estimates. It was **8,302 low** |
| 22-09-2026 | 45,102 | first-reply sum | After the cut. n = 1. A real saving of 13,233, or 62% of the 21,500 projected. Re-checked at the time: imported rule files ~3,077 against the 3,166 recorded |
| 25-09-2026 | 44,700 | first-reply sum | Post-Block-1 baseline — 44,699 · 44,701 · 44,700, three fresh sessions from the home folder, Claude Code 2.1.282, `opus[1m]` at high effort. A baseline for later changes, **not** a measure of Block 1 |
| 26-09-2026 | 34.3k | `/context` | **26-09-2026, before the startup cut:** system tools 17.1k, skills 7.2k, memory files 4.6k, system prompt 3.2k, MCP server instructions 1.5k, MCP tools 725 |
| 26-09-2026 | 21.5k | `/context` | After the four `settings.json` changes |
| 26-09-2026 | **21.9k** | `/context` | **The last complete category breakdown:** system tools 9.7k, skills 3.9k, memory files 4.6k, system prompt 3.2k, MCP server instructions 0, MCP tools 0 |
| 26-09-2026 | 22.0k | `/context` | `RTK.md` grew 374 → 491 tokens; memory files 5.0k → 5.1k. A deliberate +117, not a regression |
| 26-09-2026 | 22.0k | `/context` | `engineering` disabled. Skills 48 → 39, 3.9k → 3.0k; system tools 9.7k → **10.6k**. Net zero |

**34.3k → 21.9k is the method-consistent pair, and the one to trust.** It is Block 2's
result. The two readings after it are the cost of changes made afterwards, not a drift in
the result.

**The 930 tokens came off `engineering` exactly as predicted, and system tools rose by the
same amount in the same measurement.** The only other variable that moved was Claude Code
2.1.282 → 2.1.283, which updated mid-session. `enableArtifact: false` and
`disableClaudeAiConnectors: true` were both verified still set, and the only semantic change
to `settings.json` was `engineering@synced: false`. **Causation is inferred, not proven.** If
a later version drops system tools back to 9.7k, that settles it.

**What this table cannot tell you.** Which component of the 22-09-2026 projection was
optimistic — `usage` records totals, not a split, and settling it needs a live
per-component breakdown. When written, it also lacked a complete breakdown of the current
setup; those now exist — 03-10-2026, 09-10-2026 and 10-10-2026, in the *Current state*
table above.

### What holds, whatever the numbers do

- **Caching changes what a number means.** Across 14,048 model calls, 98.3% of input tokens
  were cache reads, billed at 0.1×. Effective input cost is about **12% of raw**. The saving
  is real but compounds slowly — worth doing once, not worth chasing in 200-token increments.
- **The rule files were never the load.** The savings came from turning off plugins and
  connectors, not from editing prose — and `STANDARDS.md` is the part that decides how
  work gets done.
- **A plugin's catalogue cost is not its skill bodies.** `claude plugin details <name>` splits
  them: `engineering` cost 871 tokens always-on for 10 skills, while each body —
  `code-review` 1,200, `debug` 1,200, `incident-response` 1,700 — loaded only when that skill
  fired. A skill you keep is already lazy; disabling it does not make it lazier, it makes it
  undiscoverable.
- **`skillOverrides` cannot reach plugin skills at all.** `/skills` shows them as *"locked by
  plugin · Plugin skills are managed via /plugin"*, and saved twice without writing an entry.
  Bare names are reliable; a plugin key is a silent no-op in any format. The only lever is
  `/plugin`, whole-plugin on or off. **D28.**
- **Ask the menu, never guess the key.** `/skills` and `/plugin` write the correct key by
  definition. `/skills` produced `anthropic-skills:doc-coauthoring`, a prefix `/context` never
  prints, so a key cannot be derived from what `/context` shows. `/plugin` produced
  `engineering@synced`, where the suffix was otherwise a coin-flip. **D29.**
- **A rule file's token cost can be estimated from its character count**, good to about 1% at
  this size: `RTK.md` at 915 → 1,190 chars was predicted at ~486 and measured 491. Confirm
  with `/context` anyway when the change is large.
- **Hold the conditions fixed before comparing anything** — version, model, effort, mode,
  folder and prompt. The system prompt alone moved 2.2k → 3.2k on the change from Opus 5.5 to
  Opus 5.
- **The session that makes a change cannot measure it.** Settings load at session start.
  Always open a new one.

**A prediction that failed, and why it is kept.** A second `skillOverrides` edit rewrote the
15 plugin keys using the prefix `/context` prints, expecting ~20.6k. It measured **21.9k**,
with every plugin skill unchanged and still carrying its full description. The 0.4k rise was
`STANDARDS.md` growing 4.0k → 4.3k when three harness rules were added — not a regression
from the edit. **A wrong key is a silent no-op, not an error**, so the attempt looked like
success until a fresh session was measured. Three guesses were spent before the menu was
asked.

`SETUP-PLAN.md`'s decision table holds the full history behind **D28** and **D29**.

### What was deliberately not cut

- **Memory files** — 6.8k at the latest reading (10-10-2026), most of it `STANDARDS.md` at
  5.5k. Per **D26**, a rule file is not trimmed.
- **The system prompt** — 2.4k on Opus 5.5 (10-10-2026). Not settable.
- **FinNode's `CLAUDE.md`** — 3,748 tokens. Splitting its rule claims from their evidence
  looked like a 41% win on paper. Reading it showed most of that prose is operative: which of
  `observeById` / `getById` fails which way, that moving the device clock does *not* fire a
  pending sweep. Only ~600 tokens are genuinely historical, in one project, at 0.1× — about
  70 effective tokens a turn. **The Voice-Flow 110 KB diagnosis has now failed to transfer to
  FinNode twice.** Measure the sections before proposing the fix.

### Retention

`cleanupPeriodDays` is 60, set 22-09-2026. Transcripts are not junk: every first-reply figure
in this section came from them. Nothing was deleted when it was set — the oldest transcript
was 21 days old.

---

## Known gaps

- **An organisation policy is loaded remotely** (`claude doctor` shows it, from
  `api.anthropic.com`). It currently disables Remote Control. Its full contents aren't
  readable locally. If it ever sets `allowManagedPermissionRulesOnly`, the personal
  `allow` list stops applying — `ask` and `deny` would survive, because those only
  restrict.
- **`curl` and `rm` are the noisiest ask rules**, ~1.1 and ~1.2 prompts a session. Most
  `curl` calls are the local Ollama health check on `127.0.0.1`, and most `rm` calls are
  scratchpad cleanup. Both were kept because narrowing a rule by argument is fragile —
  the docs are explicit that argument-constrained Bash patterns don't hold.
- **Bash rules are not a security boundary.** They match the command text Claude writes.
  `/bin/rm`, `sh -c 'rm ...'`, and similar forms are not matched. The rules are there to
  catch the ordinary case and make you stop and look, not to contain an adversary.

---

## Changing any of this

- **Permissions** — `/permissions` inside a session shows every rule and which file it
  came from, and edits apply from the next tool call. Or edit `settings.json` directly.
- **Status line thresholds** — the constants at the top of `statusline/context.py`.
- **Prompt volume feels wrong** — measure before changing. The replay script below tells
  you exactly what would prompt, against real history rather than a guess.
- **Backups** — git is the backup; this folder's history holds every committed
  state. Pre-repo copies are in `archive/`.

## How the numbers were measured

All from the session transcripts in `~/.claude/projects/*/*.jsonl`, which record the real
`usage` counts and every tool call:

- **Context size** — sum `input_tokens` + `cache_creation_input_tokens` +
  `cache_read_input_tokens` from the last assistant message.
- **Prompt volume** — replay every historical `Bash` tool call against the `ask` rules,
  splitting compound commands on `&& || ; | &` and stripping the documented wrappers.
  Measured 4.5 per session across 5,188 commands in 49 sessions.
- **Command frequency** — count matches per tool call, divided by distinct sessions.
- **Startup breakdown — use this one.** `/context all` in a fresh session, nothing typed:
  it itemises every tool, skill and rule file with its own size, so a change can be
  attributed rather than guessed. Settings load at startup, so **the session that makes a
  change cannot measure it** — always open a new one. Record model and folder with the
  figure; the system prompt alone moved 1k between Opus 5.5 and Opus 5.
- **Startup baseline** — the older first-reply method, kept because the 22-09-2026 and
  25-09-2026 figures use it. Fresh sessions only: new Terminal window, `cd ~`, bare `claude`,
  the prompt `Reply with the single word: ok`, then `/exit`. Sum the three fields above
  on that session's **first** assistant reply. A log counts only if it is new and its
  first user message is that prompt — an attached or resumed session fails this. Record
  version, model, effort, mode and folder with the figure.

Re-run these before changing a threshold or a rule. Every number in this file came from
them, and a guess that replaces a measurement is how the 150K threshold and the
"122 prompts per session" figure both turned out wrong the first time.

---

## The project trees on this machine

Surveyed 15-09-2026. `PROJECTS.md` is the index; this is the state behind it, kept here
so the index doesn't have to carry it into every turn's context.

### Branch state — read it from git, not from here

This section used to hold a table of each project's branch and last commit date. It was
accurate on the day it was written and wrong within weeks, which is the same defect
`SETUP-PLAN.md` § *Git state is not recorded here* exists to prevent. One command answers
it properly, and is never out of date. This is the one copy of the sweep; anywhere
else that needs it points here:

```bash
for r in ~/.claude ~/Documents/VS\ Code/{Voice-Flow,FinNode,vthrudebugger_v1,Debugger\ v2} \
         ~/Documents/VS\ Code/Emp\ portal/Vthru_Emp_v2.1_jun26; do
  printf '%-22s %-46s %s\n' "$(basename "$r")" \
    "$(git -C "$r" status -sb | head -1)" "$(git -C "$r" log -1 --format=%ad --date=short)"
done
```

**What is worth knowing, and does not rot:** a project parked on a feature branch for
months is worth a question before starting anything new in it — was that work finished,
merged, or abandoned? Which projects those are changes; that it is worth asking does not.

### Duplicate trees

**Two Voice Flow trees exist**, down from three. The risk is editing the wrong one and
losing work.

| Path | State |
|---|---|
| `~/Documents/VS Code/Voice-Flow` | **Current.** |
| `~/Documents/VS Code/Voice Flow_v1` | Older tree, on a rename branch, August. Detached from Claude Setup 30-10-2026 |
| `~/Documents/Voice-Flow-main` | **Gone.** Had no git repo at all. Confirmed absent 20-09-2026 and again 21-09-2026 |

**Two Packbly trees exist**, `~/Documents/VS Code/Packbly_web/v1.1-Packbly` and an older
copy at `~/Documents/extra/v1.1-Packbly`. Both are detached from Claude Setup
(30-10-2026); the folders and their data stay on disk.

**Two Debugger trees exist.** Amit chose `~/Documents/VS Code/vthrudebugger_v1` as the
tree to work on, 27-09-2026; `Debugger v2` is next up and may become an npm package
(30-10-2026). A further copy under `~/Debugger`
is gone, and whether `vthrudebugger_v1` holds its work is unknown — see
§ *Project-tree decisions*.

### Project-tree decisions

**All four are answered**, each dated below. They were settled by Amit's decisions and by
one folder disappearing — not by opening the projects — so where something is still
unknown, the entry says so rather than rounding it up.

- ~~**Which Debugger tree is current?**~~ **Settled by decision on 27-09-2026, not by a
  check.** Amit is working on `~/Documents/VS Code/vthrudebugger_v1`; `Debugger v2` is
  parked. Neither replaced the other — both were seeded from V-Thru's
  `DebugProvider.tsx` and then kept deliberately independent, so "successor" was never
  right. **Unknown, and not investigated:** whether `vthrudebugger_v1` is the newest or
  most complete Debugger tree. The 03-08-2026 memory
  `project-debugger-repo-fresh-start` says `~/Debugger/vthrudebugger_v1` was the
  furthest-ahead clone — mocks, storage, filter, InfoPanel, report — and `~/Debugger` is
  gone. Amit deleted a tree and does not recall which; whatever survives is either in
  `~/Documents/VS Code/vthrudebugger_v1` or on GitHub. No tree was opened to find out,
  and whether that work survived is not known.
- ~~**Can `Voice Flow_v1` be archived?**~~ **Amit's decision, 27-09-2026.** It is
  superseded by `Voice-Flow` and is not being worked on, but it stays on disk as it is.
  No files moved.
- ~~**Is `Packbly v2` a real project?**~~ **Amit's decision, 27-09-2026.** Yes, it is. He
  is not working on it and the entry stays exactly as it is; someone else may pick it up.
- ~~**What is `~/Documents/Voice-Flow-main`?**~~ **Answered by it disappearing** — the
  folder no longer exists, confirmed 20-09-2026 and 21-09-2026. Nothing in it was
  recoverable, since it had no git history; whatever it was, it is not a question now.

### Corrections made on 15-09-2026

The previous `PROJECTS.md` listed five projects; the filesystem has thirteen directories
with a `.git` or a `CLAUDE.md`. Two of its statements were wrong:

- **`Voice-Flow` was missing entirely** — despite being the most-used project on the
  machine, with 39 Claude sessions against FinNode's 15.
- **Emp Portal was marked as having a `CLAUDE.md`.** It does not. *(True on 15-09-2026.
  Since 20-09-2026 its rules file is at the project root — see `PROJECTS.md`.)*

Both had been carried forward without being checked. Verify against the filesystem rather
than against the previous version of the file.

### Sensitive data

Two projects hold real personal records, and `OLLAMA.md` has the standing rule about what
may be sent to a local model:

- **Emp Portal** — employee records
- **Packbly Web** — customer and courier records. Detached from Claude Setup 30-10-2026;
  the data is still on disk, so the `OLLAMA.md` rule still applies.

### Full project descriptions

`PROJECTS.md` carries a one-line version of each of these so it stays cheap to load.
The detail lives here.

- **FinNode** — `~/Documents/VS Code/FinNode` — offline-first personal Android finance
  tracker for Indian users. Kotlin + Compose, Room + SQLCipher, **regex bank-SMS
  parsing**, **diary linked to transactions**. Progress lives in its own
  `docs/ROADMAP.md`, not here. Has `CLAUDE.md` and a `docs/` set indexed from
  `README.md`.

- **Voice Flow** — `~/Documents/VS Code/Voice-Flow` — personal macOS dictation app:
  floating mic widget callable from anywhere, global hotkey, real speech-to-text, an AI
  cleanup pass, and auto-paste **into whatever app is focused**. Electron + React + Vite.
  Also runs as a plain web app (`npm run dev`) for development, but the desktop build is
  the real product.

- **Debugger** (vthrudebugger) — `~/Documents/VS Code/vthrudebugger_v1` — drop-in in-app
  debugger library for React Native. **TypeScript + RN peer deps, RN Gesture
  Handler/Reanimated**. **Auto-captures network, console and errors**; **QA-facing alert
  toasts**, network inspector, **client-side mocks**. **The Debugger tree Amit is
  working on** — his decision, 27-09-2026, not a check of which tree is furthest ahead.

- **SecondBrain schema** — `~/Documents/SecondBrain Obsidian/schema` — schema for an
  Obsidian vault. **The vault itself is the parent directory**, which holds `raw`,
  `wiki` and `schema`.

- **Emp Portal** (Vthru-Emp) — `~/Documents/VS Code/Emp portal/Vthru_Emp_v2.1_jun26` —
  multi-tenant HR portal. React 18 + Vite **frontend**, Express 5 + better-sqlite3
  **backend**, role-based dashboards. Holds real employee records.

- **Debugger v2** — `~/Documents/VS Code/Debugger v2` — in-app debug overlay for React
  Native, built so **a developer can drop it into an app**. GitHub:
  `github.com/AmitJangra25/vthrudebugger_v2`. **A separate project from
  `vthrudebugger_v1`, not a successor**; parked 27-09-2026, **next up and may become an
  npm package** (Amit, 30-10-2026) — the history is in § *Project-tree decisions*.
  **Carries its own** `ARCHITECTURE.md`, `INTEGRATION.md`, `PLAN.md`, `DEPENDENCIES.md`.

- **AtWorkpe** — `github.com/AmitJangra25/AtWorkpe`, **on GitHub only, not cloned** —
  multi-tenant company portal: leave management, attendance tracking, goals, documents,
  salary slips, onboarding and role-based dashboards (Admin, HR, Manager, Team lead,
  Employee). Production-ready multi-tenant HRMS SaaS, React + Vite client and Express +
  SQLite server.

- ~~`~/Documents/Voice-Flow-main`~~ — was a **third** Voice Flow copy with no git repo.
  **No longer on disk**, confirmed 20-09-2026 and 21-09-2026.

- `~/Documents/extra/v1.1-Packbly` — a Next.js tree, apparently an older copy of Packbly
  Web. Last commit 23-06-2026.

- `~/Documents/Skils/PM-skills-Amit` — **a clone of the public `phuryn/pm-skills`
  repository. Reference material, not your code.**
