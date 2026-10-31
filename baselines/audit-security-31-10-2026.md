# Audit — Stage C, security · 31-10-2026

Read-only security audit of Claude Setup (`~/.claude`), stage C of the three-stage audit
approved 31-10-2026 (`.claude/current-task.md`). Opus, main session; one independent Opus
reviewer; one Opus verifier for every candidate P1/P2.

## 1. Summary

**No active leak, no exposed secret, no unauthorised action found within the checked
scope.** Scans of every tracked text file, the full git history and both tarballs found no
secret-shaped strings; the Voice-Flow bundle's contents were not scanned (C12). No private
store (transcripts, `history.jsonl`, `paste-cache/`, `backups/`, `.env`) has ever been
tracked. The GitHub repo is private and the `gh` token is in the Keychain.

**0 P1, 0 P2, 8 P3, 5 P4.** The candidate P2s were all downgraded when checked by the
verifier. The three P3s that matter most:
- **C1:** `cat`, `grep` and `find` can read any file on the Mac with no box. The global
  allow rules plus the rtk rewrite let this through. This widens the known F3 item.
- **C2:** rtk sends daily usage telemetry. No setup doc mentions it.
- **C3:** rtk's hook makes its own "allow" decision for `git add`, so `ENVIRONMENT.md`
  describes that behaviour wrongly.

Rough total to fix everything: about 50k tokens. To fix C1 to C3 only: about 17k.

## 2. Findings by severity

| Severity | Count |
|---|---|
| P1 | 0 |
| P2 | 0 (3 candidates, all downgraded by the verifier) |
| P3 | 8 |
| P4 | 5 |

## 3. Findings

### P3: limited impact, normal work

**C1. Bash reads any file on the Mac with no box — confirmed in auto mode and through rtk
hook dry runs; default-mode behaviour was not tested.** Size: small-medium.
About 10k tokens to plan and fix.
- **Evidence:** `settings.json:13,26,28-31,33` allow `rtk find *`, `rtk grep *`,
  `rtk proxy cat|find|grep|ls *` and `rtk read *` with a bare `*`. The only denies are the
  `.env` spellings at `:47-80`. The hook rewrites `cat ~/.ssh/id_ed25519` to
  `rtk read ~/.ssh/id_ed25519` (dry run), and that rule allows it.
  `blockReadsOutsideWorkingDirectories` (`:272`) does not cover an allowed Bash rule. The
  verifier could not confirm that key is documented at all.
- **What is exposed:** SSH and Ollama keys, `history.jsonl`, `~/.claude.json`, and other
  projects' personal data (Emp Portal). All are readable without a box. Only the
  `STANDARDS.md` prose stops it. Harm needs a Claude mistake or a prompt injection.
- **Why not P2:** no normal-use step is known that reads these files. It is the same root
  as F3, which is known and accepted (`harness/status.md:156`,
  `baselines/s4-permissions-30-10-2026.md:141-142`). F3 was framed as "more denies"; the
  wider scope is new.
- **Recommendation:** decide F3 again with this evidence. If fixing, add deny rules for
  `~/.ssh`, `~/.ollama/id_*`, `history.jsonl`, `.claude.json`, `paste-cache/` and
  `projects/*/*.jsonl`. Cover every spelling the hook produces (`rtk read`, `rtk grep`,
  `rtk find`, `rtk proxy *`) and add the matching `Read(...)` denies. Test each rule.

**C2. rtk sends usage telemetry off the Mac daily, and no doc records it.** Size: small.
About 3k tokens.
- **Evidence:** `~/Library/Application Support/rtk/config.toml:31-34` shows telemetry
  enabled, with consent given 24-07-2026. `rtk telemetry status` reports "enabled: yes".
  `.telemetry_last_ping` changed 31-10-2026 16:58. The endpoint in the binary is
  `telemetry.rtk-ai.app/ping`. A grep for "telemetry" across `ENVIRONMENT.md`,
  `SETUP-PLAN.md` and `harness/status.md` finds nothing.
- **What is sent:** per rtk's public `docs/TELEMETRY.md`, a device hash, counts, the top
  five command names (which can include a subcommand) and savings figures. No arguments,
  paths or output. The real payload was not captured.
- **Recommendation:** Amit decides. Either run `rtk telemetry disable` (plus
  `rtk telemetry forget`) and record it, or record it as accepted.
