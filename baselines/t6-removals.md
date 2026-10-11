# T6 removal manifest — 10-10-2026

Every removal and fix made during T6, the audit and cleanup of `~/.claude`. One entry
each: what, why, where it was, what replaced it, how it was verified. Settings and hook
changes carry the exact original text, so they can be restored by copying it back.

The two `settings.local.json` files are gitignored and untracked: **this file is their
only undo.** Everything else is also recoverable from git.

Big removals — a whole file, a dead rule, a structural change — also get a dated D-row in
`SETUP-PLAN.md`.

## Starting state — 10-10-2026

- `project-rules/drift.sh`: `18 current, 0 drifted, 0 stale copies, 0 projects with
  nothing to mirror`, exit 0.
- `bash harness/session-check.sh`: exit 0, printed nothing (0 bytes).
- Tree clean at `9c20817`.
- `/context all`, fresh setup session, pasted by Amit 10-10-2026: **23.1k** — Claude Code
  2.1.296, Opus 5.5 (`claude-opus-5-5`), `Messages` 10. Effort and mode not shown.

  | Bucket | 09-10-2026 (T2) | 10-10-2026 |
  |---|---|---|
  | System prompt | 2.4k | 2.4k |
  | System tools | 12.7k | 12.8k |
  | Memory files | 6.8k | 6.8k |
  | Skills | 1.1k | 1.1k |
  | **Total** | **22.9k** | **23.1k** |

  Every-turn files: `STANDARDS.md` 5.5k · `RTK.md` 570 · `MEMORY.md` 318 · `OLLAMA.md` 266 ·
  `.claude/CLAUDE.md` 178 (151 at T2 — T3 added its warning line) · `CLAUDE.md` 34.
  Largest skill lines: `claude-api` ~360 (left at full cost on purpose), `ollama` ~130,
  `pdf-viewer:view-pdf` ~100, `plugin-authoring` ~90. MCP: 3 `pdf-viewer` tools, loaded
  on demand. The version moved 2.1.295 → 2.1.296, so the +0.1k in system tools is not
  this setup's. **Already 0.2k over the 22.9k target before any change.**

## Removals and fixes

### 1. `/tmp/ptrs.txt` — scratch file, outside the repo

- **What:** a 151-line, 6,742-byte list of doc pointers.
- **Why:** written by the second plan cross-check against its read-only brief; nothing
  depends on it. Removal approved by Amit, 10-10-2026.
- **Where:** `/tmp/ptrs.txt`, modified 10-10-2026 16:13.
- **Replaced by:** nothing. The batch 9 pointer sweep rebuilds the same list from the docs.
- **Verified:** before — `stat` (size, time, owner) and a content read (pointers from
  `~/.claude` docs), and `find /tmp -maxdepth 1 -name 'ptrs*'` found one match. After —
  `ls /tmp/ptrs.txt`: *No such file or directory*.

### 2. `settings.json` — `Bash(rtk git rev-parse *)` removed (fix A, D35)

- **What:** one global `allow` rule. Exact original line 18, between
  `"Bash(rtk git log *)",` and `"Bash(rtk git show *)",`:
  `      "Bash(rtk git rev-parse *)",`
- **Why:** it never fires. `rtk hook check` leaves `git rev-parse` unrewritten in every
  shape tried (plain, `-C`, after `cd … &&`), and `hook-audit.log` (all projects, from
  2026-09-20) holds no real `rtk git rev-parse`. Approved by Amit, 10-10-2026.
