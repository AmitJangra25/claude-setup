# Projects

Purpose: One row per project — code, path, status, whether it has its own `CLAUDE.md`, what it is, and any data warning. An index only: no progress, branch or sync state.
Owner: Setup sessions (changes are Amit's decision).
Update when: A project is added, moved, renamed, changes status, or gains a `CLAUDE.md`.
Related: `project-rules/manifest.tsv` (mirrored projects) · `ENVIRONMENT.md` (duplicate trees, open questions; § *Branch state* — read branch and sync state from git) · `templates/new-project.md` (a project without a `CLAUDE.md` gets it from here, in its own session) · `DOCUMENTATION-STANDARD.md` § *IDs and progress* (project codes) · old text: `baselines/projects-old-11-11-2026.md`

---

## Projects

Paths last checked against the filesystem 20-09-2026; not re-checked since (11-11-2026: the read-only check was blocked — unverified). Per-project progress lives in the project's own files — its `README.md` or its roadmap (FinNode: `docs/ROADMAP.md`).

| Code | Name | Path | Status | Has CLAUDE.md | What it is | Data warning |
|---|---|---|---|---|---|---|
| FN | FinNode | `~/Documents/VS Code/FinNode` | Active | Yes, + `docs/` indexed from `README.md` | Offline-first personal Android finance tracker for Indian users (Kotlin + Compose, Room + SQLCipher, bank-SMS parsing) | not checked |
| VF | Voice Flow | `~/Documents/VS Code/Voice-Flow` | Active — the live Voice Flow tree | Yes | Personal macOS dictation app: floating mic widget, global hotkey, speech-to-text, AI cleanup, auto-paste (Electron + React + Vite) | not checked |
| EP | Emp Portal (Vthru-Emp) | `~/Documents/VS Code/Emp portal/Vthru_Emp_v2.1_jun26` | Idle — Phase 7 done (PR #14, #15 merged into `main`). The local folder is still on `fix/dead-code-cleanup-and-test-fix`, so its on-disk `CLAUDE.md` is old; the `project-rules/` copy came from GitHub `main` | Yes, at the project root; documents listed in its § *Documents* | Multi-tenant HR portal (React 18 + Vite in `client/`, Express 5 + better-sqlite3 in `server/`, role-based dashboards). Near-twin of AtWorkpe; a separate project | Dummy data only, not live (Amit, 16-11-2026). **Real personal data once live** — treat it as personal data from then |
| DB1 | Debugger (vthrudebugger) | `~/Documents/VS Code/vthrudebugger_v1` | Idle — **the Debugger tree being worked on** (Amit's decision, 27-09-2026, not a check of which tree is furthest ahead). Phase 7 done (PR #11, #12 merged into `main`) | Yes, tracked in git (since PR #11); `MOBILE-CONTEXT.md` is local-only and git-ignored | Drop-in in-app debugger library for React Native: network/console/error capture, QA alert toasts, network inspector, client-side mocks | None found (16-11-2026); company domain in tests accepted while private (B7) |
| DB2 | Debugger v2 | `~/Documents/VS Code/Debugger v2` · GitHub: `github.com/AmitJangra25/vthrudebugger_v2` | **Next up; may become an npm package** (Amit, 30-10-2026) | No | In-app debug overlay for React Native. Not a successor to `vthrudebugger_v1`: both were seeded independently from V-Thru's `DebugProvider.tsx`, and v2's own memory puts `vthrudebugger_v1` deliberately out of scope for it | not checked |
| AW | AtWorkpe | `~/Documents/VS Code/AtWorkpe` · GitHub: `github.com/AmitJangra25/AtWorkpe` | Idle | Yes, + `docs/` indexed from `PROJECT-MAP.md` | Multi-tenant company portal: leave management, attendance tracking, goals, documents, salary slips, onboarding and role-based dashboards (Admin, HR, Manager, Team lead, Employee). Production-ready multi-tenant HRMS SaaS, React + Vite client and Express + SQLite server. Near-twin of Emp Portal; a separate project, set up fresh in Phase 7 | Dummy data only, nothing live (Amit, 14-11-2026). **Real personal data once live** — treat it as personal data from then |

## Not projects

- `~/Documents/extra/v1.1-Packbly` — **holds real personal data** (`OLLAMA.md`).
- `~/Documents/Skils/PM-skills-Amit`.
- `~/Documents/SecondBrain Obsidian/schema` — one `CLAUDE.md` (233 lines in the mirror, 29-10-2026), no code, no git: an agent brief for an Obsidian vault. Still mirrored in `project-rules/manifest.tsv`, because that mirror carries rule files through an account switch.
- `~` and `~/Documents` — Claude opens them as working directories. Not projects, get no `CLAUDE.md`, covered by the global rules.
- `~/Documents/Voice-Flow-main` — listed until 20-09-2026; no longer exists.
- Ten further paths in `~/.claude.json` from past sessions no longer exist on disk — old Voice Flow trees, `Packbly_Admin`, `claudetr` and a `Downloads` copy of Emp Portal. History, not projects; deliberately not listed.

## Names and renames

None yet