- **Fixed 31-10-2026, approved by Amit:** `rtk telemetry disable` ran. `rtk telemetry
  status` now reports "consent: no, enabled: no", and `config.toml:32-33` reads
  `enabled = false`, `consent_given = false`. rtk still works (`rtk gain`). Not done:
  `rtk telemetry forget`, which would delete local data and ask the server to erase
  past data; Amit did not ask for it.

**C3. The rtk hook returns its own "allow" for `git add`; `ENVIRONMENT.md` says
otherwise.** Size: small. About 4k tokens.
- **Evidence:** dry runs of `git add -f history.jsonl`, `git add foo/.env` and
  `git add -A` return `"permissionDecision":"allow"`. rtk takes this from `Bash(git add *)`
  in `settings.local.json:4` and `.claude/settings.local.json:6`.
- **What still holds:** rtk withholds "allow" when any part of the command matches an ask
  rule (`git add . && git push`, `&& git commit`, `--output`). Commit and push still box.
- **Doc conflict:** `ENVIRONMENT.md:224-229` says these rules "never match anything" and
  that default mode should box. The first is not true. On the second: rtk returns allow
  for `git add`; whether Claude Code lets that hook allow override its own ask or deny
  rules in default mode was not tested live.
- **What the docs say:** Claude Code's hooks reference says ask and deny rules are still
  evaluated whatever the hook returns (`baselines/global-open-tests.md` item 11, closed
  from the docs 10-10-2026). With no ask or deny rule for `git add`, that does not stop it.
- **Recommendation:** correct `ENVIRONMENT.md` § 3 and the matching FinNode backlog 6
  note. Optionally remove the two `git add *` rules so that default mode boxes again.

**C4. `gh gist` is not boxed, and the token has the `gist` scope.** Size: small. About 3k
tokens.
- **Evidence:** `gh auth status` shows scopes `gist, read:org, repo, workflow`.
  `settings.json:170-238` boxes `gh pr|repo|auth|api` only.
- **Scenario:** `gh gist create <file>` publishes a file in one step. In auto mode only
  the classifier stands in the way (`settings.json:359`). Default mode boxes it.
- **Likelihood:** low. It needs an injection plus a classifier miss.
- **Note:** F2 (accepted) named release, secret and workflow, not gist.
- **Recommendation:** add `Bash(*gh gist create*)` and `Bash(*gh gist edit*)` to ask, or
  drop the `gist` scope.

**C5. Ollama's cloud is not disabled, and the `ollama-do` loopback guard can be
bypassed.** Size: small. About 5k tokens.
- **Evidence:** `~/.ollama/server.json` has `disable_ollama_cloud: false`.
  `~/.ollama/config.json` has a `claude-desktop` integration that maps to `:cloud` models.
  It is not wired up today (reviewer checked: no `ANTHROPIC_BASE_URL`, no Desktop entry).
  `ollama run x:cloud` is not boxed; only pull, rm and signin are (`settings.json:136-138`).
- **Guard bypass:** `~/.local/bin/ollama-do:42` accepts
  `OLLAMA_HOST=http://localhost:11434@example.com`, and curl then sends to example.com.
  Setting that variable needs control of the environment, such as a cloned repo's settings
  `env` block. The IPv6 `[::1]` pattern fails safe.
- **Recommendation:** set `disable_ollama_cloud: true`. Make the guard reject `@` and
  parse the host exactly. Box `ollama run *:cloud`.

**C6. The pdf-viewer plugin runs an unpinned npm package at every session start, outside
the permission system.** Size: small. About 2k tokens.
- **Evidence:** `plugins/synced/<acct>/pdf-viewer~g2/.mcp.json` runs
  `npx -y @modelcontextprotocol/server-pdf --stdio` with no version. The process is
  running now. The plugin is on because it is absent from `enabledPlugins`
  (`settings.json:330-344`). `ENVIRONMENT.md:454` records it as kept for cost reasons only.
- **Scenario:** a compromised npm release runs as Amit at session start. The
  `*npx -y*` ask rule never sees it.
- **Recommendation:** set `"pdf-viewer@synced": false` unless PDFs are used, or record it
  as accepted.

