# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Packbly is a logistics platform combining two businesses in one Next.js app: (1) an intracity on-demand courier product (mobile-OTP auth, driver counter-bidding, live tracking, wallet/commission, disputes) and (2) a B2B relocation/warehousing/logistics business run through an internal ticket system — Quote → Order → an 11-stage fulfillment pipeline — with a role-based admin panel, quotations, warehouse contracts, and partner (vendor) management. Marketing pages (home, about, city landing pages, blog) sit alongside customer, partner, and admin dashboards. See `Packbly v2.md` for the original product spec.

## Tech stack

- Next.js 16.1.4 (App Router, React Compiler enabled via `babel-plugin-react-compiler`) + React 19.2.3, Turbopack
- Node 20 (Docker build uses `node:20-alpine`); ESM throughout (`"type": "module"`)
- MongoDB via the native `mongodb` driver — **no Mongoose**
- Auth: JWT (`jose`, HS256, 24h expiry) + `bcryptjs` for PIN/password hashing; bearer tokens stored client-side (no cookie sessions)
- Realtime: Socket.IO 4.8 (server + client)
- Tailwind CSS 4, `lucide-react` icons, `recharts` for admin analytics
- `@aws-sdk/client-s3` for uploads, served via CloudFront
- MSG91 for OTP SMS, Razorpay for payments
- Deploy: Docker (multi-stage) behind Caddy reverse proxy on EC2; GitHub Actions builds/pushes to ECR and redeploys on push to `main` (`.github/workflows/deploy.yml`)

## Architecture map

- **`src/app/`** — App Router. Marketing pages at root (`about`, `contact`, `blog/[slug]`, `city/[slug]`); `customer/dashboard`, `partner/dashboard`, `partner/landing`; `admin/` is the internal ops console (many subpages).
- **`src/app/api/`** — route handlers grouped by domain: `intracity/*` (orders, disputes, OTP verify, cron, settings) for the courier product; `tickets/*` (quotes, orders, partners, customers, payment-ledgers, warehouse-contracts) for the B2B pipeline; plus `forms/*`, `logistics/*`, `users/*`, `partners/*`, `payments/razorpay/*`, `otp/*`, `upload`, `cron/publish`.
- **`src/pages/api/socket.js`** — the one Pages Router file in an otherwise App-Router app. It exists solely to bootstrap Socket.IO (`new Server(res.socket.server, ...)`), which needs the raw Node `req`/`res` that App Router route handlers don't expose. It stores the instance on `global.io`; App Router routes broadcast via `global.io.emit(...)` / `global.io.to(room).emit(...)`.
- **Data layer, three tiers:**
  - `src/models/*.js` — plain-object schema + normalize/create helpers per collection, built via the shared factory `createCollectionModel` in `src/models/collection-factory.js`. Not Mongoose.
  - `src/repositories/*.js` — CRUD functions per entity (`list<Entity>`, `find<Entity>ById`, `insert<Entity>`, ...) that call `model.collection()`.
  - `src/services/*.js` — business logic on top of repositories, e.g. `reportService.js` (admin reporting engine), `blogService.js` (CMS + drives `api/cron/publish`), `customerMetricsService.js` (customer analytics).
  - Most `tickets/*` API routes bypass repositories/models entirely and talk to MongoDB directly via `getMongoClient()` (see Known Pitfalls).
- **`src/lib/`** — the ticket-management engine is a cohesive unit here: `ticket-lifecycle.js` (11-stage definitions + transition rules), `stage-validators.js` (per-stage field requirements), `ticket-status.js` (status/health formatting), `api-middleware.js` (validation helpers, response formatting, role permission matrix), `ticket-operations.js` (frontend fetch/CRUD), `useTicket.js` (React hooks). `TICKET_DEVELOPER_GUIDE.md`, `LIBRARY_REFERENCE.md`, and `INTEGRATION_GUIDE.md` at the repo root document this system in depth — read them before changing stage/validation logic.
- **`src/lib/server-auth.js`** — `getAuthenticatedUser(req, db)` + `requirePermission(req, permission)`: verifies the bearer JWT, looks the user up across `users`/`customers`/`partners` collections, attaches role permissions (admin → everything; others from the `roles` collection / `src/config/permissions.js` catalog).
- **`src/context/`** — `AuthContext.jsx` (client auth state, localStorage-persisted user/token, pre-expiry warning + auto-logout timers) and `NotificationContext.jsx` (in-app notification list).
- **`src/components/`** — feature components, not a generic UI-kit (no button/input primitives layer): business widgets like `BookingWidget.jsx`, `TrackingWidget.jsx`, `MapPickerModal.jsx`; `src/components/admin/` holds admin-only widgets.

