# Project rules

A copy of each project's `CLAUDE.md`, so the rules survive a move to another
machine or a switch to another Claude account.

**Why they are here and not in the projects.** A project's `CLAUDE.md` stays out
of that project's own repo — a standing preference since 11 Aug 2026, recorded in
memory as `claude-md-not-in-git`, and confirmed as D13 in `../SETUP-PLAN.md`.
That keeps them out of anything shared with other people, but it also meant they
existed in exactly one place on one Mac. This folder is the second place.

**The live file is the source of truth.** Everything here is a copy. Edit the
project's own `CLAUDE.md`; never edit the copy and expect it to go anywhere.

## Keeping them current

```bash
./sync.sh          # report: which copies have drifted from the live files
./sync.sh --pull   # copy the live files over the copies here
```

`sync.sh` exits non-zero when anything has drifted or a source file has moved, so
it can be run as a check. Report mode changes nothing.

`manifest.tsv` maps each copy to its source path — one tab-separated line per
project. A project whose folder moves is fixed by editing that line, and `sync.sh`
will say `MISSING SOURCE` until it is.

## What is here

| Copy | Source project |
|---|---|
| `FinNode/` | `~/Documents/VS Code/FinNode` |
| `Voice-Flow/` | `~/Documents/VS Code/Voice-Flow` |
| `Voice Flow_v1/` | `~/Documents/VS Code/Voice Flow_v1` |
| `vthrudebugger_v1/` | `~/Documents/VS Code/vthrudebugger_v1` |
| `Packbly_web/` | `~/Documents/VS Code/Packbly_web/v1.1-Packbly` |
| `Emp portal/` | `~/Documents/VS Code/Emp portal/Vthru_Emp_v2.1_jun26/.claude/` — the one project whose rules sit in `.claude/` rather than the project root (item 5.3) |
| `SecondBrain schema/` | `~/Documents/SecondBrain Obsidian/schema` |

## Before adding another one

All seven were read in full before the first copy landed here, because this repo
is pushed to GitHub. They hold architecture, conventions and pitfalls — env var
*names* appear, values do not, and no customer, employee or account record does.
Two of these projects hold real personal data in their databases; none of it is
in their rules files.

Read a new one the same way before adding it. The check is not "does it look
like a rules file" — it is "has every line of it been read".
