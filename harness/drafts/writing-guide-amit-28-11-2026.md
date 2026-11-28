# Writing guide

Purpose: Set the writing style for every Claude Setup file: sentence style, always-loaded versus on-demand content, rules and case studies, templates by file kind, and approved vocabulary.

Audience: Claude, helpers that write files, and Amit.

Read when: Writing or rewriting a document, agent, skill, rule file, guide, or case study; before a writing review or blind test.

Owner: Claude. The rules are Amit’s decisions.

Update rule: Update only from a real case logged in the backlog and recorded as a D-number. Replace superseded text. Keep no history here.

Related: DOCUMENTATION-STANDARD.md (types, headers, IDs, naming) · STANDARDS.md § Communicate (how replies read) · templates/ (one form per file kind) · DOCUMENT-MAP.md

Status: In force (D55)  
Last reviewed: 27-11-2026

## Contents

- [Summary](#summary) — the guide in five lines
- [Writing style](#writing-style) — how every sentence reads
- [Two levels](#two-levels) — short where it loads every session; teaching where it loads on need
- [Rule plus case](#rule-plus-case) — one-line rules; stories in case studies; the ladder to hooks
- [Shapes by file kind](#shapes-by-file-kind) — which form to start from
- [Agents](#agents) · [Skills](#skills) · [Rule files](#rule-files) · [Guides](#guides) · [Case studies](#case-studies) — how to write each
- [Examples](#examples) — where longer examples live
- [Words to use and avoid](#words-to-use-and-avoid) — the glossary
- [Related](#related)

## Summary

Write so a reader with no prior context can act from the first lines.

Files that load every session stay short: use bullets and one-liners. Files read on need teach: explain why the thing exists, show one real case, and give numbered steps.

A rule is one line. The story behind it lives in a linked case study.

Each of the five file kinds has a form in `templates/`. Start from the form, not a blank page.

The guide serves any kind of work. Coding and Claude Setup come first, but every form must also fit business, research, or personal work. Put subject-specific detail in an optional block.

## Writing style

Write as you would explain the subject to a colleague: use simple words, short sentences, and put the point first.

- **Conclusion first.** Open each section with what is true now, in one or two sentences. Put detail after it.
- **Use everyday words.** Use jargon only when it is the name of the thing. Explain it once.
- **Keep the facts.** Do not cut a fact to look short. Five lines are fine when five lines are needed. Cut repetition, not facts.
- **Say it once.** Give each fact one home. Elsewhere, write one line and link to it.
- **Write what is true now.** Live documents state the current position. Keep a date or reason only when the reader needs it to trust or apply the fact.
- **Keep change history in git.** A real failure that explains a rule is not change history. Record it as a case study and link it from the rule.
- **Give numbers a source.** For every measured figure, give its date and method, or label it `estimate` or `not recorded`.
- **Use bold sparingly.** Use at most one key phrase per paragraph, for a warning or the thing to remember.
- **Stay calm.** Do not use capitals for emphasis, such as `NEVER` or `MUST`. Do not use threats. State the rule and its reason plainly.
- **Choose the right shape.** Use prose for reasons. Use a list for steps or separate items. Use a table when every row has the same fields.
- **Add an example when a rule could be misread.** Use one short example, not three. Use made-up data only.
- **Keep headings stable.** Renaming a heading breaks links. If you rename one, run “what links here” and fix the links in the same change.
- **Avoid the phrases** in [Words to use and avoid](#words-to-use-and-avoid).

## Two levels

Always-loaded content costs tokens in every session. On-demand content costs tokens only when Claude reads it. Write the same fact differently depending on where it lives.

| Level | Files | How they read |
|---|---|---|
| Every session | Always-loaded files in DOCUMENTATION-STANDARD.md § Always loaded, plus every agent and skill description that Claude Code lists in each session | Use bullets and one-liners. Do not add a header, story, or example unless the line cannot be read without one. An agent description may carry one short example line. Use backtick paths, not links. |
| On need | Agent and skill bodies, guides, reference documents, and case studies | Use the full teaching style: explain why it exists, give one real case, use numbered steps, cover awkward cases, and state when to use it and when not to. Use clickable links. |

The every-session budget is final check 5 in `harness/doc-structure-plan.md` § Goal and final checks. Our part must not grow.

If a teaching paragraph drifts into an always-loaded file, move it to an on-need file. Leave one line and a pointer in the always-loaded file.

## Rule plus case

A rule says what to do. A case study explains why, using a real failure. Keep them separate: rules stay short; case studies keep the full story.

- Write each rule as one testable line in the file that owns it. State what to do or not do, and when.
- Put the story in a case study using `templates/case-study.md`.
- Link the case from the end of the rule line: `Case: <path>`.
- Link the case back to the rule.
- Name an enforcing hook on the rule line: `Enforced by: <hook file>`.
- Put the rule and case names in the hook’s opening comment.
- Agents and skills may tell one case inline in two to four sentences under **Why this exists**, when the reader needs it to apply the file. Move anything longer to a linked case study.
- Do not write case studies yet. Phase 16 decides where they live. The form is ready.

### The ladder

When Claude gets something wrong, move up one step at a time. Move up only when the step below keeps failing.

1. Add an instruction to the skill, agent, or guide where the mistake happened.
2. Add a one-line rule to a rule file, with its case study.
3. Add a hook that blocks or warns, cited from the rule.

Name the failures that caused each step. A later reader can then decide whether the step is still needed.

## Shapes by file kind

Start every new file of these five kinds from its form.

A file kind is not a file type. The five types in DOCUMENTATION-STANDARD.md § Five file types still apply on top.

Other kinds—roadmap, backlog, decisions, reference, record, task file, project `CLAUDE.md`, and project map—keep their forms and the structure in DOCUMENTATION-STANDARD.md § Structure per file.

| Kind | Form | Loads | Header | Sections, in order |
|---|---|---|---|---|
| Agent | `templates/agent.md` | Description every session; body when started | Frontmatter only | Opening · Why this exists · What you are given · How to work (Subject detail, optional) · Example · Lessons · Report |
| Skill | `templates/skill.md` | Description every session; body when used | Frontmatter only | Opening · When to use · Steps · Example · Subject detail (optional) · Self-check · Related |
| Rule file | `templates/rule-file.md` | Every session, or on need | None if always loaded; full if on need | Opening line · One heading per group of rules · Related |
| Guide | `templates/guide.md` | On need | Full | Summary · When to use · Before you start · One section per stage (Subject detail, optional) · Common mistakes · Quick reference · Related |
| Case study | `templates/case-study.md` | Through a link only | Record | What happened · Why it happened · What it cost · What changed · How to spot it again |

## Agents

An agent works in its own context. It sees only its own file and the material you give it. Its file must therefore work without relying on the main conversation.

### Description

The description loads every session. Use two or three short lines:

- What the agent does.
- When to use it.
- What it is not for.
- At most one short example line.

The full example goes in the body. Every extra example costs tokens in every session.

Use this format for the example line:

```text
Example: <what Amit says> → <what the agent is handed>
```

Do not use an `<example>` block in the description. Do not name the agent itself in the example line.

### Body

- **Opening paragraph:** State what the agent does and what it never does. For a reviewer, state that it does not approve, edit, commit, push, or start another agent.
- **Why this exists:** State the problem the agent solves. Add one real case in two to four sentences, with its date. If no dated case is logged, omit the real-case lines. Do not use a placeholder.
- **What you are given:** List the inputs in order. State what to do when an input is missing or unreadable.
- **How to work:** Use numbered steps or named lenses. State exactly what to check, what evidence to cite, and what counts as a finding. Make the instructions concrete enough that two readers check the same things.
- **Example:** Put the full example here. Use made-up data only. Put more examples in `agent-examples/<name>/`.
- **Lessons:** Use practical lessons from the agent’s own rules and past results. Start each lesson with a bold phrase, then explain the mistake it prevents or the case behind it. Do not invent lessons.
- **Report:** State the exact report shape and word limit. Rank findings by severity. For each finding, give the file and line, what is wrong, why it matters, and the smallest fix. Keep verified facts separate from assumptions. State what “nothing found” looks like: the facts verified, not an empty or padded report.

### Project facts

Put project facts—stack, product words, and which tool a project uses—in small separate files the agent reads. Do not put them in the agent. One agent can then serve every project.

Read-only reviewers report; they do not approve (D52).

Give each agent the fewest tools and the cheapest model that do the job. See `harness/models.md`.

## Skills

A skill gives the main session step-by-step instructions. It complements agents; it does not replace them.

A skill may start an agent. Work that needs a fresh, separate context belongs to an agent.

### General principle

Write a general skill for any kind of work. Put stack detail in the optional **Subject detail** block.

A skill that is coding by nature stays coding throughout. Do not weaken it to look general.

### Description

Use two or three short lines. State what the skill does and the phrases that should start it.

The description loads every session.

### Examples

Put one small example in `SKILL.md`. Put larger examples in `examples/` inside the same skill folder.

Use made-up data only.

`.gitignore` blocks everything not named. Add an allow-line for each new folder and each file inside it.

### Self-check

Use the full check for an important skill. A skill is important when it is risky—secrets, deleting, money, data, or permissions—or when Amit uses it most days.

The full check verifies:

- Every step’s result against the request.
- Every file, number, and claim against its source.
- That no gate was skipped.
- What was not checked.

Use the short check for every other skill:

- The result matches the request.
- State what was not checked.

### Limits and scripts

Keep hard limits in rule files. The skill points to them and keeps only the how.

Put fragile steps in a script in the skill’s own `scripts/` folder. Check the script like code.

Use this folder shape:

```text
skills/<name>/SKILL.md
skills/<name>/examples/       # only when needed
skills/<name>/scripts/        # only when needed
```

### Before creating a skill

Claude may ask Amit up to five short questions. Give each question a recommended answer.

This is an exception to the two-or-three-question rule in STANDARDS.md § Communicate. Record it in D55.

Ask:

1. What is it for?
2. When should it start, and when should it not?
3. What does “done” look like?
4. Which step is risky?
5. What is one real example of using it?

## Rule files

A rule file holds how to work. Write rules in lines short enough to obey without rereading.

- For an always-loaded rule file, use no header. Use bullets and one-liners only.
- For an on-need rule file, use the full header.
- Write one rule per line. Make each rule testable.
- If a rule needs a paragraph, move the paragraph to a procedure—a skill or guide—or a story—a case study.
- Group rules under a few headings by when they apply, not by when they were added.
- End a line with its links when it has them: `Case: <path>` and `Enforced by: <hook file>`.
- Do not put procedures, measurements, or history in a rule file. Put procedures in skills and guides, measurements in reference documents, and history in git.

## Guides

A guide teaches one job from start to finish. Write it for a reader who has not done the job before.

- Start with a **Summary**. State what the guide helps the reader do and the result, in one or two sentences.
- Add **When to use** and **Not for**. Use one line each, so the reader can decide within seconds whether this is the right page.
- Add **Before you start**. State what the reader needs in hand.
- Use one section per stage. Use numbered steps. State how to tell that each stage worked.
- Add **Common mistakes**. Use one line per mistake: “Don’t … — do … instead.”
- Add **Quick reference**. Use a table of task and how, for a reader who already knows the guide.
- Add a contents list after the header when the guide passes about 150 lines.

## Case studies

A case study records the story of one real failure. It keeps the reason behind a rule from being lost.

- Record one event per file.
- Use the record header.
- Write it once. Do not edit it later, except to redact information under DOCUMENTATION-STANDARD.md § Data and security.
- Record facts only: what was seen, dates, and figures with their source.
- Do not assign blame. Use roles, not people’s names.
- Do not include secrets, private data, or company facts from a project.
- Keep it to about 20 to 60 lines: long enough to be believed, short enough to be read.
- Link it both ways: from the rule it explains, and back to that rule.
- Name it `<short-slug>-DD-MM-YYYY.md`.

## Examples

Decision (Amit, D55; amended 26-11-2026): keep the kit’s examples next to the thing they explain. Use made-up data only.

- Put one small example in each skill’s `SKILL.md`.
- Put larger skill examples in that skill’s `examples/` folder.
- Put at most one short example line in each agent description.
- Put the agent’s full example in its body.
- Put additional agent examples in `agent-examples/<name>/`, outside `agents/`, so they never load as agents.
- When you create that folder or a file inside it, add its own `.gitignore` allow-line.

Do not create a repo-wide `examples/` folder. The kit’s mixes command lists and project patterns already have homes in reference documents. A shared folder would hold copies.

Build the examples in Phases 14–15, when skills and agents are rewritten.

## Words to use and avoid

The ID and phase words—Phase, T, B, D, and TC—are in DOCUMENTATION-STANDARD.md § Naming and § IDs and progress.

| Term | What it means here | Do not say |
|---|---|---|
| Approval | Amit’s explicit yes to the approval question | Treat agreement, discussion, or “sounds good” as approval |
| Claude Setup | The global standard in `~/.claude` that every project follows | “The setup project” |
| Cross-check | A fresh, read-only reviewer’s report on one plan or change. It informs; it never approves | “The reviewer approved” or “review passed” |
| Sub-agent | An agent the main session starts for one bounded job, with its own context | “Fork” for a cross-check; a fork inherits the whole conversation |
| Success measure | A number or yes/no that says the goal is met | “Done when it looks right” |
| Case study | The story of one real failure behind a rule | “Post-mortem” or “lessons learned” as a file name or heading |
| Workaround | A change that hides a defect without removing its cause; always name it as one | “Fix” for a workaround |
| Estimate | A figure not measured; always label it | A bare number that reads as measured |

Avoid these phrases anywhere:

- “Note that”
- “It is important to”
- Stacked hedges, such as “might possibly perhaps”
- A rule restated in other words
- Capitals or threats for emphasis
- “Simply” or “just” in front of real work
- “Obviously”

## Related

- [DOCUMENTATION-STANDARD.md](https://github.com/AmitJangra25/claude-setup/blob/main/DOCUMENTATION-STANDARD.md) — document types, headers, IDs, naming, growth, safety
- [STANDARDS.md § Communicate](https://github.com/AmitJangra25/claude-setup/blob/main/STANDARDS.md#communicate) — how replies to Amit read
- `templates/agent.md` · `templates/skill.md` · `templates/rule-file.md` · `templates/guide.md` · `templates/case-study.md` — the five forms
