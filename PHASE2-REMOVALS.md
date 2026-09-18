# Phase 2a + 2b — rules proposed for removal

Generated 2026-09-18. **Nothing has been removed.** This is the list to approve.

Every rule below is an `allow` rule. Removing one can only ever ADD a prompt —
it cannot remove a protection or unblock anything.

- **Group A (dead)** — the path it names no longer exists, so it can never match a command again.
- **Group C (redundant)** — a global `ask` rule overrides it, so it has no effect today.

| # | Project | File | Group | Rule | Why |
|---|---|---|---|---|---|
| 1 | Debugger v2 | settings.json | A | `Bash(~/vthrudebugger_v1/node_modules/.bin/tsc --noEmit -p tsconfig.json)` | DEAD — path gone: ~/vthrudebugger_v1 |
| 2 | Voice Flow_v1 | settings.json | A | `Bash(screencapture -x /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow-v2-1-Voice-Flow-v…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 3 | Voice Flow_v1 | settings.json | A | `Bash(sed -i '' 's\|'\\''./electron/focusTarget.js'\\''\|'\\''~/Documents/VS Code/Voice_Flow_v2.1/Voice_Flow_v2…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 4 | Voice Flow_v1 | settings.json | A | `Bash(node /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow-v2-1-Voice-Flow-v2-1/e82e855b…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 5 | Voice Flow_v1 | settings.json | A | `Bash(sed -i '' 's\|longestStreakTest, \|\|' /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 6 | Voice Flow_v1 | settings.json | A | `Bash(node --experimental-strip-types /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow-v2…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 7 | Voice Flow_v1 | settings.json | A | `Bash(find ~/.npm/_npx -maxdepth 4 -path "*typescript/bin/tsc" 2>/dev/null \| head -3; echo "---"; rtk ls "~/Do…` | DEAD — path gone: ~/Documents/VS Code/Voice_Flow_v2.1 |
| 8 | Voice Flow_v1 | settings.json | A | `Bash(sed -i '' 's\|from '\\''./authState'\\''\|from '\\''./authState.ts'\\''\|' /private/tmp/claude-501/-Users…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 9 | Voice Flow_v1 | settings.json | A | `Bash(node --experimental-strip-types /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow-v2…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 10 | Voice Flow_v1 | settings.json | A | `Bash(cp src/app/lib/historyStore.ts /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow-v2-…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 11 | Voice Flow_v1 | settings.json | A | `Bash(sed -i '' 's\|console.log\(fail === 0\|const ids = getHistory\(\).map\(\(h:any\)=>h.id\); eq\('\\''all id…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 12 | Voice Flow_v1 | settings.json | A | `Bash(env -u ELECTRON_RUN_AS_NODE ./node_modules/.bin/electron /tmp/vf_onboard.cjs)` | DEAD — path gone: /tmp/vf_onboard.cjs |
| 13 | Voice Flow_v1 | settings.json | A | `Bash(env -u ELECTRON_RUN_AS_NODE ./node_modules/.bin/electron /tmp/vf_clean.cjs)` | DEAD — path gone: /tmp/vf_clean.cjs |
| 14 | Voice-Flow | settings.json | A | `Bash(mv electron/__tests__/focusTarget.test.js /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voi…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 15 | Voice-Flow | settings.json | A | `Bash(cd "~/Documents/SecondBrain Obsidian/wiki/projects/project-v-thru" && rtk read app-customer/mod-login.md …` | DEAD — path gone: ~/Documents/SecondBrain Obsidian/wiki/projects/project-v-thru |
| 16 | Voice-Flow | settings.json | A | `Read(/~/Documents/SecondBrain Obsidian/wiki/projects/project-v-thru/**)` | DEAD — path gone: ~/Documents/SecondBrain Obsidian/wiki/projects/project-v-thru |
| 17 | Voice-Flow | settings.json | A | `Bash(/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister …` | DEAD — path gone: ~/Documents/VS Code/Voice_Flow_v2.1 |
| 18 | Voice-Flow | settings.json | A | `Bash(screencapture -x -R0,0,2000,1300 /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/e…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 19 | Voice-Flow | settings.json | A | `Bash(sips -g pixelWidth -g pixelHeight /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 20 | Voice-Flow | settings.json | A | `Bash(screencapture -x /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/e5bf2c4e-8552-4bb…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 21 | Voice-Flow | settings.json | A | `Bash(node /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/e5bf2c4e-8552-4bb9-bd39-b5943…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 22 | Voice-Flow | settings.json | A | `Bash(node /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/e5bf2c4e-8552-4bb9-bd39-b5943…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 23 | Voice-Flow | settings.json | A | `Bash(node /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/e5bf2c4e-8552-4bb9-bd39-b5943…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 24 | Voice-Flow | settings.json | A | `Bash(node /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/e5bf2c4e-8552-4bb9-bd39-b5943…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 25 | Voice-Flow | settings.json | A | `Bash(node /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/e5bf2c4e-8552-4bb9-bd39-b5943…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 26 | Voice-Flow | settings.json | A | `Bash(node /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/e5bf2c4e-8552-4bb9-bd39-b5943…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 27 | Voice-Flow | settings.json | A | `Bash(node /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/e5bf2c4e-8552-4bb9-bd39-b5943…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 28 | Voice-Flow | settings.json | A | `Bash(node /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/e5bf2c4e-8552-4bb9-bd39-b5943…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 29 | Voice-Flow | settings.json | A | `Bash(node /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/e5bf2c4e-8552-4bb9-bd39-b5943…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 30 | Voice-Flow | settings.json | A | `Bash(node /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/e5bf2c4e-8552-4bb9-bd39-b5943…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 31 | Voice-Flow | settings.json | A | `Bash(node /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/e5bf2c4e-8552-4bb9-bd39-b5943…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 32 | Voice-Flow | settings.json | A | `Bash(node /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/e5bf2c4e-8552-4bb9-bd39-b5943…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 33 | Voice-Flow | settings.json | A | `Bash(node /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/e5bf2c4e-8552-4bb9-bd39-b5943…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 34 | Voice-Flow | settings.json | A | `Bash(mkdir -p /tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/fcbe1050-0379-43d3-a3dc-29f38170b…` | DEAD — session scratchpad gone: /tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/fcbe105 |
| 35 | Voice-Flow | settings.json | A | `Bash(env -u ELECTRON_RUN_AS_NODE npx electron /tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/f…` | DEAD — session scratchpad gone: /tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/fcbe105 |
| 36 | Voice-Flow | settings.json | A | `Bash(sed -i '' 's\|/help`\);\|/app/help`\);\|' /tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/…` | DEAD — session scratchpad gone: /tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/fcbe105 |
| 37 | Voice-Flow | settings.json | A | `Bash(env -u ELECTRON_RUN_AS_NODE npx electron /tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/f…` | DEAD — session scratchpad gone: /tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/fcbe105 |
| 38 | Voice-Flow | settings.local.json | A | `Bash(sips -Z 1400 __TRACKED_VAR__/main.png --out /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-V…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 39 | Voice-Flow | settings.local.json | A | `Bash(cp package.json /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/6362b720-61ae-44f2…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 40 | Voice-Flow | settings.local.json | A | `Bash(cp package-lock.json /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/6362b720-61ae…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 41 | Voice-Flow | settings.local.json | A | `Bash(cp package-lock.json /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/6362b720-61ae…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 42 | Voice-Flow | settings.local.json | A | `Bash(cp docs/testing.md /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/6362b720-61ae-4…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 43 | Voice-Flow | settings.local.json | A | `Bash(chmod +x "/private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/b0a3c36e-c4ec-41ee-b554-…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 44 | Voice-Flow | settings.local.json | A | `Bash(bash "/private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/b0a3c36e-c4ec-41ee-b554-3f88…` | DEAD — session scratchpad gone: /private/tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow |
| 45 | vthrudebugger_v1 | settings.local.json | A | `Bash(git -C ~/vthrudebugger_v1 remote -v)` | DEAD — path gone: ~/vthrudebugger_v1 |
| 46 | vthrudebugger_v1 | settings.local.json | A | `Bash(git -C ~/vthrudebugger_v1 status --short)` | DEAD — path gone: ~/vthrudebugger_v1 |
| 47 | vthrudebugger_v1 | settings.local.json | A | `Bash(git -C ~/vthrudebugger_v1 log --oneline -3)` | DEAD — path gone: ~/vthrudebugger_v1 |
| 48 | vthrudebugger_v1 | settings.local.json | A | `Bash(git -C ~/Debugger/vthrudebugger_v1 log --oneline -3)` | DEAD — path gone: ~/Debugger/vthrudebugger_v1 |
| 49 | vthrudebugger_v1 | settings.local.json | A | `Bash(git -C ~/Debugger/vthrudebugger_v1 remote -v)` | DEAD — path gone: ~/Debugger/vthrudebugger_v1 |
| 50 | Voice Flow_v1 | settings.json | A+C | `Bash(rm -f /tmp/vf_auth.cjs /tmp/vf_auth2.cjs /tmp/vf_clean.cjs)` | DEAD — path gone: /tmp/vf_clean.cjs ; also overridden by global ask `rm *` |
| 51 | Voice-Flow | settings.json | A+C | `Bash(cd "~/Documents/VS Code/Voice-Flow" && rm src/app/lib/__tests__/zz-doc-audit.test.ts /tmp/vf-doc-audit.tx…` | DEAD — path gone: /tmp/vf-doc-audit.txt ; also overridden by global ask `rm *` |
| 52 | Voice-Flow | settings.json | A+C | `Bash(rm -rf /tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/fcbe1050-0379-43d3-a3dc-29f38170b4a…` | DEAD — session scratchpad gone: /tmp/claude-501/-Users-amitjangra-Documents-VS-Code-Voice-Flow/fcbe105 ; also overridden by global ask `rm *` |
| 53 | vthrudebugger_v1 | settings.local.json | A+C | `Bash(rm -f ~/vthru-debugger-demo/node_modules/@amitjangra25/vthru-debugger)` | DEAD — path gone: ~/vthru-debugger-demo ; also overridden by global ask `rm *` |
| 54 | Debugger v2 | settings.json | C | `Bash(git rm *)` | REDUNDANT — global ask `git rm *` already overrides this |
| 55 | Debugger v2 | settings.json | C | `Bash(gh api *)` | REDUNDANT — global ask `gh api *` already overrides this |
| 56 | Debugger v2 | settings.json | C | `Bash(gh repo *)` | REDUNDANT — global ask `gh repo *` already overrides this |
| 57 | Vthru_Emp_v2.1_jun26 | settings.json | C | `Bash(npm install *)` | REDUNDANT — global ask `npm install *` already overrides this |
| 58 | Vthru_Emp_v2.1_jun26 | settings.json | C | `Bash(pkill -f "vite")` | REDUNDANT — global ask `pkill *` already overrides this |
| 59 | Vthru_Emp_v2.1_jun26 | settings.local.json | C | `Bash(rtk curl *)` | REDUNDANT — global ask `rtk curl *` already overrides this |
| 60 | Vthru_Emp_v2.1_jun26 | settings.local.json | C | `Bash(curl -s http://127.0.0.1:4000/api/health)` | REDUNDANT — global ask `curl *` already overrides this |
| 61 | FinNode | settings.json | C | `Bash(rtk curl *)` | REDUNDANT — global ask `rtk curl *` already overrides this |
| 62 | FinNode | settings.json | C | `Bash(curl -s --max-time 20 https://repo1.maven.org/maven2/com/google/devtools/ksp/symbol-processing-gradle-plu…` | REDUNDANT — global ask `curl *` already overrides this |
| 63 | FinNode | settings.json | C | `Bash(curl -s -o /dev/null -w "%{http_code}\\n" --max-time 15 "https://plugins.gradle.org/m2/com/google/devtool…` | REDUNDANT — global ask `curl *` already overrides this |
| 64 | FinNode | settings.json | C | `Bash(curl -s -o /dev/null -w "room-runtime 2.8.4 -> %{http_code}\\n" --max-time 15 "https://dl.google.com/dl/a…` | REDUNDANT — global ask `curl *` already overrides this |
| 65 | FinNode | settings.json | C | `Bash(curl -s -o /dev/null -w "compose-bom 2026.08.00 -> %{http_code}\\n" --max-time 15 "https://dl.google.com/…` | REDUNDANT — global ask `curl *` already overrides this |
| 66 | Voice Flow_v1 | settings.json | C | `Bash(npm install *)` | REDUNDANT — global ask `npm install *` already overrides this |
| 67 | Voice Flow_v1 | settings.json | C | `Bash(pkill -f "electron/dev.js")` | REDUNDANT — global ask `pkill *` already overrides this |
| 68 | Voice Flow_v1 | settings.json | C | `Bash(pkill -f "node_modules/.bin/electron")` | REDUNDANT — global ask `pkill *` already overrides this |
| 69 | Voice Flow_v1 | settings.json | C | `Bash(pkill -f "Voice_Flow_v2.1/node_modules/electron")` | REDUNDANT — global ask `pkill *` already overrides this |
| 70 | Voice Flow_v1 | settings.json | C | `Bash(pkill -f "MacOS/VoiceFlow")` | REDUNDANT — global ask `pkill *` already overrides this |
| 71 | Voice Flow_v1 | settings.json | C | `Bash(rtk curl *)` | REDUNDANT — global ask `rtk curl *` already overrides this |
| 72 | Voice Flow_v1 | settings.json | C | `Bash(open http://localhost:5173/)` | REDUNDANT — global ask `open *` already overrides this |
| 73 | Voice Flow_v1 | settings.json | C | `Bash(git checkout *)` | REDUNDANT — global ask `git checkout *` already overrides this |
| 74 | Voice Flow_v1 | settings.json | C | `Bash(git merge --no-ff fix/paste-target-persistence-and-auth -m 'Merge branch '\\''fix/paste-target-persistenc…` | REDUNDANT — global ask `git merge *` already overrides this |
| 75 | Voice Flow_v1 | settings.local.json | C | `Bash(gh auth *)` | REDUNDANT — global ask `gh auth *` already overrides this |
| 76 | Voice Flow_v1 | settings.local.json | C | `Bash(gh api *)` | REDUNDANT — global ask `gh api *` already overrides this |
| 77 | Voice-Flow | settings.json | C | `Bash(gh auth *)` | REDUNDANT — global ask `gh auth *` already overrides this |
| 78 | Voice-Flow | settings.json | C | `Bash(git rebase *)` | REDUNDANT — global ask `git rebase *` already overrides this |
| 79 | Voice-Flow | settings.json | C | `Bash(git checkout *)` | REDUNDANT — global ask `git checkout *` already overrides this |
| 80 | Voice-Flow | settings.json | C | `Bash(git rm *)` | REDUNDANT — global ask `git rm *` already overrides this |
| 81 | Voice-Flow | settings.json | C | `Bash(git push *)` | REDUNDANT — global ask `git push *` already overrides this |
| 82 | Voice-Flow | settings.json | C | `Bash(gh api *)` | REDUNDANT — global ask `gh api *` already overrides this |
| 83 | Voice-Flow | settings.json | C | `Bash(npm install *)` | REDUNDANT — global ask `npm install *` already overrides this |
| 84 | Voice-Flow | settings.json | C | `Bash(git merge *)` | REDUNDANT — global ask `git merge *` already overrides this |
| 85 | Voice-Flow | settings.json | C | `Bash(rm -rf asar_check)` | REDUNDANT — global ask `rm *` already overrides this |
| 86 | Voice-Flow | settings.json | C | `Bash(open -a "/Applications/Voice Flow.app")` | REDUNDANT — global ask `open *` already overrides this |
| 87 | Voice-Flow | settings.json | C | `Bash(kill 33633)` | REDUNDANT — global ask `kill *` already overrides this |
| 88 | Voice-Flow | settings.json | C | `Bash(pkill -f "/Applications/Voice Flow.app")` | REDUNDANT — global ask `pkill *` already overrides this |
| 89 | Voice-Flow | settings.json | C | `Bash(rm -rf asar)` | REDUNDANT — global ask `rm *` already overrides this |
| 90 | Voice-Flow | settings.json | C | `Bash(pkill -f "Voice Flow.app")` | REDUNDANT — global ask `pkill *` already overrides this |
| 91 | Voice-Flow | settings.json | C | `Bash(rm -f app.log)` | REDUNDANT — global ask `rm *` already overrides this |
| 92 | Voice-Flow | settings.json | C | `Bash(rm -f open.log)` | REDUNDANT — global ask `rm *` already overrides this |
| 93 | Voice-Flow | settings.json | C | `Bash(open -a '/Applications/Voice Flow.app' --stdout __TRACKED_VAR__/open.log --stderr __TRACKED_VAR__/open.lo…` | REDUNDANT — global ask `open *` already overrides this |
| 94 | Voice-Flow | settings.json | C | `Bash(pkill -9 -f "Voice-Flow/node_modules/electron")` | REDUNDANT — global ask `pkill *` already overrides this |
| 95 | Voice-Flow | settings.json | C | `Bash(pkill -9 -f "vite")` | REDUNDANT — global ask `pkill *` already overrides this |
| 96 | Voice-Flow | settings.json | C | `Bash(open -a "/Applications/Voice Flow.app")` | REDUNDANT — global ask `open *` already overrides this |
| 97 | Voice-Flow | settings.json | C | `Bash(rm -rf asar2)` | REDUNDANT — global ask `rm *` already overrides this |
| 98 | Voice-Flow | settings.json | C | `Bash(security list-keychains *)` | REDUNDANT — global ask `security *` already overrides this |
| 99 | Voice-Flow | settings.json | C | `Bash(security default-keychain *)` | REDUNDANT — global ask `security *` already overrides this |
| 100 | Voice-Flow | settings.json | C | `Bash(security find-identity *)` | REDUNDANT — global ask `security *` already overrides this |
| 101 | Voice-Flow | settings.json | C | `Bash(tccutil reset *)` | REDUNDANT — global ask `tccutil *` already overrides this |
| 102 | Voice-Flow | settings.json | C | `Bash(sqlite3 '~/Library/Application Support/com.apple.TCC/TCC.db' 'select service, client, client_type, auth_v…` | REDUNDANT — global ask `sqlite3 *` already overrides this |
| 103 | Voice-Flow | settings.json | C | `Bash(rm -rf release)` | REDUNDANT — global ask `rm *` already overrides this |
| 104 | Voice-Flow | settings.json | C | `Bash(kill 71161 71146)` | REDUNDANT — global ask `kill *` already overrides this |
| 105 | Voice-Flow | settings.json | C | `Bash(rtk curl *)` | REDUNDANT — global ask `rtk curl *` already overrides this |
| 106 | Voice-Flow | settings.json | C | `Bash(curl -s http://localhost:9222/json/list)` | REDUNDANT — global ask `curl *` already overrides this |
| 107 | Voice-Flow | settings.json | C | `Bash(pkill -f "/Applications/Voice Flow.app")` | REDUNDANT — global ask `pkill *` already overrides this |
| 108 | Voice-Flow | settings.json | C | `Bash(ollama rm *)` | REDUNDANT — global ask `ollama rm *` already overrides this |
| 109 | Voice-Flow | settings.json | C | `Bash(kill 40302)` | REDUNDANT — global ask `kill *` already overrides this |
| 110 | Voice-Flow | settings.json | C | `Bash(pkill -f "whisper-server.*8799")` | REDUNDANT — global ask `pkill *` already overrides this |
| 111 | Voice-Flow | settings.json | C | `Bash(curl -s -o /dev/null http://127.0.0.1:8799/)` | REDUNDANT — global ask `curl *` already overrides this |
| 112 | Voice-Flow | settings.json | C | `Bash(curl -s -F "file=@test1.wav" -F "language=en" http://127.0.0.1:8799/inference)` | REDUNDANT — global ask `curl *` already overrides this |
| 113 | Voice-Flow | settings.json | C | `Bash(rm -f .verify-real-prompt.mjs .verify-fidelity.mjs .verify-vault.mjs)` | REDUNDANT — global ask `rm *` already overrides this |
| 114 | Voice-Flow | settings.local.json | C | `Bash(gh repo *)` | REDUNDANT — global ask `gh repo *` already overrides this |
| 115 | Voice-Flow | settings.local.json | C | `Bash(rm package-lock.json)` | REDUNDANT — global ask `rm *` already overrides this |
| 116 | Voice-Flow | settings.local.json | C | `Bash(npm i *)` | REDUNDANT — global ask `npm i *` already overrides this |
| 117 | Voice-Flow | settings.local.json | C | `Bash(pkill -f "vite")` | REDUNDANT — global ask `pkill *` already overrides this |
| 118 | Voice-Flow | settings.local.json | C | `Bash(pkill -f vite)` | REDUNDANT — global ask `pkill *` already overrides this |
| 119 | Voice-Flow | settings.local.json | C | `Bash(git mv *)` | REDUNDANT — global ask `git mv *` already overrides this |
| 120 | Voice-Flow | settings.local.json | C | `Bash(security find-certificate *)` | REDUNDANT — global ask `security *` already overrides this |
| 121 | Voice-Flow | settings.local.json | C | `Bash(sqlite3 '~/Library/Application Support/com.apple.TCC/TCC.db' 'select service, client, auth_value, hex\(cs…` | REDUNDANT — global ask `sqlite3 *` already overrides this |
| 122 | Voice-Flow | settings.local.json | C | `Bash(open "x-apple.systempreferences:com.apple.preference.security?Privacy_Microphone")` | REDUNDANT — global ask `open *` already overrides this |
| 123 | Voice-Flow | settings.local.json | C | `Bash(sqlite3 '~/Library/Application Support/com.apple.TCC/TCC.db' 'select client, client_type, auth_value from…` | REDUNDANT — global ask `sqlite3 *` already overrides this |
| 124 | Voice-Flow | settings.local.json | C | `Bash(sudo -n sqlite3 "/Library/Application Support/com.apple.TCC/TCC.db" "select client, client_type, auth_val…` | REDUNDANT — global ask `sudo *` already overrides this |
| 125 | Voice-Flow | settings.local.json | C | `Bash(open "x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles")` | REDUNDANT — global ask `open *` already overrides this |
| 126 | Voice-Flow | settings.local.json | C | `Bash(sqlite3 *)` | REDUNDANT — global ask `sqlite3 *` already overrides this |
| 127 | Voice-Flow | settings.local.json | C | `Bash(killall tccd *)` | REDUNDANT — global ask `killall *` already overrides this |
| 128 | Voice-Flow | settings.local.json | C | `Bash(ollama signin *)` | REDUNDANT — global ask `ollama signin *` already overrides this |
| 129 | Voice-Flow | settings.local.json | C | `Bash(ollama pull *)` | REDUNDANT — global ask `ollama pull *` already overrides this |
| 130 | Voice-Flow | settings.local.json | C | `Bash(curl -s https://ollama.com/library/qwen2.5-coder/tags)` | REDUNDANT — global ask `curl *` already overrides this |
| 131 | Voice-Flow | settings.local.json | C | `Bash(curl -s https://ollama.com/library/gemma3/tags)` | REDUNDANT — global ask `curl *` already overrides this |
| 132 | Voice-Flow | settings.local.json | C | `Bash(curl -s https://ollama.com/library/gpt-oss/tags)` | REDUNDANT — global ask `curl *` already overrides this |
| 133 | Voice-Flow | settings.local.json | C | `Bash(curl -s https://ollama.com/library/qwen3.5/tags)` | REDUNDANT — global ask `curl *` already overrides this |
| 134 | vthrudebugger_v1 | settings.local.json | C | `Bash(npm install *)` | REDUNDANT — global ask `npm install *` already overrides this |
| 135 | vthrudebugger_v1 | settings.local.json | C | `Bash(git push *)` | REDUNDANT — global ask `git push *` already overrides this |
| 136 | vthrudebugger_v1 | settings.local.json | C | `Bash(gh repo *)` | REDUNDANT — global ask `gh repo *` already overrides this |
| 137 | vthrudebugger_v1 | settings.local.json | C | `Bash(gh auth *)` | REDUNDANT — global ask `gh auth *` already overrides this |
| 138 | vthrudebugger_v1 | settings.local.json | C | `Bash(open *)` | REDUNDANT — global ask `open *` already overrides this |
| 139 | vthrudebugger_v1 | settings.local.json | C | `Bash(git checkout *)` | REDUNDANT — global ask `git checkout *` already overrides this |
| 140 | vthrudebugger_v1 | settings.local.json | C | `Bash(gh pr *)` | REDUNDANT — global ask `gh pr *` already overrides this |
| 141 | vthrudebugger_v1 | settings.local.json | C | `Bash(git merge *)` | REDUNDANT — global ask `git merge *` already overrides this |
| 142 | vthrudebugger_v1 | settings.local.json | C | `Bash(gem install *)` | REDUNDANT — global ask `gem install *` already overrides this |
| 143 | vthrudebugger_v1 | settings.local.json | C | `Bash(pkill -f "expo start")` | REDUNDANT — global ask `pkill *` already overrides this |
| 144 | vthrudebugger_v1 | settings.local.json | C | `Bash(pkill -f "Metro")` | REDUNDANT — global ask `pkill *` already overrides this |
