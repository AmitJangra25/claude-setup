# Project rules

A copy of each project's `CLAUDE.md` and its permission rules, so they survive a
move to another machine or a switch to another Claude account.

**Why they are here.** The policy on tracking these files in a project's own repo
changed once. Until 20-09-2026 they were deliberately kept out — a standing
preference from 11-08-2026, recorded in memory as `claude-md-not-in-git` and
confirmed as **D13** in `../SETUP-PLAN.md`. **Both are superseded.** Since
20-09-2026, `CLAUDE.md` and `.claude/settings.json` **stay tracked while a repo is
private and solo**; `../STANDARDS.md` § *Git* governs, and taking them out is
raised before a repo goes public, never done silently.

**The projects were not made uniform.** *Recorded, not freshly checked:* Voice-Flow
was left untracked and not reverted; FinNode is tracked. (11-10-2026: Voice-Flow's own
checkup on 09-10-2026 confirmed `CLAUDE.md` and `settings.json` are gitignored there —
`../baselines/status-completed-11-10-2026.md`.) So for some projects this
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
| `.claude/skills/` | **no** | judged to travel in the project's own repo already, so a copy here would be a second copy of a tracked file — the drift these scripts exist to prevent. **Not verified per project:** no sweep confirmed that every project actually tracks its skills, and the same assumption about `CLAUDE.md` turned out to vary |
| `.claude/current-task.md` | **no** | live task state, not a rule (**D31**). It is work in progress on one machine, it changes several times a session, and it is closed when the task ends — mirroring it would report drift constantly and preserve nothing worth keeping |

A project is only expected to have some of these. A missing file is skipped
silently; a copy whose source has disappeared is reported as `STALE COPY`.

## Keeping them current

```bash
./drift.sh         # report: which copies have drifted from the live files
./sync.sh --pull   # copy the live files over the copies here
```

**Two scripts, not two modes.** `drift.sh` only reads — it has no `cp`, `mkdir`,
`rm` or redirect anywhere in it — so it can be granted without also granting the
copy. `sync.sh` writes, requires `--pull`, and stays behind a prompt.

`drift.sh` exits non-zero when anything has drifted, a copy has gone stale, or a
project has none of its tracked files where the manifest says to look — so it can be
run as a check, and it changes nothing. `sync.sh --pull` copies drifted files over and
exits non-zero only for a stale copy or a project with nothing to mirror.

`manifest.tsv` maps each copy to its **project root**, one tab-separated line per
project. A project whose folder moves is fixed by editing that line; until then
`drift.sh` says `MISSING SOURCE`.

**Checked automatically at the start of every setup session** (T3, 09-10-2026):
`harness/session-check.sh` runs `drift.sh` and warns if anything drifted, and names any
`Bash(rtk proxy *)` or `Bash(rtk git *)` rule in a manifest project's live settings files
(29-10-2026). It never syncs — fixing stays `./sync.sh --pull`, or a file-by-file copy
when one project's live file must not be copied yet, after review.

## What is here

| Copy | Source project |
|---|---|
| `FinNode/` | `~/Documents/VS Code/FinNode` |
| `Voice-Flow/` | `~/Documents/VS Code/Voice-Flow` — the live Voice Flow tree, a personal dictation app |
| `vthrudebugger_v1/` | `~/Documents/VS Code/vthrudebugger_v1` |
| `Emp portal/` | `~/Documents/VS Code/Emp portal/Vthru_Emp_v2.1_jun26` |
| `SecondBrain schema/` | `~/Documents/SecondBrain Obsidian/schema` |
| `Debugger v2/` | `~/Documents/VS Code/Debugger v2` — permissions only; it has no `CLAUDE.md` yet |

AtWorkpe is on GitHub only and has no `CLAUDE.md`; add a line when it gains one.

### Detached

Packbly Web (`~/Documents/VS Code/Packbly_web/v1.1-Packbly`) and Voice Flow v1
(`~/Documents/VS Code/Voice Flow_v1`) were detached from Claude Setup on 30-10-2026:
removed from `manifest.tsv` and their copies here deleted (they remain in git history).
The Packbly Web folder and its data stay on disk, untouched. The `Voice Flow_v1` folder
has since been deleted, confirmed absent 31-10-2026.

## Before adding another one

Every file here was read in full before it landed, because this repo is pushed to
GitHub. The rules files hold architecture, conventions and pitfalls — env var
*names* appear, values do not, and no customer, employee or account record does.
Two of these projects hold real personal data in their databases; none of it is in
their rules files. The settings files were checked the same way: they are
permission patterns, and they hold no keys, tokens or credentials.

Read a new one the same way before adding it. The check is not "does it look like
a rules file" — it is "has every line of it been read".