- **Replaced by:** nothing. Plain `git rev-parse` is unaffected.
- **Restore:** put the line back at that position.
- **Verified:** `git diff` showed only this line removed (with entry 3's two additions);
  `jq` parses, 34 / 58 / 2.

### 3. `settings.json` — `Bash(rtk gh run list*)` and `Bash(rtk tree *)` added (fix B, D35)

- **What:** two global `allow` rules, added in sorted position — after `"Bash(rtk gain*)",`
  and after `"Bash(rtk read *)",`. Nothing removed: the bare `Bash(gh run list*)` and
  `Bash(tree *)` stay, because the hook leaves piped lines raw and they can still match
  there.
- **Why:** the hook rewrites `gh run list` → `rtk gh run list` and `tree` → `rtk tree`, so
  the bare rules miss the plain command and both read-only commands prompted. The added
  spellings are the hook's own output (`rtk hook check`). Approved by Amit, 10-10-2026.
- **Restore:** delete the two lines.
- **Correction, 10-10-2026 — the "why" above is not proven.** rtk 0.48.0's hook returns
  `"permissionDecision": "allow"` on some rewrites, and its binary carries the text
  *Blocked by RTK permission rule*. In all 115 simple rewrites in the session transcripts
  it did so only twice — these two commands, both matching the bare rules. So the bare
  rules may not have been dead; whether they alone were enough is untested, because
  neither command had been run before this change.
- **Verified:** `jq` 34 / 58 / 2, list sorted; `rtk hook check` output matches each new
  rule and no `ask` rule. Live, Amit, fresh setup session in manual mode, 10-10-2026
  (transcript `efcdf59d`):
  - `tree -L 1 harness`: hook `allow`, result 0.2 s later — no box, as Amit saw. `tree`
    is not installed, so the command then failed with *not found*; the permission check
    comes first.
  - `gh run list --limit 1`: hook `allow`, result 0.6 s later (`[]`). Amit reported a
    box; the transcript shows none could have waited, and Claude's three-line
    explanation was printed just before the call. No global `ask` rule matches
    `rtk gh run list` (`gh api|auth|pr|repo`). **Confirmed by Amit, 10-10-2026:** what
    he saw was Claude's pre-command explanation, not a permission box. Passed.
  - An earlier run of both the same day was in auto mode and is void: auto mode lets an
    unmatched command through, so it could not discriminate.

### 4. `.claude/settings.json` — four `ask` rules added (fix C2, D36)

- **What:** a `permissions.ask` block in the setup-only settings file:
  `Bash(*git pull*)`, `Bash(*git switch*)`, `Bash(*git stash pop*)`,
  `Bash(*git stash apply*)`. The `SessionStart` hook is unchanged.
- **Why:** `Bash(rtk git *)` in `.claude/settings.local.json` let all four run unprompted
  in setup sessions, and no `ask` rule covered them (open test 8). Narrowing that allow
  rule instead was rejected: the hook log shows `rtk git stash list`, `stash push`,
  `--no-pager diff` and `-c …` in use, which would have started prompting, and it would
  not have stopped auto mode. Approved by Amit, 10-10-2026. Cross-check 10-10-2026 ·
  Opus · keep, with doc changes · 26.5k tokens.
- **Original file, exact** (SHA-256 `e343dc6c…e0a0c5`, unchanged since `9c20817`):

  ```json
  {
    "hooks": {
      "SessionStart": [
        {
          "matcher": "startup",
          "hooks": [
            {
              "type": "command",
              "command": "bash \"$CLAUDE_PROJECT_DIR\"/harness/session-check.sh",
              "timeout": 10
            }
          ]
        }
      ]
    }
  }
  ```

- **Restore:** `git show 9c20817:.claude/settings.json > .claude/settings.json`, or copy
  the block above.
- **Known limits:** a harmless command containing the text (`grep "git pull" …`) also
  prompts. `git -C <path> pull` and `git -c x=y switch` are not caught — the global list
  has the same gap. Proven only for the modes T4 tested: manual, accept edits, auto.
  Bypass-permissions mode was never tested.
- **Verified:** `jq` valid, hook entry intact, four `ask` rules; each command and the
  risky variants (`--rebase`, `--discard-changes`, `stash@{1}`) hit their rule under
  `rtk hook check`, `stash list` and `status` do not. Live, Amit, fresh setup session:
  `rtk grep -c "git pull" …` prompted, naming `Bash(*git pull*)`.

- **C2 doc fixes — original, exact** (missing until 11-10-2026; added by entry 11):
  `README.md`, two table rows:

  ```
  | `settings.json` | Permissions, hooks, model. The `ask` list is the real safety net; projects hold only `allow` rules. |
  | `.claude/CLAUDE.md` | Setup-only rules — loads only in sessions started in `~/.claude`, never in a project. |
  ```

  `harness/overview.md`:

  ```
  4. **Permissions.** The global `ask` list in `settings.json` is the safety net; projects
     hold only `allow` rules. Auto mode lets unmatched commands through, so `ask` is what
  ```

  Open test 8's closing note: entry 6.

### 5. `.gitignore` — root allow lines anchored, PHASE2 lines moved, `.claude/settings.json` named (G1–G4, D37)

- **What:** 11 root allow lines anchored with a leading `/`; the three `PHASE2*` lines
  moved into the `archive/` block as `archive/…` paths; `!.claude/settings.json` added;
  two header comments and the `.claude/` comment corrected.
- **Why:** unanchored names matched in every re-included folder. That is how
  `.claude/settings.json` and the three `archive/PHASE2*` files were allowed — by accident
  — and it would also have let in e.g. `projects/x/CLAUDE.md`, `projects/x/.gitignore`,
  `harness/README.md`, `templates/settings.json`. The "named files only" design in the
  header was not true. Approved by Amit, 10-10-2026. Cross-check 10-10-2026 · Opus ·
  keep all four, G1 and G3 together · 33.0k tokens.
- **Original lines, exact** (also `git show 9c20817:.gitignore`):

  ```
  #   .claude.json         account UUIDs, machine ID, every folder ever opened
  #   projects/**/*.jsonl  ~158 MB of full session transcripts
  !.gitignore
  !README.md
  !CLAUDE.md
  !STANDARDS.md
  !RTK.md
  !REPOS.md
  !PROJECTS.md
  !OLLAMA.md
  !ENVIRONMENT.md
  !SETUP-PLAN.md
  !PHASE2-REMOVALS.md
  !PHASE2C-REMOVALS.md
  !PHASE2C-REMOVALS.json
  !settings.json
  # --- allow: the setup-only rules file (D33). .claude/ also holds current-task.md
  #     and settings.local.json, which stay ignored — `*` still matches them.
  ```

- **Restore:** `git show 9c20817:.gitignore > .gitignore`.
- **Before:** 95 files (94 tracked + this manifest), all allowed; untracked and not
  ignored: this manifest only.
- **Verified, 10-10-2026:** (a) all 95 files allowed, each by its intended line — root
  files by the anchored lines, `.claude/settings.json` by the new line, the PHASE2 files
  by the `archive/` lines; `git ls-files -c -i` under the new rules: 0. (b) the six
  made-up paths above, all now blocked by `*`. (c) untracked and not ignored: this
  manifest only, unchanged. (d) ignored files, old rules (`git show HEAD:.gitignore`) and
  new, read in one command with each pattern passed as `--exclude`: 4,267 each, no
  difference; the method agrees with git's own `--exclude-standard` reading. A first try
  at (d) fed the old rules through a shell stream git did not read, and is void.

### 6. Batch 4 — Amit's decisions recorded (records and wording only, D38)

No setting, hook, rule or script changed. Approved by Amit, 10-10-2026.

- **`baselines/global-open-tests.md`** — additions, plus item 8's closing note (C2, batch 1),
  which replaced two lines — original, exact, below (corrected 11-10-2026, entry 11): item 1
  *Closed 10-10-2026*; item 2 *Accepted 10-10-2026*; new item 11, closed from the docs —
  `code.claude.com/docs/en/hooks`, quoted: *"Deny and ask rules are still evaluated
  regardless of what the hook returns."*

  ```
     Also: the global `allow` rule `Bash(gh run list*)` never matches — the hook
     rewrites it to `rtk gh run list` first (Voice-Flow's checkup, 09-10-2026).
  ```

- **`harness/status.md` § *Open*** — the idea line replaced by its rejection. Original:

  ```
  - **Idea, not planned — for T6 to place:** a per-project `SessionStart` check comparing
    only that project's own settings with its mirror copy, silent when clean. Settle D23
    first (see *Known contradictions*): the copies live in `~/.claude`, outside the project.
  ```

- **`harness/status.md` § *Known contradictions*** — emptied. Original:

  ```
  - `PROJECTS.md` says project progress lives in each `README.md`; FinNode's rules point
    to `docs/ROADMAP.md`. Checked 09-10-2026 in FinNode's session: progress lives in
    `docs/ROADMAP.md` § *Phase 2 → Checkpoints*, with a one-line summary in `README.md`.
    `PROJECTS.md`'s wording is the part that is wrong — fix in T6.
  - Can a project session read `~/.claude`? D23 and PHASE 1 disagree (see D31). Nothing
    depends on it. Left for T6.
  - `SETUP-PLAN.md` § *Standing context* says no project holds a broad arbitrary-code
    rule; FinNode and Voice-Flow did until 09-10-2026. Historical text — fix in T6.
  ```

- **`PROJECTS.md`** — one sentence reworded. Original:
  `Per-project progress lives in each project's own `README.md`.`
- **`SETUP-PLAN.md`** — additions only: a dated correction under § *Standing context*'s
  "No project holds a broad arbitrary-code rule any more" paragraph, which is kept; the
  sentence *"By prompt" reworded by D38, 10-10-2026.* appended to the D23 row; the D38 row.
- **Verified:** `git diff` shows only these hunks; the sections D38 cites exist
  (§ *Verify that state rather than trust it*, § *1.3*); `drift.sh` and
  `session-check.sh` re-run below.

### 7. Batch 5 — `CLAUDE.md` comment (F1) and one `STANDARDS.md` sentence (F2)

Approved by Amit, 10-10-2026. No setting or rule behaviour changed.

- **F1, `CLAUDE.md` comment block** — not loaded per turn (the file measures 34 tokens
  with the comment). SETUP-PLAN.md no longer called "the live setup spec"; a `harness/`
  entry added. Original lines, exact:

  ```
       ~/.claude/SETUP-PLAN.md — the live setup spec, every decision and why, and the
       account-switch runbook. Read before changing any rule, setting, permission,
       hook or memory; update it after. Started 2026-09-18.
  ```

- **F2, `STANDARDS.md` § *Explaining a permission request*** — the git example list
  replaced by wording that covers the real `ask` list. Cross-check 10-10-2026 · Sonnet ·
  change: add "merges" so `git merge` stays covered — taken · 19.5k tokens. Original
  lines, exact:

  ```
  deletions, git that rewrites or discards work (`reset`, `clean`, `checkout`, `rebase`,
  `merge`, `rm`), pushing code, GitHub, killing processes, `open`, `sudo`, the Keychain,
  macOS privacy, `sqlite3`:
  ```

  New: `deletions, git that commits, merges, rewrites or discards work, pushing code,
  GitHub, killing processes, …`. Two older mentions of the list in `SETUP-PLAN.md` are
  dated history and stay. `git mv` and the four setup-only rules (D36) were not in the
  old list either.
- **Verified:** `git diff CLAUDE.md STANDARDS.md` shows only these two hunks. Per-turn
  cost to be re-measured in batch 9's fresh `/context all`.

### 8. Batch 6 — reference docs: `README.md`, `skills/ollama/SKILL.md`, `ENVIRONMENT.md`

Approved by Amit, 10-10-2026: README 1–2, the SKILL.md line, `ENVIRONMENT.md` items 1–12
and 15 (level 1, self-checked); items 13 and 14 after a narrow cross-check (below). No
setting, hook, rule or script changed. Audited and clean, no change: `PROJECTS.md`,
`REPOS.md`, `templates/*` (4 files).

- **README 1** — `SETUP-PLAN.md` word count. Original: `~29,000 words:` → `~33,000 words:`
  (`wc -w` 32,707).
- **README 2** — added a `.gitignore` row after the `settings.json` row. Addition only.
- **SKILL.md** — added `ollama-do models` after the `explain` / `docstring` / `quick` /
  `ask` line; the script's own usage text lists it. Addition only.
- **ENVIRONMENT 5** — opening per-turn cost. Original, exact:

  ```
  **Not imported by `CLAUDE.md` on purpose.** The three files that *are* imported cost
  **~5,355 tokens** on every turn of every session — `/context` in a fresh session from
  `~/.claude`, 2026-09-30, Claude Code 2.1.285. `STANDARDS.md` 4.6k + `RTK.md` 491 +
  `OLLAMA.md` 264; the 4.6k is rounded by `/context`, so the total carries about ±50.
  `CLAUDE.md` itself is a further 32 and is **not** one of the three — it is the file doing
  the importing. Previously ~3,166, measured 2026-09-22; `STANDARDS.md` grew between the two
  readings (**D27**, **D30**), so the +2,189 is real, not a measurement change.
  ```

  New: about 6.3k on 10-10-2026 (5.5k + 570 + 266), the two earlier readings kept as history.
- **ENVIRONMENT 15** — original: `Last full review: 2026-09-22. § *What every session loads
  before you type* was rewritten` / `2026-09-27; no other section was re-checked then.` →
  `Last full review: 10-10-2026 (T6, batch 6). The one before was 2026-09-22.`
- **ENVIRONMENT 1** — § 1, original, exact:

  ```
  This is where the token saving comes from. It is **completely separate from
  permissions** — changing permission rules cannot affect it, and disabling it would not
  change what Claude is allowed to do.
  ```

  New: not fully separate — the hook returns `allow` on some rewrites (D35, entry 3); `ask`
  and `deny` still apply, quoting open test 11.
- **ENVIRONMENT 2** — redirect row and the table's lead-in. Originals, exact:
  `> and the `&&` and `;` chain operators, and nothing else. Every other shell construct` /
  `> makes the *whole line* run raw:` and
  `> | `cat a > /tmp/x` — any redirect | **raw** |`. New: "usually raw — not always", with
  the `tree . > /tmp/x` rewrite and the one chained redirect in the hook log.
- **ENVIRONMENT 3** — permission counts. Originals, exact: `    allow   33 rules    read-only
  things stop prompting` and `**Counts measured against the live file 2026-09-27.** `ask`
  went **51 → 58** that day:`. New: 34 allow, counts dated 10-10-2026 (D35), the four
  setup-only `ask` rules named (D36); the 2026-09-27 history kept.
- **ENVIRONMENT 4** — `ask` prose. Original, exact: `` `rm`, `curl`, `wget`, `pkill`, `kill`,
  plus the `rtk` and `rtk proxy` spellings of all of `` / `them. Plain`. New: leading-`*`
  patterns since the 2026-09-20 merge; `rm`, `kill`, `killall`, `pkill`, `open` keep
  explicit spellings (checked against `settings.json` with `jq`).
- **ENVIRONMENT 11** — startup table: the 10-10-2026 column (23.1k) added and the intro and
  memory-file sentence moved to that reading. Original intro, exact:

  ```
  **Current state — 09-10-2026.** First-turn `/context all` from `~/.claude`, **Opus 5.5**,
  Claude Code **2.1.295**, `Messages` at 10 tokens; effort and mode not recorded. The
  2026-10-03 reading was Opus 5 at high effort, auto mode, 2.1.288. **Measured, not
  estimated.**
  ```

  Original note, exact: `**Not a like-for-like pair:** the model and Claude Code version
  both changed between the` / `two columns, and the system prompt has moved with the model
  before. Memory files is the` / `bucket this setup controls. On 09-10-2026 it was
  `STANDARDS.md` **5.5k** (4.3k on` / `2026-09-26), `RTK.md` 570, `MEMORY.md` 318,
  `OLLAMA.md` 266, `.claude/CLAUDE.md` 151,` / `` `CLAUDE.md` 34.``. The 09-10-2026 column
  values are unchanged.
- **ENVIRONMENT 10** — original, exact:

  ```
  **Two things this table cannot tell you.** Which component of the 22 Sep projection was
  optimistic — `usage` records totals, not a split, and settling it needs a live
  per-component breakdown. And what the current setup's category breakdown is, because no
  complete reading was taken after the last two changes.
  ```

- **ENVIRONMENT 6** — originals, exact: `- **Memory files** — 5.1k at the latest reading, most
  of it `STANDARDS.md` at 4.3k. Per` and `- **The system prompt** — 3.2k. Not settable.` →
  6.8k / 5.5k / 2.4k, dated 10-10-2026.
- **ENVIRONMENT 12** — new subsection *Effort on Opus 5.5 — the old keys are not known to
  apply*, at the end of § *What's set up globally*, quoting `code.claude.com/docs/en/model-config`
  as fetched 10-10-2026; and ", effort on Opus 5.5" added to the contents line. Additions
  only. **Correction to the batch 6 handoff note:** it said the `claude-opus-5` key "matches
  Opus 5 only"; the docs do not say that — recorded as not documented.
- **ENVIRONMENT 7** — "It does not." kept; a dated note added: true on 2026-09-15, rules file
  at the project root since 2026-09-20. Addition only.
- **ENVIRONMENT 8** — Voice-Flow row. Original, exact: `| **Current.** 39 Claude sessions,
  last commit 2026-09-11 |` → `| **Current.** |`. Closing paragraph removed. Original,
  exact:

  ```
  Two Voice Flow trees and two Packbly trees exist — `~/Documents/Voice-Flow-main` was a
  third and is gone. **Worth settling which is canonical**
  — the risk is editing the wrong one and losing the work.
  ```

  Why: § *Duplicate trees* says the same, and § *Project-tree decisions* settled it
  2026-09-27.
- **ENVIRONMENT 9** — FinNode progress removed. Original, exact: `  parsing**, **diary linked
  to transactions**. Phase 2, checkpoint 2c-i next; phases 0,` / `  1b and 1c plus
  checkpoints 2a and 2b done and **device-verified**. **157 unit tests**,` / `  105/105
  instrumented, **15 of 22 screens** real. Has `CLAUDE.md` and a `docs/` set` / `  indexed
  from `README.md`.` → a pointer to its own `docs/ROADMAP.md`, matching `PROJECTS.md`.
- **Verified (level 1):** `grep` finds none of the replaced strings except the intended
  history line (`~5,355 on 2026-09-30`); every row of the startup table has four columns.
- **Item 13** — the git-state loop's one home is `ENVIRONMENT.md` § *Branch state* (Amit,
  10-10-2026). README original, exact: `` sweep is in `SETUP-PLAN.md` § *Git state is not
  recorded here*. `` → `` sweep is in `ENVIRONMENT.md` § *Branch state*. ``. In
  `ENVIRONMENT.md`, original `it properly, and is never out of date:` → `… never out of
  date. This is the canonical copy of the sweep; anywhere else that needs it points here:`.
  **Batch 7:** `SETUP-PLAN.md`'s copy (~line 139) becomes a pointer, its self-references at
  ~lines 15 and 306 are re-pointed, and "canonical" can then become "the one copy".
