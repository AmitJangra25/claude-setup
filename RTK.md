# RTK - Rust Token Killer

**Usage**: Token-optimized CLI proxy. 59.6% saved across 10,017 commands — 10–98% by
command. File reads and greps save only 11–22%; correct, not a fault.

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

The hook rewrites a recognised command in place — `git status` → `rtk git status`,
0 tokens overhead. It handles plain commands, `&&` and `;` — **nothing else.** One pipe,
redirect, subshell, loop or function and the whole line runs raw; `python3` and `sed`
never rewrite. **So prefer the plain form** over piping into `head`. Measured
2026-09-26; detail in `ENVIRONMENT.md`.

Full command list: `rtk --help`.
