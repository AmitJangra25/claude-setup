---
name: rollout-plan-5-10-users
description: "Agreed 20-10-2026 — finish the app and ship a .dmg to 5–10 approved users; split PR plan B2→C→D→E1/E2, then Amit tests 1–2 weeks, then F1–F2b, G1a–G4, S1–S2; F/G/signing wait for his go-ahead"
metadata:
  node_type: memory
  type: project
  originSessionId: 772403d2-e23d-438c-8859-09451a13d473
  modified: 2026-10-20T06:18:36.498Z
---

Agreed 20-10-2026. Goal: complete the project and roll out to 5–10 approved users, local-first.

- **Done:** #51 (guest History fix, merged), B1 (#52, user-facing fixes).
- **Split plan, one focused PR each:** B2 Electron error prefix · C safe cleanup (NUL byte, unused imports/vars, "Thirteen tabs" comments) · D doc corrections (incl. Twelve→Thirteen vault checks) · E1 shorten manual-testing.md · E2 shorten roadmap.md · F1 Prompt Engineer · F2a style can disable polish rules (careful default proven untouched) · F2b "Rewrite freely", opt-in · F3 full Transforms UX **after rollout** · G1a Keychain for new keys · G1b migrate keys, remove plain text · G2a licence issuing + validation, no UI · G2b activation screen + expiry · G3 .dmg privacy check + third-party notices · G4 install guide, terms, privacy · S1 sign .dmg with existing cert · S2 Developer ID + notarization (+ auto-paste test; $99 decided then).
- **Order:** next session B2, C, D (separate PRs); then E1 + E2; then **Amit tests by hand for 1–2 weeks**; then F1 → … → S2. **F, G, signing, Chat/Vault, Phase 4/5 implementation, accounts rework and model selection wait for his explicit go-ahead after that testing period.**
- Licence keys: Amit issues and emails them; Google Sheets is his private record only, never checked by the app. Expiry must never lock users out of their own data.
- Not now: server, database, web dashboard, cloud accounts, password-reset email, sync, auto-updater, usage tracking, team plans, built-in payments. Users bring their own OpenAI/Groq/Gemini keys (no licence needed from providers); never ship Amit's keys.
- **Amit is currently the only user:** historical data loss is not critical; no extra backup/recovery/migration work. Testing stays focused on release-blocking areas; Amit does broad manual testing.
- Never remove working code just because it looks unused; only proven dead code, with approval.

**Why:** the app works well enough to share; finishing beats polishing, and small PRs keep each risk reviewable.
**How to apply:** plan each PR, show plan and diff before commit/push, never merge without approval. The plan is also in roadmap.md "Decided 20-10-2026" and the handoff. Related: [[accounts-subscription-later]], [[dictation-is-the-primary-product]].
