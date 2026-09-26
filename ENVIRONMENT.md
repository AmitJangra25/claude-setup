# This machine

How Claude Code is set up here, and why each choice was made. Reference material —
read it when you're about to change something, not on every session.

**Not imported by `CLAUDE.md` on purpose.** The three files that *are* imported cost
~3,166 tokens on every turn of every session. A file explaining why a threshold
is 250K doesn't change how work gets done, so it stays out of that budget.
`PROJECTS.md` and `REPOS.md` joined this file and `SETUP-PLAN.md` outside the import list
on 2026-09-22, for the same reason — reference, not rules.

Last reviewed: 2026-09-22. Every number below was measured from session history, not
estimated — the commands are in the section at the end.

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

Short version: grey under 250K, amber to 400K, red to 600K, then suggests `/compact`.
Half of all sessions never pass 250K, so the colour means something when it changes.

**What it's for.** Claude re-reads the whole conversation on every step, so a long
session pays for its entire history on every small action. Sessions start around 48K and
grow ~1,200 tokens per turn; the deepest recorded is 588K.

**What to do about it:** `/clear` when you finish one task and start an unrelated one.
Not mid-task — clearing during a long single task saved only 3% in the measured sessions,
versus 45–54% for sessions with several distinct tasks. The boundary is what saves
tokens, not the number.

### 3. Permissions — what stops and asks

    allow   33 rules    read-only things stop prompting
    ask     51 rules    all on things that change something
    deny     2 rules    .env files unreadable anywhere

**Counts measured against the live file 2026-09-22.** Two corrections this block carried
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
`clean`, `rm`, `merge`, `checkout`), dependency installs, `npx --yes`, `rm`, `curl`,
`wget`, `pkill`, `kill`, plus the `rtk` and `rtk proxy` spellings of all of them.

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

Measured 2026-09-22 from the `usage` counts in 68 session transcripts, then cut the same
day. The headline: **the rule files were never the load.**

    before       projected     what it is
    ~58,300        ~36,800     total first-turn input, no prompt typed yet
    ~30,000        ~30,000     Claude Code's system prompt, tool schemas, built-in
                               skills — arrives before any file here. Not settable.
      4,214         3,166      the imported global rules
     20,480             0      10 plugin skill catalogues
      2,359           ~500     account-level synced skills (8 turned off)
          0             0      Sentry, Claude Docs kept; ClickUp, Figma, Slack cut

**Measured after the cut — 45,102, on 2026-09-22.** The `projected` column is arithmetic:
the before figure minus the component estimates. It was **8,302 low**. The first real
post-cut session reads 45,102 against the last pre-cut session's 58,335 in the same
project 96 minutes earlier — a saving of **13,233, or 62% of the 21,500 projected**.
Which component is optimistic is not known, because `usage` records totals and not a
split; settling it needs a live per-component breakdown. What was re-checked does hold:
10 plugins disabled and 4 kept, and the imported rule files at ~3,077 tokens against the
3,166 recorded. **n = 1 on each side** — the before and after are each a single session —
so 45,102 is the right order of magnitude, not a figure to ±1,000. The projection is left
standing above rather than overwritten, per **D25**.

> **Measured again 25 Sep 2026 — post-Block-1 first-reply baseline: 44,700.** Fresh
> sessions from the home folder, auto mode, Claude Code 2.1.282, `opus[1m]` at high
> effort, prompt `Reply with the single word: ok`. Two runs were planned; a third
> matching fresh session was found and included. Totals: **44,699 · 44,701 · 44,700**.
> This is a baseline for later changes, not a measure of Block 1: 45,102 above is one
> session under unrecorded conditions, so no Block 1 saving or cost is calculated from
> it. Compare later figures only under the same version, model, mode, folder and prompt.

> **Measured again 26 Sep 2026, and cut — 34.3k → 21.9k.** Method changed, so read the
> caveat below before comparing with anything above. Figures are `/context` in a fresh
> session from `~/.claude`, Opus 5, auto mode, no prompt typed.
>
> | | before | after edit 1 | final |
> |---|---|---|---|
> | system tools | 17.1k | **9.7k** | 9.7k |
> | skills (52 → 49) | 7.2k | **3.9k** | 3.9k |
> | MCP server instructions | 1.5k | **0** | 0 |
> | MCP tools | 725 | **0** | 0 |
> | memory files | 4.6k | 4.6k | 5.0k |
> | system prompt | 3.2k | 3.2k | 3.2k |
> | **total** | **34.3k** | **21.5k** | **21.9k** |
>
> Four changes in `settings.json`, each reversible by deleting its line:
> `enableArtifact: false` (the largest single item), `disableClaudeAiConnectors: true`,
> `browser-use@synced` disabled, and `skillOverrides` at `name-only`, now 36 entries.
>
> **The second edit failed, and this is the measured proof.** It rewrote the 15 plugin
> keys with the prefix `/context` prints, expecting ~20.6k. Measured: **21.9k**, with
> every plugin skill unchanged — `engineering:architecture` still ~100 tokens, still its
> full description. The 0.4k rise is `STANDARDS.md` growing 4.0k → 4.3k when three
> harness rules were added; it is not a regression from the edit.
>
> **What the 36 entries actually do**, counted against `/context all` on 26 Sep:
> **18 bare keys work** — 15 claude.ai-synced skills and 3 built-in, every one now <20
> tokens. **15 prefixed plugin keys do nothing**, having already done nothing as bare
> names. **3 `artifact-*` keys** name skills that no longer load at all, since
> `enableArtifact: false` removed them; harmless, left in place. So bare keys are
> reliable and plugin skills are not reachable by this setting in either form tried.
> Whether they can be reached at all is **open**: the `/skills` menu writes
> `skillOverrides` itself, so whatever key it writes is the answer by definition. Not
> yet run.
>
> **Why this is not comparable with 44,700 above.** That figure is the sum of the
> `usage` fields on a session's first assistant reply, which includes the first user
> message and the system reminders around it. This one is `/context` with nothing typed.
> The two methods differed by ~10k on the same day before any change was made, and which
> is the better proxy for a real session is **not settled**. `/context` is used from here
> on because it itemises and repeats; the 34.3k → 21.9k comparison is method-consistent
> and is the one to trust.
>
> **What was deliberately not cut.** Memory files, 4.6k, of which `STANDARDS.md` is 4k —
> per **D26** a rule file is not trimmed. The system prompt, 3.2k, is not settable. It
> grew 2.2k → 3.2k when the model changed from Opus 5.5 to Opus 5, so hold the model
> fixed when comparing.

