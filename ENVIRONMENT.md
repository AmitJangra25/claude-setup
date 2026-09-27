# This machine

How Claude Code is set up here, and why each choice was made. Reference material —
read it when you're about to change something, not on every session.

**Not imported by `CLAUDE.md` on purpose.** The three files that *are* imported cost
~3,166 tokens on every turn of every session — measured 2026-09-22, not a current
figure. A file explaining why a threshold is 220K doesn't change how work gets done,
so it stays out of that budget.
`PROJECTS.md` and `REPOS.md` joined this file and `SETUP-PLAN.md` outside the import list
on 2026-09-22, for the same reason — reference, not rules.

Last full review: 2026-09-22. § *What every session loads before you type* was rewritten
2026-09-27; no other section was re-checked then.

Figures below include measurements, estimates and projections. Each should state its date
and method — the commands are in § *How the numbers were measured*.

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

This is where the token saving comes from. It is **completely separate from
permissions** — changing permission rules cannot affect it, and disabling it would not
change what Claude is allowed to do.

> **What the hook actually rewrites, tested 2026-09-26.** It handles a plain command
> and the `&&` and `;` chain operators, and nothing else. Every other shell construct
> makes the *whole line* run raw:
>
> | shape | result |
> |---|---|
> | `grep -rn foo .` · `cd /tmp && git log` · `cat a; cat b` | rewritten |
> | `grep foo . \| head` — any pipe | **raw** |
> | `cat a > /tmp/x` — any redirect | **raw** |
> | `echo $(cat a)` — any subshell | **raw** |
> | `for f in a b; do cat $f; done` · `f(){ cat $1; }` | **raw** |
> | `python3 …` · `sed …` — not handled in any form | **raw** |
>
> **This is why adoption was 26%**, not because rtk failed: `rtk session` reported
> 24–34% across four sessions on 2026-09-26, and `rtk discover` found ~36.3K tokens
> left on the table over 279 scanned commands — mostly `grep -B` (21), `gh api` (13)
> and `git log` (11). The habit that closes it is in `RTK.md`: prefer the plain form
> over piping into `head` when the output is small enough to read anyway.
>
> **Treat 36.3K as a floor.** `rtk discover` said it scanned 279 commands over 30 days
> while `rtk session` counted 555 on 2026-09-26 alone, so the two disagree about their
> own window.
>
> **Savings are lopsided by command**, measured over 10,017 commands (59.6% overall):
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

**Hook auditing is on, from 2026-09-20.** `settings.json` → `env` sets
`RTK_HOOK_AUDIT=1`, so rtk writes one line per hook call to
`~/.local/share/rtk/hook-audit.log`; read it with `rtk hook-audit`. `env` is read at
session start, so it never covers the session that set it. It is there to catch the one
observed case where the hook did **not** rewrite a command — see `SETUP-PLAN.md`
§ *Findings not acted on*. Either it recurs with evidence, or it closes itself.

### 2. Status line — live context size

`statusline/context.py` reads the real token counts from the session transcript and
prints the current context size. It never estimates. Thresholds and the data behind them
are documented at the top of that file.

Short version: grey under 220K, amber to 300K, red to 450K, then suggests `/compact`.
**Lowered from 250K/400K/600K on 2026-09-26** at Amit's request — he restarts somewhere
around 300–400K and wants the warning *before* that point, not at it. The old 250K
almost never fired; 220K fires on roughly half of sessions, which is the intent.

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

    allow   33 rules    read-only things stop prompting
    ask     58 rules    all on things that change something
    deny     2 rules    .env files unreadable anywhere

**Counts measured against the live file 2026-09-27.** `ask` went **51 → 58** that day:
seven rules closing the `git restore`, `git stash drop`/`clear` and brew gaps — see
`SETUP-PLAN.md` § *FinNode — open, not acted on* for the measurement and what was not
fenced. Before that, two corrections this block carried
for a while: it read `ask 87` until 2026-09-20, and then `ask 112` until 2026-09-22,
having missed the merge that took **112 → 51** on 2026-09-20 (one pattern per command
instead of up to three spellings — `SETUP-PLAN.md` § *`ask` list merged*). `allow` went
**35 → 33** on 2026-09-22. The path before that: **87 → 101** when Phase 3's gaps were
closed, **→ 107** with the six `git commit` spellings added by the Voice-Flow pass (see
`SETUP-PLAN.md` § *Open: unproven*), **→ 112** when the permission-list pass added
`rtk wget` and four `pip` spellings. The old "~5.0 prompts per session" figure was
measured against 87 rules and has been dropped rather than carried forward, because it
was never re-measured.