- **Item 14** — top-level `settings.local.json`. Table row original, exact (HEAD; corrected 11-10-2026, entry 11): `| 1 / 0 / 0 |
  Present; **active or not is unverified** |`. Paragraph original,
  exact:

  ```
  **`/skills` writes to `settings.local.json`, which is gitignored.** Its `skillOverrides`
  block **merges** with the one in `settings.json` rather than replacing it — verified
  2026-09-26. But because the file is gitignored it is
  ```

  New: the path and the memory note named, and "which file held the entries during that
  check is not recorded". **Batch 7:** `SETUP-PLAN.md` ~line 711 (D28) and ~line 1188
  repeat the unqualified "merges (verified)" claim. **Also added** (recorded 11-10-2026,
  entry 11): the sentence beginning *"Undocumented, 10-10-2026: a docs lookup, from search
  summaries"* after the paragraph — addition only.
- **Cross-check of items 13–14**, 10-10-2026 · Opus · keep both; (b) reworded from "the one
  copy" to "the canonical copy", because `SETUP-PLAN.md` still holds a full copy until
  batch 7 — taken · 33.5k tokens measured.
- **Verified (13–14):** `grep` — README and `ENVIRONMENT.md` now point at § *Branch state*,
  which exists; the heading matches `PROJECTS.md`'s existing pointer.