**C7. Mirror and memory copies reach GitHub with no secret check.** Size: small. About 4k
tokens.
- **Evidence:** `.gitignore:54` tracks project `settings.local.json` copies, which are
  built from click-allowed commands. `.gitignore:79-82` tracks memory Claude writes.
  `sync.sh:50` copies with no check. `session-check.sh:14` looks only for the
  `rtk proxy *` rule. Everything is clean today.
- **Scenario:** a click-allowed `curl -H "Authorization: Bearer …"` in a project, then
  `sync.sh --pull`, commit and push, sends the token to the private GitHub repo.
- **Recommendation:** add a secret-pattern grep (the pattern used in § 4) to `drift.sh`.

**C8. Allowed test and build commands can run any code.** Size: small. About 1k tokens.
- **Evidence:** `project-rules/FinNode/.claude/settings.json:4` (`./gradlew *`),
  `Voice-Flow/.claude/settings.json:15,69`, `Voice-Flow/.claude/settings.local.json:7`,
  `Debugger v2/.claude/settings.json:5,9`, `vthrudebugger_v1/.claude/settings.local.json:13,17`.
- **Scenario:** Claude edits a script or a test, then runs it under the allow. The script
  can `curl`, `push` or `rm` with no box.
- **Recommendation:** a normal development trade-off. Record it as known and accepted.

### P4: nice to have

**C9. Claude Desktop has accepted the bypass-mode warning and scheduled tasks are on.**
Size: small. About 1k tokens.
- **Evidence:** `~/Library/Application Support/Claude/claude_desktop_config.json` key
  names: `bypassPermissionsGateByAccount.<acct> = true`, `ccdScheduledTasksEnabled` and
  `coworkScheduledTasksEnabled = true`. Read by key name only.
- **Verifier:** this means bypass mode is available, not that it is on. No sign it was
  ever used: no `defaultMode` or `bypassPermissions` setting anywhere, and no
  `scheduled-tasks` folder. Outside `~/.claude`.
- **Recommendation:** Amit confirms this is intended. Optionally add
  `"disableBypassPermissionsMode": "disable"` to `settings.json`.

**C10. Claude Code's own telemetry and nonessential traffic are not switched off.** Size:
small. About 2k tokens.
- **Evidence:** the `settings.json:3-5` `env` block sets neither `DISABLE_TELEMETRY` nor
  `CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC`.
- **Recommendation:** Amit decides, together with C2.

**C11. Account and org UUIDs and Amit's email addresses are in a tracked file.** Size:
small. About 2k tokens.
- **Evidence:** `SETUP-PLAN.md:2063` holds both UUIDs, although `.gitignore:10` lists
  account UUIDs as never-in. `SETUP-PLAN.md:3,2064,2232,2235` hold the owner's own
  v-thru.com and gmail.com addresses.
- **Impact:** fine while the repo is private.
- **Recommendation:** raise it before the repo goes public, as `STANDARDS.md` § *Git*
  already requires. Optionally mask the UUIDs.

**C12. The Voice-Flow git bundle's file contents have never been secret-scanned.** Size:
small-medium. About 5k tokens.
- **Evidence:** `archive/voice-flow-pre-rewrite-2026-09-21.bundle` holds a whole project's
  history and is tracked. `archive/README.md:18-19` says it is why the repo must stay
  private. Scanning it means unpacking into a scratch repo, which is a write, so it was
  left out of this read-only stage.
- **Recommendation:** with Amit's OK, clone it into `/tmp`, scan it, then delete the
  scratch copy.

**C13. rtk keeps large local command logs.** Size: small. About 2k tokens.
- **Evidence:** `~/Library/Application Support/rtk/history.db` is 20 MB with 90-day
  retention (`config.toml:3`). The reviewer measured a 6.6 MB `hook-audit.log`, never
  trimmed and switched on by `RTK_HOOK_AUDIT=1` at `settings.json:4`. Both are mode 600
  and local only.
- **Recommendation:** decide whether the audit log is still needed. If not, unset the
  variable.

## 4. Technical detail