**Why the `rtk ` spellings exist — and the hole that proved it.** The rtk hook rewrites a
command *before* the permission check, so fencing `wget *` alone fences nothing: the
engine only ever sees `rtk wget …`. `curl` carried all three spellings; `wget` carried
the bare and `rtk proxy` forms but **not** `rtk `, so downloads ran unprompted until
2026-09-20. Probed live rather than reasoned — `wget …` → `rtk wget …`, and
`pip3 install …` → `rtk pip install …`. **Any new fence needs every spelling the hook
can produce.**

**Changed 2026-09-18** (phases 1.2 and 1.3 — `SETUP-PLAN.md` has the full record).
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
until **2026-09-22, when both were removed** — a rule that can never fire is a file
claiming a permission it does not grant. Removing an `allow` rule can only ever add a
prompt, and these already prompted. The same sweep removed two more in Voice-Flow
(`GIT_EDITOR=true git rebase --continue`, `tccutil`), four exact duplicates, and one
`lsregister` rule naming a `release/mac-arm64` path that no longer exists.

**`allow`** — read-only `rtk` wrappers, `tree`, `xxd`, read-only `gh`, `WebSearch`, and
docs domains. Purely additive: permission lists merge across files, so a global allow
entry can only ever remove a prompt, never add one.

**`ask`** — git operations that publish or discard work (`push`, `reset`, `rebase`,
`clean`, `rm`, `merge`, `checkout`, `restore`, `stash drop`, `stash clear`), dependency
installs including brew's `install`, `uninstall`, `upgrade` and `reinstall`, `npx --yes`,
`rm`, `curl`, `wget`, `pkill`, `kill`, plus the `rtk` and `rtk proxy` spellings of all of
them. Plain `git stash`, `git tag` and `git remote` are deliberately out — see
`SETUP-PLAN.md` § *FinNode — open, not acted on*.

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
| `git commit` | 2.0 | Local and reversible. `git push`, which publishes, is in `ask`. |

**`rtk proxy` — superseded 2026-09-20. `Bash(rtk proxy *)` is now gone from every
project.** The reasoning below is kept as the record of why it was left in place for as
long as it was; it no longer describes the machine.

What replaced it: global `allow` carries only the four read-only inner forms —
`rtk proxy cat`, `find`, `grep`, `ls` — and a project adds a named spelling when it
genuinely needs one, as `rtk proxy cmp *` was added for backup verification. The
dangerous inner forms stay named individually in `ask` exactly as described below; that
part did not change. Verified by sweeping every `.claude/settings*.json` under
`VS Code/`: zero occurrences of the wide rule.

> **The original decision, 2026-09-18 — `rtk proxy` is in `allow`, not removed.**
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

**Latest verified total: 22.0k, measured 2026-09-26.** `/context` in a fresh session from
`~/.claude`, Opus 5, auto mode, nothing typed. Two readings that day both returned 22.0k:
one after `RTK.md` grew, on a version that was not recorded, and one on Claude Code
2.1.283 after the `engineering` plugin was disabled.

The last complete category breakdown was recorded at 21.9k before later changes; a
complete breakdown of the final setup has not been recorded.

### What is switched off to get there

Five changes, each reversible. Four are lines in `settings.json`; the fifth was written by
the `/plugin` menu.

| Change | What it did | Undo |
|---|---|---|
| `enableArtifact: false` | The single largest cut. Removes the Artifact tool, and with it the three `artifact-*` skills | delete the line |
| `disableClaudeAiConnectors: true` | Turned the claude.ai connectors off wholesale — no per-connector setting exists | delete the line |
| `browser-use@synced` disabled | Its cost was MCP **server instructions**, which `skillOverrides` cannot reach | re-enable in `/plugin` |
| `engineering@synced` disabled | −0.9k of skill catalogue, and its 16 MCP auth tools cost nothing either way. See the history table: an upgrade took the same amount back the same hour | re-enable in `/plugin` |
| `skillOverrides: name-only`, 21 entries | Keeps a skill working and suggestable at under 20 tokens instead of its full cost | delete an entry |

**Plugins now: `pdf-viewer` and `swift-lsp` enabled, 12 disabled.**

**What the 21 `skillOverrides` entries are.** 18 bare keys, every one confirmed working.
3 `artifact-*` keys naming skills that no longer load at all since `enableArtifact:
false` — harmless, kept at Amit's direction. There were 36: the other 15 were plugin keys,
removed on 2026-09-26 once `/skills` confirmed they never could work. `user-invocable-only`
was confirmed working too, on a separate skill: the skill count went 49 → 48 and the skill
left the list entirely, still typable as `/doc-coauthoring`.

