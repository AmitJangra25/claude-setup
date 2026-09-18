# V-Thru Employee Portal

Multi-tenant HR portal (leave management, attendance, goals, documents, salary
slips) with role-based dashboards for super admin, admin, HR, manager, and
employee. Two independent npm packages: a React SPA at the repo root and an
Express API in `server/`. In dev, Vite proxies `/api` to the API so the
browser only ever talks to one origin; sessions are cookie-based, so there is
no separate token/CORS story.

## Tech stack (installed versions)

**Frontend (root)** — React 18.3.1 + TypeScript 5.6.3 + Vite 5.4.8, Tailwind
3.4.17, TanStack Query 5.101.4, React Router 7.18.1, React Hook Form 7.82.0 +
`@hookform/resolvers`, Zod 4.4.3, lucide-react icons. Node 22.

**Backend (`server/`)** — Express 5.2.1 + better-sqlite3 12.11.1, Zod 4.4.3,
multer 2.2.0 (file uploads), nodemailer 9.0.3, run via `tsx` (no build step
in dev). TypeScript 5.9.3, `strict: true`, `noUncheckedIndexedAccess`.

## Architecture map

### Frontend (`src/`)
- `main.tsx` — mounts `QueryClientProvider` > `BrowserRouter` > `App` (+ React Query Devtools in DEV).
- `App.tsx` — all routes; wraps everything in `AuthProvider` > `LookupProvider`. One `<Route path="/{role}" element={<ProtectedRoute allow={[role]}/>}>` block per role.
- `routes/ProtectedRoute.tsx` — gates on auth, forces `/force-password-change` when `user.mustChangePassword`, then checks `allow?: UserRole[]`. `roleHomePath(role)` maps role → base path.
- `routes/lazyViews.ts` — every view is `React.lazy`-loaded, chunk-split per role.
- `contexts/AuthContext.tsx` — auth state *is* a TanStack Query (`['auth','me']`, `staleTime: Infinity`, no refetch-on-focus) against `GET /api/auth/me`. No token storage — login/logout just write/clear the query cache. Exports `ROLE_LABELS`.
- `contexts/LookupContext.tsx` — thin wrapper over `useLookups()`; shared org reference data (teams/positions/countries), skipped for `super_admin`.
- `lib/api.ts` — fetch wrapper, prefixes `/api`, `credentials: 'same-origin'`, sends `X-Requested-With: fetch` (required by backend CSRF guard on mutations). Throws typed `ApiError(status, message)`. Has `downloadFile()` for blob downloads.
- `lib/queryClient.ts` — `staleTime: 30_000`; custom retry (no retry on 401/403/404, else 1 retry; mutations never retry).
- `hooks/use*.ts` — one file per domain (employees, leaves, attendance, goals, etc.). Convention: export `xKeys = { all: [...] }`, a `useXQuery()`, and mutation hooks that `invalidateQueries({ queryKey: xKeys.all })` on success (cross-entity invalidation where relevant, e.g. employee mutations also invalidate lookups). `useToggleEmployeeStatus` shows the optimistic-update pattern (`onMutate`/`onError`/`onSettled`).
- `schemas/*.ts` — one Zod schema file per domain, consumed by RHF's `zodResolver`. Several files comment-link to the mirrored server-side check (e.g. `leave.ts` → `server/src/routes/leaves.ts`) — **keep these two in sync when changing validation.**
- `components/` — organized by role: `admin/` (15 files, full admin surface), `employee/` (7, self-service views reused by manager/hr/employee routes), `hr/` (1, thin dashboard reusing admin/employee views), `manager/` (2, same pattern), `superadmin/` (3, org/subscription management), `layout/` (Header, Sidebar), `shared/` (10, cross-role primitives: Modal, Badge, StatCard, ApplyLeaveModal, ProfileView, etc.).

