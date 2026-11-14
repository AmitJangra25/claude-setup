---
name: mobile-project-read-only
description: The mobile app folder (~/Documents/VS Code/mobile) is READ ONLY from this project; never write there
metadata:
  node_type: memory
  type: feedback
  originSessionId: b612bb10-fc9c-4549-8aab-04730588de04
  modified: 2026-11-09T07:57:58.574Z
---

Never write, edit, delete, commit or run anything that changes files in `~/Documents/VS Code/mobile`. Reading is allowed (needs `/add-dir`). Never read its `.env` files.

**Why:** The user said so twice (09-11-2026). Mobile is the V-Thru customer app and a separate project; v1 only compares against its vendored copy at `mobile/src/debugger/`.

**How to apply:** If a fix is needed there, describe what mobile should change and let the user do it. See [[vthru-debugger-workflow-preferences]].
