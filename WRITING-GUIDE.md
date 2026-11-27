# Writing guide

Purpose: How every Claude Setup file is written — the style, the two levels, rule plus case, one shape per file kind, and the words to use and avoid.
Audience: Claude, helpers that write files, and Amit.
Read when: Writing or rewriting a document, agent, skill, rule file, guide or case study; before a writing review or a blind test.
Owner: Claude (rules are Amit's decisions).
Update rule: Only from a real case logged in the backlog, recorded as a D-number. Replace superseded text; no history here.
Related: `DOCUMENTATION-STANDARD.md` (types, headers, IDs, naming) · `STANDARDS.md` § *Communicate* (how replies read) · `templates/` (one form per file kind) · `DOCUMENT-MAP.md`
Status: in force (D55)
Last reviewed: 27-11-2026

## Contents

- [Summary](#summary) — the whole guide in five lines
- [Writing style](#writing-style) — how every sentence reads
- [Two levels](#two-levels) — short where it loads every session, teaching where it loads on need
- [Rule plus case](#rule-plus-case) — one-line rules, stories in case studies, the ladder to hooks
- [Shapes by file kind](#shapes-by-file-kind) — which form to start from
- [Agents](#agents) · [Skills](#skills) · [Rule files](#rule-files) · [Guides](#guides) · [Case studies](#case-studies) — how to write each
- [Examples](#examples) — where longer examples live
- [Words to use and avoid](#words-to-use-and-avoid) — the glossary
- [Related](#related)

## Summary

Write so a reader who arrives cold can act on the first lines. Files that load every session stay short: bullets and one-liners. Files read on need teach: they say why the thing exists, show one real case, and give numbered steps. A rule is one line; the story behind it lives in a case study the rule links to. Each of the five file kinds below has a form in `templates/`, so start from the form, not a blank page.

The guide serves any kind of work. Coding and Claude Setup come first, but every form must also fit business, research or personal work; detail that only fits one subject goes in an optional block.

## Writing style

Write the way you would explain it to a colleague: simple words, short sentences, the point first.

- **Conclusion first.** Each section opens with what is true now, in one or two sentences. Detail follows.
- **Everyday words.** Use jargon only when the word is the name of the thing, and explain it once.
- **As long as the facts need.** Never cut a fact to look short. Five lines are fine when five lines are needed. Cut repeats, not facts.
- **Say it once.** A fact has one home. Elsewhere, write one line and a link, not a summary of the home.
- **Now, not how we got here.** Live documents say what is true now. Keep a date or a "why" only when the reader needs it to trust or apply the fact — for example, when a figure was measured, or the reason a value was chosen. Keep a dated note when leaving it out would make another statement misleading. Change history stays in git. A real failure that explains a rule is not change history: it is a case study, linked from the rule ([Rule plus case](#rule-plus-case)).
- **Numbers carry their source.** Every measured figure gives its date and method, or says "estimate" or "not recorded".
- **Bold sparingly.** At most one key phrase per paragraph, for a warning or the thing to remember.
- **Calm, not loud.** No capitals for emphasis ("NEVER", "MUST") and no threats ("violation = immediate stop"). A plain sentence with its reason is obeyed better than a shouted one.
- **Pick the right shape.** Prose for reasons. A list for steps or separate items. A table when every row has the same fields.
- **An example where a rule could be misread.** One short example, not three. Examples use made-up data only.
- **Stable headings.** Renaming a heading breaks links. If you must rename one, run "what links here" and fix the links in the same change.
- **Avoid:** the phrases in [Words to use and avoid](#words-to-use-and-avoid).

## Two levels

What loads every session costs tokens on every turn; what loads on need costs only when used. So the same fact is written differently depending on where it lives.

| Level | Files | How they read |
|---|---|---|
| Every session | The always-loaded files (`DOCUMENTATION-STANDARD.md` § *Always loaded*), plus every agent and skill **description**, which Claude Code lists in each session | Bullets and one-liners. No header, no story, no example unless the line cannot be read without one; an agent's description may carry one short example line ([Examples](#examples)). Backtick paths, not links |
| On need | Agent and skill bodies, guides, reference documents, case studies | The full teaching style: why it exists, one real case, numbered steps, awkward cases, use-when and not-for lines. Clickable links |

The every-session budget is final check 5 in `harness/doc-structure-plan.md` § *Goal and final checks*: our part must not grow. A teaching paragraph that drifts into an always-loaded file breaks it; move the paragraph to an on-need file and leave one line and a pointer.

## Rule plus case

A rule tells you what to do. A case shows you why, with a real failure. Keeping them apart keeps rules short and stories complete.

- **A rule is one line,** testable, in the file that owns it: what to do or not do, and when.
- **Its story is a case study** (`templates/case-study.md`), linked from the end of the rule line: `Case: <path>`. The case links back to the rule.
- **A hook that enforces a rule is named on the rule line:** `Enforced by: <hook file>`. The hook's opening comment names the rule and the case.
- **Agents and skills may tell one case inline,** in two to four sentences under *Why this exists*, because the reader needs it to apply the file. Anything longer becomes a case study, linked.
- **Where case studies live** is decided in Phase 16. Until then, write none; the form is ready.

**The ladder.** When Claude gets something wrong, climb one step at a time, and only when the step below keeps failing:

1. **An instruction** — a line in the skill, agent or guide where the mistake happened.
2. **A rule** — one line in a rule file, with its case study.
3. **A hook** — a script that blocks or warns, cited from the rule.

Each step up names the failures that caused it, so a later reader can tell whether the step is still needed.

## Shapes by file kind

Start every new file of these five kinds from its form. A file kind is not a file type: the five types in `DOCUMENTATION-STANDARD.md` § *Five file types* still apply on top. Other kinds (roadmap, backlog, decisions, reference, record, task file, project `CLAUDE.md`, project map) keep their forms and `DOCUMENTATION-STANDARD.md` § *Structure per file*.

| Kind | Form | Loads | Header | Sections, in order |
|---|---|---|---|---|
| Agent | `templates/agent.md` | description every session; body when started | frontmatter only | opening · Why this exists · What you are given · How to work (Subject detail, optional) · Example · Lessons · Report |
| Skill | `templates/skill.md` | description every session; body when used | frontmatter only | opening · When to use · Steps · Example · Subject detail (optional) · Self-check · Related |
| Rule file | `templates/rule-file.md` | every session, or on need | none if always loaded; full if on need | opening line · one heading per group of rules · Related |
| Guide | `templates/guide.md` | on need | full | Summary · When to use · Before you start · one section per stage (Subject detail, optional) · Common mistakes · Quick reference · Related |
| Case study | `templates/case-study.md` | through a link only | record | What happened · Why it happened · What it cost · What changed · How to spot it again |

## Agents

An agent is a separate worker with its own context. It knows only its own file and what it is handed, so the file must stand alone.

1. **Description** (loads every session): two or three short lines — what it does, when to use it, what it is not for — plus at most one short example line; the full example goes in the body ([Examples](#examples)). Every extra example is paid for in every session. The example line is one `Example: <what Amit says> → <what the agent is handed>` line, never an `<example>` block. The body's *Example* adds the context and why this agent, and does not repeat the description's sentence.
2. **Opening paragraph:** what the agent does, and what it never does (for a reviewer: approve, edit, commit, push, start another agent).
3. **Why this exists:** the gap the agent closes, and one real case in two to four sentences, with its date. If no dated case is logged yet, leave out the Real case lines; never use a placeholder.
4. **What you are given:** the inputs, numbered, and what to do when one is missing or unreadable.
5. **How to work:** numbered steps or named lenses. Each lens says exactly what to check, what evidence to cite, and what counts as a finding — concrete enough that two readers would check the same things.
6. **Example:** the full example, made-up data only; more in `agent-examples/<name>/` ([Examples](#examples)).
7. **Lessons:** practical lessons, each a bold lead phrase plus the reason it matters: the mistake it prevents, or the case behind it. Take them from the agent's own rules and past results; never invent one.
8. **Report:** the exact shape and word limit; findings ranked by severity, each with file and line, what is wrong, why it matters and the smallest fix; verified facts kept apart from assumptions; and what "nothing found" looks like — the facts verified, never an empty or padded report.

Project facts (stack, product words, which tool a project uses) live in small separate files the agent reads, not in the agent, so one agent serves every project. Read-only reviewers report and never approve (D52). Give the fewest tools and the cheapest model that do the job (`harness/models.md`).

## Skills

A skill is a how-to the main session follows. It adds to agents and never replaces them: a skill may start an agent, but work that needs a fresh, separate context stays an agent's job.

- **Coding-first, not coding-only.** A general skill's steps read for any work; stack detail goes in the optional *Subject detail* block. A skill that is coding by nature stays coding all through; never weaken it to look general.
- **Description: two or three short lines.** What it does and the phrases that should start it. It loads every session.
- **A small example inside `SKILL.md`;** larger ones in `examples/` inside the same skill folder. Made-up data only. `.gitignore` blocks everything not named, so each new folder needs its own allow-line, and so does each file inside it.
- **Self-check by importance.** An important skill — anything risky (secrets, deleting, money, data, permissions) or used most days — gets the full check: every step's result against the request, every file, number and claim against its source, no gate skipped, and what was not checked. Every other skill gets the short check: the result matches the request, and what was not checked.
- **Hard limits stay in rule files.** The skill points to them and keeps only the how.
- **Fragile steps go in a script** in the skill's own `scripts/` folder, checked like code.
- **Folder:** `skills/<name>/SKILL.md`, then `examples/` and `scripts/` only when needed.

**Before creating a skill,** Claude may ask Amit up to five short questions, each with a recommended answer — an exception to the two or three in `STANDARDS.md` § *Communicate*, recorded in D55. The usual five: what is it for · when should it start, and when not · what does "done" look like · which step is risky · one real example of using it.

## Rule files

A rule file holds how to work, in lines short enough to obey without rereading.

- **Always loaded:** no header; bullets and one-liners only. **On need:** the full header.
- **One rule per line,** testable. If a rule needs a paragraph, the paragraph is a procedure (a skill or guide) or a story (a case study).
- **Group rules under a few headings** by when they apply, not by when they were added.
- **End the line with its links** when it has them: `Case: <path>` and `Enforced by: <hook file>`.
- **No procedures, measurements or history.** Procedures go in skills and guides, measurements in reference documents, history in git.

## Guides

A guide teaches one job from start to finish, for a reader who has not done it before.

- **Summary first:** what the guide helps you do and the result, in one or two sentences.
- **When to use, and not for:** one line each, so the reader knows within seconds whether this is the right page.
- **Before you start:** what you need in hand.
- **One section per stage,** with numbered steps; each stage says how to tell it worked.
- **Common mistakes:** "Don't … — do … instead", one line each.
- **Quick reference:** a table of task and how, for the reader who already knows the guide.
- **Over about 150 lines,** add a contents list after the header.

## Case studies

A case study is the story of one real failure, kept so a rule's reason is never lost.

- **One event per file.** Record header; written once and never edited (except to redact, `DOCUMENTATION-STANDARD.md` § *Data and security*).
- **Facts only:** what was seen, the dates, figures with their source. No blame and no people's names — roles instead. No secrets, no private data, no company facts from a project.
- **About 20 to 60 lines.** Long enough to be believed, short enough to be read.
- **Linked both ways:** from the rule it explains, and back to that rule.
- **Name:** `<short-slug>-DD-MM-YYYY.md`.

## Examples

**Decision (Amit, D55; amended 26-11-2026):** keep the kit's examples idea, placed next to the thing it explains. Made-up data only.

- **Each skill:** one small example in `SKILL.md`; larger examples in its `examples/` folder.
- **Each agent:** at most one short example line in its description; its full example in its body; additional examples in `agent-examples/<name>/`, outside `agents/` so they never load as agents. When created, that folder and each file inside it need their own `.gitignore` allow-line.

There is no repo-wide `examples/` folder: the kit's mixes command lists and project patterns, which here already have homes in reference documents, so a shared folder would hold copies. Built in Phases 14–15, when skills and agents are rewritten.

## Words to use and avoid

Each term: what it means here, then what not to say. The ID and phase words (Phase, T, B, D, TC) are in `DOCUMENTATION-STANDARD.md` § *Naming* and § *IDs and progress*.

**Approval**:
Amit's explicit yes to the approval question.
_Avoid_: treating agreement, discussion or "sounds good" as approval.

**Claude Setup**:
The global standard in `~/.claude` that every project follows.
_Avoid_: "the setup project".

**Cross-check**:
A fresh, read-only reviewer's report on one plan or change. It informs; it never approves.
_Avoid_: "the reviewer approved", "review passed".

**Sub-agent**:
An agent the main session starts for one bounded job, with its own context.
_Avoid_: "fork" for a cross-check (a fork inherits the whole conversation).

**Success measure**:
A number or a yes/no that says the goal is met.
_Avoid_: "done when it looks right".

**Case study**:
The story of one real failure behind a rule.
_Avoid_: "post-mortem", "lessons learned" as a file name or heading.

**Workaround**:
A change that hides a defect without removing its cause; always named as one.
_Avoid_: "fix" for a workaround.

**Estimate**:
A figure not measured; always labelled.
_Avoid_: a bare number that reads as measured.

**Phrases to avoid anywhere:** "Note that", "It is important to", stacked hedges ("might possibly perhaps"), a rule restated in other words, capitals or threats for emphasis, "simply" or "just" in front of real work, "obviously".

## Related

- [DOCUMENTATION-STANDARD.md](DOCUMENTATION-STANDARD.md) — document types, headers, IDs, naming, growth, safety
- [STANDARDS.md § Communicate](STANDARDS.md#communicate) — how replies to Amit read
- `templates/agent.md` · `templates/skill.md` · `templates/rule-file.md` · `templates/guide.md` · `templates/case-study.md` — the five forms
