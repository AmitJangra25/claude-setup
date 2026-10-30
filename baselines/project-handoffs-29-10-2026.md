# Project handoffs — setup-audit follow-ups · 29-10-2026

Handoff notes for the items the 29-10-2026 Claude Setup audit deferred to other sessions
(`baselines/audit-29-10-2026.md`; listed in `harness/status.md` § *Open*). A setup session
may not write a project's `.claude/current-task.md`, so each note is pasted into that
project's own session, which adds it to its own task record. Line numbers are as of
29-10-2026 and may have moved. No security detail is repeated here, on purpose.

---

## FinNode

- **Goal / success measure:** clear the FinNode items from the 29-10-2026 Claude Setup
  audit. Yes/no: each item below is fixed, or Amit decides to keep it, and nothing else
  changes.
- **Latest measured result:** none yet. The items come from the audit; line numbers are as
  of 29-10-2026 and may have moved. Source: `~/.claude/baselines/audit-29-10-2026.md`.
- **Status:** not started. Needs Amit's approval of a plan in a FinNode session.
- **Approved scope:** none yet. Out of scope: app code, and everything not listed here.
- **Project and folder:** FinNode, `~/Documents/VS Code/FinNode`. FinNode already has a
  `.claude/current-task.md` (trimmed 29-10-2026): add this note to it, do not replace it.

**First (pending from 29-10-2026):**
- The live `CLAUDE.md` edit is already done: lines 24–25, "carry on" now stops on a missed
  success measure. It matches `~/.claude/project-rules/FinNode/CLAUDE.md`. It only needs
  committing, with FinNode's next PR, under FinNode's git rules.

**Contradictions — Amit decides:**
- **A6:** `CLAUDE.md:74, 199` say the design copy is the source of truth. Memory
  `finnode-ui-redesign-handoff.md:8-11` says that copy is stale. Pick one and fix the other.
- **A7 (low):** `CLAUDE.md:205-207` give a Play Store reason. The same memory note, at line
  15, says sideload only.
- **A9:** memory `setup-review-project-by-project.md:27` says 8–10 questions. The global
  rule says two or three. Strike the line, or handle it under F6.

**Repeats and stale facts:**
- **B7:** memory `check-feasibility-before-building.md` repeats global step 3 (Plan). Add
  the "now global" header that nine other memory notes already carry.
- **B8:** `CLAUDE.md:19-29` repeats global § *Stay on the task you were given*. Trim it to
  the backlog path plus its evidence. Keep the 29-10-2026 stop-on-missed-measure line,
  word for word. Check before cutting: this is rule text.
- **E5:** memory `MEMORY.md:1` says "six left", but the note behind it is superseded.
- **E6:** `finnode-ui-redesign-handoff.md:35` conflicts with `CLAUDE.md:182-187`, which says
  Phase 3 is in progress. `figma-finnode-design-repo.md:20` is probably stale; not verified.

**F6 (needs a setup session too):** move the lesson in memory
`setup-review-project-by-project.md` into `~/.claude/SETUP-PLAN.md` § *PHASE 10 — Project-by-project review*, then
remove the note. The `SETUP-PLAN.md` edit belongs to a `~/.claude` session. The removal
needs two-method confirmation, an independent review and Amit's approval.

- **Watch for:**
  - FinNode's memory notes live in `~/.claude/projects/…FinNode/memory/`, which is the
    `~/.claude` repository. Edits there show as uncommitted in `~/.claude`, and a setup
    session commits them.
  - Any `CLAUDE.md` change drifts its mirror. The next setup session's `drift.sh` will
    flag it, and the mirror is synced there.
- **Blockers:** none.
- **Exact next step:** in a FinNode session, read this note, propose a plan covering A6,
  A7, A9, B7, B8, E5 and E6, and wait for Amit's approval.

---

## Voice-Flow

- **Goal / success measure:** fix the one stale memory fact from the 29-10-2026 Claude
  Setup audit. Yes/no: the note states the traced cause, and nothing else changes.
- **Latest measured result:** none yet. Source: `~/.claude/baselines/audit-29-10-2026.md`
  (E3); the cause is recorded in `~/.claude/harness/status.md`.
- **Status:** not started. Needs Amit's approval.
- **Project and folder:** Voice-Flow, `~/Documents/VS Code/Voice-Flow`.

- **E3:** memory `rtk-proxy-prompt-choose-yes.md:17-19` calls the cause "unproven". It was
  traced on 29-10-2026: `Bash(rtk proxy *)` came back when a commit wrapped in `rtk proxy`
  was approved with "don't ask again". The rule is now global, in `~/.claude/RTK.md`:
  `rtk proxy` is for reads only, and that offer gets a plain "Yes". Update the note to say
  so.
- **Seen, not verified:** `verify-shipped-bundle-not-source.md:29, 33-36`. A pointer and its
  wording look doubtful. Check while you're there; change it only if it's actually wrong.
- **No action:** `stop-at-earliest-gate`, `cannot-see-permission-prompts` and
  `state-workaround-behaviour-before-building` are now in global `STANDARDS.md`. Amit
  decided these notes stay as they are.

