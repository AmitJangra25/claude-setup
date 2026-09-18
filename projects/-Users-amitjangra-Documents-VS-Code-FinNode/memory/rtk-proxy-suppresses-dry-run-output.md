---
name: rtk-proxy-suppresses-dry-run-output
description: rtk's git filter prints nothing for `git add --dry-run`, which looks like git doing nothing but isn't.
metadata:
  type: reference
---

The `rtk hook claude` PreToolUse hook rewrites `git add …` to `rtk git add …`, and rtk's
summariser prints **nothing at all** for `--dry-run` (it only reports real index changes,
as `ok N files changed, …`). The staging action itself is performed faithfully — verified
2026-09-16 by staging 33 files and confirming the index.

**Why:** an empty response to `git add -A --dry-run` reads as "git silently did nothing",
which is a false alarm worth not chasing twice.

**How to apply:** to preview a staging operation, use `rtk proxy git add -A --dry-run`,
which bypasses the filter and lists every path. Verify a real `git add` with
`git diff --cached --name-only`, not by reading the command's own output.
