---
name: main-session-opens-projects-by-add-dir
description: "Reads of any project are open (D46); /add-dir is only for changing another project's folder, after Amit approves that exact change"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 09c9f96c-a2c9-4c97-a895-0075bc24aa4d
  modified: 2026-11-10T07:04:48.909Z
---

Any session may read other projects and `~/.claude` when the task needs it — say which.
Changing another project's folder needs Amit's approval of that exact change, then
`/add-dir` of that folder, because Claude's file tools cannot write outside the working
folder. Never use a shell command to write around the lock.

**Why:** 10-11-2026 — Amit: "stick to one project" was always meant to stop writes, not
reads. D46 turned the read block off and the write lock on (`SETUP-PLAN.md`). This
replaces the 05-11-2026 rule "ask for /add-dir to read a project".

**How to apply:** read freely, never `.env`, secrets or personal data; before any write
outside the working folder, get approval, then ask for `/add-dir`. Related:
[[claude-setup-status]], [[stay-on-the-asked-task]].