### 9. Batch 7 — `SETUP-PLAN.md` (dated notes; S1–S10, Q1, Q2)
Approved by Amit, 10-10-2026. Every stale statement is annotated with a dated note beside it
(D25), never overwritten; dated phase history otherwise unchanged. No setting, hook, rule or
script changed. Exact original text of each edited span, in file order of the edit list:

- **S2 D28 row** — original, exact:

  ```
  merges** with `settings.json` rather than replacing it (verified), but which
  ```

- **S2 rebuild-table row** — original, exact:

  ```
  its `skillOverrides` block *merges* with that file rather than replacing it.
  ```

- **S3 § Git state backups line** — original, exact:

  ```
  **`backups/` was deleted on 2026-09-21** — see § *Where the backups went*.
  ```

- **S3 rebuild runbook backups line** — original, exact:

  ```
  `backups/` no longer exists: it was deleted on 2026-09-21 once
  ```

- **S3 § Where the backups went** — original, exact:

  ```
  5.2 MB, one per editing step.
  ```

- **S4 file size** — original, exact:

  ```
  It is ~176 KB, measured 2026-09-27; reading it all
  would cost an estimated 44k tokens, scaled from that size rather than measured.
  ```

- **S5 reading order** — original, exact:

  ```
  1. **§ *Where this stands*** at the top — the current state and the finish order —
     then the status table in § *Status at handoff (2026-09-18)*.
  2. **§ PHASE 11 — The global pass**
  ```

