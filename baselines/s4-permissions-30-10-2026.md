# S4 — fewer permission boxes · 30-10-2026

The S4 permission change: what was proposed, how it was measured and checked, and what
the live box tests showed. Approved by Amit as one package (steps 1–6), 30-10-2026.

## Facts

- Claude Code 2.1.314 · model Opus 5.5 (`claude-opus-5-5`) · started from `~/.claude`,
  auto mode.
- Setup commit at start: `a50a7ba`, tree clean. The settings changes are uncommitted at the
  time of writing.
- Evidence files kept next to this one, **gitignored** (`.gitignore:22`):
  `s4-proposal-30-10-2026.json` (the overlay) and `s4-replay-30-10-2026.py` (the read-only
  replay). Both are copied in full at the end of this file, which is what travels with git.

## Goal and success measure (Amit)

Fewer permission boxes across all projects. Only important or critical boxes stay, the
truly dangerous stay boxed or blocked, and nothing is lost in security or quality. Amit
clicks "Yes" on almost every box, so a box that protects nothing is a cost.

Measure (yes/no): every rule in scope classified; each change states its click impact;
no box added for a command Amit runs often; any added box named and justified; 0 files
changed without approval. Measured by replaying past Bash history. **Result: met.**

## Verified here

### Before applying (30-10-2026)

- `project-rules/drift.sh`: 18 current, 0 drifted.
- For all 12 files in the proposal: every rule to remove was present, and no rule to add
  was already there.
- `jq .` reproduced each of the 12 files byte for byte, so the rewrite changed only rules.
- Each new file was built in `/tmp`, then compared with the proposal before being written:
  the rules removed and added per list match it exactly, and every key outside
  `permissions` is unchanged. Three files (FinNode `settings.json`, Voice-Flow
  `settings.local.json`, vthrudebugger_v1 `settings.local.json`) listed removals in a
  different order from the proposal; the same rules.

### After applying

- `jq empty`: all 14 settings files valid (global, both setup files, 11 mirrors).
- `drift.sh`: 18 current, 0 drifted, so each live project file equals its mirror.
- Replay on the real files, no overlay (`S4_TOTALS=1 python3 -I
  baselines/s4-replay-30-10-2026.py`):

  | | Before (earlier session, 30-10-2026) | After |
  |---|---|---|
  | Bash calls · sessions | 16,530 · 183 | 16,563 · 184 |
  | Boxed calls | 2,241 | **1,722** (−519, −23%) |
  | Non-auto calls with a part no allow rule covers | 1,765 | 1,766 (+1) |

  After, by project: global-only 290 · Voice-Flow 805 · Emp portal 2 · SETUP 296 ·
  FinNode 329. Modes per call: auto 14,658 · default 137 · acceptEdits 157 · unknown
  1,611. The 33 extra calls are this session's; the total is unchanged.

### Files changed

In `~/.claude`: `settings.json`, `.claude/settings.json`, `.claude/settings.local.json`,
and the mirrors under `project-rules/` for the nine live files below.

Live project files, left uncommitted. Git cannot undo the gitignored ones; their
pre-change copies are in `~/.claude` at `a50a7ba`.

- `/Users/amitjangra/Documents/VS Code/Debugger v2/.claude/settings.json` (gitignored)
- `/Users/amitjangra/Documents/VS Code/FinNode/.claude/settings.json` (tracked)
- `/Users/amitjangra/Documents/VS Code/FinNode/.claude/settings.local.json` (gitignored)
- `/Users/amitjangra/Documents/VS Code/Packbly_web/v1.1-Packbly/.claude/settings.local.json` (gitignored)
- `/Users/amitjangra/Documents/VS Code/Voice Flow_v1/.claude/settings.json` (gitignored)
- `/Users/amitjangra/Documents/VS Code/Voice Flow_v1/.claude/settings.local.json` (gitignored)
- `/Users/amitjangra/Documents/VS Code/Voice-Flow/.claude/settings.json` (tracked)
- `/Users/amitjangra/Documents/VS Code/Voice-Flow/.claude/settings.local.json` (gitignored)
- `/Users/amitjangra/Documents/VS Code/vthrudebugger_v1/.claude/settings.local.json` (gitignored)

