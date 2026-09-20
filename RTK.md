# RTK - Rust Token Killer

**Usage**: Token-optimized CLI proxy. ~60% saved, measured across 9,491 commands —
10–98% depending on the command.

## `rtk proxy` — raw output, no filtering

```bash
rtk proxy <cmd>       # Execute raw command without filtering (for debugging)
```

⚠️ **Name collision**: if `rtk gain` fails, you may have reachingforthejack/rtk (Rust Type Kit) installed instead.

## Gotcha — `--dry-run` prints nothing

rtk's git filter reports only real index changes, so `git add --dry-run` prints **nothing at
all**. That is the proxy, not git doing nothing. Preview a staging operation with
`rtk proxy git add -A --dry-run`; verify a real one with `git diff --cached --name-only`.

## Hook-Based Usage

All other commands are automatically rewritten by the Claude Code hook.
Example: `git status` → `rtk git status` (transparent, 0 tokens overhead)

Full command list: `rtk --help`.
