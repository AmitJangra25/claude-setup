# Project rules

A copy of each project's `CLAUDE.md` and its permission rules, so they survive a
move to another machine or a switch to another Claude account.

**Why they are here.** The policy on tracking these files in a project's own repo
changed once. Until 2026-09-20 they were deliberately kept out — a standing
preference from 11 Aug 2026, recorded in memory as `claude-md-not-in-git` and
confirmed as **D13** in `../SETUP-PLAN.md`. **Both are superseded.** Since
2026-09-20, `CLAUDE.md` and `.claude/settings.json` **stay tracked while a repo is
private and solo**; `../STANDARDS.md` § *Git* governs, and taking them out is
raised before a repo goes public, never done silently.

**The projects were not made uniform.** *Recorded, not freshly checked:* Voice-Flow
was left untracked and not reverted; FinNode is tracked. So for some projects this
folder is their only version history, and for others it is a second copy that
survives a machine or an account switch. `.claude/settings.local.json` stays
gitignored everywhere — it holds absolute paths from this Mac and a long list of
one-off grants, and belongs in no repo shared with anyone. Either way, everything
here travels.

**The live file is the source of truth.** Everything here is a copy. Edit the
project's own file; never edit the copy and expect it to go anywhere.

## What is mirrored, and what deliberately is not

| | Mirrored here? | Why |
|---|---|---|
| `CLAUDE.md` | yes | not tracked in every project — see above |
| `.claude/settings.json` | yes | not tracked in every project; holds the permission rules |
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
| `Voice-Flow/` | `~/Documents/VS Code/Voice-Flow` — the live Voice Flow tree, a personal dictation app |
| `vthrudebugger_v1/` | `~/Documents/VS Code/vthrudebugger_v1` |
| `Packbly_web/` | `~/Documents/VS Code/Packbly_web/v1.1-Packbly` |
| `Emp portal/` | `~/Documents/VS Code/Emp portal/Vthru_Emp_v2.1_jun26` |
| `SecondBrain schema/` | `~/Documents/SecondBrain Obsidian/schema` |
| `Debugger v2/` | `~/Documents/VS Code/Debugger v2` — permissions only; it has no `CLAUDE.md` yet |

`Packbly_v2` is absent on purpose: it has no `CLAUDE.md` and no `.claude/`, so
there is nothing to mirror. Add a line when it gains one.

### Retired

| Copy | Source project |
|---|---|
| `Voice Flow_v1/` | `~/Documents/VS Code/Voice Flow_v1` |

**`Voice Flow_v1` is not the Voice Flow project.** It is an earlier tree, superseded by
`Voice-Flow` and not worked on — Amit's decision, 2026-09-27. The names are one hyphen
apart, so check which one you are in before changing anything: `Voice-Flow` is the
current one.

It stays where it is. The tree was kept on disk rather than archived, its line stays in
`manifest.tsv`, and `sync.sh` still mirrors it — retired here means nobody is working on
it, not that it has gone.

## Before adding another one

Every file here was read in full before it landed, because this repo is pushed to
GitHub. The rules files hold architecture, conventions and pitfalls — env var
*names* appear, values do not, and no customer, employee or account record does.
Two of these projects hold real personal data in their databases; none of it is in
their rules files. The settings files were checked the same way: they are
permission patterns, and they hold no keys, tokens or credentials.

Read a new one the same way before adding it. The check is not "does it look like
a rules file" — it is "has every line of it been read".