### Scratch tests (`/tmp/s4-scratch`, earlier session, 30-10-2026)

Copied from that session's task record; not re-run here.

- `git ls-remote` honours `--upload-pack` only before the repo name (a control before it
  ran code), so `git ls-remote origin *` is safe to allow.
- `git config --get` with extra arguments never writes (exit 1/129).
- `npm pack --dry-run` runs `prepack` but writes no tarball.
- `rtk tree -o` writes nothing; `xxd in out` writes; `git log --output` writes.
- rtk hook: `git add` and `tree` get the hook's own "allow"; `git fetch|stash|log|push|
  status|diff` are rewritten without "allow"; `git -C /p push` → `rtk git -C /p push`,
  which matched no ask rule before S4.

### Cross-checks (Opus, fresh, read-only, earlier session)

- Plan v1: CHANGE, 6 fixes taken, 51.3k tokens.
- Final plan: keep after 5 fixes, all taken, 46.3k tokens.

## Supplied by Amit — live box tests

One command per message, run from `~/.claude` in auto mode. Amit reported each result
and pasted the box text.

| # | Command | Expected | Seen |
|---|---|---|---|
| 1 | `gh auth status` | no box (was `*gh auth*`) | no box |
| 2 | `git merge-base HEAD HEAD` | no box (was `*git merge*`) | no box |
| 3 | `security list-keychains` | no box (was `*security *`) | no box |
| 4 | `git -C /Users/amitjangra/.claude merge --abort` | box, new rule | box; answered No |
| 5 | `git log -1 --output=/tmp/s4-out.txt` | box, new rule | box; answered No |

Box text, test 4: "Ask rule Bash(git - merge *) overrides auto mode for this command."
The rule is `Bash(*git -* merge *)`; the asterisks did not show in the pasted text.

Box text, test 5: the command shown was `rtk git log -1 --output=/tmp/s4-out.txt`, and
"Ask rule Bash(*git *--output*) overrides auto mode for this command." So the rule still
matches after the rtk rewrite.

## Not verified

- How Claude Code matches `$(…)`, `env`/`xargs` wrappers and double spaces.
- Whether repeated auto-mode blocks turn into boxes.
- The replay approximates matching (`*` = any text; compounds split on `&& || ; | &` and
  newlines).
- The scratch tests were not re-run in this session.

## Interpretation

- Where the boxes came from: ask rules matching reads. `gh pr view` 183, `gh pr list` 32,
  `gh repo view` 46, `gh api` GETs ~76, `git merge-base` 19, `git pull --ff-only` 79+,
  `git switch` 63 (Voice-Flow), `sed -n`/`grep` reads of files named like Voice-Flow
  scripts ~150, and words inside grep/echo/heredoc text for `security`, `tccutil`,
  `brew install`, `git * commit`.
- Kept boxed on purpose (counts from history): commit 425, push 336, `git checkout` 223,
  FinNode connected tests 198 (they wipe device data), `rm` 148, `curl` 88,
  `gh pr merge|create` 166, installs.
- Holes closed: `git -<opt> …` forms of push, reset, rebase, merge, checkout, clean,
  restore, rm, mv, stash drop/clear and branch delete (`git -C dir push` matched no ask
  rule before); `git … --output` and `--upload-pack`; remote remove/rm/rename/set-head;
  forced or discarding `switch`; `pull --rebase/-r/--force/-f`; the writing `security`
  subcommands; `tccutil`/`brew install` by full path, `env`, `arch` and `sh -c`; FinNode
  `gradlew` uninstall/publish/`--init-script`/`-I`. Broad allows that could write were
  removed or narrowed (`xxd`, `git apply`, `git stash`, `git config`, `git remote`,
  `git ls-remote`, `npm pack`, `npm audit`, `awk ' *`).