- **S5 renumber** — original, exact:

  ```
  3. The specific phase section only if the work touches it.
  ```

- **S6 dangling pointer** — original, exact:

  ```
  See § *The next piece of work* for the
  split test that applies to a file which really does govern every turn.
  ```

- **S7 counts, status table** — original, exact:

  ```
  read 35 from 2026-09-18 until then) and `deny` is 2;
  ```

- **S7 counts, verify section** — original, exact:

  ```
  counts are 33 `allow` / 58 `ask` / 2 `deny`, after
  ```

- **S7 counts, Phase 3 callout** — original, exact:

  ```
  > Live now: **ask 58 · allow 33 · deny 2**.
  ```

- **S7 counts, Phase 3 allow heading** — original, exact:

  ```
  *(2026-09-20 snapshot; now 33)*
  ```

- **S8 commit count** — original, exact:

  ```
  - **Local:** `~/.claude` is a git repository (4 commits).
  ```

- **S8 sweep expected total** — original, exact:

  ```
  print("project allow rules:", tot, " (expect 384)")
  ```

- **S9 archive allow lines** — original, exact:

  ```
  Adding to `archive/` needs a named allow-line in `.gitignore`, which
  blocks everything by default.
  ```

- **S10 D16 superseded** — original, exact:

  ```
  because four projects blanket-allow `Bash(rtk proxy *)` | 2026-09-18 |
  ```

- **S10 D31 settled** — original, exact:

  ```
  The D23 / **PHASE 1** contradiction above is unchanged and still unsettled.
  ```

- **S10 SecondBrain fixed** — original, exact:

  ```
  `PROJECTS.md`
    still lists it as its own project, which is wrong and worth fixing in the global
    pass.
  ```

- **S10 Packbly_v2 reversed** — original, exact:

  ```
  - **Packbly_v2** — no `CLAUDE.md`, no `.claude/`. Likely a Figma export, not an app.
  ```

- **S10 CLAUDE.md gitignored row** — original, exact:

  ```
  | gitignored in the project (`claude-md-not-in-git`), so this is its only history |
  ```

- **S10 settings gitignored row** — original, exact:

  ```
  | gitignored in the project, so this is their only history. **Added 2026-09-20**,
  ```

- **S10 node_modules count, Phase 6** — original, exact:

  ```
  and the 68 inside
  `node_modules`
  ```

- **S10 node_modules count, Phase 10** — original, exact:

  ```
  - The 68 `allow` rules inside `node_modules`
  ```

- **S10 open question 3** — original, exact:

  ```
  so open question 3 stands.
  ```

- **S10 FinNode drift closed** — original, exact:

  ```
  single-file copy precisely so `sync.sh --pull` would not sweep this in unreviewed. Needs
    its own review.
  ```

- **S10 word count dated** — original, exact:

  ```
  **Now 2,478 words** — Phase 11 cut them
  ```

- **Q2 runbook counts** — original, exact:

  ```
  ## Rebuilding on another account
  ```

- **S1 (a) loop replaced by pointer** (`SETUP-PLAN.md`) — original, exact:

  ```
  Run this instead. It takes one command and is always right:
  
  ```bash
  for r in ~/.claude ~/Documents/VS\ Code/{Voice-Flow,Voice\ Flow_v1,FinNode,vthrudebugger_v1,Debugger\ v2} \
           ~/Documents/VS\ Code/Packbly_web/v1.1-Packbly \
           ~/Documents/VS\ Code/Emp\ portal/Vthru_Emp_v2.1_jun26; do
    printf '%-22s %s\n' "$(basename "$r")" "$(git -C "$r" status -sb | head -1)"
  done
  ```
  ```

- **S1 (b) rename-section pointer** (`SETUP-PLAN.md`) — original, exact:

  ```
  Use the one-command sweep in
  § *Git state is not recorded here*;
  ```

- **Q1 D38 correction** (`SETUP-PLAN.md`) — original, exact:

  ```
  to another project or to `~/.claude`; the sweep in § *Verify that state rather than trust it* checks it.
  ```

- **S1 (c) ENVIRONMENT wording** (`ENVIRONMENT.md`) — original, exact:

  ```
  This is the canonical copy of the sweep;
  ```

- **Cross-check of S1 and Q1**, 10-10-2026 · Opus · S1 keep, one rewording ("moved there"
  → "the one copy since", because `ENVIRONMENT.md` already held its own copy); Q1 change —
  the sweep also misses non-`VS Code` paths, `~/…` `additionalDirectories` and a prefix-match
  sibling, row 5.2 covers "all 17" files, and a clause on the 09-10-2026 checkups — all
  taken · 44.0k tokens measured. **Plan change:** the batch 6 note said lines ~15 and ~306
  would be re-pointed; only ~306 was. Line 15 points at § *Git state is not recorded here*,
  which stays (header and reasoning), so it is still right.
- **Verified:** every edit matched exactly once before anything was written; edited table
  rows still end in `|`; the loop now exists once (`grep status -sb` over all `.md` outside
  `baselines/`); `drift.sh` and `session-check.sh` re-run at batch close.
- **Not changed, noted for Amit:** the sweep script itself (Q1 option b, excluded — it means
  running across project folders).

#### Entry 9 addendum — fixes from the full batch 7 re-check, 10-10-2026

Cross-check at Amit's request · Opus · verdict: small fixes needed — 2 wrong notes, 5 to
tighten; batch 7 otherwise in scope, history annotated, log originals accurate, Q1 honest ·
74.7k tokens measured. Fixes 1 and 2 re-verified by the main session (`ls -la backups`: five
rotating files; `harness/status.md` FinNode line and open test 4). All 7 approved by Amit,
10-10-2026. Exact original text of each edited span:

- **Fix 1 — backups count** (`SETUP-PLAN.md`) — original, exact:

  ```
  `.claude.json.backup.*` files — two on 10-10-2026, 520 KB.
  ```