**`/skills` writes to `settings.local.json`, which is gitignored.** Its `skillOverrides`
block **merges** with the one in `settings.json` rather than replacing it — verified
2026-09-26. But because the file is gitignored it is **not in this repo and does not travel
to a second account.** Block 4's runbook needs this.

**Also changed on 2026-09-26, at no token cost:** the status-line thresholds, 250K/400K/600K
→ 220K/300K/450K. See § *Status line* — the status line is a shell command the terminal
renders, and its output never enters context.

### How the numbers moved

**Two methods are in this table and they are not directly comparable.** The first-reply sum
adds the `usage` fields on a session's first assistant reply, which includes the first user
message and the system reminders around it. `/context` is read with nothing typed. On the
same day, before any change, the two differed by about 10k. Which is the better proxy for a
real session is **not settled**. `/context` is used from here on, because it itemises and
repeats.

| Date | Figure | Method | What it was |
|---|---|---|---|
| 22 Sep | ~58,300 | first-reply sum | Before any cut. n = 1. Of it: ~30,000 Claude Code's own system prompt, tool schemas and built-in skills (not settable), 4,214 the imported rule files, 20,480 ten plugin catalogues, 2,359 account-level synced skills |
| 22 Sep | ~36,800 | **arithmetic** | A projection, not a measurement — the before figure minus component estimates. It was **8,302 low** |
| 22 Sep | 45,102 | first-reply sum | After the cut. n = 1. A real saving of 13,233, or 62% of the 21,500 projected. Re-checked at the time: imported rule files ~3,077 against the 3,166 recorded |
| 25 Sep | 44,700 | first-reply sum | Post-Block-1 baseline — 44,699 · 44,701 · 44,700, three fresh sessions from the home folder, Claude Code 2.1.282, `opus[1m]` at high effort. A baseline for later changes, **not** a measure of Block 1 |
| 26 Sep | 34.3k | `/context` | **26 Sep 2026, before the startup cut:** system tools 17.1k, skills 7.2k, memory files 4.6k, system prompt 3.2k, MCP server instructions 1.5k, MCP tools 725 |
| 26 Sep | 21.5k | `/context` | After the four `settings.json` changes |
| 26 Sep | **21.9k** | `/context` | **The last complete category breakdown:** system tools 9.7k, skills 3.9k, memory files 4.6k, system prompt 3.2k, MCP server instructions 0, MCP tools 0 |
| 26 Sep | 22.0k | `/context` | `RTK.md` grew 374 → 491 tokens; memory files 5.0k → 5.1k. A deliberate +117, not a regression |
| 26 Sep | 22.0k | `/context` | `engineering` disabled. Skills 48 → 39, 3.9k → 3.0k; system tools 9.7k → **10.6k**. Net zero |

**34.3k → 21.9k is the method-consistent pair, and the one to trust.** It is Block 2's
result. The two readings after it are the cost of changes made afterwards, not a drift in
the result.

**The 930 tokens came off `engineering` exactly as predicted, and system tools rose by the
same amount in the same measurement.** The only other variable that moved was Claude Code
2.1.282 → 2.1.283, which updated mid-session. `enableArtifact: false` and
`disableClaudeAiConnectors: true` were both verified still set, and the only semantic change
to `settings.json` was `engineering@synced: false`. **Causation is inferred, not proven.** If
a later version drops system tools back to 9.7k, that settles it.

**Two things this table cannot tell you.** Which component of the 22 Sep projection was
optimistic — `usage` records totals, not a split, and settling it needs a live
per-component breakdown. And what the current setup's category breakdown is, because no
complete reading was taken after the last two changes.

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

- **Memory files** — 5.1k at the latest reading, most of it `STANDARDS.md` at 4.3k. Per
  **D26**, a rule file is not trimmed.
- **The system prompt** — 3.2k. Not settable.
- **FinNode's `CLAUDE.md`** — 3,748 tokens. Splitting its rule claims from their evidence
  looked like a 41% win on paper. Reading it showed most of that prose is operative: which of
  `observeById` / `getById` fails which way, that moving the device clock does *not* fire a
  pending sweep. Only ~600 tokens are genuinely historical, in one project, at 0.1× — about
  70 effective tokens a turn. **The Voice-Flow 110 KB diagnosis has now failed to transfer to
  FinNode twice.** Measure the sections before proposing the fix.

### Retention