- Follow-ups outside S4, each needing its own approval: one-line explanation for
  important boxes only (`STANDARDS.md`); prefer `git switch` over `git checkout` for
  branches (could cut ~200 more boxes); Part B `.env`-style denies and Bash reads of
  `~/.ssh` etc.; a global `*git -c *` alias bypass; `gh release|secret|workflow run|issue`
  and `gh co` are unboxed today.

## The proposal, as applied

`s4-proposal-30-10-2026.json`, rewrapped onto fewer lines; the JSON is identical
(`jq -S` output compared with `cmp`, 30-10-2026). Keys are relative to `~/.claude`, or
to `project-rules/` (and so the project root) for projects.

```json
{
  "settings.json": {
    "remove": {
      "allow": ["Bash(tree *)", "Bash(xxd *)"],
      "ask": ["Bash(*gh pr*)", "Bash(*gh repo*)", "Bash(*gh auth*)", "Bash(*gh api*)",
        "Bash(*git merge*)", "Bash(*git * commit*)", "Bash(*security *)", "Bash(*tccutil*)",
        "Bash(*brew install*)"]
    },
    "add": {
      "ask": ["Bash(*gh pr create*)", "Bash(*gh pr merge*)", "Bash(*gh pr close*)",
        "Bash(*gh pr reopen*)", "Bash(*gh pr edit*)", "Bash(*gh pr comment*)",
        "Bash(*gh pr review*)", "Bash(*gh pr ready*)", "Bash(*gh pr checkout*)",
        "Bash(*gh pr lock*)", "Bash(*gh pr unlock*)", "Bash(*gh pr update-branch*)",
        "Bash(*gh pr revert*)", "Bash(*gh repo create*)", "Bash(*gh repo delete*)",
        "Bash(*gh repo edit*)", "Bash(*gh repo rename*)", "Bash(*gh repo archive*)",
        "Bash(*gh repo unarchive*)", "Bash(*gh repo fork*)", "Bash(*gh repo clone*)",
        "Bash(*gh repo sync*)", "Bash(*gh repo set-default*)", "Bash(*gh repo deploy-key*)",
        "Bash(*gh repo autolink*)", "Bash(*gh auth login*)", "Bash(*gh auth logout*)",
        "Bash(*gh auth refresh*)", "Bash(*gh auth token*)", "Bash(*gh auth setup-git*)",
        "Bash(*gh auth switch*)", "Bash(*gh auth status*-t*)",
        "Bash(*gh auth status*--show-token*)", "Bash(*gh api* -X*)", "Bash(*gh api*--method*)",
        "Bash(*gh api* -f*)", "Bash(*gh api* -F*)", "Bash(*gh api*--field*)",
        "Bash(*gh api*--raw-field*)", "Bash(*gh api*--input*)", "Bash(*gh api*graphql*)",
        "Bash(*git merge *)", "Bash(*git merge)", "Bash(*git -* commit*)",
        "Bash(*git -* push*)", "Bash(*git -* reset*)", "Bash(*git -* rebase*)",
        "Bash(*git -* merge *)", "Bash(*git -* checkout*)", "Bash(*git -* clean*)",
        "Bash(*git -* restore*)", "Bash(*git -* rm *)", "Bash(*git -* mv *)",
        "Bash(*git -* stash drop*)", "Bash(*git -* stash clear*)", "Bash(*git *--output*)",
        "Bash(*git *--upload-pack*)", "Bash(tccutil *)", "Bash(rtk proxy tccutil *)",
        "Bash(brew install*)", "Bash(rtk brew install*)", "Bash(rtk proxy brew install*)",
        "Bash(/opt/homebrew/bin/brew install*)", "Bash(*gh pr new*)", "Bash(*gh repo new*)",
        "Bash(*gh api*DELETE*)", "Bash(*gh api*PATCH*)", "Bash(*gh api*PUT*)",
        "Bash(*gh api*POST*)", "Bash(*security find-*)", "Bash(*security dump-*)",
        "Bash(*security export*)", "Bash(*security import*)", "Bash(*security delete-*)",
        "Bash(*security add-*)", "Bash(*security set-*)", "Bash(*security unlock-keychain*)",
        "Bash(*security create-keychain*)", "Bash(*security default-keychain*)",
        "Bash(*security authorizationdb*)", "Bash(*security remove-trusted-cert*)",
        "Bash(/usr/bin/tccutil *)", "Bash(*env *tccutil *)", "Bash(*sh -c*tccutil*)",
        "Bash(/usr/local/bin/brew install*)", "Bash(*arch *brew install*)",
        "Bash(*git -* branch*-d*)", "Bash(*git -* branch*-D*)",
        "Bash(*git -* branch*--delete*)", "Bash(*git *remote remove*)",
        "Bash(*git *remote rm *)", "Bash(*git *remote rename*)", "Bash(*git *remote set-head*)",
        "Bash(*git *switch* -f*)", "Bash(*git *switch*--force*)",
        "Bash(*git *switch*--discard*)", "Bash(*git *switch* -C*)",
        "Bash(*git *pull*--rebase*)", "Bash(*git *pull* -r*)", "Bash(*git *pull*--force*)",
        "Bash(*git *pull* -f*)"]
    }
  },
  ".claude/settings.json": {
    "remove": {"ask": ["Bash(*git pull*)", "Bash(*git switch*)"]}
  },
  "Voice-Flow/.claude/settings.json": {
    "remove": {
      "ask": ["Bash(*install:app*)", "Bash(*compile:vault*)", "Bash(*signing:cert*)",
        "Bash(*create-signing-cert*)", "Bash(*reset:permissions*)",
        "Bash(*scripts/install-app*)", "Bash(*scripts/compile-vault*)",
        "Bash(*scripts/reset-permissions*)", "Bash(*scripts/uninstall-app*)",
        "Bash(*git switch*)", "Bash(*git pull*)"]
    },
    "add": {
      "ask": ["Bash(*node *scripts/install-app*)", "Bash(*node *scripts/uninstall-app*)",
        "Bash(*node *scripts/compile-vault*)", "Bash(*node *scripts/reset-permissions*)",
        "Bash(*./scripts/install-app*)", "Bash(*./scripts/uninstall-app*)",
        "Bash(*./scripts/compile-vault*)", "Bash(*./scripts/reset-permissions*)",
        "Bash(*sh *scripts/install-app*)", "Bash(*sh *scripts/uninstall-app*)",
        "Bash(*sh *scripts/compile-vault*)", "Bash(*sh *scripts/reset-permissions*)",
        "Bash(*sh *create-signing-cert*)", "Bash(*node *create-signing-cert*)",
        "Bash(*./scripts/create-signing-cert*)", "Bash(*npm *install:app*)",
        "Bash(*pnpm *install:app*)", "Bash(*yarn *install:app*)", "Bash(*npm *uninstall:app*)",
        "Bash(*pnpm *uninstall:app*)", "Bash(*yarn *uninstall:app*)",
        "Bash(*npm *compile:vault*)", "Bash(*pnpm *compile:vault*)",
        "Bash(*yarn *compile:vault*)", "Bash(*npm *signing:cert*)", "Bash(*pnpm *signing:cert*)",
        "Bash(*yarn *signing:cert*)", "Bash(*npm *reset:permissions*)",
        "Bash(*pnpm *reset:permissions*)", "Bash(*yarn *reset:permissions*)",
        "Bash(scripts/install-app*)", "Bash(/*/scripts/install-app*)",
        "Bash(source *scripts/install-app*)", "Bash(. *scripts/install-app*)",
        "Bash(scripts/uninstall-app*)", "Bash(/*/scripts/uninstall-app*)",
        "Bash(source *scripts/uninstall-app*)", "Bash(. *scripts/uninstall-app*)",
        "Bash(scripts/compile-vault*)", "Bash(/*/scripts/compile-vault*)",
        "Bash(source *scripts/compile-vault*)", "Bash(. *scripts/compile-vault*)",
        "Bash(scripts/reset-permissions*)", "Bash(/*/scripts/reset-permissions*)",
        "Bash(source *scripts/reset-permissions*)", "Bash(. *scripts/reset-permissions*)",
        "Bash(scripts/create-signing-cert*)", "Bash(/*/scripts/create-signing-cert*)",
        "Bash(source *scripts/create-signing-cert*)", "Bash(. *scripts/create-signing-cert*)"]
    }
  },
  "Voice-Flow/.claude/settings.local.json": {
    "remove": {"allow": ["Bash(git stash *)", "Bash(git log *)", "Bash(git apply *)"]}
  },
  "FinNode/.claude/settings.json": {
    "remove": {"allow": ["Edit(CLAUDE.md)", "WebFetch(domain:kotl.in)"]},
    "add": {
      "ask": ["Bash(*gradlew*uninstall*)", "Bash(*gradlew*publish*)",
        "Bash(*gradlew*--init-script*)", "Bash(*gradlew* -I *)"]
    }
  },
  "FinNode/.claude/settings.local.json": {
    "remove": {"allow": ["Bash(git fetch *)"]}
  },
  "Debugger v2/.claude/settings.json": {
    "remove": {"allow": ["Bash(git remote *)"]},
    "add": {"allow": ["Bash(git remote -v)", "Bash(git remote get-url *)"]}
  },
  "Voice Flow_v1/.claude/settings.json": {
    "remove": {"allow": ["Bash(git stash *)"]}
  },
  "Voice Flow_v1/.claude/settings.local.json": {
    "remove": {"allow": ["Bash(git remote *)", "Bash(git ls-remote *)"]},
    "add": {
      "allow": ["Bash(git remote -v)", "Bash(git remote get-url *)",
        "Bash(git ls-remote origin *)", "Bash(git ls-remote --heads origin *)",
        "Bash(git ls-remote --tags origin *)"]
    }
  },
  "vthrudebugger_v1/.claude/settings.local.json": {
    "remove": {"allow": ["Bash(git ls-remote *)", "Bash(git config *)", "Bash(npm pack *)"]},
    "add": {
      "allow": ["Bash(git ls-remote origin *)", "Bash(git ls-remote --heads origin *)",
        "Bash(git ls-remote --tags origin *)", "Bash(git config --get *)",
        "Bash(git config --list)", "Bash(npm pack --dry-run)"]
    }
  },
  "Packbly_web/.claude/settings.local.json": {
    "remove": {"allow": ["Bash(npm audit *)", "Bash(awk ' *)"]},
    "add": {"allow": ["Bash(npm audit)", "Bash(npm audit --json)"]}
  },
  ".claude/settings.local.json": {
    "remove": {"allow": ["Bash(git ls-remote *)"]},
    "add": {
      "allow": ["Bash(git ls-remote origin *)", "Bash(git ls-remote --heads origin *)",
        "Bash(git ls-remote --tags origin *)"]
    }
  }
}
```