- **Fix 2 — FinNode drift** (`SETUP-PLAN.md`) — original, exact:

  ```
  (10-10-2026: `drift.sh` reports 0 drifted; FinNode's checkup on
    09-10-2026 found it in sync — `harness/status.md`.)
  ```

- **Fix 3 — D13 caution** (`SETUP-PLAN.md`) — original, exact:

  ```
  — FinNode tracks it; noted 10-10-2026.)
  ```

- **Fix 4 — Packbly_v2 pointer** (`SETUP-PLAN.md`) — original, exact:

  ```
  just not one he works on —
    `PROJECTS.md`.)
  ```

- **Fix 5 — commit count** (`SETUP-PLAN.md`) — original, exact:

  ```
  (4 commits on 2026-09-18 — read today's count from git)
  ```

- **Fix 7 — D38 gap stated in the row** (`SETUP-PLAN.md`) — original, exact:

  ```
  and did not repeat the walk.
  ```

- **Fix 6 — status line count split** (`harness/status.md`) — original, exact:

  ```
  `SETUP-PLAN.md` — 31 dated notes and
  pointer fixes (S1–S10, Q2),
  ```

- **Fix 6 — status line re-check** (`harness/status.md`) — original, exact:

  ```
  all taken · 44.0k tokens.
  Manifest entry 9.
  ```

- **Fix 6 — task record count split** (`.claude/current-task.md`) — original, exact:

  ```
    - Batch 7 — `SETUP-PLAN.md`: 31 dated notes / pointer fixes (S1–S10, Q2); git-state loop
  ```

- **Fix 6 — task record re-check** (`.claude/current-task.md`) — original, exact:

  ```
  Cross-check of S1 + Q1 · Opus · 44.0k, all changes taken.
  ```

- **Fix 6 — fourth sweep gap** (`.claude/current-task.md`) — original, exact:

  ```
  `VS Code`, `~/…` `additionalDirectories` and Bash-rule reach (now documented in D38, not
  ```

- **Fix 6 — agent costs** (`.claude/current-task.md`) — original, exact:

  ```
  batch 7 S1 + Q1 44.0k.
  ```

- **Verified:** every edit matched exactly once before anything was written. `.claude/current-task.md`
  is gitignored — this addendum is its only record of the old text.

#### Entry 9 addendum — scratch scripts deleted, 10-10-2026

- **What:** three throwaway edit scripts written by this session to apply batch 7 —
  `/tmp/t6b7.py` (8,372 bytes, 19:47), `/tmp/t6b7b.py` (3,797 bytes, 19:48),
  `/tmp/t6b7c.py` (3,925 bytes, 19:56). Outside the repo; nothing depended on them. Every
  original text they replaced is logged above, so they held nothing that is not here.
- **Why:** scratch residue. Deletion approved by Amit, 10-10-2026.
- **Confirmed before, two methods, via `rtk proxy`:** `ls -la` (sizes and times as above) and
  a content check (`grep -c` for `SETUP-PLAN.md` / `t6-removals`: 3, 2, 6 hits).
- **Confirmed after:** `ls` on each path — *No such file or directory* ×3; `find /private/tmp
  -maxdepth 1 -name 't6b7*'` — 0 matches.

### 10. Batch 8 — harness, baselines, archive, project-rules docs

Approved by Amit, 11-10-2026: M1–M2, R1–R4, O1, B1–B2, G1 (level 1, self-checked) and open
test item 12. No setting, hook, rule or script logic changed; the `manifest.tsv` edits are
comment lines, which both scripts skip. Audited and clean, no change: `drift.sh`, `sync.sh`,
`harness/cross-check.md`, `harness/session-check.sh`, `archive/README.md`; dated runs and
`baselines/03-10-2026.md` checked for pointers only (history). Deferred to batch 9 (Amit):
the `harness/status.md` § *Next gate* rewrite, level 2 cross-check then. Exact original
text of each edited span:

- **M1** (`project-rules/manifest.tsv`) — original, exact:

  ```
  #     CLAUDE.md                      the project's rules (gitignored in the project)
  #     .claude/settings.json          permission rules (gitignored in the project)
  ```

- **M2** (`project-rules/manifest.tsv`) — original, exact:

  ```
  # Skills are NOT here on purpose — they are not gitignored, so they travel in the
  # project's own repo. See SETUP-PLAN.md § 'Project rules are separate'.
  ```

- **R1** (`project-rules/README.md`, exit behaviour; `sync.sh` exits non-zero only on
  stale or missing, code line 60) — original, exact:

  ```
  Both exit non-zero when anything has drifted, a copy has gone stale, or a project
  has none of its tracked files where the manifest says to look — so either can be
  run as a check. `drift.sh` changes nothing.
  ```

- **R2** (`project-rules/README.md`) — original, exact: `and it is deleted when the task closes —`
- **R3** (`project-rules/README.md`, dated note added) — original, exact:

  ```
  was left untracked and not reverted; FinNode is tracked. So for some projects this
  ```

- **R4** (`project-rules/README.md`) — original, exact: `the drift this script exists to prevent`
- **O1** (`harness/overview.md`, rewrap only) — original, exact:

  ```
     add mostly `allow` rules, and a few their own `ask` rules. Auto mode lets unmatched commands through, so `ask` is what
     stops it (`baselines/09-10-2026-run2.md`).
  ```

- **B1 + B2** (`baselines/README.md`) — original, exact:

  ```
  **One exception to the naming rule:** `global-open-tests.md` is an index of what is
  still unproven, not a dated run. It carries no results — only one line per open
  item and a pointer to where the detail lives. Project-specific tests appear there
  as pointers only; their records belong inside the project they are about.
  ```

- **G1** (`baselines/global-open-tests.md`) — original, exact:

  ```
  What is still unproven about this setup, one line each. **An index, not a dated
  run**: the detail stays where it already lives, and this file only says what is
  open and where to look.
  ```

- **Item 12** (`baselines/global-open-tests.md`) — added after item 11: the D38 sweep
  script's gaps, open, pointer to `SETUP-PLAN.md` § *Decisions already made*, row D38.
  Addition only.
- **Verified (level 1):** every edit matched exactly once; `grep -c` for each replaced
  string — 0 in all four files; § *Decisions already made* exists once; `drift.sh` 18
  current / 0 drifted, exit 0; `session-check.sh` 0 bytes.

