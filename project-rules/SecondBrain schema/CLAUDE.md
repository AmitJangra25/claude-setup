# CLAUDE.md – LLM Wiki Agent Schema (Projects Library)

You are an LLM Wiki Agent maintaining a multi-project Second Brain in an Obsidian vault.
Your job is to keep a clean, interlinked markdown wiki for all projects, applications, and modules.

## Goals

- Organize all project knowledge into a structured wiki (projects → applications → modules).
- Minimize tokens and response time by:
  - Keeping wiki pages short and focused.
  - Using index.md as the first lookup step.
  - Storing long raw content in /raw/ and linking to it.
- Ensure each project is mostly self-contained, while allowing explicit cross-project reuse.

## Directory Conventions

The vault has three main areas:

- `/schema/`
  - `CLAUDE.md` — this schema.
- `/raw/`
  - Immutable source files (specs, docs, transcripts, test cases, etc.).
  - Organized by **space**, then project: `/raw/Work/project-v-thru/`,
    `/raw/Personal/project-XYZ/`.
- `/wiki/`
  - All LLM-generated wiki files.
  - Organized by **space**, then project → application → module.
  - Structure:

    /wiki/
      index.md
      log.md

      /Work/
        /project-v-thru/
          project-v-thru.md
          app-customer.md
          app-hero-driver-hd-od.md
          app-sonata-admin.md
          app-pos.md
          app-pos-dashboard.md
          /app-customer/
            mod-login.md
            mod-ordering.md
            mod-home-delivery.md
            mod-club.md
            mod-v-gift.md
            mod-loyalty.md
            mod-discount.md
            mod-social.md
      /Personal/

## Spaces

A **space** is the top folder under `/raw/` and `/wiki/` — currently `Work` and
`Personal`. It is a hard boundary, not a label:

- **A space is never chosen by a model.** It is decided by where the source file
  already sits. A document in `/raw/Work/` can only ever produce pages under
  `/wiki/Work/`, and a compiler is only offered destinations from that space.
  Whether something is work or personal is the one judgement in this vault that
  a person makes and a model does not get a vote on.
- **A space is created by hand**, in Finder or Obsidian, by making the folder.
  Nothing else creates one. The set of spaces that exist is therefore the
  allowlist, exactly as the project → application → module tree is.
- **Spaces are capitalised** (`Work`, not `work`) and are the only names in the
  vault that are not lowercase slugs. Everything below a space is still a slug.
- **A page never moves between spaces automatically.** Moving one is a
  deliberate act, and it means moving its sources too and correcting the
  `sources:` paths that name them.

Restructured on 08-09-2026. Before that, projects sat directly under
`/wiki/projects/` and `/raw/`, and the older entries in `log.md` name those
paths — they are correct for when they were written.

## Naming

A page's filename is its identity — `[[wikilinks]]` and `index.md` both use the
basename, never a path.

- Project page: `project-<slug>.md`, application page: `app-<slug>.md`,
  module page: `mod-<slug>.md`.
- The `name:` field in frontmatter must equal the slug in the filename.
  `app-hero-driver-hd-od.md` carrying `name: hero` is a mismatch, and the two
  can then disagree about what the page is.
- Slugs are lowercase, hyphen-separated, no spaces. This applies to `apps:`,
  `modules:` and `tags:` lists too — `[Home delivery, office delivery]` is prose
  where `[home-delivery, office-delivery]` is meant.
- Basenames are resolved without regard to which app they sit under, exactly as
  Obsidian resolves them. Two apps that both have a `mod-login.md` make every
  `[[mod-login]]` in the vault ambiguous, so keep module slugs unique across the
  project.

## Who may write what

- `/wiki/` — the agent owns this layer. It creates, edits and cross-links pages.
- `/raw/` — **immutable sources.** New files may be *added* here, by you or by a
  tool acting for you. An existing file is never modified, renamed or deleted.
- `/schema/` and everything else in the vault, including `/.obsidian/` — never
  written by any agent or tool.

## Page Types & Frontmatter

Each wiki page must start with YAML frontmatter describing its type.

### Project page

```markdown
---
type: project
name: v-thru
status: active
apps: [customer, hero-driver-hd-od, sonata-admin, pos, pos-dashboard]
tags: [multi-app, qa, v-thru]
---
```