### Backend (`server/src/`)
- `index.ts` — calls `ensureSeed()` then starts the app on `127.0.0.1:PORT` (default 4000).
- `app.ts` — Express app wiring: security headers, in-memory rate limiter (600 req/min/ip), `csrfGuard`, then one router mount per resource under `/api/*`; JSON body limited to 256kb; central error handler (multer size limit → 413, JSON parse → 400, else 500).
- `auth.ts` — sessions: random 32-byte token in an `HttpOnly; SameSite=Strict` cookie (`vthru_sid`, 8h TTL, `Secure` in prod); only the SHA-256 hash is stored server-side (`sessions` table). `requireAuth` checks session expiry + user/org active status. `requireRole(...roles)` middleware. `orgOf(req)` extracts `org_id` for tenant scoping (super_admin has `org_id = NULL`). `csrfGuard` requires `X-Requested-With: fetch` header on non-GET requests (defense-in-depth on top of `SameSite=Strict`).
- `db.ts` — better-sqlite3, WAL mode, `foreign_keys=ON`. Schema is inline `CREATE TABLE IF NOT EXISTS` (no migration framework) plus idempotent `ensureColumn()` for backward-compatible additions. Tables: `organizations, countries, teams, positions, users, sessions, password_resets, public_holidays, leave_requests, leave_balances, attendance_records, goals, documents, salary_slips, notifications, subscription_requests, audit_logs`.
- `security.ts` — scrypt password hashing (`scrypt:N:r:p:salt:key`, timing-safe verify); `RateLimiter` (sliding window, in-memory, auto-GC); password policy + temp password generator.
- `routes/` — one file per resource; `super.ts` (org creation/suspension/subscriptions, `super_admin`-only), `auth.ts` (login/logout/dev-login/change-password/forgot-reset-password), `files.ts` (multer memoryStorage, 5MB/1-file limit, extension allow-list, files written to `data/uploads/{uuid}{ext}` mode `0o600`), `users.ts`, `leaves.ts`, `attendance.ts`, `goals.ts`, `holidays.ts`, `lookups.ts` (+ teams), `misc.ts` (audit/notifications/reports/bulk).
- `helpers.ts` — `parseBody(schema, body)` (Zod → `HttpError(400,...)`), `sendError(res, err)` (used by every route's `catch`), `audit()`/`notify()`/`notifyApprovers()`, date/subscription utilities.
- `seed.ts` — `ensureSeed()` is idempotent (no-ops if any `super_admin` row exists); creates a platform super admin + demo org "Acme Corporation" with teams/positions/users/leave/attendance/holidays/goals.
- `mailer.ts` — nodemailer via Gmail only if `GMAIL_USER`+`GMAIL_APP_PASSWORD` set; otherwise logs the reset link to console.

## Must-follow rules

- **Auth is cookie/session-based, not token-based.** Never add `Authorization` headers or client-side token storage — extend `AuthContext`'s query-cache model instead.
- **Every mutation from the client must go through `lib/api.ts`** so the `X-Requested-With: fetch` header is sent — a fetch that skips it will be rejected by `csrfGuard` with 403.
- **All org-scoped backend queries must filter by `org_id`** (via `orgOf(req)`); `super_admin` rows have `org_id = NULL` by DB constraint — don't bypass this for tenant isolation.
- **Schema changes need two-sided updates**: a DB column/table change in `db.ts` + the matching Zod schema in `src/schemas/` (frontend) and the route's inline validation (backend) — several schema files explicitly comment-link the server line they mirror; keep that comment accurate.
- **New DB columns use `ensureColumn()`**, not a migration file — this repo has no migration framework.
- **Query-key invalidation follows the `xKeys.all` convention** in each `hooks/use*.ts` — new mutations should invalidate the domain's key (and any cross-entity keys, e.g. lookups) rather than manually refetching.
- **Uploaded files are validated by extension allow-list + size (5MB)**, not just MIME sniffing — follow the existing pattern in `routes/files.ts` for any new upload endpoint.
- Runtime data (`server/data/vthru.db*`, `server/data/uploads/`) is git-ignored — never commit it; set `VTHRU_DATA_DIR` to relocate for tests/dev.

## Build / test / run

```bash
# install (two independent packages)
npm install
npm install --prefix server

# dev (two terminals)
npm run dev --prefix server   # API on :4000, seeds DB on first run
npm run dev                   # Vite on :5173, proxies /api -> :4000

# frontend
npm run build                 # production build -> dist/
npm run lint                  # eslint (frontend + server, one config)
npm run typecheck             # tsc --noEmit -p tsconfig.app.json

# server
npm run --prefix server typecheck
npm run --prefix server test  # tsx --test test/*.test.ts — real Express app, ephemeral temp DB dir
npm run --prefix server seed  # idempotent demo-data seed
```

## Known pitfalls

- The API only binds to `127.0.0.1` (`index.ts`) — it is not reachable from another host/container without changing the bind address.
- `dev-login` (passwordless quick sign-in) only works when `NODE_ENV` is not production and only against the seeded demo org — don't rely on it existing in prod builds.
- Without `GMAIL_USER`/`GMAIL_APP_PASSWORD` set, password-reset emails are never actually sent — the reset link only appears in the API console log, which is easy to miss while testing that flow.
- `server/data/` contains a live SQLite DB (WAL mode: expect `.db-wal`/`.db-shm` sidecar files) — don't delete/reset it casually, it holds real dev data; use `VTHRU_DATA_DIR` to get an isolated one instead.
- The rate limiter and session store are in-memory — restarting the API drops all sessions (forces re-login) and resets rate-limit counters.
- Frontend and server are lint/typechecked as two separate TS projects (`tsconfig.app.json` vs `server/tsconfig.json`); running the wrong `typecheck` script won't catch errors in the other package.
