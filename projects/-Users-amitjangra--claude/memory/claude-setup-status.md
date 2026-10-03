---
name: claude-setup-status
description: "Where the Claude Code setup stands — the spec is ~/.claude/SETUP-PLAN.md; read its START HERE block before changing any rule, setting, permission, hook or memory"
metadata:
  node_type: memory
  type: project
  originSessionId: c68b536f-cba2-4bd5-a222-40996918bc2d
  modified: 2026-09-29T13:25:51.981Z
---

Amit's Claude Code setup lives in `~/.claude`, which is itself the git repo
`github.com/AmitJangra25/claude-setup`. The written spec, every decision and the
account-switch runbook are in `~/.claude/SETUP-PLAN.md`.

**Why:** the setup grew by accident over ~120 sessions and nobody designed it. The
plan file holds the verified inventory, the decisions with their reasoning, and a
record of every claim that turned out to be wrong when checked — so work resumes
from a known state rather than a guess.

**Where it stands, 2026-09-29.** The original repair plan closed 2026-09-21. Work
since then is a second pass on the same repo, organised as blocks:

- **Block 1 — rules, workflow, templates, permissions, baseline.** Done. Two modes
  and the task order are in `STANDARDS.md`; four templates load on demand.
- **Block 2 — startup context.** Done and measured. **58.3k → 34.3k → 21.9k.**
  See [[skill-overrides-name-only]] for the mechanism that did most of it, and for
  the part settled 2026-09-26: plugin skills are **locked by plugin** and no
  `skillOverrides` key reaches them, so the only lever is `/plugin`. The `engineering`
  plugin was disabled that day (**D29**) — skills 3.9k → 3.0k — but the total held at
  **22.0k**, because system tools rose by the same 0.9k when Claude Code updated to
  2.1.283. **Use `/skills` and `/plugin` to write these settings; they know the key
  format and no guess has ever been right.**
  **Current state — 2026-10-03:** the 22.0k above is **historical**. The current reading
  is **22.8k** on Claude Code 2.1.288. Do **not** treat the two as the same measurement —
  the newer `/context` reports deferred tools separately and outside the total, and
  whether the older one counted them the same way is unverified. Full buckets, method and
  limits: `ENVIRONMENT.md` § *What every session loads before you type*.
- **Block 3 — fix verified local defects, then test.** Three defects fixed
  2026-09-26: the auto-mode trusted-repo line named `~/Documents`, these notes were
  stranded in the `~/Documents` memory folder, and `README.md` said five imports
  when there are three. Both task tests were run read-only on 2026-09-28 — 14 prompts
  and their replies are in `~/.claude/baselines/2026-09-28.md`. **Voice-Flow's five project
  `ask` entries were seen to prompt live on 2026-09-28** — each prompt named its matching
  rule; observed and pasted in by Amit, since Claude cannot see prompts
  (`~/.claude/baselines/2026-09-28-run2.md`). **FinNode's three were seen to prompt on
  2026-09-29**, each box naming its own rule (`baselines/2026-09-29.md`). A **synthetic**
  file-changing probe ran the same day and held its scope, but **a real project-task test
  is still unproven** (`baselines/2026-09-29-run2.md`). Two of the 58 global `ask` rules
  *were* seen to fire in a manual-mode probe on 2026-09-21, after the 2026-09-20 merge to
  the current spellings; the other 56 have not been probed.
- **Block 4 — repo review, then switch accounts.** Not started. "User B" means a
  second Claude account used by Amit on this same Mac, not another macOS user —
  which is exactly what the runbook in `SETUP-PLAN.md` was written for. Never tested.

**2026-09-29, outside the blocks.** The mirror's read-only report was split out of
`sync.sh` into `drift.sh` — the reason is in `ENVIRONMENT.md` § *Permissions*. Its first
run found two FinNode copies drifted; both were pulled back in. **D31** then settled
where a live task record
lives: `.claude/current-task.md` **inside the selected project**, never under
`~/.claude` — a central store would need the standing cross-directory grant that
**D23** removed on 2026-09-18. `templates/handoff.md` was extended as its template
rather than copied, and `STANDARDS.md` gained one pointer line at *Orient*.
`STANDARDS.md` step 9 now points at that same record, so it is read at Orient and written
at Handoff. A fresh session found and read it, and a same-session `/compact` probe then
continued the work within scope — but **neither shows the record caused recovery**, since
the task reached the session before the compaction (`baselines/2026-09-29-run2.md`).
Four file-spelling `ask` rules were added to Voice-Flow, taking it 5 → 9, and each
prompted for a harmless grep (`baselines/2026-09-29-run3.md`, `-run4.md`).
**Not verified:** the real scripts, the child processes they spawn inside Node, every
direct spelling, or the full approval workflow. FinNode's `settings.local.json` mirror is
drifted and deliberately not pulled.

**Start setup sessions from `~/.claude`, not `~/Documents`.** Memory is stored per
starting folder, which is how these notes ended up in the wrong place. `~/Documents`
is not a repo and holds every project at once, so it is the widest possible working
directory — the opposite of the one-project boundary the rules exist to keep.

**How to apply:** read the START HERE block of `~/.claude/SETUP-PLAN.md` before
changing any rule, setting, permission, hook or memory, and update the plan when
they change. Nothing is removed or blocked without Amit's explicit approval. See
[[stay-on-the-asked-task]] and [[propose-skills-from-observed-work]]. The
always-recommend-an-option rule is not a note here — it is global, in
`STANDARDS.md` § *When something is unclear*: never present options neutrally,
name the one you recommend and why not the others.
