---
name: rtk-proxy-suppresses-dry-run-output
description: rtk's git filter prints nothing for `git add --dry-run`, which looks like git doing nothing but isn't.
metadata:
  type: reference
---

> **The claim now lives in `~/.claude/RTK.md` § *Gotcha — `--dry-run` prints nothing*,**
> so it applies in every project. This file keeps the evidence. Promoted 2026-09-20.

The `rtk hook claude` PreToolUse hook rewrites `git add …` to `rtk git add …`, and rtk's
summariser prints **nothing at all** for `--dry-run` (it only reports real index changes,
as `ok N files changed, …`). The staging action itself is performed faithfully — verified
2026-09-16 by staging 33 files and confirming the index.

**Why:** an empty response to `git add -A --dry-run` reads as "git silently did nothing",
which is a false alarm worth not chasing twice.

**How to apply:** to preview a staging operation, use `rtk proxy git add -A --dry-run`,
which bypasses the filter and lists every path. Verify a real `git add` with
`git diff --cached --name-only`, not by reading the command's own output.

**Re-verified 2026-09-20 on rtk 0.48.0**, two ways: `rtk git add -A --dry-run` printed
nothing, and probing the hook directly (`echo '{"tool_name":"Bash","tool_input":
{"command":"git add -A --dry-run"}}' | rtk hook claude`) confirmed it still rewrites to
that form, compound commands included. The SETUP-PLAN note calling this possibly stale is
**withdrawn**. One thing is still unexplained: a bare `git add -A --dry-run` in that
session printed its path normally, so the hook did not fire for that call — the rule about
rtk holds, but whether the hook fires in a given session was not pinned down.
