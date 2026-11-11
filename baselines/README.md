# Behaviour baselines

What this setup actually did, on a date, in enough detail to run the same thing
again in a few months and see whether it still does it.

Not imported. Read one when comparing a new run against an old one, and not
otherwise.

## Why a record rather than a memory

A rule that is never exercised is a guess with formatting. These files exist so
that "the rules are working" is a claim backed by a transcript, and so that a
later run can be compared against something written down rather than against a
recollection.

## Three kinds of statement, kept apart

Every dated record separates:

- **Verified here** — checked from this machine, by a command whose output is
  quoted or whose result is stated.
- **Supplied by Amit** — transcripts pasted into a session. The *behaviour* in
  them is readable. The *factual claims* about another project are not, because
  this setup's own rules forbid opening another project to settle a question.
- **Interpretation** — judgement, attributed, in its own section.

A record that blurs these is worse than no record, because it looks like
evidence.

## How to repeat a run

1. Start from the same folders. Setup tests run from `~/.claude`; project tests
   run from the project's own folder. Memory is per starting folder, so this is
   not cosmetic.
2. Use the same numbered prompts, **verbatim**. Reword one and it stops being
   comparable.
3. Keep the fencing as recorded. Each entry is marked **guided** (the prompt
   spelled out what not to do) or **less-guided** (it did not). Running a
   less-guided prompt with fences added measures obedience instead of the setup,
   which is the one thing these records exist to tell apart.
4. Capture the banner. Claude Code version, model and effort belong in the facts
   block; without them a difference between runs cannot be attributed.
5. Capture the project's `git status --short`, branch and commit **at the start
   and at the end**. A clean tree at the end says nothing about the beginning.

## How to compare two runs

Read them in this order, because the later questions only matter if the earlier
answers hold:

1. **Did behaviour change at all?** Same prompt, materially different reply.
2. **Did the less-guided prompts hold?** They are the real measurement. If guided
   prompts still pass and less-guided ones no longer do, the rules stopped
   carrying and only explicit instruction is working.
3. **Did what it declined to do change?** Refusing to fix an unobserved failure,
   naming a workaround as a workaround, stopping at the approval gate.
4. **Did what it admitted not checking change?** A run that stops saying what it
   did not verify has regressed, even if every answer is right.
5. **Then the configuration.** Setup commit, permission counts, Claude Code
   version. A behaviour change with an unchanged configuration is a model
   change; the reverse is yours.

## Splitting

One file per run. If a single run grows past roughly 60 KB, split it by session
rather than by test — the sessions are the natural boundary, and a reader is
almost always after one session's behaviour rather than one prompt's.

## Preserving records

Keep past observations intact. Put a later run in a new dated file; if an
existing record needs a factual correction, add a dated, labelled correction
that says what changed. Do not silently rewrite the original result.

New dated files use DD-MM-YYYY: `DD-MM-YYYY.md`, then `DD-MM-YYYY-run2.md` and so
on for further runs that day. Existing historical filenames (`YYYY-MM-DD`) are not
renamed unless a separate migration is approved. Link earlier records where that helps explain the result.

**Two exceptions to the naming rule.** `global-open-tests.md` is an index of what is
open about this setup, not a dated run: one short entry per item — what was found, or
the decision — and a pointer to where the detail lives. Closed items stay, marked
closed. Project-specific tests appear there as pointers only; their records belong
inside the project they are about. `t6-removals.md` is the T6 cleanup manifest — every
removal and fix with its original text — not a run. `status-completed-11-10-2026.md`,
`status-completed-23-10-2026.md` and `status-completed-01-11-2026.md` are the
`harness/status.md` § *Completed* log, moved out unchanged on 11-10-2026, 29-10-2026 and
01-11-2026 — not runs. `environment-history-01-11-2026.md` is dated history moved
unchanged out of `ENVIRONMENT.md` on 01-11-2026 — not a run.
`old-document-maps-11-11-2026.md`, `status-completed-11-11-2026.md` and
`backlog-log-11-11-2026.md` are the three old document maps (D47), the old body of
`harness/status.md` and the old body of `harness/backlog.md`, moved unchanged on
11-11-2026 (documentation structure, Phase 2) — not runs.

**Audit, fix and test records (added 01-11-2026, audit CB2)** are a further kind, also
not runs: audit reports (`audit-*.md`, with `audit-corrections-*.md`), fix reports
(`stage-c-fix-report-*.md`), the S4 permissions record (`s4-permissions-*.md`; its
`.json` and `.py` are local-only and embedded in it), project follow-ups
(`project-handoffs-*.md`), and before/after test records for a fix pass
(`doc-test-*.md`).

Only flat `.md` files are currently allowed by `.gitignore` in this folder.
Other file types or subfolders need an explicit tracking decision before
they can be relied on as backed-up evidence.
