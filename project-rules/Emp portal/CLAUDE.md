# Emp Portal

## Commands

Run from the project root. Two independent npm packages, `client/` and `server/`; the root has no `package.json`. Dev needs two terminals: the API, then the client.

| Command | What |
|---|---|
| `npm install --prefix client` / `npm install --prefix server` | Install dependencies (two independent packages) |
| `npm run dev --prefix server` | API on :4000, seeds DB on first run |
| `npm run dev --prefix client` | Vite on :5173, proxies /api -> :4000 |
| `npm run build --prefix client` | Production build -> `client/dist/` |
| `npm run lint --prefix client` | ESLint — currently lints `client/` only; `server/` is not linted (B5) |
| `npm run typecheck --prefix client` | `tsc --noEmit -p tsconfig.app.json` |
| `npm run --prefix server typecheck` | Server type check |
| `npm run --prefix server test` | `tsx --test test/*.test.ts` — real Express app, ephemeral temp DB dir |
| `npm run --prefix server seed` | Idempotent demo-data seed |

`.claude/launch.json` defines `api` and `web`; `web` still runs `npm run dev` at the root and is broken (B6).

### Known pitfalls

- The API only binds to `127.0.0.1` (`index.ts`) — it is not reachable from another host/container without changing the bind address.
- `dev-login` (passwordless quick sign-in) only works when `NODE_ENV` is not production and only against the seeded demo org — don't rely on it existing in prod builds.
- Without `GMAIL_USER`/`GMAIL_APP_PASSWORD` set, password-reset emails are never actually sent — the reset link only appears in the API console log, which is easy to miss while testing that flow.
- `server/data/` contains a live SQLite DB (WAL mode: expect `.db-wal`/`.db-shm` sidecar files) — don't delete/reset it casually, it holds dummy dev data (D2); use `VTHRU_DATA_DIR` to get an isolated one instead.
- The rate limiter is in-memory — restarting the API resets rate-limit counters. Sessions are not: they are stored in the `sessions` table, so they survive a restart and expire only on their own 8h TTL.
- Frontend and server are lint/typechecked as two separate TS projects (`client/tsconfig.app.json` vs `server/tsconfig.json`); running the wrong `typecheck` script won't catch errors in the other package.

## Hard rules

- **Data safety (D2).** Dummy data only today (owner, 16-11-2026). From go-live, everything in `server/data/` (database and uploads) is real personal data.
- Never read, copy, print, stage or commit `.env*`, anything in `server/data/`, credentials, tokens or secrets.
- `server/data/` is ignored by the root `.gitignore`, but its database and WAL files were committed before that rule (B1). Stage named files only — never `git add .` or `git add -A`.
- Never print the demo passwords in `server/src/seed.ts`; never search that file in a way that prints seeded logins.
- Emp Portal is a separate project from AtWorkpe: never read, copy from or change AtWorkpe.
- **Auth is cookie/session-based, not token-based (D5).** Never add `Authorization` headers or client-side token storage — extend `AuthContext`'s query-cache model instead.
- **Every mutation from the client must go through `lib/api.ts`** so the `X-Requested-With: fetch` header is sent — a fetch that skips it will be rejected by `csrfGuard` with 403.
- **All org-scoped backend queries must filter by `org_id`** (via `orgOf(req)`); `super_admin` rows have `org_id = NULL` by DB constraint — don't bypass this for tenant isolation.
- **Schema changes need two-sided updates (D7)**: a DB column/table change in `db.ts` + the matching Zod schema in `client/src/schemas/` (frontend) and the route's inline validation (backend) — several schema files explicitly comment-link the server line they mirror; keep that comment accurate.
- **New DB columns use `ensureColumn()` (D6)**, not a migration file — this repo has no migration framework.
- **Query-key invalidation follows the `xKeys.all` convention** in each `hooks/use*.ts` — new mutations should invalidate the domain's key (and any cross-entity keys, e.g. lookups) rather than manually refetching.
- **Uploaded files are validated by extension allow-list + size (5MB)**, not just MIME sniffing — follow the existing pattern in `routes/files.ts` for any new upload endpoint.
- Runtime data (`server/data/vthru.db*`, `server/data/uploads/`) is git-ignored — never commit it; set `VTHRU_DATA_DIR` to relocate for tests/dev.

## Past defects

- `44e7409` (31-07-2026, folder move to `client/`): the root `.gitignore` moved into `client/`, so `server/data/` was no longer ignored and `server/data/vthru.db` plus its WAL files were committed. Fix and guard: B1.

## Documents

- `PROJECT-MAP.md` — which folder holds what, and which document gets which change; read before searching code
- `.claude/current-task.md` — the task in progress (git-ignored)
- `docs/ROADMAP.md` — phases and tasks
- `docs/BACKLOG.md` — found work not yet planned
- `docs/DECISIONS.md` — decisions in force
- `client/README.md` — product overview, getting started, password-reset email setup
- `docs/archive/` — dated records of superseded documents; the pre-Phase-7 `CLAUDE.md` is `docs/archive/claude-md-16-11-2026.md`
