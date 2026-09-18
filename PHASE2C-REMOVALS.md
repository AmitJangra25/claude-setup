# Phase 2c — Group B one-off leftovers, proposed for removal

Generated 2026-09-18. **B1 (14) and B2 (9) were approved and removed on 2026-09-18.**
**B3 (74) was held by choice — see D21.** The 3 flagged rules at the end are
still undecided. Restore point: `~/.claude/backups/2026-09-18-phase2c/`.

Every rule below is an `allow` rule, so removing one can only ever ADD a prompt.
The exact rule text lives in `PHASE2C-REMOVALS.json` beside this file — the 2a/2b
list truncated its rules, which cost a round of re-matching. This one does not.

- **B1 — dead operand.** The file the command acts on no longer exists. Same
  standard as Group A; 2a missed these because it only tested *absolute* paths.
- **B2 — spent edit.** The target file is live, but the `sed` search string has
  already been replaced, so re-running it would be a no-op.
- **B3 — pipeline fragment.** A read-only stage of one past compound command
  (`echo`, `awk`, `grep`, `sort`). No side effects. Removing only declutters.

| # | Project | File | Group | Rule | Why |
|---|---|---|---|---|---|
| 1 | Debugger v2 | settings.json | B3 | `Bash(echo "IDENTICAL — exit $?")` | pipeline fragment — read-only, tied to one past command |
| 2 | Debugger v2 | settings.json | B1 | `Bash(node out/rules.test.js)` | operand gone: out/rules.test.js |
| 3 | Debugger v2 | settings.json | B3 | `Bash(sed -e "s#\\.\\/requestRules'#./requestRules'#")` | pipeline fragment — read-only, tied to one past command |
| 4 | Debugger v2 | settings.json | B2 | `Bash(sed -i '' -e 's\|INTEGRATION.md#step-7--tune-the-ignore-rules-for-your-stage-environment\|INTEGRATION.md#step-7-tune-the-ignore-rules-for-your-stage-environment\|g' -e 's\|INTEGRATION.md#step-6--wire-the-api-layer\|INTEGRATION.md#step-6-wire-the-api-layer\|g' README.md)` | spent: each search string verified absent from its live target file |
| 5 | Debugger v2 | settings.json | B3 | `Bash(sort -u -t: -k3)` | pipeline fragment — read-only, tied to one past command |
| 6 | FinNode | settings.json | B3 | `Bash(echo "EXIT=$?")` | pipeline fragment — read-only, tied to one past command |
| 7 | FinNode | settings.json | B1 | `Bash(unzip -q -o gradle.zip)` | operand gone: gradle.zip |
| 8 | FinNode | settings.json | B3 | `Bash(echo "--- emulator bin ---")` | pipeline fragment — read-only, tied to one past command |
| 9 | FinNode | settings.local.json | B3 | `Bash(echo "push_exit=$?")` | pipeline fragment — read-only, tied to one past command |
| 10 | Voice Flow_v1 | settings.json | B3 | `Bash(echo "started with pid $!")` | pipeline fragment — read-only, tied to one past command |
| 11 | Voice Flow_v1 | settings.json | B3 | `Bash(grep -v "ExperimentalWarning\\\|--import\\\|Use \\`node\\\|^$")` | pipeline fragment — read-only, tied to one past command |
| 12 | Voice Flow_v1 | settings.json | B3 | `Bash(grep -n "^import { useState, useEffect }" src/app/pages/History.tsx)` | pipeline fragment — read-only, tied to one past command |
| 13 | Voice Flow_v1 | settings.json | B3 | `Bash(grep -viE "ExperimentalWarning\|Use \\`node\|^\\\(node:\|^$")` | pipeline fragment — read-only, tied to one past command |
| 14 | Voice Flow_v1 | settings.json | B3 | `Bash(cat)` | pipeline fragment — read-only, tied to one past command |
| 15 | Voice Flow_v1 | settings.json | B1 | `Bash(swiftc extract_frames.swift -o extract_frames -framework AVFoundation -framework AppKit)` | operand gone: extract_frames.swift |
| 16 | Voice Flow_v1 | settings.json | B1 | `Bash(./extract_frames ~/Documents/"VoiceFlow recording.mov" ./frames)` | operand gone: the extract_frames binary |
| 17 | Voice-Flow | settings.json | B3 | `Bash(xargs -0 du -k)` | pipeline fragment — read-only, tied to one past command |
| 18 | Voice-Flow | settings.json | B3 | `Bash(echo "\(exit $?\)")` | pipeline fragment — read-only, tied to one past command |
| 19 | Voice-Flow | settings.json | B3 | `Bash(echo "\(tsc exit $?\)")` | pipeline fragment — read-only, tied to one past command |
| 20 | Voice-Flow | settings.json | B3 | `Bash(echo "--- exit: $? ---")` | pipeline fragment — read-only, tied to one past command |
| 21 | Voice-Flow | settings.json | B3 | `Bash(echo "exit=$?")` | pipeline fragment — read-only, tied to one past command |
| 22 | Voice-Flow | settings.json | B3 | `Bash(echo "=== exit code: $? ===")` | pipeline fragment — read-only, tied to one past command |
| 23 | Voice-Flow | settings.json | B3 | `Bash(echo "EXIT CODE = $?")` | pipeline fragment — read-only, tied to one past command |
| 24 | Voice-Flow | settings.json | B3 | `Bash(env)` | pipeline fragment — read-only, tied to one past command |
| 25 | Voice-Flow | settings.json | B3 | `Bash(awk '{print "ahead:",$1," behind:",$2}')` | pipeline fragment — read-only, tied to one past command |
| 26 | Voice-Flow | settings.json | B3 | `Bash(awk '{print "ahead:",$1,"  behind:",$2}')` | pipeline fragment — read-only, tied to one past command |
| 27 | Voice-Flow | settings.json | B3 | `Bash(grep -i '\\.app$')` | pipeline fragment — read-only, tied to one past command |
| 28 | Voice-Flow | settings.json | B3 | `Bash(echo "launched, exit $?")` | pipeline fragment — read-only, tied to one past command |
| 29 | Voice-Flow | settings.json | B3 | `Bash(awk '{print $2, $11, $12, $13}')` | pipeline fragment — read-only, tied to one past command |
| 30 | Voice-Flow | settings.json | B3 | `Bash(echo "EXIT CODE: $?")` | pipeline fragment — read-only, tied to one past command |
| 31 | Voice-Flow | settings.json | B3 | `Bash(echo "EXIT: $?")` | pipeline fragment — read-only, tied to one past command |
| 32 | Voice-Flow | settings.json | B3 | `Bash(:)` | pipeline fragment — read-only, tied to one past command |
| 33 | Voice-Flow | settings.json | B3 | `Bash(awk '{print $2, $11, $12}')` | pipeline fragment — read-only, tied to one past command |
| 34 | Voice-Flow | settings.json | B3 | `Bash(awk '{print $2, $11}')` | pipeline fragment — read-only, tied to one past command |
| 35 | Voice-Flow | settings.json | B3 | `Bash(grep -v "duplicate dependency\\\|^$")` | pipeline fragment — read-only, tied to one past command |
| 36 | Voice-Flow | settings.json | B3 | `Bash(awk '{print $1, $2}')` | pipeline fragment — read-only, tied to one past command |
| 37 | Voice-Flow | settings.json | B3 | `Bash(grep -E "\\.app$")` | pipeline fragment — read-only, tied to one past command |
| 38 | Voice-Flow | settings.json | B3 | `Bash(echo "exit:$?")` | pipeline fragment — read-only, tied to one past command |
| 39 | Voice-Flow | settings.json | B3 | `Bash(grep -iB0 -A0 "voice")` | pipeline fragment — read-only, tied to one past command |
| 40 | Voice-Flow | settings.json | B3 | `Bash(awk '/^-+$/{blk=""} {blk=blk"\\n"$0} /com\\.voiceflow\\.desktop/{print blk"\\n===="; blk=""}')` | pipeline fragment — read-only, tied to one past command |
| 41 | Voice-Flow | settings.json | B3 | `Bash(echo "=== exit: $? ===")` | pipeline fragment — read-only, tied to one past command |
| 42 | Voice-Flow | settings.json | B3 | `Bash(awk '/^-+$/{blk=""} {blk=blk"\\n"$0} /com\\.voiceflow\\.desktop/{print blk; blk=""}')` | pipeline fragment — read-only, tied to one past command |
| 43 | Voice-Flow | settings.json | B3 | `Bash(awk '{print "installed:", $6, $7, $8}')` | pipeline fragment — read-only, tied to one past command |
| 44 | Voice-Flow | settings.json | B3 | `Bash(awk '{print $1/1073741824" GB"}')` | pipeline fragment — read-only, tied to one past command |
| 45 | Voice-Flow | settings.json | B3 | `Bash(echo "RAM bytes: $\(sysctl -n hw.memsize\)")` | pipeline fragment — read-only, tied to one past command |
| 46 | Voice-Flow | settings.json | B3 | `Bash(echo "open exit: $?")` | pipeline fragment — read-only, tied to one past command |
| 47 | Voice-Flow | settings.json | B2 | `Bash(sed -i '' 's\|Rather than guess, the path was instrumented. After a dictation the Recorder\|Rather than guess, the path was instrumented. After a dictation the Compose page\|; s\|badge on the Recorder and saved into `history.json`. This is what makes the\|badge on the Compose page and saved into `history.json`. This is what makes the\|' docs/backlog.md)` | spent: each search string verified absent from its live target file |
| 48 | Voice-Flow | settings.json | B2 | `Bash(sed -i '' 's\|\\[package-upgrade-log\\.md\\]\(package-upgrade-log\\.md\)\|[package-upgrade-log.md]\(archive/package-upgrade-log.md\)\|g' docs/backlog.md)` | spent: each search string verified absent from its live target file |
| 49 | Voice-Flow | settings.json | B2 | `Bash(sed -i '' 's\|`product-specification\\.md` \(design system\|`archive/product-specification.md` \(design system\|' docs/code-conventions.md)` | spent: each search string verified absent from its live target file |
| 50 | Voice-Flow | settings.json | B2 | `Bash(sed -i '' 's\|\\[docs/product-specification\\.md\\]\(docs/product-specification\\.md\)\|[docs/archive/product-specification.md]\(docs/archive/product-specification.md\)\|' README.md)` | spent: each search string verified absent from its live target file |
| 51 | Voice-Flow | settings.json | B1 | `Bash(sed -i '' "s\|import { describe, it } from 'vitest';\|import { describe, it } from 'vitest';\\nimport { writeFileSync } from 'node:fs';\\nconst lines: string[] = [];\|" src/app/lib/__tests__/zz-doc-audit.test.ts)` | operand gone: src/app/lib/__tests__/zz-doc-audit.test.ts |
| 52 | Voice-Flow | settings.json | B1 | `Bash(sed -i '' "s\|      console.log\(\\`\\\\\\\\n--- \\${label} ---\\\\\\\\n\\${JSON.stringify\(out\)}\\\\\\\\n\\${out}\\`\);\|      lines.push\(\\`--- \\${label} ---\\\\\\\\n\\${JSON.stringify\(out\)}\\`\);\|" src/app/lib/__tests__/zz-doc-audit.test.ts)` | operand gone: src/app/lib/__tests__/zz-doc-audit.test.ts |
| 53 | Voice-Flow | settings.json | B2 | `Bash(sed -i '' 's\|Ten documents live in `docs/`, indexed in\|Seven live documents and three archived ones sit in `docs/`, indexed in\|' README.md)` | spent: each search string verified absent from its live target file |
| 54 | Voice-Flow | settings.json | B1 | `Bash(chmod +x whisper-flags.sh)` | operand gone: whisper-flags.sh |
| 55 | Voice-Flow | settings.json | B1 | `Bash(./whisper-flags.sh)` | operand gone: whisper-flags.sh |
| 56 | Voice-Flow | settings.json | B1 | `Bash(chmod +x whisper-flags2.sh)` | operand gone: whisper-flags2.sh |
| 57 | Voice-Flow | settings.json | B1 | `Bash(./whisper-flags2.sh)` | operand gone: whisper-flags2.sh |
| 58 | Voice-Flow | settings.json | B3 | `Bash(break)` | pipeline fragment — read-only, tied to one past command |
| 59 | Voice-Flow | settings.json | B3 | `Bash(grep -vE "^[+-]{2,}")` | pipeline fragment — read-only, tied to one past command |
| 60 | Voice-Flow | settings.json | B2 | `Bash(sed -i '' -e 's\|\\[backlog\\.md\\]\(backlog\\.md\) §4\|[archive/backlog-old.md]\(archive/backlog-old.md\) §4\|g' docs/local-models.md)` | spent: each search string verified absent from its live target file |
| 61 | Voice-Flow | settings.json | B2 | `Bash(sed -i '' -e 's\|\\[backlog\\.md\\]\(backlog\\.md\) §3\|[archive/backlog-old.md]\(archive/backlog-old.md\) §3\|g' -e 's\|`backlog\\.md` §3\|`archive/backlog-old.md` §3\|g' docs/manual-testing.md)` | spent: each search string verified absent from its live target file |
| 62 | Voice-Flow | settings.json | B2 | `Bash(sed -i '' -e 's\|`docs/backlog\\.md` §3\|`docs/archive/backlog-old.md` §3\|g' -e 's\|`docs/backlog\\.md` §0\\.1\|`docs/archive/backlog-old.md` §0.1\|g' -e 's\|`docs/backlog\\.md` §0\\.2\|`docs/archive/backlog-old.md` §0.2\|g' -e 's\|`docs/backlog\\.md` §0\\.3\|`docs/archive/backlog-old.md` §0.3\|g' -e 's\|`roadmap\\.md` §6\|`docs/roadmap.md`'"'"'s security table\|g' CLAUDE.md)` | spent: each search string verified absent from its live target file |
| 63 | Voice-Flow | settings.json | B3 | `Bash(python3 -m json.tool)` | pipeline fragment — read-only, tied to one past command |
| 64 | Voice-Flow | settings.json | B3 | `Bash(awk '{print "RAM:", $1/1e9, "GB"}')` | pipeline fragment — read-only, tied to one past command |
| 65 | Voice-Flow | settings.json | B3 | `Bash(echo "EXIT=$?")` | pipeline fragment — read-only, tied to one past command |
| 66 | Voice-Flow | settings.json | B3 | `Bash(awk '{print $2}')` | pipeline fragment — read-only, tied to one past command |
| 67 | Voice-Flow | settings.local.json | B3 | `Bash(echo "---exit $?")` | pipeline fragment — read-only, tied to one past command |
| 68 | Voice-Flow | settings.local.json | B3 | `Bash(grep -iE "\\.DS_Store\|^dist/\|^release/\|\\.bak$\|\\.orig$\|copy\|old")` | pipeline fragment — read-only, tied to one past command |
| 69 | Voice-Flow | settings.local.json | B3 | `Bash(grep -nE "^#{1,3} ")` | pipeline fragment — read-only, tied to one past command |
| 70 | Voice-Flow | settings.local.json | B3 | `Bash(echo "  running? $\(pgrep -f 'MacOS/Voice Flow$' >/dev/null && echo yes \|\| echo no\)")` | pipeline fragment — read-only, tied to one past command |
| 71 | Voice-Flow | settings.local.json | B3 | `Bash(echo "unregister exit: $?")` | pipeline fragment — read-only, tied to one past command |
| 72 | Voice-Flow | settings.local.json | B3 | `Bash(echo "gc exit: $?")` | pipeline fragment — read-only, tied to one past command |
| 73 | Voice-Flow | settings.local.json | B3 | `Bash(echo "package.json name:      $\(node -p "require\('./package.json'\).name"\)")` | pipeline fragment — read-only, tied to one past command |
| 74 | Voice-Flow | settings.local.json | B3 | `Bash(echo "package-lock.json name: $\(node -p "require\('./package-lock.json'\).name"\)")` | pipeline fragment — read-only, tied to one past command |
| 75 | Voice-Flow | settings.local.json | B3 | `Bash(echo "exit: $?")` | pipeline fragment — read-only, tied to one past command |
| 76 | Voice-Flow | settings.local.json | B3 | `Bash(echo "npm version: $\(npm -v\)")` | pipeline fragment — read-only, tied to one past command |
| 77 | Voice-Flow | settings.local.json | B3 | `Bash(echo "lockfileVersion in our lock: $\(node -p "require\('./package-lock.json'\).lockfileVersion"\)")` | pipeline fragment — read-only, tied to one past command |
| 78 | Voice-Flow | settings.local.json | B3 | `Bash(echo "--- new lockfileVersion: $\(node -p "require\('./package-lock.json'\).lockfileVersion"\)")` | pipeline fragment — read-only, tied to one past command |
| 79 | Voice-Flow | settings.local.json | B3 | `Bash(echo "lockfileVersion now: $\(node -p "require\('./package-lock.json'\).lockfileVersion"\)")` | pipeline fragment — read-only, tied to one past command |
| 80 | Voice-Flow | settings.local.json | B3 | `Bash(echo "--- lockfileVersion restored: $\(node -p "require\('./package-lock.json'\).lockfileVersion"\)")` | pipeline fragment — read-only, tied to one past command |
| 81 | Voice-Flow | settings.local.json | B3 | `Bash(echo "package.json version: $\(node -p "require\('./package.json'\).version"\)")` | pipeline fragment — read-only, tied to one past command |
| 82 | Voice-Flow | settings.local.json | B3 | `Bash(echo "package.json version -> $\(node -p "require\('./package.json'\).version"\)")` | pipeline fragment — read-only, tied to one past command |
| 83 | Voice-Flow | settings.local.json | B3 | `Bash(echo "lockfileVersion -> $\(node -p "require\('./package-lock.json'\).lockfileVersion"\)")` | pipeline fragment — read-only, tied to one past command |
| 84 | Voice-Flow | settings.local.json | B3 | `Bash(echo "lock version field -> $\(node -p "require\('./package-lock.json'\).version"\)")` | pipeline fragment — read-only, tied to one past command |
| 85 | Voice-Flow | settings.local.json | B3 | `Bash(echo "exit code: $?")` | pipeline fragment — read-only, tied to one past command |
| 86 | Voice-Flow | settings.local.json | B1 | `Bash(sed -i '' 's\|> Groq is the fastest but the free tier rate limits under load.\|> Groq is the fastest but the free tier rate limits under heavy load.\|' docs/testing.md)` | operand gone: docs/testing.md |
| 87 | Voice-Flow | settings.local.json | B1 | `Bash(BASE=http://localhost:5173 OUT=./shots2 node shoot.mjs)` | operand gone: shoot.mjs |
| 88 | Voice-Flow | settings.local.json | B1 | `Bash(BASE=http://localhost:5173 OUT=./shots3 node shoot.mjs)` | operand gone: shoot.mjs |
| 89 | Voice-Flow | settings.local.json | B1 | `Bash(awk 'NR>=856' docs/plan.md)` | operand gone: docs/plan.md |
| 90 | Voice-Flow | settings.local.json | B3 | `Bash(awk '{print $1}')` | pipeline fragment — read-only, tied to one past command |
| 91 | Voice-Flow | settings.local.json | B3 | `Bash(grep -c "com.voiceflow.desktop$")` | pipeline fragment — read-only, tied to one past command |
| 92 | Voice-Flow | settings.local.json | B3 | `Bash(grep -i "\\.app$")` | pipeline fragment — read-only, tied to one past command |
| 93 | Voice-Flow | settings.local.json | B3 | `Bash(echo "=== exit: $? \(empty = nothing in retained logs\) ===")` | pipeline fragment — read-only, tied to one past command |
| 94 | Voice-Flow | settings.local.json | B3 | `Bash(awk '{print " "$4" available"}')` | pipeline fragment — read-only, tied to one past command |
| 95 | Vthru_Emp_v2.1_jun26 | settings.local.json | B3 | `Bash(jobs)` | pipeline fragment — read-only, tied to one past command |
| 96 | v1.1-Packbly | settings.local.json | B3 | `Bash(sort -t: -k2 -n -r)` | pipeline fragment — read-only, tied to one past command |
| 97 | vthrudebugger_v1 | settings.local.json | B3 | `Bash(echo "exit: $?")` | pipeline fragment — read-only, tied to one past command |

---

## Flagged, NOT proposed — 3 rules whose matching semantics are unverified

These are spent one-off doc edits like group B2, and the search string was
verified absent from each live target file. They are held back because the
`sed` text contains a literal `*` (markdown bold), and I have not verified
whether Claude Code's permission matcher treats that as a glob wildcard. If it
does, these rules match more broadly than they appear to, which changes what
removing them means. Decide separately.

1. `Bash(sed -i '' 's|`__tests__/` beside the code, `\\*.test.ts\(x\)`. 926 tests today, and the ones|`__tests__/` beside the code, `*.test.ts\(x\)`. 955 tests today, and the ones|' docs/code-conventions.md)`

2. `Bash(sed -i '' 's|\(\\*\\*44 files, 926 tests, all green\\*\\* as of 16 Aug 2026|\(**47 files, 955 tests, all green** as of 17 Aug 2026|' docs/roadmap.md)`

3. `Bash(sed -i '' 's;| \\*\\*Total Test Count\\*\\* | 1000+ | 763 | Phase 4 |;| **Total Test Count** | 1000+ | 955 | Phase 4 |;' docs/unit-test-coverage.md)`