**Read this before trying to trim a rule file.** `STANDARDS.md` is 2,472 tokens — 4% of
what a session costs — and it is the part that decides how work gets done. The 93% that
is not your files is where the savings were, and they came from turning off plugins and
connectors, not from editing prose.

**A plugin's catalogue cost is not its skill bodies.** `claude plugin details <name>`
splits the two: `engineering` costs 871 tokens always-on for 10 skills (~87 each, name
and description), while each body — `code-review` 1,200, `debug` 1,200,
`incident-response` 1,700 — loads only when that skill fires. A skill you keep is
already lazy; disabling it does not make it lazier, it makes it undiscoverable.

**Caching changes what the number means.** Across 14,048 model calls, **98.3% of input
tokens were cache reads**, billed at 0.1×. Effective input cost is **12% of raw**, so
~58,300 raw was ~5,800 effective per turn and the measured 45,102 is ~4,500. The
saving is real but it compounds slowly — worth doing once, not worth chasing in
200-token increments.

**What is not worth cutting**, measured rather than assumed: FinNode's `CLAUDE.md` is
3,748 tokens, and splitting its rule claims from their evidence looked like a 41% win on
paper. Reading it showed most of that prose is operative — which of `observeById` /
`getById` fails which way, that moving the device clock does *not* fire a pending sweep.
Only ~600 tokens are genuinely historical, in one project, at 0.1× — about 70 effective
tokens a turn. **The Voice-Flow 110 KB diagnosis has now failed to transfer to FinNode
twice.** Measure the sections before proposing the fix.

**Retention.** `cleanupPeriodDays` is 60, set 2026-09-22. Transcripts are not junk: every
number in this section came from them. Nothing was deleted when it was set — the oldest
transcript was 21 days old.

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

### Open questions

Not guesses to act on — things to confirm before treating either answer as true.

- **Which Debugger tree is current?** `vthrudebugger_v1` has the `CLAUDE.md` and is on a
  feature branch; `Debugger v2` has newer commits and its own `ARCHITECTURE.md`,
  `INTEGRATION.md` and `PLAN.md`, but no `CLAUDE.md`.
- **Can `Voice Flow_v1` be archived?** `Voice-Flow` appears to have superseded it.
- **Is `Packbly v2` a real project?** The README describes it as a Figma code export
  ("Website Redesign Proposal"), which reads as a design bundle, not an app.
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
  toasts**, network inspector, **client-side mocks**.

- **Packbly Web** — `~/Documents/VS Code/Packbly_web/v1.1-Packbly` — logistics platform:
  intracity courier product plus a **B2B relocation and warehousing ticket system**.
  Next.js 16 **App Router** + React 19, **MongoDB native driver**, Socket.IO, **JWT
  auth**. Holds real customer and courier records.

- **Voice Flow v1** — `~/Documents/VS Code/Voice Flow_v1` — the earlier Voice Flow tree.
  Superseded by `Voice-Flow`; confirm whether it can be archived.

- **SecondBrain schema** — `~/Documents/SecondBrain Obsidian/schema` — schema for an
  Obsidian vault. **The vault itself is the parent directory**, which holds `raw`,
  `wiki` and `schema`.

- **Emp Portal** (Vthru-Emp) — `~/Documents/VS Code/Emp portal/Vthru_Emp_v2.1_jun26` —
  multi-tenant HR portal. React 18 + Vite **frontend**, Express 5 + better-sqlite3
  **backend**, role-based dashboards. Holds real employee records.

- **Debugger v2** — `~/Documents/VS Code/Debugger v2` — in-app debug overlay for React
  Native, built so **a developer can drop it into an app**. Successor to
  `vthrudebugger_v1`; **carries its own** `ARCHITECTURE.md`, `INTEGRATION.md`, `PLAN.md`,
  `DEPENDENCIES.md`.

- **Packbly v2** — `~/Documents/VS Code/Packbly_v2/packblyfima3` — a Figma code export
  ("Website Redesign Proposal"), **shadcn theme + assets**. Reads as a design bundle
  rather than an app; confirm whether it is a real project.

- ~~`~/Documents/Voice-Flow-main`~~ — was a **third** Voice Flow copy with no git repo.
  **No longer on disk**, confirmed 2026-09-20 and 2026-09-21.

- `~/Documents/extra/v1.1-Packbly` — a Next.js tree, apparently an older copy of Packbly
  Web. Last commit 2026-06-23.

- `~/Documents/Skils/PM-skills-Amit` — **a clone of the public `phuryn/pm-skills`
  repository. Reference material, not your code.**

Three Voice Flow trees and two Packbly trees exist. **Worth settling which is canonical**
— the risk is editing the wrong one and losing the work.