### 11. Batch 9 — `harness/status.md` rewrite, cross-check fixes, open test 12

Approved by Amit, 11-10-2026: the `status.md` rewrite with the four draft fixes from the
cross-check, the four log and D-row fixes, open test 12 deferred, and the batch 9 finish
list additions. Cross-check 11-10-2026 · Opus · draft and full T6 diff · change, all
taken · 96.7k tokens measured. Additions only, no original: the `status.md` T6 entry (S5), the
C2 originals in entry 4, open test 8's original in entry 6, the item 14 note in entry 8.
`.claude/current-task.md` is gitignored — this entry is its only record of the old text.
Exact original text of each replaced span:

- **S1 § Current phase — sentence appended** (`harness/status.md`) — original, exact:

  ```
  (open test 6) deferred until Amit asks. P1B finished 08-10-2026.
  ```

- **S2 P1A entry — "Done:" facts moved in** (`harness/status.md`) — original, exact:

  ```
    a step-4 contradiction) · 33.4k tokens measured.
  ```

- **S3 P1B-1 entry — gate facts moved in** (`harness/status.md`) — original, exact:

  ```
  - **P1B-1** — reviewed by Amit and committed 08-10-2026. The history in
  ```

- **S4 P1B-2 entry** (`harness/status.md`) — original, exact:

  ```
  - **P1B-2** — done 08-10-2026. `.claude/current-task.md` is now only a live task record
  ```