## Must-follow rules

- New DB access should go through the models/repositories pattern (`src/models` + `src/repositories`), not a fresh `MongoClient` in a route file — several `tickets/*` routes already deviate from this; don't add more.
- Always connect via `getMongoClient()` from `src/lib/mongodb.js` (`MONGO_URI`). Don't read `MONGODB_URI`/`MONGODB_DB` — those are dead vars left over in some ticket routes (see pitfalls).
- Auth is enforced per-route, not centrally — new API routes must explicitly call `getAuthenticatedUser`/`requirePermission` from `src/lib/server-auth.js`; there is no middleware guard (`src/app/api/middleware.js` is an empty file).
- Ticket stage transitions must go through `validateStageTransition` + `validateForStage` before writing `ticketStage`; don't write stage/status fields directly.
- Financial fields (`salesPrice`, `partnerPrice`) are role-gated — filter them per role (see `getFinancialVisibility` / the `redactOrderForRole` pattern in `src/app/api/tickets/orders/route.js`) rather than returning raw documents to unauthorized roles.
- Realtime events go through `global.io` (set by `src/pages/api/socket.js`) — don't spin up a second Socket.IO server instance.

## Commands

- `npm run dev` — start dev server (Turbopack)
- `npm run build` / `npm run start` — production build / start
- `npm run lint` — ESLint (`eslint-config-next` core-web-vitals; several `react-hooks/*` rules are disabled in `eslint.config.mjs`)
- No test suite exists (no test script, no test framework installed) — verify changes manually via `npm run dev` against the affected pages/API routes.
- Docker: `docker build .` / `docker compose up -d` (`docker-compose.yml` runs the Next app behind Caddy). Deploys are automated on push to `main` via `.github/workflows/deploy.yml` → ECR → EC2 — don't push to `main` expecting no side effects.

## Known pitfalls

- Two Mongo connection patterns coexist: `src/lib/mongodb.js` (`MONGO_URI`, the real one, used via `getMongoClient()`) vs. several `src/app/api/tickets/*/route.js` files that declare unused `MONGODB_URI`/`MONGODB_DB` consts as dead leftovers — the actual DB name is hardcoded `"packbly"` everywhere. Those env vars aren't read for anything real.
- Env vars actually in use: `MONGO_URI`, `JWT_SECRET`, `AWS_REGION`/`AWS_ACCESS_KEY_ID`/`AWS_SECRET_ACCESS_KEY`/`AWS_BUCKET_NAME`/`AWS_CLOUDFRONT_URL`, `MSG91_AUTH_KEY`/`MSG91_REGISTERATION_OTP_TEMPLATE_ID`/`MSG91_LOGIN_OTP_TEMPLATE_ID`, `RAZORPAY_KEY_ID`/`RAZORPAY_KEY_SECRET`, `INTRACITY_PRICE_SECRET`, `NEXT_PUBLIC_API_URL`, `NEXT_PUBLIC_GOOGLE_MAPS_API_KEY`. There's no `.env.example` in the repo — confirm with whoever manages secrets before wiring up a new integration.
- `src/app/api/partners/login/route.js` accepts a plaintext PIN match if it doesn't look bcrypt-hashed (`partner.pin.startsWith('$2')`) — a backward-compatibility shim for legacy records, not a pattern to copy into new auth code.
- MongoDB clients must not be created at module load during `next build` — `src/lib/mongodb.js` explicitly guards on `process.env.NEXT_PHASE === "phase-production-build"`. Follow the same guard if you add another module-level DB client.
- `src/app/api/middleware.js` is an empty file, not real Next.js middleware — don't assume it's protecting any route.
