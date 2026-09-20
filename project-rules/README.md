# Project rules

A copy of the files each project keeps out of its own git repo — its `CLAUDE.md`
and its permission rules — so they survive a move to another machine or a switch
to another Claude account.

**Why they are here and not in the projects.** A project's `CLAUDE.md` stays out
of that project's own repo — a standing preference since 11 Aug 2026, recorded in
memory as `claude-md-not-in-git`, and confirmed as D13 in `../SETUP-PLAN.md`.
`.claude/settings.json` and `.claude/settings.local.json` are gitignored for the
same kind of reason: they hold absolute paths from this Mac and a long list of
one-off grants, and neither belongs in a repo shared with anyone. That keeps all
three out of anything public — but it also meant they existed in exactly one place
on one Mac. This folder is the second place.

**The live file is the source of truth.** Everything here is a copy. Edit the
project's own file; never edit the copy and expect it to go anywhere.

## What is mirrored, and what deliberately is not

| | Mirrored here? | Why |
|---|---|---|
| `CLAUDE.md` | yes | gitignored in the project |
| `.claude/settings.json` | yes | gitignored in the project; holds the permission rules |
| `.claude/settings.local.json` | yes | gitignored; this is where clicking **allow** writes |
| `.claude/skills/` | **no** | *not* gitignored, so it already travels in the project's own repo. A second copy of a tracked file is the drift this script exists to prevent |

A project is only expected to have some of these. A missing file is skipped
silently; a copy whose source has disappeared is reported as `STALE COPY`.

## Keeping them current

```bash
./sync.sh          # report: which copies have drifted from the live files
./sync.sh --pull   # copy the live files over the copies here
```

`sync.sh` exits non-zero when anything has drifted, a copy has gone stale, or a
project has none of its tracked files where the manifest says to look — so it can
be run as a check. Report mode changes nothing.

`manifest.tsv` maps each copy to its **project root**, one tab-separated line per
project. A project whose folder moves is fixed by editing that line; until then
`sync.sh` says `MISSING SOURCE`.

## What is here

| Copy | Source project |
|---|---|
| `FinNode/` | `~/Documents/VS Code/FinNode` |
| `Voice-Flow/` | `~/Documents/VS Code/Voice-Flow` |
| `Voice Flow_v1/` | `~/Documents/VS Code/Voice Flow_v1` |
| `vthrudebugger_v1/` | `~/Documents/VS Code/vthrudebugger_v1` |
| `Packbly_web/` | `~/Documents/VS Code/Packbly_web/v1.1-Packbly` |
| `Emp portal/` | `~/Documents/VS Code/Emp portal/Vthru_Emp_v2.1_jun26` |
| `SecondBrain schema/` | `~/Documents/SecondBrain Obsidian/schema` |
| `Debugger v2/` | `~/Documents/VS Code/Debugger v2` — permissions only; it has no `CLAUDE.md` yet |

`Packbly_v2` is absent on purpose: it has no `CLAUDE.md` and no `.claude/`, so
there is nothing to mirror. Add a line when it gains one.

## Before adding another one

Every file here was read in full before it landed, because this repo is pushed to
GitHub. The rules files hold architecture, conventions and pitfalls — env var
*names* appear, values do not, and no customer, employee or account record does.
Two of these projects hold real personal data in their databases; none of it is in
their rules files. The settings files were checked the same way: they are
permission patterns, and they hold no keys, tokens or credentials.

Read a new one the same way before adding it. The check is not "does it look like
a rules file" — it is "has every line of it been read".
