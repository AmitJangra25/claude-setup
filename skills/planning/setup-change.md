# Claude Setup change

Purpose: How to plan any change to `~/.claude`, including its docs.
Audience: Claude and helpers that plan a Claude Setup change.
Read when: The planning skill picks the kind "Claude Setup change".
Owner: Claude (rules are Amit's decisions).
Update rule: When the job's steps change. Replace superseded text; history stays in git. The doc-testing lines are copied from `documentation.md`; change both together.
Related: `skills/planning/SKILL.md` · `.claude/CLAUDE.md` · `ENVIRONMENT.md` · `skills/planning/documentation.md`
Status: current
Last reviewed: 26-11-2026

## Summary

Any change to `~/.claude`. Read [SKILL.md](SKILL.md) first; this guide adds only what is
special here, and carries the documentation lines a Setup change needs, so it is the
only guide you read. The setup-only rules in [.claude/CLAUDE.md](../../.claude/CLAUDE.md)
also apply: every changing setup plan includes the `harness/status.md` update, the
cross-check result if one ran, and the next gate.

## When to use

- **Use when:** the change is anywhere in `~/.claude` — a rule, a skill, an agent, a
  hook, a setting, a template or a doc.
- **Not for:** a change inside a project, even a config one (that project's kind — see
  [SKILL.md](SKILL.md) step 1).

## Before you start

- The goal in Amit's words and one real case that shows the need ([SKILL.md](SKILL.md) step 4).
- `harness/status.md` read, for setup work.

## Write the plan

**Minimum plan:**

- **Goal and success measure.**
- **Files:** each file created, changed, moved or removed. A new tracked file needs its
  own `.gitignore` allow-line.
- **Loading impact:** does it change what loads every session (`STANDARDS.md`, any
  `CLAUDE.md`, `MEMORY.md`, skill descriptions)? Roughly how many tokens per session,
  up or down. Label it an estimate until measured.
- **Safety and permission impact:** does it touch permissions, settings, hooks, rule
  files, secrets or privacy? If yes, the plan is deep — except a wording fix that keeps
  the meaning in a rule file ([STANDARDS.md § How a task runs](../../STANDARDS.md#how-a-task-runs)).
- **Review size:** most changes in `~/.claude` count as "harness or structure"
  ([cross-check.md § Levels](../../harness/cross-check.md#levels--the-smallest-that-is-enough)),
  so they need a full review.
- **Undo:** how to put it back.

**When the change is to a doc,** add these lines from `documentation.md`:

- **Source of truth:** where each fact comes from — code, a command's output, a decision
  (D-number), Amit. One fact, one home; other docs point to it.
- **Fact check:** how each fact will be checked before it is written.
- The doc's shape follows [DOCUMENTATION-STANDARD.md](../../DOCUMENTATION-STANDARD.md),
  and its writing follows [WRITING-GUIDE.md](../../WRITING-GUIDE.md).

**Add when needed:**

- **Migration and pointers:** when text moves, every file that points to it, and how the
  old place points to the new one. Count IDs before and after.
- **Cross-project effect:** which projects inherit the change, and any `project-rules/`
  copies to update.
- **Fresh-session test:** whenever what loads changes, and for any hook, permission or
  settings change. The session that made the change cannot judge it.
- **Permission rules:** read [ENVIRONMENT.md § 3. Permissions](../../ENVIRONMENT.md#3-permissions)
  first; a rule must cover every spelling the rtk hook can produce.

It worked when every minimum line is filled, and the loading impact has a number.

## Testing

- The existing checks that cover the change: `harness/doc-check.sh`,
  `harness/session-check.sh`, `project-rules/drift.sh`.
- A fresh-session test when *Add when needed* calls for one.
- **Docs, plain prose:** check the facts, the links and the format
  (`harness/doc-check.sh`). No build, no UI test.
- **Docs that are runbooks, safety instructions, or commands that must run:** real
  verification. Run each command, or each step, and show the output. If a step cannot
  safely be run, say so and mark the result partly verified.
- A wording fix that keeps the meaning: the format check is enough
  ([STANDARDS.md § How a task runs](../../STANDARDS.md#how-a-task-runs)).

It worked when the checks ran with no new warnings, and any fresh-session test is recorded.

## Recording

Where results, decisions and the task record go: [STANDARDS.md § How a task runs](../../STANDARDS.md#how-a-task-runs)
step 8 and [.claude/CLAUDE.md](../../.claude/CLAUDE.md). Commits: that file's § *Git for
~/.claude*, only when Amit asks.

It worked when the `harness/status.md` update, the cross-check result and the next gate
are recorded.

## Common mistakes

- Don't skip the loading impact — anything every session loads costs on every turn.
- Don't judge a loading or hook change in the session that made it — test it fresh.
- Don't write a permission rule for one spelling — cover every form the rtk hook produces.
- Don't move text without its pointers — fix every file that links to it.
- Don't open `documentation.md` as well — its needed lines are here.

## Quick reference

| Task | How |
|---|---|
| Plan | Goal and measure · files · loading impact · safety impact · undo |
| Doc change | Add source of truth and fact check |
| Touches permissions, settings, hooks, rule files | Deep (except a meaning-keeping wording fix) |
| Loading or hook change | Fresh-session test |
| Checks | `doc-check.sh`, `session-check.sh`, `drift.sh` |
| Record | `STANDARDS.md` step 8, `.claude/CLAUDE.md`; commit only when Amit asks |

## Related

- [.claude/CLAUDE.md](../../.claude/CLAUDE.md) — setup-only rules and git for `~/.claude`.
- [ENVIRONMENT.md § 3. Permissions](../../ENVIRONMENT.md#3-permissions) — before any permission rule.
- [documentation.md](documentation.md) — source of the copied doc lines; change both together.