- **Secret scan.** Pattern: `sk-`, `sk_live_`, `ghp_`, `gho_`, `github_pat_`, `AKIA…`,
  `AIza…`, private-key headers, `xox?-`, JWT, and `api_key|secret|token|password = <12+>`.
  - Proven first on fakes: 4 of 4 caught, the clean line not.
  - Scanned: the tracked working tree — 102 tracked files at scan time, 0 secret-pattern
    matches; `git log --all -G` (0 commits); both tarballs streamed (0 and 0); mirrors
    (0, reviewer). Compressed files cannot be searched as text: the tarballs were
    streamed separately, the Voice-Flow bundle was not scanned (C12). These patterns do
    not catch every possible secret format. Re-run 01-11-2026 on 106 tracked files (103
    text, 3 compressed skipped): 0 matches (`baselines/audit-corrections-31-10-2026.md`).
  - Personal data: no phone, Aadhaar or PAN shapes. Emails: only the owner's two.
  - UUIDs in memory files are `originSessionId` only.
- **Git exposure.**
  - `.gitignore` blocks everything, then lists allowed files by name.
  - 102 files are tracked. None is a transcript, `history.jsonl`, `paste-cache/`,
    `backups/`, `file-history/`, a `.env` or a credential.
  - Remote `github.com/AmitJangra25/claude-setup` is `PRIVATE` (`gh repo view`).
  - Private stores: every file is mode 600 (401 of 401 in `paste-cache`, 356 of 356
    transcripts, `history.jsonl`). Folders are 755. The machine has one user.
- **rtk hook.** Dry runs through `rtk hook claude` on stdin.
  - `git status` and `git push` are rewritten with no decision.
  - `git add …` gets "allow" (C3). Any compound containing push, commit or `--output` gets
    no "allow".
  - `.env` reads, `rm`, `$(…)` and `rtk proxy cat … .env` get no output.
  - `cat`, `head` and `grep` of outside paths become `rtk read` or `rtk grep` (C1).
- **Scripts.**
  - `session-check.sh` reads the manifest projects' two settings files and greps them; it
    writes nothing.
  - `drift.sh` has no write path.
  - `sync.sh --pull` writes only `project-rules/<name>/` copies.
  - `statusline/context.py` imports `json, os, sys` only and makes no network calls.
- **Outside flows checked.**
  - WebFetch allows: 7 docs and GitHub domains, GET only.
  - WebSearch is allowed.
  - `curl` and `wget` box in every spelling.
  - `gh` writes box, except gist, issue and release (C4, F2).
  - No user MCP servers (`~/.claude.json` key names only).
  - Plugins: swift-lsp (local) and pdf-viewer (C6). Claude.ai connectors are off
    (`settings.json:275`).
- **Auto mode.**
  - `settings.json:353-379` describes the trust boundary and treats gists and pastebins as
    outside.
  - No `defaultMode` or `bypassPermissions` setting in any `~/.claude` or mirror file.
- **Known and accepted items unchanged:** T1, T2, T3, F1, F2, F4, F6 (`harness/status.md`
  § *Open*). F3 is widened by C1.
- **Could not check:**
  - `~/.claude.json` beyond its MCP key names (off limits).
  - The bundle's contents (C12).
  - The real rtk telemetry payload (needs a network capture).
  - Default-mode permission behaviour for C1 and C3 (both agents ran in auto mode).
  - Whether a hook "allow" overrides ask or deny rules in Claude Code, tested live (the
    docs say it does not — open test 11).
  - Desktop session folders (transcripts).
- **Disagreement settled:** the reviewer said rtk never returns "allow". It had not tested
  `git add`. The main session and the verifier both observed "allow" for it (C3).

## 5. Nothing changed

- During the audit, no rule, setting, script, project file or history file was changed.
- After the report, on Amit's instruction: rtk telemetry was turned off (C2). This is
  rtk's own config, outside `~/.claude`.
- No project folder was written to.
- No `.env`, key or transcript was opened.
- No local content was sent out. The only outside requests were rtk's public doc page and
  `gh repo view` / `gh auth status` (metadata only).
- Writes this stage: this report, `harness/status.md` and `.claude/current-task.md`.

## 6. Checks

| | Before | After |
|---|---|---|
| `drift.sh` | 13 current, 0 drifted, 0 stale, 0 missing | 13 current, 0 drifted, 0 stale, 0 missing |
| `session-check.sh` | silent, exit 0 | silent, exit 0 |

## 7. Token use

| Part | Tokens |
|---|---|
| Independent reviewer, Opus | 92.6k (measured; plan said ~45k) |
| Verifier, Opus | 43.0k (measured; plan said ~15k) |
| Main session | not measurable from inside the session |