- **S6 § Next gate — body replaced wholesale** (`harness/status.md`) — original, exact:

  ```
  **Now:** T1–T5 and all three project checkups done. **T6 in progress** — plan approved
  10-10-2026, batches 0–9 in `.claude/current-task.md`, removals logged in
  `baselines/t6-removals.md`. Plan cross-checks 10-10-2026 · Opus · two runs: first kept
  with 7 changes, all taken · 33.3k tokens; second, at Amit's request, 1 wrong fact and
  8 missed items, all taken · 63.3k tokens measured — that agent wrote one scratch file
  against its brief, since deleted. **Batch 1 closed 10-10-2026:** fixes A, B (D35) and C2
  (D36) applied and tested live; fix D dropped. Cross-check of C2 · Opus · keep, with doc
  changes, all taken · 26.5k tokens. Docs lookup · read-only, docs sites only · 45.5k tokens,
  from search summaries, not quotes. **Batch 2 closed 10-10-2026:** hooks and scripts all
  working and needed, no fix; read-only, self-check only (Amit agreed). Found: Opus 5.5
  ignores the user-settings `effortLevel` (docs, quoted) — Amit decides separately; old keys
  left. **Batch 3 closed 10-10-2026:** `.gitignore` G1–G4 (D37) applied, four checks
  passed. Cross-check · Opus · keep all four · 33.0k tokens. **Batch 4 closed 10-10-2026:**
  open tests 1 closed, 2 accepted, 11 added and closed from the docs; D38; per-project
  `SessionStart` idea rejected; known contradictions empty. Records and wording only. **Batch 5 closed 10-10-2026:**
  `CLAUDE.md` comment (F1) and one `STANDARDS.md` sentence (F2) fixed; cross-check of F2 ·
  Sonnet · one word added · 19.5k tokens. **Batch 6 closed 10-10-2026:** reference docs —
  `README.md`, `skills/ollama/SKILL.md` and 14 `ENVIRONMENT.md` items fixed; `PROJECTS.md`,
  `REPOS.md`, `templates/*` clean; the git-state loop's one home is `ENVIRONMENT.md`
  § *Branch state* (Amit). Cross-check of items 13–14 · Opus · keep both, one rewording
  taken · 33.5k tokens. **Batch 7 closed 10-10-2026:** 31 dated notes and pointer fixes
  (S1–S10, Q2; 30 in `SETUP-PLAN.md`, 1 in `ENVIRONMENT.md`), the git-state loop now a pointer to `ENVIRONMENT.md`, and D38
  corrected to what the sweep script actually checks (Q1). Cross-check of S1 and Q1 · Opus ·
  S1 keep with one rewording, Q1 changed (three more misses named) — all taken · 44.0k tokens.
  Full re-check at Amit's request · Opus · 2 wrong notes and 5 tightenings, all fixed ·
  74.7k tokens. Manifest entry 9 and its addendum. **Batches 0–7 all closed 10-10-2026.**
  **Batch 8 closed 11-10-2026:** 11 wording fixes in the project-rules, harness and baselines
  docs, and open test 12 (D38's sweep-script gaps, left open). Level 1, no agent. Manifest
  entry 10. **Next: batch 9** — finish, started only when Amit says; it opens with the
  rewrite of this section (deferred from batch 8, level 2 cross-check), in a fresh session;
  the handoff is
  `.claude/current-task.md`. The setup is finished when every line of `harness/overview.md` § *What
  "finished" means* is true. Open test 3's replay: not run for now (Amit, 09-10-2026).

  Done: Opus diff review, Amit's review, `/context all` before and after (setup 22.6k →
  22.9k, FinNode 28.4k → 28.6k, measured), setup-only load test passed. The earlier
  requirement for two P1A setup sessions before P1B was replaced by Amit's approval of
  P1B-1 in direction, 08-10-2026. The cold Orient gate sessions do not count as P1A
  usage. P1B-1 done 08-10-2026 after the cold Orient gate passed, and committed after
  Amit's diff review. P1B-2 done 08-10-2026 after its own plan approval. Mirror drift closed 09-10-2026:
  `rtk proxy *` removed in each project's own session, `drift.sh` 0 drifted. Committing and
  pushing each need Amit's separate approval.
  ```

- **D37 row headline** (`SETUP-PLAN.md`) — original, exact:

  ```
  and every tracked file has its own allow line.**
  ```

- **Open test 12 — deferred** (`baselines/global-open-tests.md`) — original, exact:

  ```
  — open, script unchanged
     (Amit, 11-10-2026).
  ```

- **Entry 6 — "additions only" corrected** (`baselines/t6-removals.md`) — original, exact:

  ```
  - **`baselines/global-open-tests.md`** — additions only, nothing removed: item 1
  ```

- **Entry 8 item 14 — logged row replaced with the HEAD text** (`baselines/t6-removals.md`) — original, exact:

  ```
  Table row original, exact: `| 1 / 0 / 0 |
    Present; **undocumented location — active or not is unverified** |`.
  ```

- **Task record — status line** (`.claude/current-task.md`) — original, exact:

  ```
  - **Status:** in progress — batches 0–8 done; **resume at batch 9** in a fresh session,
    only after Amit says to start it.
  ```

- **Task record — SessionStart re-prove** (`.claude/current-task.md`) — original, exact:

  ```
  re-prove the `SessionStart` hook once (proposed, not yet confirmed by
      Amit);
  ```

- **Task record — finish list close rewrite** (`.claude/current-task.md`) — original, exact:

  ```
  `status.md` *Last verified*; this record to
  ```

- **Task record — agent costs** (`.claude/current-task.md`) — original, exact:

  ```
  batch 7 full re-check 74.7k.
  ```

- **D32 row — dated note added** (`SETUP-PLAN.md`; pointer sweep, approved by Amit
  11-10-2026) — original, exact:

  ```
  which git does not keep, so this row is their durable record.
  ```

#### Entry 11 addendum — fixes from the final full-diff check, 11-10-2026

Final full-diff check · Opus · keep, 4 small fixes · 75.3k tokens measured. Fixes and the
final-check line in `harness/status.md` (an addition, no original) approved by Amit,
11-10-2026; level 1, self-checked. Exact original text of each replaced span:

- **Fix 1 — SETUP-PLAN.md count** (`harness/status.md`) — original, exact:

  ```
  `SETUP-PLAN.md` (30), and the harness,
  ```

- **Fix 2 — open tests review date** (`baselines/global-open-tests.md`) — original, exact:

  ```
  Last reviewed 10-10-2026.
  ```

- **Fix 3a — task record status line** (`.claude/current-task.md`) — original, exact:

  ```
  applied; next the pointer sweep, then wait for Amit.
  ```

- **Fix 3b — task record changed-files list** (`.claude/current-task.md`) — original, exact:

  ```
  new `baselines/t6-removals.md` (entries 1–10).
  ```

- **Fix 3c — task record exact next step** (`.claude/current-task.md`) — original, exact:

  ```
  - **Exact next step:** fresh session in `~/.claude` → read this record, `harness/status.md`
    and `baselines/t6-removals.md` (entries 9–10 are the latest) → wait for Amit to start
    batch 9 → propose the batch 9 plan (status.md rewrite with its cross-check, then the
    finish list above) and wait for approval before changing anything.
  ```

- **Fix 4 — entry 11 S5 label** (`baselines/t6-removals.md`) — original, exact:

  ```
  no original: the `status.md` T6 entry, the
  ```

### 12. Batch 9 — the finish: baseline moved 22.9k → 23k, status closed

- **What:** the setup-session `/context all` target moved from 22.9k to 23k (Amit,
  11-10-2026), and the T6 close recorded.
- **Why:** the finish reading is 23k against a 22.9k target. The 0.1k is Claude Code's
  system tools (12.7k on 2.1.295 → 12.8k on 2.1.296); memory files stayed at 6.8k. Cutting
  this setup's files to absorb a Claude Code change was rejected in favour of moving the
  target — the option named in the batch 9 plan.
- **Where and replaced by:**
  - `ENVIRONMENT.md` § startup table — the 11-10-2026 column added, intro and notes
    updated, a *Setup-session baseline: 23k* paragraph added. Original intro, exact:

    ```
    **Current state — 10-10-2026: 23.1k.** First-turn `/context all` from `~/.claude`,
    ```

    The original table and its note are the 10-10-2026 version of that section in git.
  - `harness/overview.md` § *What "finished" means* — original, exact:

    ```
    is at or below 22.9k (`ENVIRONMENT.md`).
    ```

  - `harness/status.md` — § *Current phase* last line, § *Completed* T6 `/context` line,
    § *Next gate* **Now**. Originals, exact:

    ```
    project checkups are done; T6 is in batch 9, the finish — `.claude/current-task.md`.
    ```

    ```
      `/context all`, fresh setup session: 23.1k at the start; the finish figure is not yet
      measured.
    ```

    ```
    **Now:** T6 batch 9, the finish; the handoff is `.claude/current-task.md`. **Then:** Amit's
    review, the commit and any push, each on his separate approval.
    ```

  - `harness/status.md` *Last verified* — already 11-10-2026, unchanged.
  - `.claude/current-task.md` — *Status* line set to *none*, then the closed T6 record
    cleared (Amit, 11-10-2026), after each of its facts was found here, in
    `harness/status.md` or in `ENVIRONMENT.md`. Two facts were only there; they move here:
    - Batch 1: `rtk hook check` was proven to write nothing to `hook-audit.log`, which is
      why it is the hook-test method.
    - Batch 1: `RTK_HOOK_AUDIT` kept switched on — Amit's decision, 10-10-2026.
- **Verified:** see *Ending state* below.

## Ending state — 11-10-2026

- `project-rules/drift.sh`: `18 current, 0 drifted, 0 stale copies, 0 projects with
  nothing to mirror`, exit 0.
- `bash harness/session-check.sh`: exit 0, printed nothing (0 bytes).
- `/hooks`, fresh setup session, pasted by Amit 11-10-2026: 2 hooks — `PreToolUse`
  `rtk hook claude` (user), `SessionStart` `harness/session-check.sh` on startup (project).
- `/context all`, same session, pasted by Amit 11-10-2026: **23k** — Claude Code 2.1.296,
  Opus 5.5 (`claude-opus-5-5`), `Messages` 10. Effort and mode not shown.

  | Bucket | 10-10-2026 (start) | 11-10-2026 (finish) |
  |---|---|---|
  | System prompt | 2.4k | 2.4k |
  | System tools | 12.8k | 12.8k |
  | Memory files | 6.8k | 6.8k |
  | Skills | 1.1k | 1.1k |
  | **Total** | **23.1k** | **23k** |

  Every-turn files: `STANDARDS.md` 5.5k → **5.4k** (batch 5, F2 — one sentence shortened) ·
  `RTK.md` 570 · `MEMORY.md` 318 · `OLLAMA.md` 266 · `.claude/CLAUDE.md` 178 · `CLAUDE.md`
  34 — all others unchanged. `/context` printed the total without a decimal, so the drop is
  under its rounding. Against the old 22.9k target the finish is 0.1k over, all of it in
  system tools on 2.1.296; the target is now **23k** (entry 12).
