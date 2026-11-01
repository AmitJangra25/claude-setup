# RTK - Rust Token Killer

Token-saving CLI proxy; live savings: `rtk gain`. The hook rewrites a recognised command in
place (`git status` → `rtk git status`). It handles plain commands, `&&` and `;` only —
one pipe, redirect, subshell, loop or function and the whole line runs raw; `python3` and
`sed` never rewrite. **So prefer the plain form** (`ls`, `grep`, `git status`) over piping
into `head`. Detail and measurements: `ENVIRONMENT.md` § 1.

## `rtk proxy` — raw output, no filtering

- **Before deleting, moving or overwriting a file** because of what a command printed,
  re-run that read through `rtk proxy` — rtk rewrites output.
- `rtk proxy` is for reads only. Never wrap a commit, push or other ask-list command in it.
- If a box for `rtk proxy …` offers "don't ask again", choose plain "Yes".
- Through rtk, `git add --dry-run` prints nothing. Preview with
  `rtk proxy git add -A --dry-run`; verify real staging with `git diff --cached --name-only`.
