# This machine

How Claude Code is set up here, and why each choice was made. Reference material —
read it when you're about to change something, not on every session.

**Not imported by `CLAUDE.md` on purpose.** The five files that *are* imported cost
roughly 6,000 tokens on every turn of every session. A file explaining why a threshold
is 250K doesn't change how work gets done, so it stays out of that budget.

Last reviewed: 2026-09-15. Every number below was measured from session history on that
date, not estimated — the commands are in the section at the end.

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

**The catch worth knowing.** Claude Code has a built-in list of commands that never
prompt: `ls`, `cat`, `echo`, `pwd`, `head`, `tail`, `grep`, `find`, `wc`, `which`,
`diff`, `stat`, `du`, `cd`, and read-only `git`. RTK renames them to `rtk ls`, `rtk grep`
and so on, and the built-in list no longer recognises them — so they start prompting.

That is why 615 permission entries had accumulated across the projects: safe commands
were being approved by hand, one project at a time. The global `allow` list now covers
the read-only `rtk` wrappers, so this stops happening.

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

    allow   35 rules    read-only things stop prompting
    ask     87 rules    ~5.0 prompts per session, all on things that change something
    deny     2 rules    .env files unreadable anywhere

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

Two consequences to know about: `Bash(gh auth status*)` and `Bash(gh repo view*)` are
now **dead letters**, because the broader `ask` rules override them. They were left in
place rather than removed.

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

Re-run these before changing a threshold or a rule. Every number in this file came from
them, and a guess that replaces a measurement is how the 150K threshold and the
"122 prompts per session" figure both turned out wrong the first time.

---

## The project trees on this machine

Surveyed 2026-09-15. `PROJECTS.md` is the index; this is the state behind it, kept here
so the index doesn't have to carry it into every turn's context.

### Branch state at survey

| Project | Branch | Last commit |
|---|---|---|
| FinNode | `main` | 2026-09-15 |
| Voice Flow | `main` | 2026-09-11 |
| Voice Flow v1 | `rename-voice-flow-v1` | 2026-08-14 |
| vthrudebugger_v1 | `alert-swipe-to-dismiss` | 2026-07-28 |
| Debugger v2 | `main` | 2026-08-05 |
| Packbly Web | `main` | 2026-07-17 |
| Packbly v2 | `main` | 2026-08-09 |
| Emp Portal | `fix/dead-code-cleanup-and-test-fix` | 2026-08-05 |
| SecondBrain Obsidian | `main` | 2026-09-08 |

Two projects sit on a feature branch with months of no commits — `vthrudebugger_v1` and
`Emp Portal`. Worth checking whether that work was finished, merged, or abandoned before
starting anything new in either.

### Duplicate trees

**Three Voice Flow trees exist.** The risk is editing the wrong one and losing work.

| Path | State |
|---|---|
| `~/Documents/VS Code/Voice-Flow` | **Current.** 39 Claude sessions, last commit 2026-09-11 |
| `~/Documents/VS Code/Voice Flow_v1` | Older tree, on a rename branch, August |
| `~/Documents/Voice-Flow-main` | **No git repo at all.** Has a `CLAUDE.md`. Looks like a downloaded or extracted archive |

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
- **What is `~/Documents/Voice-Flow-main`?** No git history, so nothing there is
  recoverable if it is overwritten.

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

- `~/Documents/Voice-Flow-main` — a **third** Voice Flow copy. No git repo, has a
  `CLAUDE.md`. Most likely a downloaded or extracted archive.

- `~/Documents/extra/v1.1-Packbly` — a Next.js tree, apparently an older copy of Packbly
  Web. Last commit 2026-06-23.

- `~/Documents/Skils/PM-skills-Amit` — **a clone of the public `phuryn/pm-skills`
  repository. Reference material, not your code.**

Three Voice Flow trees and two Packbly trees exist. **Worth settling which is canonical**
— the risk is editing the wrong one and losing the work.