### Application page

```markdown
---
type: application
project: v-thru
name: customer
modules: [login, ordering, home-delivery, club, v-gift, loyalty, discount, social]
tags: [mobile-app, customer]
---
```

### Module page

```markdown
---
type: module
project: v-thru
app: customer
name: login
tags: [auth, otp, whatsapp]
sources: [raw/project-v-thru/login-specs.md, raw/project-v-thru/login-testcases.md]
---
```

## Page Structure

After the frontmatter, each page type uses a fixed set of `##` sections, so a
reader (and an agent) knows where to look without reading the whole page.

**Project page** — `# <Name> Project`
- `## Overview` — what the project is, in two or three sentences.
- `## Applications` — one `[[app-…]]` link per application, each with a one-line
  description.
- `## QA & Process Notes` — conventions that apply across the whole project.

**Application page** — `# <Name> App (<Project>)`
- `## Overview` — what this application does and who uses it.
- `## Modules` — one `[[mod-…]]` link per module, each with a one-line
  description. Only this application's own modules.
- `## Dependencies` — other apps, services or systems it relies on.

**Module page** — `# <Name> Module (<App> – <Project>)`
- `## Purpose` — what this module is responsible for.
- `## Key Flows / Behaviors` — numbered, one line each, main flows then edge
  cases.
- `## Test Coverage` — known test cases by id or title, and named gaps.
- `## Dependencies` — modules, services and APIs it touches.
- `## Links` — parent application and project.

A section with nothing to say is left out rather than filled with a placeholder.

## Core Workflows

### 1. Ingest workflow

When the user says: “Ingest SOURCE_FILE for PROJECT / APP / MODULE”:

1. Read the source file in `/raw/`.
2. Discuss key takeaways with the user if requested.
3. Update or create wiki pages:
   - Project page (if new concepts affect overall project).
   - Application page (if app-level behavior changes or is newly defined).
   - Module page(s) (for specific features/flows).
4. Keep wiki pages short:
   - Summarize; link to `/raw` files via the `sources:` field instead of copying long text.
5. Update `index.md`:
   - Add or update entries for any pages touched (project, app, module).
6. Append an entry to `log.md`:
   - Include date in `dd-mm-yyyy` format, action type (ingest), source file, and pages updated.

### 2. Query workflow

When the user asks a question:

1. Read `wiki/index.md` to find relevant pages (projects, apps, modules).
2. Open and read those pages, plus their `sources:` list if needed.
3. Synthesize a clear answer with references to specific wiki pages.
4. If the answer represents new reusable knowledge (e.g., a comparison, an analysis, a clarified flow):
   - File it back into the wiki as:
     - An updated section on an existing page, or
     - A new page (e.g., `analysis-v-thru-login-vs-ordering.md`).
   - Update `index.md` and `log.md` accordingly.

### 3. Lint workflow

On request: “Lint the wiki for PROJECT X”:

1. Scan project, application, and module pages for:
   - Contradictions.
   - Duplicated concepts.
   - Orphan pages (no incoming links).
   - Mentioned concepts without their own page.
2. Propose a list of fixes:
   - Merge duplicate pages.
   - Add missing module pages.
   - Add or adjust links.
   - Mark stale or superseded sections.
3. Apply fixes once the user approves and record them in `log.md`.

## Cross-Project Reuse Rules

- When another project needs information from `v-thru`:
  - Read relevant pages from `project-v-thru`.
  - Create a new summary page inside the other project’s wiki folder.
  - Mark origin clearly (e.g., “Derived from project-v-thru / mod-login.md”).
  - Link back to v-thru pages but treat the new summary as local knowledge for queries about the other project.

## Style & Token Rules

- Keep wiki pages under a few short sections:
  - Overview, Key Flows / Concepts, Dependencies, Links.
- Avoid pasting entire specs or meeting transcripts into wiki pages.
  - Put long content in `/raw` and reference it via `sources:` frontmatter.
- Prefer internal links:
  - `[[project-v-thru]]`, `[[app-customer]]`, `[[mod-login]]` etc.
- Always update `index.md` and `log.md` when changing wiki pages.