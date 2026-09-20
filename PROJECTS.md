# Projects

One line per project: path, what it is, and whether it has its own `CLAUDE.md`.
A project without one gets it by running the per-project setup prompt inside it.

Verified against the filesystem 2026-09-20. Branch state, duplicate trees and the
open questions are in `ENVIRONMENT.md` — this file stays an index.

## Active

- [x] **FinNode** — `~/Documents/VS Code/FinNode` — offline-first personal Android finance
  tracker for Indian users (Kotlin + Compose, Room + SQLCipher, bank-SMS parsing).
  Phase 2, checkpoint 2c-i next. Has `CLAUDE.md` + `docs/` indexed from `README.md`.
- [x] **Voice Flow** — `~/Documents/VS Code/Voice-Flow` — personal macOS dictation app:
  floating mic widget, global hotkey, speech-to-text, AI cleanup, auto-paste
  (Electron + React + Vite). Has `CLAUDE.md`. The live Voice Flow tree.

## Idle, has a `CLAUDE.md`

- [x] **Emp Portal** (Vthru-Emp) — `~/Documents/VS Code/Emp portal/Vthru_Emp_v2.1_jun26`
  — multi-tenant HR portal (React 18 + Vite, Express 5 + better-sqlite3, role-based
  dashboards). **Real employee records.** Its rules sat in `.claude/CLAUDE.md` until
  2026-09-20 and are now at the project root, like every other project.
- [x] **Debugger** (vthrudebugger) — `~/Documents/VS Code/vthrudebugger_v1` — drop-in
  in-app debugger library for React Native: network/console/error capture, QA alert
  toasts, network inspector, client-side mocks.
- [x] **Packbly Web** — `~/Documents/VS Code/Packbly_web/v1.1-Packbly` — logistics
  platform: intracity courier + B2B relocation/warehousing tickets (Next.js 16 +
  React 19, MongoDB, Socket.IO, JWT). **Real customer and courier records.**
- [x] **Voice Flow v1** — `~/Documents/VS Code/Voice Flow_v1` — earlier Voice Flow tree.
- [x] **SecondBrain schema** — `~/Documents/SecondBrain Obsidian/schema` — schema for an
  Obsidian vault.

## No `CLAUDE.md` yet

- [ ] **Debugger v2** — `~/Documents/VS Code/Debugger v2` — in-app debug overlay for
  React Native. Successor to `vthrudebugger_v1`.
- [ ] **Packbly v2** — `~/Documents/VS Code/Packbly_v2/packblyfima3` — a Figma code
  export, likely a design bundle rather than an app.

Not projects: `~/Documents/extra/v1.1-Packbly`, `~/Documents/Skils/PM-skills-Amit`.
`~/Documents/Voice-Flow-main` was listed here until 2026-09-20 and no longer exists.
See `ENVIRONMENT.md`.

Claude also opens `~` and `~/Documents` themselves as working directories. They are
not projects, get no `CLAUDE.md`, and are covered by the global rules. Ten further
paths appear in `~/.claude.json` from past sessions and no longer exist on disk —
old Voice Flow trees, `Packbly_Admin`, `claudetr` and a `Downloads` copy of Emp
Portal. They are history, not projects, and are deliberately not listed here.
