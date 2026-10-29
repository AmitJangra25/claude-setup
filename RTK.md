# RTK - Rust Token Killer

**Usage**: token-saving CLI proxy. Savings vary widely by command; reads and greps save
least, which is correct. Live figure: **`rtk gain`**; breakdown: `ENVIRONMENT.md`.

## `rtk proxy` — raw output, no filtering

```bash
rtk proxy <cmd>       # Execute raw command without filtering (for debugging)
```

- **Before deleting, moving or overwriting a file** because of what a command printed,
  re-run that read through `rtk proxy` — rtk rewrites output.
- `rtk proxy` is for reads only. Never wrap a commit, push or other ask-list command in it.
- If a box for `rtk proxy …` offers "don't ask again", choose plain "Yes".

⚠️ **Name collision**: if `rtk gain` fails, you may have reachingforthejack/rtk (Rust Type Kit) installed instead.

## Gotcha — `--dry-run` prints nothing

rtk's git filter reports only real index changes, so `git add --dry-run` prints **nothing at
all**. That is the proxy, not git doing nothing. Preview a staging operation with
`rtk proxy git add -A --dry-run`; verify a real one with `git diff --cached --name-only`.

## Hook-Based Usage

The hook rewrites a recognised command in place — `git status` → `rtk git status`,
0 tokens overhead. It handles plain commands, `&&` and `;` — **nothing else.** One pipe,
redirect, subshell, loop or function and the whole line runs raw; `python3` and `sed`
never rewrite. **So prefer the plain form** (`ls`, `grep`,
`git status`) over piping into `head`. Measured
26-09-2026; detail in `ENVIRONMENT.md`.

Full command list: `rtk --help`.