`cleanupPeriodDays` is 60, set 2026-09-22. Transcripts are not junk: every first-reply figure
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
- **Backups** — `settings.json.bak*` in this directory.

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
- **Startup baseline** — the older first-reply method, kept because the 2026-09-22 and
  2026-09-25 figures use it. Fresh sessions only: new Terminal window, `cd ~`, bare `claude`,
  the prompt `Reply with the single word: ok`, then `/exit`. Sum the three fields above
  on that session's **first** assistant reply. A log counts only if it is new and its
  first user message is that prompt — an attached or resumed session fails this. Record
  version, model, effort, mode and folder with the figure.

Re-run these before changing a threshold or a rule. Every number in this file came from
them, and a guess that replaces a measurement is how the 150K threshold and the
"122 prompts per session" figure both turned out wrong the first time.

---

## The project trees on this machine

Surveyed 2026-09-15. `PROJECTS.md` is the index; this is the state behind it, kept here
so the index doesn't have to carry it into every turn's context.

### Branch state — read it from git, not from here

This section used to hold a table of each project's branch and last commit date. It was
accurate on the day it was written and wrong within weeks, which is the same defect
`SETUP-PLAN.md` § *Git state is not recorded here* exists to prevent. One command answers
it properly, and is never out of date:

```bash
for r in ~/.claude ~/Documents/VS\ Code/{Voice-Flow,Voice\ Flow_v1,FinNode,vthrudebugger_v1,Debugger\ v2} \
         ~/Documents/VS\ Code/Packbly_web/v1.1-Packbly \
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
| `~/Documents/VS Code/Voice-Flow` | **Current.** 39 Claude sessions, last commit 2026-09-11 |
| `~/Documents/VS Code/Voice Flow_v1` | Older tree, on a rename branch, August |
| `~/Documents/Voice-Flow-main` | **Gone.** Had no git repo at all. Confirmed absent 2026-09-20 and again 2026-09-21 |

**Two Packbly trees exist.**

| Path | State |
|---|---|
| `~/Documents/VS Code/Packbly_web/v1.1-Packbly` | The one with a `CLAUDE.md` |
| `~/Documents/extra/v1.1-Packbly` | Same name, last commit 2026-06-23. Looks like an older copy |

**Two Debugger trees exist.** Amit chose `~/Documents/VS Code/vthrudebugger_v1` as the
tree to work on, 2026-09-27; `Debugger v2` is parked. A further copy under `~/Debugger`
is gone, and whether `vthrudebugger_v1` holds its work is unknown — see
§ *Project-tree decisions*.

### Project-tree decisions

**All four are answered**, each dated below. They were settled by Amit's decisions and by
one folder disappearing — not by opening the projects — so where something is still
unknown, the entry says so rather than rounding it up.

- ~~**Which Debugger tree is current?**~~ **Settled by decision on 2026-09-27, not by a
  check.** Amit is working on `~/Documents/VS Code/vthrudebugger_v1`; `Debugger v2` is
  parked. Neither replaced the other — both were seeded from V-Thru's
  `DebugProvider.tsx` and then kept deliberately independent, so "successor" was never
  right. **Unknown, and not investigated:** whether `vthrudebugger_v1` is the newest or
  most complete Debugger tree. The 2026-08-03 memory
  `project-debugger-repo-fresh-start` says `~/Debugger/vthrudebugger_v1` was the
  furthest-ahead clone — mocks, storage, filter, InfoPanel, report — and `~/Debugger` is
  gone. Amit deleted a tree and does not recall which; whatever survives is either in
  `~/Documents/VS Code/vthrudebugger_v1` or on GitHub. No tree was opened to find out,
  and whether that work survived is not known.
- ~~**Can `Voice Flow_v1` be archived?**~~ **Amit's decision, 2026-09-27.** It is
  superseded by `Voice-Flow` and is not being worked on, but it stays on disk as it is.
  No files moved.
- ~~**Is `Packbly v2` a real project?**~~ **Amit's decision, 2026-09-27.** Yes, it is. He
  is not working on it and the entry stays exactly as it is; someone else may pick it up.
- ~~**What is `~/Documents/Voice-Flow-main`?**~~ **Answered by it disappearing** — the
  folder no longer exists, confirmed 2026-09-20 and 2026-09-21. Nothing in it was
  recoverable, since it had no git history; whatever it was, it is not a question now.

### Corrections made on 2026-09-15

The previous `PROJECTS.md` listed five projects; the filesystem has thirteen directories
with a `.git` or a `CLAUDE.md`. Two of its statements were wrong:

- **`Voice-Flow` was missing entirely** — despite being the most-used project on the
  machine, with 39 Claude sessions against FinNode's 15.
- **Emp Portal was marked as having a `CLAUDE.md`.** It does not.

Both had been carried forward without being checked. Verify against the filesystem rather
than against the previous version of the file.

### Sensitive data

Two projects hold real personal records, and `OLLAMA.md` has the standing rule about what
may be sent to a local model:

- **Emp Portal** — employee records
- **Packbly Web** — customer and courier records

### Full project descriptions

`PROJECTS.md` carries a one-line version of each of these so it stays cheap to load.
The detail lives here.

- **FinNode** — `~/Documents/VS Code/FinNode` — offline-first personal Android finance
  tracker for Indian users. Kotlin + Compose, Room + SQLCipher, **regex bank-SMS
  parsing**, **diary linked to transactions**. Phase 2, checkpoint 2c-i next; phases 0,
  1b and 1c plus checkpoints 2a and 2b done and **device-verified**. **157 unit tests**,
  105/105 instrumented, **15 of 22 screens** real. Has `CLAUDE.md` and a `docs/` set
  indexed from `README.md`.

- **Voice Flow** — `~/Documents/VS Code/Voice-Flow` — personal macOS dictation app:
  floating mic widget callable from anywhere, global hotkey, real speech-to-text, an AI
  cleanup pass, and auto-paste **into whatever app is focused**. Electron + React + Vite.
  Also runs as a plain web app (`npm run dev`) for development, but the desktop build is
  the real product.

- **Debugger** (vthrudebugger) — `~/Documents/VS Code/vthrudebugger_v1` — drop-in in-app
  debugger library for React Native. **TypeScript + RN peer deps, RN Gesture
  Handler/Reanimated**. **Auto-captures network, console and errors**; **QA-facing alert
  toasts**, network inspector, **client-side mocks**. **The Debugger tree Amit is
  working on** — his decision, 2026-09-27, not a check of which tree is furthest ahead.

- **Packbly Web** — `~/Documents/VS Code/Packbly_web/v1.1-Packbly` — logistics platform:
  intracity courier product plus a **B2B relocation and warehousing ticket system**.
  Next.js 16 **App Router** + React 19, **MongoDB native driver**, Socket.IO, **JWT
  auth**. Holds real customer and courier records.

- **Voice Flow v1** — `~/Documents/VS Code/Voice Flow_v1` — the earlier Voice Flow tree.
  Superseded by `Voice-Flow`. **Not worked on; stays on disk, not archived** — Amit's
  call, 2026-09-27.

- **SecondBrain schema** — `~/Documents/SecondBrain Obsidian/schema` — schema for an
  Obsidian vault. **The vault itself is the parent directory**, which holds `raw`,
  `wiki` and `schema`.

- **Emp Portal** (Vthru-Emp) — `~/Documents/VS Code/Emp portal/Vthru_Emp_v2.1_jun26` —
  multi-tenant HR portal. React 18 + Vite **frontend**, Express 5 + better-sqlite3
  **backend**, role-based dashboards. Holds real employee records.

- **Debugger v2** — `~/Documents/VS Code/Debugger v2` — in-app debug overlay for React
  Native, built so **a developer can drop it into an app**. **A separate project from
  `vthrudebugger_v1`, not a successor, parked 2026-09-27** — why, and what is still
  unknown, is in § *Project-tree decisions*. **Carries its own** `ARCHITECTURE.md`,
  `INTEGRATION.md`, `PLAN.md`, `DEPENDENCIES.md`.

- **Packbly v2** — `~/Documents/VS Code/Packbly_v2/packblyfima3` — a Figma code export
  ("Website Redesign Proposal"), **shadcn theme + assets**. Reads as a design bundle
  rather than an app. **It is a real project** — Amit's call, 2026-09-27 — just not one
  he is working on. The entry stays as it is.

- ~~`~/Documents/Voice-Flow-main`~~ — was a **third** Voice Flow copy with no git repo.
  **No longer on disk**, confirmed 2026-09-20 and 2026-09-21.

- `~/Documents/extra/v1.1-Packbly` — a Next.js tree, apparently an older copy of Packbly
  Web. Last commit 2026-06-23.

- `~/Documents/Skils/PM-skills-Amit` — **a clone of the public `phuryn/pm-skills`
  repository. Reference material, not your code.**

Two Voice Flow trees and two Packbly trees exist — `~/Documents/Voice-Flow-main` was a
third and is gone. **Worth settling which is canonical**
— the risk is editing the wrong one and losing the work.
