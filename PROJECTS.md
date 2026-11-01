# Projects

One line per project: path, what it is, and whether it has its own `CLAUDE.md`.
A project without one gets it from `templates/new-project.md`, filled in that project's own session.

Last checked against the filesystem 20-09-2026; entries edited 30-10 and 31-10-2026 were
not re-checked against it. Duplicate trees and the open questions are
in `ENVIRONMENT.md`; branch and sync state is not written down anywhere — read it from
git, per `ENVIRONMENT.md` § *Branch state*. Per-project progress lives in the project's own
files — its `README.md` or its roadmap (FinNode: `docs/ROADMAP.md`). This file stays an index and carries none of it.

## Active

- **FinNode** — `~/Documents/VS Code/FinNode` — offline-first personal Android finance
  tracker for Indian users (Kotlin + Compose, Room + SQLCipher, bank-SMS parsing).
  Has `CLAUDE.md` + `docs/` indexed from `README.md`.
- **Voice Flow** — `~/Documents/VS Code/Voice-Flow` — personal macOS dictation app:
  floating mic widget, global hotkey, speech-to-text, AI cleanup, auto-paste
  (Electron + React + Vite). Has `CLAUDE.md`. The live Voice Flow tree.

## Idle, has a `CLAUDE.md`

- **Emp Portal** (Vthru-Emp) — `~/Documents/VS Code/Emp portal/Vthru_Emp_v2.1_jun26`
  — multi-tenant HR portal (React 18 + Vite, Express 5 + better-sqlite3, role-based
  dashboards). **Real employee records.** Its rules sat in `.claude/CLAUDE.md` until
  20-09-2026 and are now at the project root, like every other project.
- **Debugger** (vthrudebugger) — `~/Documents/VS Code/vthrudebugger_v1` — drop-in
  in-app debugger library for React Native: network/console/error capture, QA alert
  toasts, network inspector, client-side mocks. **The Debugger tree being worked on** —
  Amit's decision, 27-09-2026, not a check of which tree is furthest ahead.

## No `CLAUDE.md` yet

- **Debugger v2** — `~/Documents/VS Code/Debugger v2` — in-app debug overlay for
  React Native. GitHub: `github.com/AmitJangra25/vthrudebugger_v2`. **Next up; may
  become an npm package** (Amit, 30-10-2026). Not a successor to `vthrudebugger_v1`: both
  were seeded independently from V-Thru's `DebugProvider.tsx`, and v2's own memory puts
  `vthrudebugger_v1` deliberately out of scope for it.

## On GitHub only, not on this Mac

- **AtWorkpe** — `github.com/AmitJangra25/AtWorkpe` — multi-tenant company portal:
  leave management, attendance tracking, goals, documents, salary slips, onboarding and
  role-based dashboards (Admin, HR, Manager, Team lead, Employee). Production-ready
  multi-tenant HRMS SaaS, React + Vite client and Express + SQLite server. Not cloned; no
  `CLAUDE.md` yet.

Not projects: `~/Documents/extra/v1.1-Packbly`, `~/Documents/Skils/PM-skills-Amit`, and
`~/Documents/SecondBrain Obsidian/schema` — one `CLAUDE.md` (233 lines in the mirror, 29-10-2026), no code, no git: an
agent brief for an Obsidian vault. Still mirrored in `project-rules/manifest.tsv`, because
that mirror carries rule files through an account switch.
`~/Documents/Voice-Flow-main` was listed here until 20-09-2026 and no longer exists.
See `ENVIRONMENT.md`.

Claude also opens `~` and `~/Documents` themselves as working directories. They are
not projects, get no `CLAUDE.md`, and are covered by the global rules. Ten further
paths appear in `~/.claude.json` from past sessions and no longer exist on disk —
old Voice Flow trees, `Packbly_Admin`, `claudetr` and a `Downloads` copy of Emp
Portal. They are history, not projects, and are deliberately not listed here.
