# AtWorkpe

## Commands

Run from the project root. Each package has its own `package.json`; the root has none.

| Command | What |
|---|---|
| `npm install --prefix server` / `npm install --prefix client` | Install dependencies |
| `npm run dev --prefix server` | API on 127.0.0.1:4000 with watch reload; seeds the database on start |
| `npm start --prefix server` | API without watch |
| `npm run seed --prefix server` | Seed the database |
| `npm test --prefix server` | API tests (`server/test/*.test.ts`) |
| `npm run typecheck --prefix server` | Server type check |
| `npm run dev --prefix client` | Vite dev server on port 5173; proxies `/api` to port 4000 |
| `npm run build --prefix client` | Production build to `client/dist/` |
| `npm run lint --prefix client` | ESLint (client only) |
| `npm run typecheck --prefix client` | Client type check |
| `npm run preview --prefix client` | Preview the production build |

`.claude/launch.json` starts both as `api` and `web`.

## Hard rules

- **Data safety (D2).** Dummy data only today (owner, 14-11-2026). From go-live, everything in `server/data/` (database and uploads) is real personal data.
- Never read, copy, print, stage or commit `.env*`, anything in `server/data/`, credentials, tokens or secrets.
- `server/data/` is ignored by git (root `.gitignore`). Still stage named files only — never `git add .` or `git add -A`.
- Never print the demo passwords in `server/src/seed.ts`.
- AtWorkpe is a separate project from Emp Portal: never read, copy from or change Emp Portal.

## Past defects

None yet

## Documents

- `PROJECT-MAP.md` — which folder holds what, and which document gets which change; read before searching code
- `.claude/current-task.md` — the task in progress (git-ignored)
- `docs/ROADMAP.md` — phases and tasks
- `docs/BACKLOG.md` — found work not yet planned
- `docs/DECISIONS.md` — decisions in force
- `README.md` — product overview, environment variables, deploy checklist
- `docs/archive/` — dated records of superseded documents
