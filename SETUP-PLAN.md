# Claude Code setup — specification, repair plan, and rebuild runbook

Written 2026-09-18. Owner: Amit (amit@v-thru.com). Machine: this Mac.

---

# ► START HERE — resuming in a new session

## What we are doing, in three lines

Amit's whole Claude Code setup is being reviewed **project by project**, one at a
time, and the global rules come **last** — only after every project has been seen.
Voice-Flow is done. **FinNode is next.** The method, the cost model and the
Voice-Flow result are in § *PHASE 10*.

## Next session: start here, not at the top

**Do not read this whole file.** It is ~79 KB and reading it costs about 20k
tokens, which is the opposite of the point. Read, in this order:

1. **This block** and the status table below it.
2. **§ PHASE 10 — Project-by-project review** — the method and what Voice-Flow
   produced. This is the only section that governs the current work.
3. The specific phase section only if the work touches it.

Everything else is reference. Search it when you need it.

## The next piece of work — FinNode

`~/Documents/VS Code/FinNode` — offline-first Android finance tracker for Indian
users (Kotlin + Compose, Room + SQLCipher, bank-SMS parsing). Active, phase 2.

Run it exactly as the Voice-Flow pass ran — the six steps are in § PHASE 10.
**Survey and ask before touching anything.** Amit wants 8–10 questions a project;
every removal is a question, never an inference.

What is already known to be waiting there:

| | |
|---|---|
| `CLAUDE.md` | 2,501 words — second largest, and it re-states four `STANDARDS.md` sections in substance. Phase 8 step 4 says keep the project evidence, drop the general paragraph |
| Permissions | 25 rules. **`Bash(python3 -c ' *)` runs any code** — the same hole closed in Voice-Flow. Also `git -c user.name=Amit … commit -q -m ' *`, now overridden by the global ask but still sitting there |
| Memory | 2 files. **`rtk-proxy-suppresses-dry-run-output` is the third of the five trapped rules** — rtk runs on every Bash call in every project, so an rtk gotcha is global by definition. Promoting it finishes Phase 8 step 1. `always-recommend-an-option` is already in `STANDARDS.md` § *When something is unclear* and needs the same pointer line the Voice-Flow duplicates got |
| Docs | It has its own `docs/` indexed from `README.md`, so the claim/evidence split may already be half done. Check before proposing it |

