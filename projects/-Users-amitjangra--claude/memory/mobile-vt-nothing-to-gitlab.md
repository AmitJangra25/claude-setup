---
name: mobile-vt-nothing-to-gitlab
description: "mobile (VT, V-Thru app, company GitLab) — Claude never pushes, merges or pulls; notes stay local; backup only in private claude-setup GitHub"
metadata:
  node_type: memory
  type: project
  originSessionId: 3c1c9410-c5fb-47d2-820a-cc81442dbe0c
  modified: 2026-11-16T12:10:10.117Z
---

Called **"Vthru Customer app"** (Amit, 16-11-2026) to avoid confusion with the folder name. mobile (code VT, `~/Documents/VS Code/mobile`) is the company's React Native app on V-Thru's GitLab; the debugger (DB1) integrates into it. Rules (Amit, 16-11-2026):

- Nothing from Claude goes to GitLab: never push, merge, pull or open a merge request. Fixes are committed on local branches only; Amit sends the PR himself and a collaborator merges.
- Claude's notes (CLAUDE.md, project map, task file, docs) stay local in the mobile folder, hidden via `.git/info/exclude` — never in the team's shared `.gitignore`.
- A backup of its Claude Setup files lives in Amit's private GitHub repo (claude-setup), `project-rules/VT/` — rules and structure only; no code, URLs, keys or customer data; secret-scan before each commit.
- Never run `codepush:*`, production builds, fastlane, or anything that deploys; never touch `.env*`.

**Why:** company code with collaborators; Amit keeps GitLab clean of Claude files and controls every push.
**How to apply:** in any mobile session or any Setup work touching VT, apply these before any git action. Related: [[claude-setup-status]].