## The replay script

`s4-replay-30-10-2026.py`, byte for byte (the file itself is gitignored). Run with
`python3 -I`; `S4_TOTALS=1` totals only, `S4_SHORT=1` adds which ask rules fire,
`S4_PROPOSAL=<json>` applies an overlay. Reads Claude Code session history; prints
command names and flags only.

```python
#!/usr/bin/env python3
"""S4 step 0 — read-only replay of past Bash tool calls against current permission rules.

Reads ~/.claude/projects/**/*.jsonl (tool_use commands only, never tool output text
except to detect the user's "No"), and the rule files. Writes nothing. Prints counts
keyed by command name + flags only; arguments and values are redacted.
"""
import collections, glob, json, os, re, shlex, subprocess, sys

HOME = os.path.expanduser("~")
C = f"{HOME}/.claude"
PR = f"{C}/project-rules"

FOLDER_TO_PROJECT = {
    "-Users-amitjangra--claude": "SETUP",
    "-Users-amitjangra-Documents-VS-Code-Debugger-v2": "Debugger v2",
    "-Users-amitjangra-Documents-VS-Code-Emp-portal-Vthru-Emp-v2-1-jun26": "Emp portal",
    "-Users-amitjangra-Documents-VS-Code-FinNode": "FinNode",
    "-Users-amitjangra-Documents-VS-Code-Voice-Flow": "Voice-Flow",
    "-Users-amitjangra-Documents-VS-Code-vthrudebugger-v1": "vthrudebugger_v1",
}

OVERLAY = json.load(open(os.environ["S4_PROPOSAL"])) if os.environ.get("S4_PROPOSAL") else {}
def perms(path):
    try:
        p = json.load(open(path)).get("permissions", {})
    except FileNotFoundError:
        p = {}
    key = path[len(PR) + 1:] if path.startswith(PR + "/") else path[len(C) + 1:]
    o = OVERLAY.get(key)
    if o:
        p = {k: [r for r in p.get(k, []) if r not in o.get("remove", {}).get(k, [])] + o.get("add", {}).get(k, [])
             for k in ("allow", "ask", "deny")}
    return p

def bash_rules(files):
    out = {"allow": [], "ask": [], "deny": []}
    for f in files:
        p = perms(f)
        for k in out:
            out[k] += [r[5:-1] for r in p.get(k, []) if r.startswith("Bash(") and r.endswith(")")]
    return out

GLOBAL = [f"{C}/settings.json"]
def files_for(project):
    if project == "SETUP":
        return GLOBAL + [f"{C}/.claude/settings.json", f"{C}/.claude/settings.local.json", f"{C}/settings.local.json"]
    if project is None:
        return GLOBAL
    return GLOBAL + [f"{PR}/{project}/.claude/settings.json", f"{PR}/{project}/.claude/settings.local.json"]

_rx = {}
def rx(pat):
    if pat not in _rx:
        if pat.endswith(":*"):
            body = re.escape(pat[:-2]) + r"(\s.*)?"
        else:
            body = ".*".join(re.escape(p) for p in pat.split("*"))
            if pat.endswith(" *"):  # "cmd *" also matches bare "cmd"
                body = "(?:" + body + "|" + ".*".join(re.escape(p) for p in pat[:-2].split("*")) + ")"
        _rx[pat] = re.compile(body, re.S)
    return _rx[pat]

def first(rules, seg):
    for r in rules:
        if rx(r).fullmatch(seg):
            return r
    return None

ENV = re.compile(r"^(?:[A-Za-z_][A-Za-z0-9_]*=(?:'[^']*'|\"[^\"]*\"|\S*)\s+)+")
def segments(cmd):
    # split on && || ; | & newline, outside quotes (approximate, like the documented replay)
    parts, buf, q, i = [], "", None, 0
    while i < len(cmd):
        ch = cmd[i]
        if q:
            buf += ch
            if ch == q: q = None
        elif ch in "'\"":
            q = ch; buf += ch
        elif cmd.startswith("&&", i) or cmd.startswith("||", i):
            parts.append(buf); buf = ""; i += 1
        elif ch in ";|&\n":
            parts.append(buf); buf = ""
        else:
            buf += ch
        i += 1
    parts.append(buf)
    return [ENV.sub("", p.strip()) for p in parts if p.strip()]

_rw = {}
def rewrite(seg):
    if seg not in _rw:
        if "\0" in seg:
            _rw[seg] = seg
            return seg
        r = subprocess.run(["rtk", "hook", "check", seg], capture_output=True, text=True)
        _rw[seg] = r.stdout.strip() if r.returncode == 0 and r.stdout.strip() else seg
    return _rw[seg]

SAFE_WORD = re.compile(r"^[a-z][a-z0-9_.:-]{0,24}$")
def shape(seg, n=2):
    """command name + up to n following tokens; flags kept (value cut at '='), others redacted."""
    try:
        t = shlex.split(seg)
    except ValueError:
        t = seg.split()
    if not t: return "<empty>"
    out = [os.path.basename(t[0]) if "/" in t[0] else t[0]]
    if not SAFE_WORD.match(out[0]): out[0] = "<cmd>"
    k = 1
    if out[0] == "rtk" and len(t) > 1:
        out.append(t[1] if SAFE_WORD.match(t[1]) else "<arg>"); k = 2
    for tok in t[k:k + n]:
        if tok.startswith("-"):
            out.append(tok.split("=")[0][:20])
        elif SAFE_WORD.match(tok) and k <= 2:
            out.append(tok)
        else:
            out.append("<arg>")
        k += 1
    if len(t) > k: out.append(f"+{len(t) - k}")
    return " ".join(out)

CANDIDATES = [l.strip() for l in open(sys.argv[1]) if l.strip() and not l.startswith("#")] if len(sys.argv) > 1 else []
FAMILIES = re.compile(r"^(rtk )?(git (-C \S+ )?(config|remote|ls-remote|apply|switch|stash|tag|fetch)|npm (audit|pack)|xxd|awk|tree|\./gradlew)\b")

calls = sessions = 0
proj_calls = collections.Counter(); proj_sess = collections.defaultdict(set); modes = collections.Counter()
ask_hits = collections.Counter(); ask_by_rule = collections.Counter()
deny_hits = collections.Counter(); unmatched = collections.Counter()
cand = collections.Counter(); cand_shapes = collections.defaultdict(collections.Counter)
fam = collections.Counter(); nos = collections.Counter()
ask_rule_shapes = collections.defaultdict(collections.Counter)
fam2 = collections.Counter(); boxed_calls = collections.Counter(); noallow = set()

for path in glob.glob(f"{C}/projects/**/*.jsonl", recursive=True):
    folder = path[len(C) + 10:].split("/")[0]
    project = FOLDER_TO_PROJECT.get(folder)
    label = project or "global-only"
    R = bash_rules(files_for(project))
    pending, mode = {}, "unknown"
    for line in open(path, errors="replace"):
        try: e = json.loads(line)
        except ValueError: continue
        mode = e.get("permissionMode", mode)
        msg = e.get("message") or {}
        content = msg.get("content") if isinstance(msg, dict) else None
        if not isinstance(content, list): continue
        for c in content:
            if not isinstance(c, dict): continue
            if c.get("type") == "tool_use" and c.get("name") == "Bash":
                cmd = (c.get("input") or {}).get("command", "")
                if not isinstance(cmd, str) or not cmd: continue
                calls += 1; proj_calls[label] += 1; proj_sess[label].add(e.get("sessionId")); modes[mode] += 1
                boxed = []
                for seg in segments(cmd):
                    rs = rewrite(seg)
                    sh = shape(rs)
                    if FAMILIES.match(rs): fam[(label, shape(rs, 3))] += 1
                    t = rs.split()
                    if t[:1] == ["rtk"]: t = t[1:]
                    if t[:1] == ["gh"] and len(t) > 2 and t[1] in ("pr", "api", "repo", "auth"):
                        sub = t[2] if SAFE_WORD.match(t[2]) and t[1] != "api" else "<path>"
                        flags = sorted({x.split("=")[0] for x in t[3:] if x in ("-X", "--method", "-f", "-F", "--field", "--raw-field", "--input") or x.startswith("--method")})
                        fam2[f"gh {t[1]} {sub} {' '.join(flags)}".strip()] += 1
                    elif t[:1] == ["curl"]:
                        hosts = {"localhost" if re.search(r"(localhost|127\.0\.0\.1)", x) else "<remote>" for x in t if "://" in x or x.startswith(("localhost", "127."))}
                        wr = sorted({x for x in t if x in ("-X", "-d", "--data", "-F", "--form", "-T", "--upload-file", "-o", "-O", "--output")})
                        fam2[f"curl {' '.join(sorted(hosts)) or '<nohost>'} {' '.join(wr)}".strip()] += 1
                    elif t[:2] in (["git", "checkout"], ["git", "merge-base"], ["git", "pull"]):
                        fam2[" ".join(t[:2] + sorted({x for x in t[2:] if x.startswith("-")})) + (" <path-args>" if "--" in t or "." in t[2:] else "")] += 1
                    for p in CANDIDATES:
                        if rx(p).fullmatch(rs) or rx(p).fullmatch(seg):
                            cand[p] += 1; cand_shapes[p][shape(rs, 3)] += 1
                    d = first(R["deny"], rs) or first(R["deny"], seg)
                    if d: deny_hits[(label, d)] += 1; continue
                    a = first(R["ask"], rs) or first(R["ask"], seg)
                    if a:
                        ask_hits[(label, sh)] += 1; ask_by_rule[a] += 1; boxed.append(sh)
                        ask_rule_shapes[a][shape(rs, 1)] += 1; continue
                    if not (first(R["allow"], rs) or first(R["allow"], seg)):
                        unmatched[(mode, sh)] += 1
                        if mode != "auto": noallow.add(c.get("id"))
                if boxed:
                    boxed_calls[label] += 1; boxed_calls["ALL"] += 1
                pending[c.get("id")] = boxed or [shape(rewrite(segments(cmd)[0]))] if segments(cmd) else ["<empty>"]
            elif c.get("type") == "tool_result" and c.get("tool_use_id") in pending:
                txt = c.get("content")
                txt = json.dumps(txt) if not isinstance(txt, str) else txt
                if "doesn't want to proceed" in txt:
                    for sh in pending[c.get("tool_use_id")]: nos[sh] += 1
                pending.pop(c.get("tool_use_id"), None)

def top(counter, n, title):
    print(f"\n## {title}")
    for k, v in counter.most_common(n):
        print(f"{v:6}  {k if isinstance(k, str) else '  |  '.join(k)}")

print(f"Bash calls: {calls}   sessions: {sum(len(s) for s in proj_sess.values())}")
for p in proj_calls: print(f"  {p:18} calls {proj_calls[p]:6}  sessions {len(proj_sess[p])}")
print("modes (per call):", dict(modes))
print("BOXED CALLS:", dict(boxed_calls))
print("NON-AUTO calls with a part no allow rule covers (box in default mode unless built-in read-only):", len(noallow))
if os.environ.get("S4_TOTALS"): sys.exit(0)
top(ask_by_rule, 40, "Ask rules that fired (each = a box in any mode)")
print("\n## Ask rule -> what hit it (command + first token)")
for a, n in ask_by_rule.most_common(45):
    print(f"{n:6}  {a}   " + "; ".join(f"{s} x{c}" for s, c in ask_rule_shapes[a].most_common(6)))
if os.environ.get("S4_FAM"):
    top(fam2, 50, "gh / curl / checkout / merge-base / pull shapes")
if os.environ.get("S4_SHORT"): sys.exit(0)
top(ask_hits, 40, "Ask hits by project | command shape")
top(nos, 25, "Your 'No' clicks by command shape")
top(deny_hits, 15, "Deny hits by project | rule")
top(collections.Counter({k: v for k, v in unmatched.items() if k[0] != "auto"}), 30, "Non-auto mode: matched no rule (box or auto check) | mode | shape")
top(collections.Counter({k[1]: v for k, v in unmatched.items() if k[0] == "auto"}), 30, "Auto mode: matched no rule (auto-mode check decides) | shape")
print("\n## Candidate rules: past matches")
for p in CANDIDATES:
    print(f"{cand[p]:6}  {p}   " + "; ".join(f"{s} x{n}" for s, n in cand_shapes[p].most_common(4)))
top(fam, 80, "Risky families: project | shape")
```