- **Watch for:** Voice-Flow memory lives in the `~/.claude` repository, so a setup session
  commits these edits.
- **Exact next step:** in a Voice-Flow session, propose the E3 wording and wait for Amit's
  approval.

---

## Debugger v2

- **Goal / success measure:** fix the stale path from the 29-10-2026 Claude Setup audit.
  Yes/no: the memory note names the folder that really exists, and nothing else changes.
- **Latest measured result:** none yet. Source: `~/.claude/baselines/audit-29-10-2026.md`
  (E8).
- **Status:** not started. Needs Amit's approval.
- **Project and folder:** Debugger v2. Confirm the real folder first, most likely
  `~/Documents/VS Code/Debugger v2`; this was not checked from the setup session.

- **E8:** memory `project_debugger_repo_fresh_start.md:11` says the repo is at
  `/Users/amitjangra/Documents/VS Code/Debugger`. That memory folder belongs to
  `Debugger v2`, so the path is probably wrong. Check it on disk and correct line 11.
- **Seen, Amit to confirm:** the same note, at lines 21–25, calls `vthrudebugger_v1` out of
  scope. `~/.claude/PROJECTS.md` lists `vthrudebugger_v1` as the Debugger tree being worked
  on (Amit, 27-09-2026). These may describe two separate projects. If so, no change is
  needed. Ask Amit before editing.

- **Watch for:** this memory lives in the `~/.claude` repository, so a setup session
  commits the edit.
- **Exact next step:** in a Debugger v2 session, confirm the folder path, propose the
  one-line fix, and wait for Amit's approval.

---

## Packbly Web — security follow-up (S5)

- **Goal / success measure:** fix the app weakness that Packbly's own rule file describes,
  found in the 29-10-2026 Claude Setup audit (S5). Yes/no: the weakness is fixed and tested
  in the app, and the rule file's description is updated to match.
- **Status:** not started. Needs a plan and Amit's approval in a Packbly session.
- **Project and folder:** Packbly Web, `~/Documents/VS Code/Packbly_web/v1.1-Packbly`.
  **Real customer and courier records.**
- **Where the detail is:** Packbly's own `CLAUDE.md`. The audit deliberately kept security
  detail out of its files; Amit has the full S5 list from the Session 1 review. Ask him
  which of S5a–c are Packbly's before planning.
- **Decided (Amit, 29-10-2026):** fix in the app's own session. The description stays in
  the private `~/.claude` rule copy for now.
- **Safety:** never read `.env` files or real records while doing this. Test on fake data.
- **Exact next step:** ask Amit for the S5 item(s), read `CLAUDE.md`, propose a plan with
  a test, and wait for approval.

---

## Emp Portal — security follow-up (S5)

- **Goal / success measure:** fix the app weakness that Emp Portal's own rule file
  describes, found in the 29-10-2026 Claude Setup audit (S5). Yes/no: the weakness is fixed
  and tested in the app, and the rule file's description is updated to match.
- **Status:** not started. Needs a plan and Amit's approval in an Emp Portal session.
- **Project and folder:** Emp Portal,
  `~/Documents/VS Code/Emp portal/Vthru_Emp_v2.1_jun26`. **Real employee records.**
- **Where the detail is:** Emp Portal's own `CLAUDE.md`. The audit deliberately kept
  security detail out of its files; Amit has the full S5 list from the Session 1 review.
  Ask him which of S5a–c are Emp Portal's before planning.
- **Decided (Amit, 29-10-2026):** fix in the app's own session. The description stays in
  the private `~/.claude` rule copy for now.
- **Safety:** never read `.env` files or real employee records. Test on fake data.
- **Exact next step:** ask Amit for the S5 item(s), read `CLAUDE.md`, propose a plan with
  a test, and wait for approval.

---

## Claude Setup — S4 project allow lists

- **Goal / success measure:** review each project's `allow` rules for anything that lets
  a risky action run without a box. Yes/no: every risky allow rule is listed with a
  keep or remove decision from Amit, and nothing is changed without approval.
- **Status:** not started. Out of scope for Session 2 (Amit, 29-10-2026).
- **Project and folder:** Claude Setup, `~/.claude`. Read the mirrors in
  `project-rules/*/.claude/settings*.json`; do not open the live project folders.
- **Before starting:** read `ENVIRONMENT.md` § *Permissions — what stops and asks*. The rtk
  hook rewrites commands before the permission check, so a rule has to be judged against
  every spelling the hook can produce.
- **Known context:** the large project allow lists were never reviewed. `session-check.sh`
  already flags `Bash(rtk proxy *)` and `Bash(rtk git *)`.
- **Model:** Opus. This is permission work, where a mistake is costly.
- **Watch for:** changing a live project's settings is that project's work, or needs an
  exact approved exception. A setup session only reads the mirrors.
- **Exact next step:** in a `~/.claude` session, count the allow rules per mirror, propose
  a review plan with a token estimate, and wait for Amit's approval.
