# ENVIRONMENT.md — dated history, moved out 01-11-2026 — preserved record

Moved unchanged on 01-11-2026 from `ENVIRONMENT.md` (audit CL10, CL12; Stage A+B fix pass,
approved by Amit 01-11-2026), so that file holds the current state. Each section below
names where its text stood in `ENVIRONMENT.md` at commit `18b8573`. Nothing below a
section's rule line has been edited. Inside the copy, "above", "below", "this file" and
section names mean `ENVIRONMENT.md` as it stood at `18b8573`.

---

## A. Permission count changes — from § *3. Permissions*, lines 199–222

---

**Counts measured against the live file 15-10-2026** (`jq`); `ask` re-measured 23-10-2026,
58 → 90 (see *Added 23-10-2026* below). On 29-10-2026 `ask` went **90 → 96** (`find`
`-delete`, `-exec`, `-ok`, `-fprint`, `-fls`; `xargs … rm`) and `deny` **2 → 34** (`.env`
for `rtk read`, `rtk grep`, `rtk rg`, `xxd`, `cat`, `less`, `awk`, `sed`, `head`, `tail`,
three patterns each, plus two `rtk proxy` patterns); every rule tested in `/tmp`. `allow` went **34 → 39** on
23-10-2026: `rtk git branch *` became six listing forms (see *`git branch` is allowed only as a
listing* below). Before that, **33 → 34** on 10-10-2026 (**D35**: `rtk git rev-parse *`
out, `rtk gh run list*` and `rtk tree *` in). Sessions
started in `~/.claude` also load six setup-only `ask` rules from `.claude/settings.json`:
`git stash pop` and `git stash apply` (**D36**; four until S4 removed the blanket
`git pull` and `git switch`, **D41**), and `git add`, `git -* add`, `git stage`,
`git -* stage` (**D44**, 01-11-2026); they are not in the counts above. On 27-09-2026 `ask` went **51 → 58**:
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

## B. Earlier startup readings — from § *What every session loads*, lines 411–420

---

**Historical — the 26-09-2026 reading was 22.0k. Superseded by *Current state —
03-10-2026* below; it is no longer the latest figure and must not be quoted as current.**
`/context` in a fresh session from `~/.claude`, Opus 5, auto mode, nothing typed. Two
readings that day both returned 22.0k:
one after `RTK.md` grew, on a version that was not recorded, and one on Claude Code
2.1.283 after the `engineering` plugin was disabled.

The last complete category breakdown before that was recorded at 21.9k, ahead of later
changes. A complete breakdown of the **current** setup was missing until 03-10-2026 —
it is now recorded immediately below, so that gap is closed.

## C. Notes on the 03-10-2026 column — from § *What every session loads*, lines 472–481

---

The 03-10-2026 column fills the gap described in the paragraph above: it is the first complete bucket
breakdown **of the current setup**. It is not the first ever recorded here — the 21.9k
breakdown came earlier, before later changes.

**Do not compare this total with the 22.0k above.** That reading was taken on 2.1.283,
and this file carries no record of deferred tools. The 03-10-2026 `/context` lists
deferred tools separately — MCP 3.3k, system tools 17.3k — and does **not** count them in
the 22.8k. Whether the 22.0k reading counted them the same way is **unverified**. The two
numbers may be measuring different things, so the buckets above stand on their own and
any difference between the two totals does not.

## D. Status-line threshold notes — from § *What is switched off to get there*, lines 539–548

---

**Also changed on 26-09-2026, at no token cost:** the status-line thresholds, 250K/400K/600K
→ 220K/300K/450K. See § *Status line* — the status line is a shell command the terminal
renders, and its output never enters context.

**Superseded 30-09-2026:** raised again to **250K/400K/550K**. The 26-09-2026 change above
is kept as the record of why they were lowered at the time; it no longer describes the
machine. See § *Status line*.

**11-10-2026: lowered again** to **200K/300K/400K**, to save tokens. The 30-09-2026 values
above no longer describe the machine either. See § *Status line*.

## E. Earlier status-line values — from § *2. Status line*, lines 151–153 (the sentence starting "Earlier values")

---

Earlier values: 250K/400K/600K, lowered to
220K/300K/450K on 26-09-2026, raised to 250K/400K/550K on 30-09-2026 because against a 1M
window 220K fired while roughly 94% of it was still free.