**First command of the session:** back up, into
`backups/2026-09-20-finnode/` (or the day's date), verified with `cmp`. Nothing
else happens first.

## The order after FinNode

Amit's call each time. The remaining seven, with what is known:

- **vthrudebugger_v1** — holds `vthru_debugger_workflow_preferences`, one memory
  carrying five rules, two of them the last trapped global ones (*never commit
  without being asked*, *one PR per branch off main*). Phase 8 step 3.
- **Voice Flow_v1** — 50 permission rules incl. `python3 -c ' *`; an old tree.
- **Emp portal** — real employee records. 11 rules.
- **Packbly_web** — real customer and courier records. 8 rules.
- **Debugger v2** — 17 rules, **no `CLAUDE.md` yet**. Starts from a blank page.
- **Packbly_v2** — no `CLAUDE.md`, no `.claude/`. Likely a Figma export, not an app.
- **SecondBrain schema** — not really a separate project: it is Voice-Flow's vault
  (`electron/vaultStore.js:22` sets it as `DEFAULT_VAULT_ROOT`). `PROJECTS.md`
  still lists it as its own project, which is wrong and worth fixing in the
  global pass.

**Then, and only then, the global pass:** `STANDARDS.md`, the other four imported
files, the global permission list, and whatever turned out to be universal.

## Status at handoff (2026-09-18)

| | Step | State |
|---|---|---|
| ✅ | 1.1 Back up 27 files | **DONE**, verified byte-identical with `cmp` |
| ✅ | 6.1 `git init` + `.gitignore` + baseline commit | **DONE**, commit `14883fa`, 38 files, 90 KB |
| ✅ | Read all 27 memory files | **DONE** — produced D13, D14 and Phase 7 |
| ✅ | 1.2 Close the holes in the global ask list | **DONE**, 35 rules added, `ask` 52 → 87 |
| ✅ | 1.3 Add two global entries rtk needs | **DONE**, 3 rules added, `allow` 32 → 35 |
| ✅ | **Phase 2a + 2b Permission cleanup** | **DONE** 2026-09-18. All 144 rules removed from 9 files; allow 560 → 416, verified against the `2026-09-18-phase2` backup: 0 added, `ask`/`deny` untouched, every file still valid JSON |
| ◐ | **Phase 2c Group B one-off leftovers** | **PARTLY DONE** 2026-09-18. B1 (14) + B2 (9) removed; allow 416 → 393, verified. **B3 (74 pipeline fragments) held by choice** — removing them only tidies, and can only add a prompt on a read-only stage. 3 `*` rules still flagged |
| ✅ | Phase 7a Repair where memories are stored | **DONE**, 3 orphaned dirs fixed, 18 memories reachable |
| ✅ | Phase 7b Promote working preferences to STANDARDS.md | **DONE**, 5 sections + 3 edits, +626 tokens/turn |
| ✅ | **Phase 3 The deliberate set** | **DONE** 2026-09-20. Scope rewritten first, as instructed: 1.2 had already made the change, so this documented it — all 124 rules grouped in plain English with a reason each (deny 2 · ask 87 in 11 groups · allow 35 in 6), every rule classified, nothing left over. **No permission rule changed.** Surfaced **4 gaps, none closed** (D4): `pnpm add`/`yarn add`/`npm i` missing rtk spellings of a rule that already asks, and **`rtk git branch *` sits in `allow` but `-D` deletes** — visible in the rule list (my first runtime 'proof' of this was invalid; see What I got wrong). Backup: `backups/2026-09-20-phase3/`
| ✅ | **Phase 4 Make the prompts readable** | **DONE** 2026-09-20. Hard rule, not guidance; new fifth line **"Why now"** on every global-`ask` command; `tccutil reset` gets its own subsection — must name the service and the app, and say when it hits every app on the machine. +360 tokens/turn. Backup: `backups/2026-09-20-phase3/`
| ✅ | **Phase 3 gaps closed** | **DONE** 2026-09-20. 14 `ask` rules added, `ask` 87 → 101. Additions only — verified `allow` (35), `deny` (2) and every other setting byte-identical against the backup, 0 rules removed. Covers the 3 missing install spellings (`rtk`/`rtk proxy` × `pnpm add`, `yarn add`, `npm i`) and branch deletion (`-d`/`-D`/`--delete` × bare/`rtk`/`rtk proxy`), which ask beats allow on by rule-type precedence. **Runtime confirmation still outstanding** — this session does not enforce `ask`. Backup: `backups/2026-09-20-phase3-gaps/`
| ◐ | **PHASE 8 Where rules live** | **PARTLY DONE 2026-09-20 — step 1 half done, step 2 done for one project.** Step 1: **2 of the 5** trapped rules promoted, both Voice-Flow's — `verify-shipped-bundle-not-source` into § *Evidence, not assumption*, `claude-md-not-in-git` into a new § *Git*. Additions only, **0 deleted lines**, +47 words / ~62 tokens per turn. The other **3 stay trapped** (vthrudebugger's *never commit without being asked* and *one PR per branch*, FinNode's rtk dry-run gotcha) and wait for those projects' own passes — see Phase 10. Step 2 done for Voice-Flow's 7 duplicates, **by a better method than planned**: a pointer line at the *top* naming the governing section, body and dated evidence kept. Replacing the body would have deleted the record of why each rule was given, which `dont-delete-reference-docs` forbids — and memory bodies do not load every turn, so keeping them costs nothing. Steps 3 and 4 not started. **Original survey, unchanged below:** surveyed 2026-09-20. The structure is already written in `STANDARDS.md` line 3; the files don't follow it. **There is no global memory** — memory is always project-scoped, so a universal preference saved in one project is structurally trapped. Found **10 rules written in two places** and **5 universal rules trapped in one project**, incl. *never commit without being asked* (not in `STANDARDS.md` at all) and the rtk dry-run gotcha. 4-step plan in the Phase 8 section. https://claude.ai/artifact/JPhMJ7z3bAMux6w5G3ZaMy |
| ◐ | **PHASE 10 Project-by-project review** | **STARTED 2026-09-20. Voice-Flow done, 7 projects to go.** Amit's order, and it supersedes doing global first: walk each project, decide what is universal only after seeing them all, then one global pass at the end. **Voice-Flow:** `CLAUDE.md` 4,650 → 1,534 words, per-turn cost in this project **10,056 → 6,003 tokens**; permissions 234 → 180; 2 rules promoted to `STANDARDS.md`; 7 memories marked; 3 skills added. Every deletion cross-checked twice by two methods before it was made. Full detail in the Phase 10 section. |
| | **PHASE 9 The 384 permission rules** | Surveyed 2026-09-20, nothing actioned. **18 rules execute arbitrary code and bypass the entire ask list** — `node *`, `python3 -c ' *`, `rtk proxy *`. Plus 37 already-global, 67 spent one-offs, 8 subsumed, 8 that write files. **The 384 cost zero tokens** — that was conflated when first reported. https://claude.ai/artifact/YAJNnNkSemQyCCtMsNkzDD |
| | **Open: Emp portal working tree** | `.gitignore` change from 5.7 is **uncommitted** on branch `fix/dead-code-cleanup-and-test-fix`. A `git add -A` there sweeps it into Amit's own commit. His call: commit separately, or revert |
| | **Open: unproven** | **20 `ask` rules have never been seen to fire** — the 14 added by Phase 3 gaps and the **6 `git commit` spellings added by the Voice-Flow pass**. Every session that added them had prompts disabled, including the one that used them to commit. Pattern matching was tested offline and is correct (`git commit`, `git -c … commit` and `git -C … commit` all match; `git log`/`status`/`diff` do not), but **matching a pattern is not the same as the prompt appearing.** Needs one real `git commit`, `git branch -D` or `pnpm add` in a normal session. Until then, treat "commit now asks" as designed, not proven |
| | **Full setup review** | https://claude.ai/artifact/2WH7CSysZCJY7Ta6EhskA3 — every permission rule, global file, memory and today's changes in one page |
| ✅ | **5.3 – 5.8 Low-priority tidying** | **DONE** 2026-09-20. Only **2 of the 6 needed work** — 5.4 and 5.6 were already satisfied (by D8 and by 7a) and the rows were stale, not the files. **5.3** moved Emp portal's rules to the project root and updated `manifest.tsv`, with the drift check proven live. **5.5** was reframed: 10 of the 17 recorded paths no longer exist, so the real work was fixing **3 errors** in `PROJECTS.md` — Emp Portal misfiled as having no `CLAUDE.md`, a dead `Voice-Flow-main` entry, and a stale date. **5.7** is a decision, recommended as leave-as-is, nothing changed. **5.8** is cloud-side and not fixable here: `uv`/`uvx` absent for browser-use, and definite's shipped URL 404s while its host answers 200.
| | **Open: Voice-Flow history + 5.8** | **Voice-Flow's `CLAUDE.md` survives in git history** — 4,647 bytes recoverable from `598e38e Initial commit`, an early version, before `c1e9459` untracked it. The repo is private, and the `claude-md-not-in-git` memory says to offer a history rewrite **before it goes public**. Offered, not done — a rewrite is destructive and needs explicit approval. 5.8: `definite` stays broken until the vendor fixes its URL |
| ✅ | **5.2 Cross-project read access** | **DONE** 2026-09-18. Voice-Flow's `Read(//Documents/VS Code/**)` removed — it reached `Emp portal/.../vthru.db` and Packbly. **No cross-project grant survives anywhere.** D23 |
| ✅ | **5.2b Standing grants over other folders** | **DONE** 2026-09-18. 12 entries removed. Voice-Flow now reaches only `/private/tmp`, `/tmp`, `Voice Flow.app` and its own tree; FinNode only its own |
| ✅ | **5.1 Voice Flow 110 KB rules → short `CLAUDE.md` + `docs/`** | **DONE** 2026-09-18, both parts. Part one: `CLAUDE.md` **110 KB → 29 KB**, evidence moved verbatim to `docs/working-rules.md` (42 entries) and `docs/known-pitfalls.md` (47 entries), 0 rules lost. **Part two: all 89 checked against the code — 0 superseded, 7 re-measured.** D24, D25 |
| ✅ | **5.1 part two: check the 89 entries against the code** | **DONE** 2026-09-18. Every cited path, symbol, constant, version and build setting resolved; `npm test` 76 files / 1764 tests and `npm run typecheck` green; `doctor:polish` and `doctor:vault` re-run. **No rule or pitfall is superseded.** 7 entries carry a dated re-measurement note (5 in working-rules, 2 in known-pitfalls) — the rules held, the numbers had drifted. Both docs' "not yet checked" headers replaced; `docs/README.md` rows updated. Backup: `backups/2026-09-18-phase5.1-part2/`. One open app defect confirmed still open: `electron/main.js:387` `fullScreenable`. **Addendum 2026-09-19:** the same figures were found in 20 more places across 6 Voice Flow docs, all outside 5.1's scope. 18 were left alone — they read as dated records of decisions made on those numbers, which is what D25 says to keep. The 2 that were annotated are in `docs/manual-testing.md` (Test 23's live baseline and the 10 Sep pass record), because a tester reads them at the moment of deciding whether a run passed. So the note count is **9 places in 3 docs**, not 7 in 2. The 4 stale code comments (`doctor-polish.js:64`/`:500`, `polishPrompt.ts:171`, `polishGuard.ts:25`) are still untouched — a source change wants its own commit. Backup: `backups/2026-09-19-manual-testing-baseline/`; Voice Flow commit `f91c399` |
| ✅ | 6.2 Private GitHub remote + push | **DONE**, `AmitJangra25/claude-setup`, verified private |
| ✅ | Pushed 2026-09-18 | 4 commits, head `8cdee2f`, remote confirmed private via the API |
| ✅ | **6.3 Project rules into this repo** | **DONE** 2026-09-18. All 7 project `CLAUDE.md` files copied to `project-rules/`, with `sync.sh` + `manifest.tsv` as the anti-drift step. All 7 read in full first. Drift detection proven by breaking a copy on purpose |

**Where the numbers stand now** — project `allow` rules **560 → 330**:
560 as found · **416** after 2a+2b (−144) · **393** after 2c (−23) · **392**
after 5.2 (−1) · **384** after 5.2b (−8, plus 4 `additionalDirectories`
entries) · **330** after the Voice-Flow pass (−54). Global `allow` is unchanged
at 35 and `deny` at 2; **`ask` is 107** — 87 after 1.2, 101 after Phase 3 gaps,
107 after the Voice-Flow pass added the three `git * commit *` spellings.

**And 68 rules nobody has ever counted.** Four `.claude/settings.local.json`
files sit *inside* `node_modules` — three copies of `resolve` and one of
`nanoid` — carrying **68 `allow` rules** that arrived by `npm install`, not from
this machine. They are the package maintainer's own grants, published to npm by
accident, and one of them ships a `notes.md` of their house style. The 384 count
never included them. Found 2026-09-20 while cross-checking the Voice-Flow pass;
see Phase 9.

## The git repo — where it lives

- **Local:** `~/.claude` is a git repository (4 commits).
- **Remote:** `https://github.com/AmitJangra25/claude-setup` — **private**,
  owned by GitHub account `AmitJangra25`. Pushed 2026-09-18.

**Verified after every push:** GitHub holds byte-for-byte the same file list as
`git ls-files` locally — no more. The count has moved as work landed: 40 at 6.2,
34 after 7a removed six duplicate memory files, 35 once `PHASE2-REMOVALS.md` was
added. Check it against `git ls-files | wc -l`, not against a number in this file. Zero matches for any excluded
pattern (`.claude.json`, `history.jsonl`, `*.jsonl` transcripts, credentials,
`backups/`, `plugins/`, `skills/`, `file-history`, `paste-cache`). Confirmed
against GitHub's own file listing, not the local `.gitignore`.

To resume on another machine: `git clone` it into `~/.claude`. That covers
everything in the "survives account switch" table below.

## Verify that state rather than trust it

```bash
# backup exists, 27 files
ls -1 ~/.claude/backups/2026-09-18-setup/global | wc -l      # expect 10
find ~/.claude/backups/2026-09-18-setup -type f | wc -l      # expect 27

# git repo exists, both commits present, tree clean
git -C ~/.claude log --oneline                               # newest first; 14883fa is the baseline
git -C ~/.claude status --porcelain                          # expect empty
git -C ~/.claude ls-files | wc -l                            # expect 37

# settings.json after 1.2. It NO LONGER matches the 1.1 backup — that is
# expected. The real proof is that the change was additions only:
git -C ~/.claude diff 885c1d4 -- settings.json | grep -c '^-[^-]'   # expect 0
python3 -c "import json;p=json.load(open('$HOME/.claude/settings.json'))['permissions'];print(len(p['allow']),len(p['ask']),len(p['deny']))"
                                                             # expect 35 87 2

# 1.2 marker: `tccutil` now appears TWICE — `Bash(tccutil *)` and
# `Bash(rtk proxy tccutil *)`. Do NOT grep for `gh repo` — `Bash(gh repo view*)`
# is a pre-existing ALLOW rule and gives a false positive.
grep -c tccutil ~/.claude/settings.json                      # expect 2
```

If `tccutil` returns 0, 1.2 has been reverted — check `git log` and
`git diff 885c1d4 -- settings.json`.

```bash
# Five dated backups, one per editing step. All verified with `cmp` when made.
ls -1d ~/.claude/backups/*/
#   2026-09-18-setup     before 1.1   (27 files, the original state)
#   2026-09-18-phase2    before 2a+2b (11 project settings files)
#   2026-09-18-phase2c   before 2c
#   2026-09-18-phase5.2  before 5.2   (Voice-Flow only)
#   2026-09-18-phase5.2b before 5.2b  (Voice-Flow + FinNode)
#   2026-09-18-phase5.1  before 5.1  (Voice-Flow CLAUDE.md + docs/README.md)
#   2026-09-18-phase5.1-part2 before 5.1 part two (CLAUDE.md + the two docs + docs/README.md)

# 5.1 part one: the split lost nothing. Each doc body must still equal the
# line range it came from in the backup. Both MUST print True.
python3 - <<'EOF'
import os
V = os.path.expanduser("~/Documents/VS Code/Voice-Flow")
orig = open(os.path.expanduser("~/.claude/backups/2026-09-18-phase5.1/CLAUDE.md")).read().split("\n")
for slug, (a, b) in (("working-rules", (162, 646)), ("known-pitfalls", (760, 1446))):
    body = open(f"{V}/docs/{slug}.md").read().split("\n---\n", 1)[1].strip()
    print(slug, body == "\n".join(orig[a-1:b]).strip())
EOF

# Project allow rules, and D23's invariant: no project may reach another.
# Prints the current total, then every cross-project grant. The second list
# MUST be empty — if it is not, D23 has been breached and it is a P1.
python3 - <<'EOF'
import json, os
VS = os.path.expanduser("~/Documents/VS Code"); tot = 0; bad = []
for root, dirs, fs in os.walk(VS):
    dirs[:] = [d for d in dirs if d != "node_modules"]
    if os.path.basename(root) != ".claude": continue
    dirs[:] = []
    top = os.path.relpath(os.path.dirname(root), VS).split(os.sep)[0]
    for fn in sorted(fs):
        if not (fn.startswith("settings") and fn.endswith(".json")): continue
        pm = json.load(open(os.path.join(root, fn)))["permissions"]
        tot += len(pm["allow"])
        for a in pm["allow"]:
            if "Documents/VS Code" in a and a.startswith(("Read(", "Edit(", "Write(")):
                inner = a[a.index("(") + 1:-1].lstrip("/")
                if not inner.startswith(f"Users/amitjangra/Documents/VS Code/{top}"):
                    bad.append(f"{top}/{fn}: {a}")
        for x in pm.get("additionalDirectories") or []:
            if x.startswith(VS) and not x.startswith(os.path.join(VS, top)):
                bad.append(f"{top}/{fn}: additionalDirectories {x}")
print("project allow rules:", tot, " (expect 384)")
print("cross-project grants:", bad or "NONE — D23 holds")
EOF
```

## How to work on this, in one line each

- **Nothing is removed or blocked without explicit approval.** This is D4 and it
  governs everything. List it, explain it, wait.
- **Explain every permission request in four lines** before the prompt appears:
  what it does · what changes · risk and why · how to undo. This is D3.
- **Verify with a command and its output, or do not claim it.** Four claims in
  the first session turned out to be wrong; see "What I got wrong".
- **Re-run anything through `rtk proxy`** if it feeds a decision to delete, move
  or overwrite a file. rtk rewrites command output. This is D12.
- **Cross-check twice, by two different methods, before deleting anything.** Amit's
  standing instruction since 2026-09-20. It has already caught a wrong claim and an
  incomplete fix in work reported as done — see Phase 10.
- **List incidental findings at the end, do not chase them.** Amit sets the pace.
- **Recommend one option and say why — including why not the others.**
- **Amit dictates his prompts.** Read through transcription errors rather than
  asking what he meant. "bs4" meant "VS Code".

---

## Why this file exists

Three reasons, in order of importance.

**1. It is the rebuild spec.** The setup must survive switching Claude accounts
— logging out of account A and into account B — and must be reproducible on a
different machine. This file plus the git repo in Phase 6 are what make that
possible. Section "Rebuilding on another account" is the runbook.

**2. It records what is actually there.** The setup grew by accident over ~120
sessions: rules written in one project, permissions granted by clicking "allow"
in the moment, skills arriving from the cloud on their own. Nobody designed it.

**3. It is the standing record.** As the setup changes with how the work is
actually done, this file is what gets updated — so the reasoning behind each
choice is still here in six months, and so the next change is made against a
known state rather than a guess.

## What I got wrong while surveying it, and why

Recorded so the same mistake is not repeated.

| I claimed | The truth | Why I got it wrong |
|---|---|---|
| `rtk git branch -D` runs with no prompt, proven by running it | **The test could not show that.** The session had `ask` enforcement off — `rm -rf` in the same command line matches `Bash(rm *)` and was also silent. The *rule-list* defect is real; the runtime claim was not earned | Read the absence of a prompt as evidence about one rule, without checking whether any rule was being enforced. A control was available and free — an already-asking command in the same command line — and I did not look at it |
| A stray rules file at `Documents/Voice-Flow-main/` | It is at `Documents/extra/Voice-Flow-main/` | rtk rewrote my search output and dropped a path segment. I did not re-verify. |
| A project's `allow` overrides a global `ask`, so the git safety rule was cancelled | **Backwards.** Rules are evaluated deny → ask → allow, and rule type beats file location. The global `ask` wins. | I assumed instead of reading the documentation. |
| 350 saved permissions | 560 | 350 was Voice Flow alone, not the total. |
| 8 rules ran without prompting | 40 | My risk categories put arbitrary-code and Keychain access in the "low risk" bucket. |
| `ENVIRONMENT.md` never loading was a problem to fix | **Deliberate and already documented.** A comment in `CLAUDE.md` explains it: reference material, and every `@import` is re-read every turn. | I read `CLAUDE.md`'s imports but not the file itself. |
| Voice Flow's `CLAUDE.md` being gitignored was an oversight | A standing preference from 2026-08-11, recorded in memory as `claude-md-not-in-git` | Did not read the memory files before recommending. Fixed by D14. |
| `sudo` ran 2× and `killall` 3× in history, so both needed fencing | **Neither has ever been run.** Every hit was the *word* inside a python regex or a `grep -n "a\|killall\|b"` pattern | My probe split compound commands on `\|` and matched heredoc contents. Fixed by replaying with full-token glob matching, which is what the permission system actually does. |

**Root cause:** each answer came from a fresh narrow query instead of one
complete inventory. Fixed by completing the inventory before planning — this
file is that inventory.

---

## The five systems

Only system 2 was deliberately authored. The rest accumulated.

```
1. CLOUD          claude.ai account — arrives on its own, cannot be edited here
   18 synced skills, 13 synced plugins, 4 MCP connectors
   (ClickUp, Figma, Sentry, Claude Docs)

2. GLOBAL RULES   ~/.claude/*.md — 13 KB, loads in every session
   CLAUDE.md imports STANDARDS, PROJECTS, RTK, REPOS, OLLAMA
   ENVIRONMENT.md (15 KB) exists but is NOT imported — never loads

3. SETTINGS       ~/.claude/settings.json + .claude/ in each project
   model opus[1m], effort high, 1 hook (rtk on every Bash), statusline script
   AS FOUND: 560 permission rules across 8 projects / 11 files (the "562 / 12
   files" first written here was wrong; measured again it is 560 / 11).
   All 560 are `allow` — not one project-level `ask` or `deny`.
   NOW: 384, after phases 2a, 2b, 2c, 5.2 and 5.2b.

4. PROJECT RULES  CLAUDE.md per project — 6 of 8 projects have one
   Voice-Flow 110 KB · FinNode 16 KB · rest 2-6 KB

5. MEMORY         ~/.claude/projects/<path>/memory/
   27 memory files across 5 folders — 2 folders orphaned by path changes
```

Desktop app is separate (`~/Library/Application Support/Claude/`) and out of
scope for now.

## Scope

Projects inside `~/Documents/VS Code/` only — 8 of them. Everything else in
`~/Documents` is ignored, including `extra/Voice-Flow-main`.

| Project | Rules | Permissions | Memory | Git |
|---|---|---|---|---|
| FinNode | 238 lines | 32 | 3 | CLAUDE.md committed |
| Voice-Flow | 1446 lines | 350 | 11 | CLAUDE.md gitignored |
| Voice Flow_v1 | 83 | 55 | — | |
| vthrudebugger_v1 | 91 | 56 | 3 | |
| Packbly_web | 59 | 8 | — | |
| Emp portal | 86 (wrong folder) | 15 | — | not committed |
| Debugger v2 | none | 23 | 4 | |
| Packbly_v2 | none | — | — | |

---

## Decisions already made

| # | Decision | Made |
|---|---|---|
| D1 | Goal is to make consequential actions **visible**, not to build a lock | 2026-09-18 |
| D2 | Always ask before git push and anything that can destroy unsaved work — every project | 2026-09-18 |
| D3 | Permission prompts get four short lines: what it does · what changes · risk and why · how to undo | 2026-09-18 |
| D4 | **Never block or remove anything without explicit approval** | 2026-09-18 |
| D5 | `tccutil reset` → ask with full detail. Do not block it. | 2026-09-18 |
| D6 | Dated backup folder before the first edit, kept permanently | 2026-09-18 |
| D7 | Voice Flow rules: split into short rules + separate docs, trim what is stale | 2026-09-18 |
| D8 | ENVIRONMENT.md stays unloaded; add a pointer to it from PROJECTS.md | 2026-09-18 |
| D9 | Remove the dead and one-off permission rules, after per-rule impact check | 2026-09-18 |
| D10 | `python3 -c` / `node -e` / `awk` / `osascript` stay allowed. Accepted as arbitrary code execution; fencing them costs many daily prompts and blocks nothing real | 2026-09-18 |
| D11 | Voice Flow + Emp portal rules get committed to git, but **after** the Voice Flow split (5.1), so the repo gets the clean version | 2026-09-18 |
| D12 | rtk stays. The fault was my verification, not rtk: anything feeding a decision to delete, move or overwrite a file must be re-run through `rtk proxy` first | 2026-09-18 |
| D13 | **Supersedes D11.** Project `CLAUDE.md` files stay out of their own project repos (August preference holds). A copy lives in the private `~/.claude` repo under `project-rules/<project>/` so they still travel | 2026-09-18 |
| D14 | Read the memory files before recommending anything that touches a project | 2026-09-18 |
| D17 | Session size is managed at the **task boundary, not a number**. Past ~300k finish the current piece, then suggest a fresh session. Never clear mid-task — measured 3% saving there against 45–54% at a boundary | 2026-09-18 |
| D18 | Priority is **P1** broken/blocking/losing data · **P2** works but wrong, or blocks the next piece · **P3** everything else. Assign before dividing the work | 2026-09-18 |
| D19 | Before writing code: state what the change is for, find what depends on it, and say what it cannot affect | 2026-09-18 |
| D20 | A rule already in `STANDARDS.md` is **not** restated in different words. Four of Amit's 2026-09-18 rules were already covered; re-adding them would double the file and let two phrasings drift apart | 2026-09-18 |
| D15 | **`npx` stays out of `ask`.** Confirms the existing `ENVIRONMENT.md` exclusion against a fresh measurement: 231 of 235 calls are build/test. Only `npx --yes|-y` is fenced | 2026-09-18 |
| D21 | **B3 pipeline fragments stay.** 74 `echo`/`awk`/`grep`/`sort` rules are one-off but harmless; removing them buys tidiness and costs prompts mid-task on read-only commands | 2026-09-18 |
| D22 | A rule containing a literal `*` is **not** removed until it is known whether Claude Code's matcher globs it. 3 spent `sed` rules are held on this | 2026-09-18 |
| D23 | **A project may read its own tree silently. Another project — never, not by any rule. Other folders (Documents, `~/.claude`, temp) — by prompt, not by a standing grant.** Amit's rule, 2026-09-18: "That doesn't make any sense: to give access to other projects." Supersedes the narrow-it proposal in 5.2, which would have kept `Voice Flow_v1` — that is another project, so it goes too | 2026-09-18 |
| D24 | **Voice Flow's rule claims live in `CLAUDE.md`, the evidence in `docs/`.** This knowingly bends `docs/README.md`'s own rule 4 ("the moment two files carry the same rule, one of them starts lying"): each claim line now exists twice. Accepted because D7 asked for "short rules + separate docs" and a pointer-only `CLAUDE.md` would leave every Voice Flow session with no rules in context. Tie-breaker written into both files: if they disagree, **`CLAUDE.md` is the rule** and the document is the record of why — fix the document | 2026-09-18 |
| D25 | **A stale measurement is annotated, never overwritten.** When 5.1 part two found a figure the code had outgrown, the original sentence and its date were left standing and a dated `> **Measured again**` note was added beside it. Overwriting the number would destroy the thing the document exists for — what was true when the rule was made, and how far it has moved since. Same principle as `dont-delete-reference-docs`, applied inside a file rather than to it | 2026-09-18 |
| D16 | Every new `ask` rule is written in all three spellings — bare, `rtk `, `rtk proxy ` — because four projects blanket-allow `Bash(rtk proxy *)` | 2026-09-18 |

**D4 governs everything below.** Every removal is listed individually and waits
for a yes.

---

## Why permissions cannot be made airtight

From Claude Code's documentation:

> "A Bash rule matches the command text Claude writes... It doesn't match the
> same program invoked in a different form, so a deny or ask rule covers the
> invocation Claude usually produces and isn't a security boundary around the
> program."

Blocking `python3 -c` while `node -e` is allowed achieves nothing. Blocking both
while `bash script.sh` is allowed achieves nothing. So the aim is not to stop a
determined action — it is to make the consequential ones *visible*, and to catch
honest mistakes. Anything stronger is theatre.

## The precedence rule that makes this work

> "Rules are evaluated in order: deny, then ask, then allow. The first match in
> that order determines the outcome, and rule specificity doesn't change the
> order."

**Rule type beats file location.** A global `ask` wins over a project `allow`.
This is the key to the whole plan: a broad project rule can be made visible by
adding a global `ask`, **without removing the project rule**. Nothing breaks,
nothing is deleted, and the action starts prompting. That satisfies D4 and is
more durable than deleting, because it also covers projects that do not exist yet.

---

## PHASE 1 — Safety net and the real fix  (HIGH)

### 1.1 Back up  ·  **DONE 2026-09-18**
27 files copied to `~/.claude/backups/2026-09-18-setup/`, folder structure
preserved: 8 global `.md` + global `settings.json` + `statusline/context.py`
+ 6 project `CLAUDE.md` + 11 project settings files.
**Verified:** all 27 confirmed byte-identical to their originals with `cmp`.
**Undo:** n/a, nothing was changed.

### 1.2 Close the holes in the global ask list  ·  **DONE 2026-09-18**

> **PREREQUISITE — do this first.** `~/.claude/CLAUDE.md` carries an instruction
> in a comment: *"Read ~/.claude/ENVIRONMENT.md before changing settings.json or
> the thresholds."* `ENVIRONMENT.md` is 15 KB and holds the measurements behind
> the current permission and rtk choices. Read it before editing `settings.json`,
> and check whether anything in it already covers or contradicts the additions
> below.
Add to `permissions.ask` in `~/.claude/settings.json`. Each makes an action
visible that currently runs silently in at least one project.

| Add to ask | Why | Currently silent in |
|---|---|---|
| `Bash(tccutil *)` | Can wipe mic/camera permissions for every app on the Mac | Voice-Flow |
| `Bash(gh api *)` | Any GitHub API call, including delete | Debugger v2, Voice Flow_v1, Voice-Flow |
| `Bash(gh repo *)` | Includes `gh repo delete` | Debugger v2, Voice-Flow, vthrudebugger |
| `Bash(gh pr *)` | Opens/merges/closes pull requests | vthrudebugger |
| `Bash(gh auth *)` | Changes which GitHub account is used | 3 projects |
| `Bash(rtk gh *)` | Same via rtk | 3 projects |
| `Bash(security *)` | Reads macOS Keychain | Voice-Flow |
| `Bash(sudo *)` | Runs as administrator — no rule exists today | Voice-Flow |
| `Bash(killall *)` | Force-stops programs by name | Voice-Flow |
| `Bash(npx *)` | Downloads and runs a package (only `--yes`/`-y` covered today) | Voice-Flow |
| `Bash(rtk npx *)` | Same via rtk | Voice-Flow, vthrudebugger |
| `Bash(ollama pull *)`, `Bash(ollama rm *)`, `Bash(ollama signin *)` | Multi-GB downloads, deletions, account change | Voice-Flow |
| `Bash(gem install *)` | Installs Ruby packages | vthrudebugger |
| `Bash(git mv *)` | Renames tracked files | Voice-Flow |
| `Bash(sqlite3 *)` | Arbitrary SQL on any database file | Voice-Flow |
| `Bash(open *)` | Opens any file or app | vthrudebugger |

Not added, deliberately: `python3 -c`, `node -e`, `awk`, `osascript`. These are
how routine inspection work gets done — including the analysis that produced
this file. Fencing them costs many prompts a day and stops nothing, per the
"not a security boundary" note above. **Flagged for your call, not decided.**

**Impact:** a handful of extra prompts, only for the actions listed.
**Undo:** `git -C ~/.claude checkout settings.json`, or delete the added lines.

#### What was actually added, and how it differs from the table above

35 rules, `ask` 52 → 87. Verified: 35 insertions, **0 deletions**; `allow` (32),
`deny` (2), `hooks`, `statusLine` and every other key byte-identical.

15 commands — `tccutil` · `sudo` · `security` · `killall` · `sqlite3` · `open` ·
`git mv` · `gem install` · `ollama pull|rm|signin` · `gh api|pr|auth|repo` —
each in bare and `rtk proxy` spelling, plus `rtk ` for `git mv` and the four `gh`
forms.

Three deliberate departures from the table above, all found by the
`ENVIRONMENT.md` prerequisite:

1. **`npx *` and `rtk npx *` were NOT added.** Of 235 `npx` calls in history, 231
   are `vitest` (165), `tsc` (55), `vite` (7) and `asar` (4) — routine build and
   test. Only 4 are `--yes`, which `ask` already catches. The rule would have
   added ~231 prompts and caught nothing new. `ENVIRONMENT.md` had already
   excluded these deliberately; the 1.2 table had silently reversed that.
2. **`gh auth *` and `gh repo *` were kept broad**, knowing they override the
   existing `Bash(gh auth status*)` and `Bash(gh repo view*)` allow rules. Cost
   is 7 prompts across 56 sessions. The alternative — 11 narrow subcommand rules
   — costs the same to avoid and `ENVIRONMENT.md` warns argument-constrained
   patterns are fragile. **Those two allow rules are now dead letters.** Left in
   place, not removed; removing them is a Phase 2 decision.
3. **`rtk proxy` spellings were added**, which the table omitted. Confirmed by
   `find`: four project files carry blanket `Bash(rtk proxy *)` —
   `vthrudebugger_v1`, `Voice-Flow`, `Voice Flow_v1`, `Debugger v2`. Without the
   third spelling, `rtk proxy sudo …` would still run silently in those four.

**Measured cost:** replaying 5,734 historical Bash calls across 56 sessions,
**+26 prompts total = +0.46 per session**. 25 of the 35 rules never fire against
history at all — they are pure fences. The only real `tccutil` call ever made was
`tccutil reset All …` against the Claude install directory, which is exactly the
case D5 wanted visible.

### 1.3 Add two global entries rtk needs  ·  **DONE 2026-09-18**
- `Read(//Users/amitjangra/Library/Application Support/rtk/tee/**)` — rtk writes
  overflow output there and refers to it. Currently granted in Voice-Flow only,
  while the rtk hook runs in every project. This is why output went missing
  during the survey.
- `Bash(rtk gain*)`, `Bash(rtk discover*)`, `Bash(rtk --version)` — already
  partly present; confirm all three.

**Undo:** `git -C ~/.claude checkout settings.json`, or delete the three lines.

#### What was added, and the root cause it fixes

3 rules, `allow` 32 → 35. Verified: 3 insertions, **0 deletions**; `ask` (87),
`deny` (2) and every non-permission key byte-identical.

```
Bash(rtk --version)
Bash(rtk discover*)
Read(//Users/amitjangra/Library/Application Support/rtk/tee/**)
```

`Bash(rtk gain*)` was already present, so only two of the three Bash entries
were actually missing.

**Root cause of the missing output, now confirmed.** `permissions` sets
`blockReadsOutsideWorkingDirectories: true`. rtk's tee directory sits outside
every project, so reading it was blocked in **every** project except Voice-Flow,
which was the only file granting the path. The rtk hook itself is global — it is
`hooks.PreToolUse` → `rtk hook claude` in this same file, and applies to every
project automatically. So the hook wrote overflow logs everywhere and could read
them back in exactly one place.

**Verified, not assumed:** the directory exists with 20 log files, mode 700; the
newest were written by rtk during the session that made this change; and a real
file path was matched against the rule prefix. `find` confirmed Voice-Flow's
`settings.json` was the only project file granting it.

**Note the two leading slashes** in the `Read(...)` rule. A single slash anchors
at `~/.claude/`, not at the filesystem root — see the deny-rule note in
`ENVIRONMENT.md`. The spelling here is copied from Voice-Flow's working rule.

**Portability caveat for an account or machine switch:** this rule hardcodes
`/Users/amitjangra`. There is no home-relative spelling for an absolute path in
a permission rule, so on a different machine or username this one line must be
edited by hand after cloning. The rtk **binary** does not travel in this repo
either — it is at `~/.local/bin/rtk` (0.48.0); install rtk first, then clone.

---

## PHASE 2 — Permission cleanup  (HIGH, needs line-by-line approval)

### Measured 2026-09-18 — supersedes the estimates below

**Written before phase 2 ran. 2a, 2b and 2c have since been applied — see the
status table. Kept because the reasoning is what makes the result reviewable.**

The single most important fact: **all 560 project rules are `allow`. Zero `ask`,
zero `deny`.** Removing any of them can only ever *add* a prompt — it cannot
remove a protection or unblock anything. That is what makes 2a and 2b safe.

| Group | Measured | Action | Behaviour change |
|---|---|---|---|
| A — Dead | **53** | Remove (2a) | **None, provably.** The path each names is gone; it can never match again |
| C — Redundant | **93** | Remove (2b) | **None today.** A global `ask` rule already overrides it |
| A ∩ C | 4 | — | counted once |
| **Union proposed** | **144** | | 560 → 416 rules (measured after the fact) |
| Exact duplicates | 7 | Remove (2b) | Same 7 rules listed twice in Voice-Flow `settings.json` |
| Dormant — **excluded** | 1 | **Keep** | `release/mac-arm64/Voice Flow.app` is build output: gone now, returns on the next build |
| B — One-off leftovers | **97** | 23 removed (2c), 74 held | B1 dead operand 14 ✅ · B2 spent edit 9 ✅ · B3 pipeline fragment 74 **kept**. Old estimate of 53 was a pattern guess |
| D — Broad and silent | 40 | **Keep.** Fenced by 1.2 | |

**Why 144 and not the 112 estimated:** group C grew from 18 to 93 when 1.2
expanded the global `ask` list from 52 to 87. Every project `allow` rule that a
new `ask` rule covers became a dead letter. Four were live until 1.2 landed
(`security`, `sqlite3`, `open`, `gh`) — a consequence of an approved change, not
a pre-existing condition.

**Evidence for group A:** 6 distinct session scratchpad directories referenced,
**0 still exist**. Plus 10 literal paths tested individually and confirmed gone:
`~/vthrudebugger_v1`, `~/Debugger/vthrudebugger_v1`, `~/vthru-debugger-demo`,
`Voice_Flow_v2.1`, four `/tmp/vf_*.cjs` scripts, a rotated rtk tee log, and a
SecondBrain subfolder.

**Nine rules that looked dead are live and stay:** the Android SDK symlink,
`com.apple.TCC/TCC.db` ×3, the Whisper model ×2, and Voice-Flow's own
`git -C` commands ×2.

> **Warning for whoever runs this.** Two classifier passes wrongly flagged those
> nine. Both bugs were the same: a regex that split paths at spaces, turning
> `/Users/amitjangra/Documents/VS Code/…` into `/Users/amitjangra/Documents/VS`
> and calling it missing. **Do not classify by parsing paths out of rule text.**
> The only unambiguous signal is the session-scratchpad UUID pattern, which
> contains no spaces. Everything else was confirmed by testing the literal path.

**The list to approve:** `PHASE2-REMOVALS.md` in this directory — 144 rows, each
with project, file, group and reason. It is committed, so it survives a restart.

### Still to check before Phase 2 runs
- [x] Group A re-derived by measurement, not pattern guess — 53, evidence above.
- [x] Group C recomputed against the **current** 87-rule global ask list — 93.
- [x] **Amit's approval of the 144.** Given 2026-09-18 ("approve the 142 removals" — the list held 144).
- [x] Re-count B by hand. **97**, not 53, read rule by rule against the 416 survivors.
- [x] Confirm no group-B rule is load-bearing for a build or test script. Every operand tested; `scripts/audit.sh`, `create-signing-cert.sh`, `reset-permissions.js`, `uninstall-app.js`, `electron/main.js` are live and **kept**.
- [x] Confirm each file stays valid JSON after editing. All 11 re-parsed clean.
- [x] Back up the project settings files before the first edit (D6). There are **11**, not 12; copied to `backups/2026-09-18-phase2/`, verified with `cmp`.

### Non-Bash permissions — surveyed, no action proposed yet

The 560 count is Bash rules. These are the rest, and they were not examined
until late in the survey.

| Project | Grant | Note |
|---|---|---|
| Voice-Flow | `Read(//Users/amitjangra/Documents/VS Code/**)` | Reads **every** project, incl. Packbly and Emp portal — 5.2 |
| Voice-Flow | `Read(//private/tmp/**)`, `Read(//tmp/**)` | Whole temp directories |
| Voice-Flow | `Read(//Applications/Voice Flow.app/**)` ×3 | The installed app bundle |
| Voice-Flow | `Read(//Users/amitjangra/.continue/**)`, `.claude/**`, SecondBrain ×3 | Other tools' config and the Obsidian vault |
| Voice-Flow | `Read(.../rtk/tee/**)` | rtk's overflow logs — **should be global**, see 1.3 |
| Voice-Flow | `Skill(claude-api)`, `Skill(claude-api:*)` | Pre-approves that skill |
| Voice-Flow | 5 × `additionalDirectories`: the project, `.continue`, `.local/bin`, `.claude`, `/private/tmp` | Widens the working directory |
| FinNode | `Read(//Users/amitjangra/.claude/**)` + `additionalDirectories: ~/.claude` | Can read global config |
| FinNode | `Edit(docs/**)`, `Write(docs/**)`, `Edit(CLAUDE.md)` | Write access, scoped |
| FinNode | `WebFetch(github.com)`, `WebFetch(kotl.in)` | |
| Voice Flow_v1 | `Read(//private/tmp/**)`, `Read(//tmp/**)`, `Read(~/.npm/_npx/**)` | |
| Voice-Flow `.local` | `WebSearch` + 7 `WebFetch` domains (github, morphllm, promptquorum, ollama ×2, continue) | Accumulated, harmless |
| Voice Flow_v1 `.local` | `WebSearch` + 8 `WebFetch` domains (wisprflow ×4, wikipedia, substack, alternativeto, github) | Research leftovers from competitor work |

Nothing here is urgent. 5.2 is the only one worth changing, and the rtk read
grant is worth promoting to global (1.3).

---

## PHASE 3 — The deliberate set  ·  **DONE 2026-09-20**

**Scope rewritten before starting, as the status table instructed.** The
original scope said "write three lists into `~/.claude/settings.json`". Step 1.2
already did that — `ask` went 52 → 87 and the rules are in place. What was
missing was the *plain-English* version: the rules as named groups with a reason
each, so the set can be read back and argued with instead of re-derived from 87
globs. That is what this phase delivers. **It changed no permission rule.**

Verified against `settings.json` on 2026-09-20: **allow 35 · ask 87 · deny 2**.
Every rule falls into one of the groups below; nothing is left over.

### Never — `deny`, 2 rules

`Read(//**/.env)` and `Read(//**/.env.*)` — credentials. The only outright block
in the setup, and the only one no `allow` anywhere can override, because deny is
evaluated first.

Narrower than it sounds: it stops *reading* a `.env`, not a program that loads
one, and it does not cover a database holding real records. That is why D23
removed cross-project read access instead of leaning on `deny`.

### Always ask — `ask`, 87 rules in 11 groups

The count looks large because most commands appear up to three times: bare
(`sudo *`), rtk-wrapped (`rtk git push *`) and proxied (`rtk proxy sudo *`). The
`rtk hook claude` PreToolUse hook rewrites Bash commands, so a rule covering
only the bare spelling can be walked around by the rewritten one. **36 distinct
commands, 87 spellings.**

| n | Group | Why it asks |
|---|---|---|
| 24 | Git history / tree rewrite — `checkout` `clean` `merge` `mv` `push` `rebase` `reset` `rm` | Each can destroy uncommitted work or rewrite shared history. `push` also leaves the machine. |
| 21 | Package installs — `npm`/`pnpm`/`yarn` add+install, `npx -y`, `gem install` | Runs arbitrary third-party code as me, and edits the lockfile. |
| 12 | GitHub — the account, not the repo: `gh api` `gh auth` `gh pr` `gh repo` | Acts as my GitHub identity and is visible to other people. |
| 6 | Process termination — `kill` `killall` `pkill` | Kills work that is not mine to kill; a loose pattern takes the editor with it. |
| 6 | Ollama models — `pull` `rm` `signin` | A pull is a multi-GB download, `rm` deletes a model, `signin` is an account action. |
| 5 | Network fetch — `curl` `wget` | Reaches the network and can write a file to disk. |
| 4 | macOS privacy + Keychain — `security` `tccutil` | `security` reads stored credentials; `tccutil` revokes app permissions that must then be re-granted by hand. |
| 3 | Deletion — `rm` | The obvious one. |
| 2 | Administrator — `sudo` | Anything at all, outside the project, without the usual limits. |
| 2 | Local database — `sqlite3` | Two projects hold real records (Emp Portal, Packbly). A write is silent and not reversible. |
| 2 | Launching apps / files — `open` | Hands a file to whatever app claims the type, outside Claude's control. |

### Always fine — `allow`, 35 rules in 6 groups

Everything here is read-only, or reversible and confined to this setup.

| n | Group | Why it is fine |
|---|---|---|
| 14 | Read-only shell — `ls` `read` `cat` `find` `grep` `wc` `du` `df` `ps` `tree` `xxd` | Observation only; none of them writes. |
| 8 | Web — 7 pinned domains + `WebSearch` | Named domains only: github.com, api.github.com, raw.githubusercontent.com, docs.claude.com, code.claude.com, developer.android.com, npmjs.com. Reading, not posting. |
| 6 | Git, read-only — `branch` `diff` `log` `rev-parse` `show` `status` | Reports state rather than changing it — **except `branch`, see gap 4.** |
| 3 | GitHub, read-only — `gh auth status` `gh repo view` `gh run list` | Reads only; every writing `gh` verb is in `ask`. |
| 3 | rtk meta — `--version` `gain` `discover` | Reports rtk's own analytics. |
| 1 | rtk tee output — `Read(.../rtk/tee/**)` | rtk's own captured output, needed to re-read a filtered result. |

Also on: `blockReadsOutsideWorkingDirectories: true`.

### Why this holds

Rules are evaluated **deny → ask → allow**, and rule *type* beats file
*location*. A project-level `allow` therefore cannot cancel a global `ask` —
clicking "allow, don't ask again" inside a project still hits the global ask.
That is the entire point of the set, and it is the thing I had backwards in the
first session; see "What I got wrong".

### Gaps found while writing this down — none closed

Writing the lists out is what surfaced these. Per D4 nothing was changed.

1. **`pnpm add`** — no rtk spelling at all. rtk wraps `pnpm`, so `rtk pnpm add x`
   is reachable and matches no `ask` rule. `rtk proxy pnpm install` exists,
   `rtk proxy pnpm add` does not.
2. **`yarn add`** — `rtk proxy yarn add *` missing, while `rtk proxy yarn install *` is present.
3. **`npm i`** — the bare short form asks, but neither `rtk npm i *` nor
   `rtk proxy npm i *` exists, and rtk wraps `npm`.
4. **`rtk git branch *` is in `allow`, but `-D` deletes.** Established by
   *reading* the rule: the glob covers every flag, and `-D` force-deletes a
   branch, so a deleting command sits inside the "always fine" list. Confirmed
   separately that rtk passes the flag through to git rather than filtering it
   (throwaway repo, 2026-09-20 — the branch was removed).

   **What was NOT established, and what I first claimed wrongly:** that it runs
   *unprompted*. The session used for that test does not enforce the `ask` list
   at all — the same command line contained `rm -rf`, which matches the existing
   `Bash(rm *)` ask rule, and that ran silently too. So "no prompt appeared"
   distinguished nothing. The defect is real and visible in the rule list; the
   runtime proof is still outstanding and needs a session that enforces `ask`.
   This is the only one of the four that sits in the *always fine* list, so it
   is still the one worth fixing first — the other three are missing spellings
   of a rule that already asks.

1–3 are installs, which the table says always ask; closing them is 3 additions
and removes nothing. 4 wants either an `ask` on the destructive flags or a
narrowing of the allow rule — a narrowing is a removal, so it needs approval
either way.

The other 15 asymmetries in the rtk coverage table are **not** gaps: rtk does
not wrap `sudo`, `tccutil`, `security`, `kill`, `killall`, `pkill`, `open`,
`rm`, `sqlite3`, `gem`, `ollama` or `yarn`, so the missing `rtk <cmd>` spelling
is unreachable and `rtk proxy` alone covers it. Verified against `rtk --help`,
rtk 0.48.0.

**Undo:** `backups/2026-09-20-phase3/`.

---

## PHASE 4 — Make the prompts readable  ·  **DONE 2026-09-20**

All three changes landed in `STANDARDS.md`, in the "Explaining a permission
request" section. The four lines — what it does · what changes · risk and why ·
undo — are unchanged and still the core of it.

**1. Stated as a hard rule.** The opening now reads "This is a hard rule, not a
preference", and names the failure explicitly: a prompt that arrives unexplained
is a failure *even if it is approved*. Previously it read as guidance and, per
D5, was not reliably happening.

**2. A fifth line — "Why now" — whenever the command is on the global `ask`
list.** What was asked for that needs this, in Amit's terms, not the command
restated. The example contrasts "You asked to see the test failures and the
runner isn't installed" against "installing dependencies". The reasoning is
written into the section itself: those commands ask because they were judged
consequential *in advance*, so the prompt is the last point where that judgement
meets what is actually happening, and it has to carry the reason.

**3. `tccutil reset` has its own subsection.** "Resets permissions" is banned
outright. It must name the **service** and the **app**, say what stops working
until re-granted, and — when the command carries no bundle id — say that it hits
**every app on the machine**. It also records that the fix is by hand in System
Settings → Privacy & Security, per app, and that some apps must be quit and
reopened before they ask again. Worked example uses Voice Flow's Accessibility
permission and auto-paste.

**Cost:** `STANDARDS.md` 1164 → 1438 words, about +360 tokens per turn, on top
of 7b's +626. It loads in every session in every project.

**Verified:** all 10 preceding sections byte-identical — the diff touches only
line 113 onward (3 lines removed, 31 added), and the section list is unchanged
apart from the new `tccutil` subsection.

**Undo:** `cp backups/2026-09-20-phase3/STANDARDS.md STANDARDS.md`.

---

## PHASE 5 — Structure  (MEDIUM / LOW)

| # | Item | Priority | Notes |
|---|---|---|---|
| 5.1 | Voice Flow 110 KB rules → short `CLAUDE.md` + `docs/` | **DONE** 2026-09-18 | Split in two on purpose: the relocation is verifiable in minutes, the staleness pass needs file-by-file evidence and is where a session gets expensive. **Part one, done:** `Working rules` (lines 161-646, 42 bullets) → `docs/working-rules.md`, `Known pitfalls` (759-1446, 47 bullets) → `docs/known-pitfalls.md`, both moved **verbatim**; `CLAUDE.md` keeps the section order, `Stack`/`Architecture map`/`Commands` untouched, and each rule's one-line claim with a pointer. 110 KB → 29 KB, a 73% cut. Two rows added to `docs/README.md` per its own rule 2. **Verified:** each doc body compares *equal* to the corresponding line range of the backup, all 89 claims found in their doc, and `git status` showed exactly the 3 expected changes. Restore point: `backups/2026-09-18-phase5.1/`. **Part two, done 2026-09-18:** all 89 read against the code. Every cited file path, identifier, constant, dependency version and electron-builder setting resolved; `npm test` (76 files, 1764 tests) and `npm run typecheck` green; `npm run doctor:polish`, `-- --plans` and `npm run doctor:vault` re-run; `structurePlan` + `looksLikeBenchmarkScript` replayed over all 172 history entries. **Nothing is superseded** — every entry whose symbol is absent from the code is an entry documenting its own deletion. **7 carry a dated `> **Measured again 18 Sep 2026**` note** because the dictation history grew 118 → 172 and two line counts moved; the rules themselves held, including the load-bearing one (`all 64 sections-shaped dictations are still benchmark-script repeats`, re-verified at the larger N). Per `dont-delete-reference-docs` nothing was deleted — the original wording stands and the note sits beside it. Verified by diffing against the backup: the only changes are the two headers and 7 inserted blockquotes, **0 original lines removed**, and all 89 `CLAUDE.md` claims still resolve. |
| 5.2 | Voice Flow `Read(//Documents/VS Code/**)` | **DONE** 2026-09-18 | **Removed, not narrowed** — D23. It reached `Emp portal/.../server/data/vthru.db` (employee records) and Packbly (customer records), and the global `deny` is only `.env`, so nothing covered the database. Voice Flow's rules and docs reference no other project except one line about `Voice Flow_v1`, which goes too under D23. Verified: **no cross-project grant survives anywhere in the setup.** The 5 `additionalDirectories` are a separate item — none point at another project. |
| 5.2b | Standing grants over other folders | **DONE** 2026-09-18 | D23's second half. 12 entries removed across Voice-Flow and FinNode: SecondBrain vault ×2, `.continue`, rtk tee (redundant — the global rule is `settings.json:30`, verified), 3 duplicate `Voice Flow.app` spellings subsumed by `Voice Flow.app/**`, and the `additionalDirectories` for `.continue`, `.local/bin` and `~/.claude` (both projects). **Voice-Flow now reaches only** `/private/tmp`, `/tmp`, `/Applications/Voice Flow.app` and its own tree; **FinNode only its own tree.** Kept `/private/tmp` — the session scratchpad is needed every turn. |
| 5.3 | Emp portal `.claude/CLAUDE.md` → `CLAUDE.md` | **DONE** 2026-09-20 | Moved to the project root, content byte-identical (`cmp`). `project-rules/manifest.tsv` hardcoded the old path, so it was updated in the same step — that was the whole blast radius. **Proved the drift check is live rather than assuming it:** pointed the manifest back at the old path and `sync.sh` reported `MISSING SOURCE` and exit 1; restored, and it reports 7 current / 0 drifted / 0 missing. Emp portal's `.claude/` still holds `settings.json`, `settings.local.json` and `launch.json`, which stay where they are. |
| 5.4 | Add pointer to ENVIRONMENT.md from PROJECTS.md | **ALREADY DONE** — no action 2026-09-20 | D8 is satisfied and was before this phase started. `PROJECTS.md` references `ENVIRONMENT.md` twice: line 7 ("Branch state, duplicate trees and the open questions are in `ENVIRONMENT.md`") and in the closing "Not projects" line. The row was stale, not the file. |
| 5.5 | Update PROJECTS.md — folders opened that it does not list | **DONE** 2026-09-20 | The row's framing was wrong, so the work changed. Of the **17** paths in `~/.claude.json`, **10 no longer exist** — old Voice Flow trees, `Packbly_Admin`, `claudetr`, a `Downloads` copy of Emp Portal — so listing them would document history, not projects. They are named in `PROJECTS.md` as deliberately excluded. Of the 7 that do exist, 5 were already listed and 2 are `~` and `~/Documents` themselves, now recorded as working directories rather than projects. **Three actual errors found and fixed:** Emp Portal was filed under "No `CLAUDE.md` yet" when it has had one since 6 Aug; `~/Documents/Voice-Flow-main` was listed under "Not projects" and is gone; the verification date said 2026-09-15. |
| 5.6 | Merge 2 orphaned memory folders | **ALREADY DONE by 7a** — no action 2026-09-20 | Verified rather than assumed: all **5** folders under `projects/` map to a directory that exists on disk, and the two the row names (`-Users-amitjangra-Debugger-vthrudebugger-v1`, `Voice-Flow-Pro`) are gone. **18 memories, none stranded** — corrected 2026-09-20 from "23", which wrongly counted the five `MEMORY.md` index files as memories. Counted with `MEMORY.md` excluded: Voice-Flow 10, Debugger v2 3, FinNode 2, vthrudebugger_v1 2, Documents 1. |
| 5.7 | Commit Voice Flow + Emp portal rules to git? | **RESOLVED — the question was backwards** 2026-09-20 | Read the `claude-md-not-in-git` memory before recommending this time. It is a standing preference stated "from now onwards" on 2026-08-11: keep `CLAUDE.md` untracked and gitignored, applied **proactively at repo setup rather than on request**. So committing them was never the open question — compliance was. **Both project repos are private** (checked via the API) and **neither file contains a secret**: the credential-shaped grep hits are all prose *describing* auth design that already lives in the same repo's source. **Voice-Flow: already compliant** — `c1e9459 Untrack CLAUDE.md and add it to .gitignore`. **Emp portal: was not, and it was a live risk** — the file was untracked *and* unignored, so `git add -A` on the current feature branch would have committed it. Fixed by adding `CLAUDE.md` to its `.gitignore` with the same comment Voice-Flow uses; the file itself is untouched and `sync.sh` still reports 7 current. Never committed there, so its history is clean. **Cost accepted, unchanged:** a cloud session cloning either repo still gets no project rules; `project-rules/` here is what carries them. |
| 5.8 | Two cloud plugins fail to connect | **HALF RESOLVED** 2026-09-20 | Both live under `plugins/synced/`, which is **gitignored and cloud-synced**, so a local edit is overwritten on the next sync. **`browser-use`:** ran `uvx --python 3.12 browser-use@latest --cli-mcp` with no `uv` or `uvx` on PATH. **`uv` 0.12.17 installed via Homebrew 2026-09-20 at Amit's instruction**, after I recommended against it — `uv` and `uvx` both resolve to `/opt/homebrew/bin`. **Not yet proven to fix the plugin:** connections are attempted at session start, and the first run must still download CPython 3.12 (not installed locally, `uv python list` shows it as download-available) plus `browser-use@latest`, which is re-fetched from the network on every start. **`definite`:** points at `https://api.definite.app/v3/mcp/http`; checked directly — DNS resolves, the host answers **200 at `/`**, the configured path returns **404**. Stale shipped URL, vendor- or cloud-side, not fixable here. Undo for the install: `brew uninstall uv`. |

---

## Explicitly not doing

- **Adding another tool.** Nothing here needs one. A sixth system to maintain
  would make this worse, not better.
- **Touching the cloud skills and plugins.** They are account-side; edits here
  get overwritten. A tour of what they are is worth doing — that is reading,
  not fixing.
- **Reaching an "expert" setup.** Fix what exists, improve it gradually.

## Open questions

All three original open questions are now answered — see D10, D11, D12.

Nothing is currently open. New questions get added here as they come up, with
the decision recorded in the table above once made.

---

## Rebuilding on another account

### The short answer

**Same Mac, different email: you lose very little.** Almost everything is files
on disk, and files do not care which account is logged in.

| What | Survives account switch? | Why |
|---|---|---|
| All 6 global `.md` rules files | **Yes** | Plain files in `~/.claude/` |
| `settings.json` — model, effort, hook, permissions | **Yes** | Plain file |
| All 8 projects' `CLAUDE.md` and `.claude/settings.json` | **Yes** | Plain files in the project |
| The 27 memory files | **Yes** | Plain files under `~/.claude/projects/` |
| rtk, ollama-do, statusline script | **Yes** | Installed in `~/.local/bin` and `~/.claude/statusline/` |
| The 18 cloud skills | **No** | See below |
| The 13 cloud plugins | **No** | See below |
| 4 MCP connectors (ClickUp, Figma, Sentry, Claude Docs) | **No** | Authorised per account |
| Artifacts and Claude Docs you have made | **No** | Live in the account |

### Why the cloud skills and plugins do not survive — verified

They are stored in folders **named after the account**:

```
~/.claude/skills/synced/<organizationUuid>_<accountUuid>/
~/.claude/plugins/synced/<organizationUuid>_<accountUuid>/

current: 26df45ac-a0b9-4c23-a8bd-b39351292679_30b66a9c-25e5-4e24-bdfe-8ebf23b886cb
                    ^ organization (v-thru.com)      ^ account (amit@v-thru.com)
```

Account B has a different `accountUuid`, so Claude Code creates a new empty
folder and syncs whatever **B's** account has. A's folder stays behind doing
nothing. If B is in the same organisation the org half matches, but the account
half still differs — so the folder is still new.

**This cannot be fixed by copying the folder.** Renaming A's folder to B's UUID
would be overwritten on the next sync. The skills and plugins have to be
present on account B's claude.ai side. That is a web-side action, not a file.

### The switch checklist

Run in this order. Steps 1-3 need no work if the git repo from Phase 6 exists.

1. **Before logging out** — `git -C ~/.claude add -A && git commit && git push`.
   This is the only step that cannot be done afterwards. The remote exists
   (6.2 DONE), so this now works.
2. `/logout`, then `/login` with account B.
3. **Verify the files are untouched** — `/status`, then check `~/.claude/CLAUDE.md`
   still loads and one project's `CLAUDE.md` is still read. Nothing should have
   moved.
4. **Re-enable the marketplace plugin**: `/plugin install swift-lsp@claude-plugins-official`.
   `settings.json` already lists it under `enabledPlugins`, but the plugin files
   install per account.
5. **Re-authorise the 4 MCP connectors** on claude.ai for account B: ClickUp,
   Figma, Sentry, Claude Docs.
6. **Check which cloud skills and plugins arrived.** Compare against the list in
   the "Five systems" section above. Anything missing has to be added on
   claude.ai for account B — it cannot be copied across.
7. **Delete the stranded folders** once B is working:
   `~/.claude/skills/synced/<A's uuid>/` and the same under `plugins/`. Only
   after confirming B is healthy, and only with approval (D4).

### What to do on a *different* machine

Steps above, plus: install Claude Code, clone the dotfiles repo into `~/.claude`,
install rtk (`~/.local/bin/rtk`, v0.48.0), install `ollama-do` and Ollama, and
re-clone the 8 projects. The projects carry their own `CLAUDE.md` and
`.claude/settings.json` in their own repos — except two, see 5.7.

---

## PHASE 6 — Put it in git  (HIGH — do before any account switch)

**Suggested reorder, not yet approved:** run `git init` and the `.gitignore`
*before* Phase 1.2 rather than here. Every phase then becomes its own commit,
giving a restore point per step instead of the single snapshot from 1.1. Same
work, better safety net. D6 (dated backup folder) stays either way — it is
already done.

A private git repo for `~/.claude`. No third-party tool: git and a `.gitignore`
are enough. This is also the standard approach for the same problem — see
"Tools considered" below.

### Commit — roughly 60 KB total

```
CLAUDE.md  STANDARDS.md  RTK.md  REPOS.md  PROJECTS.md  OLLAMA.md
ENVIRONMENT.md  SETUP-PLAN.md
settings.json
statusline/context.py
projects/*/memory/**          <- the 27 memory files ONLY
README.md                     <- new: how to rebuild, points at this file
```

### Never commit — and why each one matters

| Excluded | Size | Why |
|---|---|---|
| `.claude.json` | 92 KB | Account UUIDs, machine ID, every folder you have opened, all cached state |
| `history.jsonl` | 348 KB | **Every prompt you have typed, plus pasted content** |
| `projects/**/*.jsonl` | ~158 MB | 61 full session transcripts — entire conversations |
| `backups/` | 460 KB | Copies of `.claude.json` |
| `plugins/`, `skills/synced/` | 24 MB | Account-keyed; regenerate on login. Committing them would carry A's UUID into B |
| `file-history/`, `paste-cache/` | 6 MB | Snapshots of your files and clipboard |
| `shell-snapshots/`, `session-env/`, `sessions/`, `cache/`, `tmp/`, `jobs/`, `tasks/`, `ide/`, `downloads/`, `feedback/`, `daemon*` | — | Machine state, no value elsewhere |
| `*.bak`, `policy-limits.json*`, `remote-settings.json`, `mcp-needs-auth-cache.json` | — | Stale or account-side |

**Checked:** no `.credentials.json` and no `buddy-tokens.json` in `~/.claude` —
your login lives in the macOS Keychain, so the repo cannot leak it. That is
worth re-checking before the first push, because the file appears if the
Keychain is ever unavailable.

### 6.1 Local repo  ·  **DONE 2026-09-18**
`git init`, deny-by-default `.gitignore` written first, 3 commits, tree clean,
40 files, 90 KB. Verified: no `.claude.json`, no `history.jsonl`, no session
transcripts, no credentials staged — 14 danger patterns checked, all clean.

### 6.2 Remote  ·  **DONE 2026-09-18**

```
repo       AmitJangra25/claude-setup
visibility PRIVATE  (confirmed via gh repo view before pushing)
branch     main, tracking origin/main
commits    4
files      40, verified identical to local git ls-files
```

Approved explicitly before running, as an outward-facing action. `gh` was
authenticated as `AmitJangra25` with `repo` scope.

**For any future push, check three things:**

1. **The repo is private.** This folder holds your rules, your working
   preferences and 27 memory files about your projects and how you work. Not
   secret, but not public either.
2. **`git status` shows nothing unexpected.** The `.gitignore` is
   deny-by-default, so it should hold — but verify rather than trust, because a
   push cannot be undone once GitHub has it. Content sent to GitHub may be
   cached or indexed even if the repo is deleted afterwards.
3. **Which GitHub account.** See the identity note below.

### Git identity is your personal Gmail, not your work address

```
user.name  : AmitJangra25
user.email : amitjangra044@gmail.com
```

Your Claude account is `amit@v-thru.com`. The two commits so far are authored by
the Gmail address, because that is the global git config on this Mac. Left as
found — changing it was not asked for. Worth a decision before adding a remote,
since it determines which GitHub account owns the repo and whose name is on
every commit.

### 6.3 Project rules into this repo  ·  **DONE 2026-09-18**
Per D13, all **7** project `CLAUDE.md` files are copied to
`project-rules/<project>/CLAUDE.md`. Seven, not the six `PROJECTS.md` implies —
the SecondBrain vault schema has one too. Voice Flow's copy is the 29 KB cleaned
version from 5.1 part one, which is why this waited.

**The sync step:** `project-rules/sync.sh` reports which copies have drifted from
their live files and exits non-zero if any have; `--pull` copies the live files
over. `manifest.tsv` maps each copy to its source path, so a project that moves
is one edited line and says `MISSING SOURCE` until it is fixed. Report mode
changes nothing.

**Verified:** all 7 copies byte-identical to their sources by `cmp` run
independently of the script; drift detection proven by breaking one copy on
purpose and watching *only* that project report `DRIFTED`, exit 1; `git status
--porcelain -uall` lists exactly the 10 intended files and `git ls-files
--others --ignored` shows nothing in `project-rules/` being silently dropped.

**Before adding an eighth:** all 7 were read in full first, because this repo is
pushed. They carry architecture, conventions and pitfalls — env var *names* but
no values, and no customer, employee or account record, including from the two
projects whose databases hold real ones. A regex scan is not a substitute for
reading the file.

### 6.4 Optional  ·  NOT DONE
A shell function to pull on open and push on close. Out of scope until Phases
1-2 are done.

### Project rules are separate — `settings.json` only, since 6.3
Each project's `.claude/settings.json` belongs in that project's own repo, not
in this one. **`CLAUDE.md` no longer does:** D13 supersedes the original line
here, and since 6.3 a copy of every project's rules lives in `project-rules/`.
The concern this paragraph was written about — that on a new machine or account
those projects start with no rules — is what 6.3 answers for `CLAUDE.md`. It is
still true of `settings.json` — **it was, until 2026-09-20.** They are mirrored
here now too, for the same reason `CLAUDE.md` is: gitignored in the project means
no version history anywhere else.

**Skills are a third category, decided 2026-09-20.** A project's
`.claude/skills/` travels in **that project's own repo**, not here and not in
`project-rules/`. The reason `CLAUDE.md` needs a mirror is that it is
gitignored in every project; skills are not, so they already have version
history and a remote where they live. Voice-Flow's three are on
`AmitJangra25/Voice-Flow` as of `d106eda`, verified present in `origin/main`.
**Do not add them to `manifest.tsv`** — a second copy of a file that is already
tracked is the drift `sync.sh` exists to prevent.

So the three project-level things now sit in three different places, and the
split is deliberate rather than accidental:

| | Lives in | Why |
|---|---|---|
| `CLAUDE.md` | this repo, `project-rules/` | gitignored in the project (`claude-md-not-in-git`), so this is its only history |
| `.claude/skills/` | the project's own repo | not ignored; travels with the code it describes |
| `.claude/settings*.json` | this repo, `project-rules/<name>/.claude/` | gitignored in the project, so this is their only history. **Added 2026-09-20**, reversing the earlier leave-as-is: until then **330 permission rules existed in no repo at all**, and the decision had been taken before anyone counted them |

`manifest.tsv` changed shape in the same step. Its second column was the path to a
project's `CLAUDE.md`; it is now the **project root**, and `sync.sh` derives all
three tracked files from it. Same format, same tab-separated line per project — but
a project can now be mirrored when it has permissions and no rules file yet, which
is how **Debugger v2** and its 17 rules got covered. The `CLAUDE.md` half was
proved to behave identically before the change was trusted: same 6 current, same
one drift, same exit code.

**Still outside it:** the 2 rules in `~/Documents/.claude/`, and the 68 inside
`node_modules` — the first because it is not a project, the second because they
return on every `npm install`.

---

## Tools considered, and the decision

Asked for explicitly. Honest assessment.

| Tool | Licence | Verdict |
|---|---|---|
| **rtk** (in use) | — | Keep for now. It saves tokens. It also corrupted a file path and hid output twice during this survey, so open question 3 stands. |
| **claude-mem** (`thedotmack/claude-mem`) | Apache 2.0, not MIT | **No.** Claude Code already has a native memory system and you are using it — 27 files across 5 folders. claude-mem would be a second, parallel memory system, and it wants its own model provider key. Two memory systems is worse than one imperfect one. |
| **claude-memory-skill** (`hanfang/claude-memory-skill`) | MIT | No, same reason. It is a lighter version of something you already have. |
| **claude-code-dotfiles** (`Povaz/claude-code-dotfiles`) | — | **Read it, do not install it.** It solves exactly this problem — "across machines and subscriptions" — with symlinks and git. Worth reading for its `.gitignore`. But Phase 6 is about 15 lines of git; a dependency is not warranted. |
| **`import-memory`** (built-in skill) | — | Not applicable. It imports memories from ChatGPT or Gemini into claude.ai's web memory. Not account-to-account, not Claude Code. |

**The principle:** every tool added is a system that has to be understood,
updated and debugged. You have five already and only one was deliberate. The
answer to "how do I make this portable" is a git repo, and that is not a tool.

Sources: [claude-mem](https://github.com/thedotmack/claude-mem) ·
[claude-memory-skill](https://github.com/hanfang/claude-memory-skill) ·
[claude-code-dotfiles](https://github.com/Povaz/claude-code-dotfiles)

---

## PHASE 7 — Fix where the working preferences live  (HIGH)

Found while reading the 27 memory files, 2026-09-18. This is a root-cause fix,
not a workaround.

### The problem

Memory is stored **per project folder**. Most memories are not about a project
at all — they are standing instructions about how the work should be done. They
only load in the one project they happen to be filed under.

**Measured 2026-09-18** (the earlier "11 of 16" was an estimate): 23 memory
files, **18 unique**, across 6 directories. Nine are cross-project working
preferences filed under a single project.

| Preference | Loads only in | Should apply |
|---|---|---|
| `always-recommend-an-option` — name a recommendation and say why, **including why not the others** | FinNode | everywhere |
| `report-findings-dont-chase-them` — list incidental findings at the end; Amit sets the pace | Voice-Flow, Voice-Flow-Pro | everywhere |
| `fix-root-cause-flag-workarounds` — always label a fix workaround vs root-cause | Voice-Flow | everywhere |
| `dont-delete-reference-docs` — relocate and mark stale, don't delete | Voice-Flow-Pro | everywhere |
| `docs-are-products-not-logs` — write docs about the thing, not about their own history | Voice-Flow | everywhere |
| `claude-md-not-in-git` | Voice-Flow-Pro | everywhere |
| `amit-uses-voice-input` — Amit dictates; read through transcription errors | Voice-Flow | **everywhere** — this is a `type: user` memory sitting in one project |

So: working in Packbly or Emp portal today, none of the above is in context.
`always-recommend-an-option` loads in FinNode only. `amit-uses-voice-input`
explains "bs4" meaning "VS Code" — and it was not loaded in this session.

### 7a — Repair where memories are stored  ·  **DONE 2026-09-18**

A worse problem sat underneath the filing one, found by checking each memory
directory against the filesystem. **Three of the six directories pointed at
project folders that no longer exist**, so 10 of the 23 files could never load
at all:

| Orphaned directory | Files | Sessions | Fate |
|---|---|---|---|
| `…VS-Code-Voice-Flow-Pro` | 6 | 0 | **Deleted.** All 5 memories byte-identical to live Voice-Flow copies; its index was a strict subset |
| `…VS-Code-Debugger` | 4 | 0 | **Migrated** to `…VS-Code-Debugger-v2` |
| `…Debugger-vthrudebugger-v1` | 3 | 0 | **Migrated** to `…VS-Code-vthrudebugger-v1` |

`~/Debugger/` and `~/Documents/VS Code/Debugger/` do not exist anywhere under
`~` — searched, not assumed. The projects moved; the memories stayed behind.

**The sharpest example:** `vthru_debugger_workflow_preferences` holds *"share a
written plan, let the user review, only then implement"* — the plan-first rule
Amit asked for on 2026-09-18 as if it were new. It was already recorded, and had
been unable to load since the folder moved.

Also: `Debugger v2` had no `CLAUDE.md` **and** no reachable memories — the least
instructed project on the machine. It now has 3 memories.

**Method:** copy → `filecmp` verify → only then remove. Deletions confined to
files with a proven identical live counterpart.
**Result:** 5 memory directories, all mapping to a project folder that exists;
18 unique memories, none lost.
**Undo:** `git -C ~/.claude checkout -- projects/` — all 29 memory files are
tracked and were already pushed.

### 7b — The fix for where preferences live

Promote the universal ones into `~/.claude/STANDARDS.md`, which loads in every
project and is already in the git repo. Leave genuinely project-specific
memories where they are:

**Stays as project memory:** `verify-shipped-bundle-not-source`,
`check-history-json-before-chasing-polish`, `history-must-be-unlimited`,
`recorder-page-becomes-chat`, `project-debugger-ui-frozen`,
`project-debugger-repo-fresh-start`, `feedback-debugger-overlay-intentional`,
`vthru-customer-app-debug-toggle`, `vthru-debugger-workflow-preferences`.

**Moves to STANDARDS.md:** the seven in the table above.

Originals are not deleted — per D4 nothing is removed without approval, and a
memory that also exists in STANDARDS.md is harmless duplication until you say
otherwise.

**Undo:** revert `STANDARDS.md` from the git repo or the 1.1 backup.

#### 7b — what was actually written  ·  **DONE 2026-09-18**

`STANDARDS.md` 85 → 145 lines, **60 insertions, 3 deletions**. Five new sections
and three edits to existing ones, in this order:

| Section | Source |
|---|---|
| **Plan before building** *(new)* | Amit's rules 1, 10, 11, 12, 13 + D17, D18 |
| **Evidence, not assumption** *(+1 para)* | rtk rewrites output — re-verify via `rtk proxy` (D12) |
| **Fix the cause** *(+1 para)* | label a fix workaround vs root-cause — `fix-root-cause-flag-workarounds` |
| **Reuse what is already there** *(new)* | Amit's rules 4, 9 |
| **Know what the change touches** *(new)* | Amit's rules 7, 8 + blast radius, per D19 |
| **Stay on the task** *(1 para reworded)* | reconciled with `report-findings-dont-chase-them` |
| **When something is unclear** *(new)* | Amit's rule 14 + `always-recommend-an-option` + `amit-uses-voice-input` |
| **Docs are products** *(new)* | `docs-are-products-not-logs` + `dont-delete-reference-docs` |

**Deliberately not added:** Amit's rules 2, 3, 5 and 6 — already covered by
§ *Fix the cause* and § *Build the smallest thing*. Restating them would have
doubled the file and let two phrasings drift apart. This is D20.

**The one deletion** was the paragraph *"...do not end a task by talking me into
a list of other things to fix"*, which contradicted the
`report-findings-dont-chase-them` memory. The memory's version won, because it
was given directly. Flagged before the edit, not after.

**Cost:** +626 tokens per turn, `STANDARDS.md` ~988 → ~1,614. The always-loaded
set goes from ~3,469 to ~4,095. **My pre-write estimate was +340 — wrong by
most of a factor of two.** The wording was reviewed and approved as written, so
the content is what was wanted; the estimate was the error. If the per-turn cost
proves too high, § *When something is unclear* and § *Docs are products* are the
two most compressible.

**Originals kept.** The nine promoted memories still exist in their project
folders — per D4 nothing is removed without approval, and duplication between a
memory and `STANDARDS.md` is harmless.

---

## PHASE 8 — Where rules live: divide, standardise, restructure  (HIGH)

Opened 2026-09-20 at Amit's request: review **everything built in the setup**, not
just the day's work, and decide what is universal versus project-specific. Nothing
in this phase has been actioned — it is a survey plus a proposal.

**Full write-up:** https://claude.ai/artifact/JPhMJ7z3bAMux6w5G3ZaMy

### The finding

The structure is not undefined. `STANDARDS.md` line 3 already states it: global is
universal, a project's `CLAUDE.md` adds specifics, and where they overlap the
project wins. **The files simply do not follow the rule that is already written.**

### The constraint that causes most of it

**There is no global memory.** Memory always lives at
`~/.claude/projects/<project-path>/memory/`; there is no `~/.claude/memory/`.
A preference stated once while working in Voice-Flow is saved into Voice-Flow's
folder and only ever loads there, however universally it was meant. The only
surface a universal rule can occupy is one of the five files `CLAUDE.md` imports.
This is a storage fact, verified, not a judgement call.

### A · Ten rules written in two places

Phase 7b promoted preferences into `STANDARDS.md` and **left the originals in
place**, so both copies exist and can drift.

Six memories already covered by `STANDARDS.md`, verified by grep:

| Memory | Lives in | Already global as |
|---|---|---|
| `fix-root-cause-flag-workarounds` | Voice-Flow | Fix the cause, not the symptom |
| `report-findings-dont-chase-them` | Voice-Flow | Stay on the task you were given |
| `docs-are-products-not-logs` | Voice-Flow | Docs are products |
| `dont-delete-reference-docs` | Voice-Flow | Do not delete reference or spec docs |
| `amit-uses-voice-input` | Voice-Flow | I dictate most prompts |
| `always-recommend-an-option` | FinNode | Never present options neutrally |

Plus FinNode's `CLAUDE.md` re-states four `STANDARDS.md` sections verbatim in
substance — *Evidence not assumption*, *Fix the cause*, *Build the smallest thing*,
*Stay on the task*. **Not simple duplication:** each carries real project evidence
(the Phase 0/1b/1c defect counts, the `DiaryDao` precedent). Keep the evidence,
drop the re-stated general paragraph.

### B · Five universal rules trapped in one project

The half that actively costs something. Each is general but only loads in one place.

| Rule | Trapped in | Why global |
|---|---|---|
| **Never commit or push without being asked** | vthrudebugger_v1 memory | Highest value. **Not in `STANDARDS.md` at all** — currently relies on a Claude Code default rather than Amit's own rule |
| `claude-md-not-in-git` | Voice-Flow memory | Stated "from now onwards" — explicitly global. Only loading in Voice-Flow is why Emp portal was out of compliance until 5.7 |
| One PR per feature, own branch off `main` | vthrudebugger_v1 memory | Nothing project-specific in it |
| `rtk-proxy-suppresses-dry-run-output` | FinNode memory | rtk runs on every Bash call in every project via the hook — an rtk gotcha is global by definition |
| `verify-shipped-bundle-not-source` | Voice-Flow memory | General principle for anything that ships a build |

`vthru_debugger_workflow_preferences` is the worst case: **one file holding three
rules already global** (plan-first, ask-don't-guess, reuse existing helpers), **two
that should be global**, and nothing project-specific. It needs splitting, not moving.

### C · Correctly placed — do not touch

Voice-Flow's 89 working rules and pitfalls, Emp portal's 8 must-follow rules,
Packbly_web's 6, Voice Flow_v1's 5, FinNode's hard rules and architecture, and all
7 project-type memories. All genuinely about their own codebase. Checked by reading.

### The cost, and the shape of the fix

Six global files load **every turn**: 2,968 words, ≈3,900 tokens before Amit types.
Promoting a rule is not free — it loads in every session of every project forever.

**The fix is the pattern already invented in Voice-Flow:** state the rule as a
one-line claim globally, keep the evidence in the project that earned it. That is
how Voice-Flow's `CLAUDE.md` went 110 KB → 29 KB losing nothing (5.1). Applied here,
the five trapped rules cost about **5 lines / ~60 words**, not five copied files.

### Proposed order — none of this is done

| # | Step | Risk |
|---|---|---|
| 1 | Promote the 5 trapped rules — 4 into `STANDARDS.md`, 1 into `RTK.md`, one line each | low, additions only |
| 2 | Retire the 6 redundant memories. **Apply `dont-delete-reference-docs`:** replace each body with a one-line pointer to the global section rather than deleting, unless Amit says otherwise | low |
| 3 | Split `vthru_debugger_workflow_preferences` — 2 rules out to global, 3 dropped as already-global | medium, needs Amit's read |
| 4 | Trim FinNode's four re-stated sections to their project evidence | medium, most editing |

**Explicitly out of scope here:** the 384 permission rules and the 18
arbitrary-code-execution rules. Separate problem, separate page — see Phase 9.

---

## PHASE 9 — The 384 project permission rules  (HIGH — one safety item)

Surveyed 2026-09-20, **nothing actioned.**
**Full audit, all 384 rules searchable:** https://claude.ai/artifact/YAJNnNkSemQyCCtMsNkzDD

**Correction recorded first:** the 384 rules cost **zero tokens**. They are read by
the permission system, never sent to Claude. Only the `.md` files load into context.
The two were conflated when first reported to Amit.

**Second correction, 2026-09-20: the audit missed 68 rules.** Four
`.claude/settings.local.json` files live *inside* `node_modules` — three copies of
`resolve`, one of `nanoid` — and the 384 count never saw them. They are not Amit's:
they are the package maintainers' own Claude Code grants, published to npm by
accident, and `resolve`'s folder also ships a `notes.md` describing that project's
house style. Practically they are inert, because Claude Code reads settings from the
project root and the working directory's parents, not from an arbitrary dependency —
but **a dependency can ship permission grants, and `npm install` delivers them
silently.** That is worth a decision of its own, not a cleanup: the files reappear
on every install. Found while cross-checking the Voice-Flow pass; see Phase 10.

**Second correction:** "duplicates" was the wrong frame. Rules are per-project, so
`Bash(rtk ls *)` in 7 projects is 7 projects each needing it, not 6 wasted copies.
Deleting them would break those projects. The fix for those is promotion to global.

### The safety item — 18 rules that execute arbitrary code

`Bash(node *)`, `Bash(node -e ' *)`, `Bash(node --input-type=module -e ' *)`,
`Bash(python3 -c ' *)`, `Bash(python3 -)`, `Bash(rtk proxy *)`,
`Bash(osascript -l JavaScript -e ' *)`,
`Bash(osascript -e 'tell application "System Events" *)`, `Bash(awk ' *)`.

Once one matches, **the entire global ask list is bypassed**, because the command
that runs is `node` or `python3`, not `rm` or `sudo`. Concretely:
`node -e "require('fs').rmSync(...)"` matches `Bash(node -e ' *)` in Voice-Flow,
matches no ask rule, and deletes with no prompt.

This is the same blind spot already recorded in "What I got wrong" — *"My risk
categories put arbitrary-code and Keychain access in the low risk bucket."* It was
identified then and never closed.

### The rest

| Category | n | Fix |
|---|---|---|
| Already granted by the global allow list | 37 | Delete — zero effect |
| One-off literal commands, spent, cannot match again | 67 | Delete — nothing lost |
| Subsumed by a broader rule in the same project | 8 | Delete — nothing lost |
| Rules that **write files** sitting in an allow list | 8 | Review — 3 are dead `sed -i` replacements |
| Present in 3+ projects | 83 copies | Promote to ~16 global rules — **but not the 4 that are arbitrary-code** |
| Look fine as they are | 210 | Leave |

Categories overlap; the totals do not sum to 384.

---

## PHASE 10 — Project-by-project review  (IN PROGRESS)

Opened 2026-09-20 at Amit's direction, and it **changes the order of everything
left**. Phases 8 and 9 both proposed a global pass first. That is backwards: what
belongs in `STANDARDS.md` cannot be decided until every project has been seen, and
deciding it early means reopening it. So the rule is now:

**Walk the projects one at a time. Promote to global only at the end.**

### How a project pass runs

1. **Read it and say what it is** — in plain English, one short page: what the
   project does, what its `CLAUDE.md` says, what its permissions actually let a
   session do, what is missing. Amit reads and decides; nothing is assumed.
2. **Ask, and keep asking.** Eight to ten questions a project is normal and wanted.
   Every removal is a question, never an inference.
3. **Back up first**, into `backups/<date>-<project>/`, verified with `cmp`.
4. **Cross-check twice before any deletion, by two different methods.** This is
   Amit's standing instruction and it has already earned itself — see below.
5. **Verify after**, against the backup: what was removed, what was added, and that
   `ask`/`deny` and every unrelated setting are untouched.
6. **Report what was not verified** as plainly as what was.

### The cost model that drives the trimming

Three tiers, and confusing them is what made the setup expensive:

| | Cost |
|---|---|
| `CLAUDE.md` and every file it `@import`s | **every turn, forever** |
| `docs/`, `skills/`, `agents/`, memory bodies | only when actually opened |
| `settings.json` permissions, hooks | **zero, always** — never sent to a model |

So the shape of every pass is the same: **claim in `CLAUDE.md`, evidence in
`docs/`, and a skill to force the doc open at the moment it matters.** That is the
pattern 5.1 invented in Voice-Flow; Phase 10 applies it everywhere.

A skill is the important half. Trimming a rule out of `CLAUDE.md` makes it
invisible until something opens the document. A skill named for the dangerous job —
not for a file — costs nothing until called and puts the right document in front of
the session at the right moment.

### Order

Voice-Flow first (biggest `CLAUDE.md`, most to save, proves the method), then the
rest by Amit's call. Two projects — **Debugger v2** and **Packbly_v2** — have no
`CLAUDE.md` at all and start from a blank page rather than an untangling.

### Voice-Flow  ·  **DONE 2026-09-20**

Backup: `backups/2026-09-20-voiceflow/` — 18 files, all verified byte-identical.

**Per-turn cost in this project: ~10,056 → ~6,003 tokens.**

| | Before | After |
|---|---|---|
| `CLAUDE.md` | 4,650 words / ~6,140 tokens | **1,534 words / ~2,024 tokens** |
| `allow` rules | 234 | **180** |
| Documents in `docs/` | 11 | **13** |
| Skills | 0 | **3** |

**The diagnosis was wrong the first time, and the correction matters.** The first
report said the 42 working rules were most of the file. Measured, they were 687
words of 4,650. The real weight was **Architecture map (1,629) and Commands
(1,339)** — 64% of the file — because those two sections had *never* been split and
still carried every war story inline. Rules and pitfalls were already claim-only.
The lesson is the one from 7b: measure the section before proposing the fix.

**What was done.**

- **Permissions, 234 → 180.** Two `git commit` allows removed and the rule made
  global instead. Five wildcards that execute arbitrary code removed — `node *`,
  `node -e ' *`, `node --input-type=module -e ' *`, `python3 -c ' *`, `python3 -` —
  leaving the named scripts and `npm run *`, which covers all 18 package scripts.
  47 dead one-offs removed (32 `echo`, 15 `awk`); `sed`/`perl` kept at Amit's call.
  One wildcard **narrowed rather than removed**:
  `osascript -e 'tell application "System Events" *` became `… to get *`, which
  still answers every read-only query the paste debugging needs and refuses
  `keystroke`, `key code`, `click` and `delete login item`.
- **Global `ask` 101 → 107.** `git commit` now asks everywhere, in six spellings.
- **`STANDARDS.md` +2 rules**, additions only — see Phase 8.
- **7 memories marked** with a pointer to the governing global section. **0 lines
  deleted** across all 11 files in the folder.
- **`CLAUDE.md` split.** `Architecture map` and `Commands` moved verbatim into new
  `docs/architecture.md` and `docs/commands.md`; the condensed map and command list
  stay. Working rules trimmed 42 → 20, pitfalls 47 → 15. **All 89 remain in `docs/`
  in full** — every dropped line was proved present there before removal.
  `docs/README.md` gained both rows and an honest account of the trade.
- **3 skills**, in `.claude/skills/`: `verify-app` (prove a change reached the
  installed `.app`), `vault-work` (this code writes into a real Obsidian vault),
  `polish-work` (fourteen identical runs once produced five different shapes).

**The trade, stated because it is real:** 22 rules and 32 pitfalls are no longer in
front of a session automatically. Each trimmed section names the document holding
the rest and says to read it first, and the three skills cover the three areas where
a missed rule actually costs something.

### What the cross-check found — and why it is now a fixed step

Amit asked for a cross-check before any of this was recorded. It found **two real
errors in work already reported as done**:

1. **A factual error introduced while rewriting.** The condensed Architecture map
   called eight vault modules "the pure ones". Measured against the code,
   `vaultTree` (3 filesystem references) and `vaultLint` (2) are not. The original
   text had only ever marked `vaultPlan` pure; the generalisation was invented.
   Fixed — the seven with zero references are now named explicitly, and so are the
   five that read or write.
2. **The `git commit` fix was two-thirds of a fix.** `Bash(git commit *)` does not
   match `git -c user.name=… commit`, and **FinNode has exactly that rule saved as
   an allow.** Closed with `git * commit *` in three spellings, tested to catch the
   `-c` and `-C` forms while still letting `git log`, `git status` and `git diff`
   run. `cd X && git commit` still slips — that is the structural limit already
   documented under *Why permissions cannot be made airtight*, not a new hole.

It also found **one miss in the review itself**: the first pass listed five things
worth looking at in Voice-Flow's permissions and did not include the
`System Events` wildcard, which could send keystrokes to any application. It was
narrowed once shown.

**Conclusion: the cross-check is not optional.** Two of the three findings were in
work already called done and verified. A pass is not finished until it has been
re-read against the code by a second method.

### Voice-Flow — open, not acted on

- `docs/architecture.md` says "Eleven files" for the vault modules; there are
  **twelve** on disk. Stale in the original text, moved verbatim, so `CLAUDE.md`
  (twelve) and the document (eleven) now disagree.
- `CLAUDE.md` says `useCopyToClipboard.ts` is "the only place that copies";
  `useDictationPipeline.ts` also calls `clipboard.writeText`, for auto-paste. The
  wording is the original's and reads as absolute.
- The `verify-shipped-bundle-not-source` memory points at
  `/Applications/Voice Flow Pro.app`. The app has been `Voice Flow.app` since the
  19 Aug 2026 rename, so following the memory literally fails. The new
  `verify-app` skill uses the correct path; the memory was left alone.
- `.claude/` is untracked in Voice-Flow's git. `settings.local.json` should stay
  that way; `settings.json` and the three new skills probably should not.

### Carried to the projects they belong to

Found while cross-checking Voice-Flow, deliberately **not** fixed out of order:

- `Bash(python3 -c ' *)` — the same arbitrary-code hole — is still open in
  **FinNode**, **Debugger v2** and **Voice Flow_v1**.
- **FinNode** still holds `git -c user.name=Amit -c user.email=… commit -q -m ' *`
  as an allow. The new global `ask` overrides it by rule-type precedence, so it is
  covered, but the rule itself is still there.
- The 68 `allow` rules inside `node_modules` — see the counts note at the top and
  Phase 9.

---

## Findings not acted on

Listed rather than chased, per `report-findings-dont-chase-them`. Nothing here
is being worked on; they are recorded so they are not lost.

1. **`docs-are-products-not-logs` may apply to this file.** That memory says
   docs should be about the thing, not about their own history, and that
   append-only dated logs are not wanted. This file has a "What I got wrong"
   section and a dated decisions table. Both were asked for explicitly on
   2026-09-18, so they stay — but flagging the tension rather than quietly
   deciding it.
2. **`rtk-proxy-suppresses-dry-run-output` may be stale.** It says rtk prints
   nothing for `git add --dry-run`. On rtk 0.48.0 today it printed all 38 paths.
   Verified independently with `git ls-files`, which also returned 38.
3. **Two memory folders are duplicates, not just orphans.** `Voice-Flow` (11
   files) and `Voice-Flow-Pro` (6) share 4 identical memories.
   `Debugger-vthrudebugger-v1` sits under `/Users/amitjangra/Debugger/`, a path
   that no longer exists.
4. **The `always-recommend-an-option` memory is not being followed in full.** It
   asks for a recommendation *and why not the others*. The "why not" has been
   missing from most option lists in this session.
5. **FinNode's `CLAUDE.md` is committed to its repo**, which contradicts
   `claude-md-not-in-git`. Not resolved by D13 either way — worth a decision
   when Phase 5 reaches it.
