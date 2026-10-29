---
name: accounts-subscription-later
description: "Account/sign-in redesign (real per-user data, subscription model) is planned after Phase 4–5; first rollout uses signed licence keys instead"
metadata:
  node_type: memory
  type: project
  originSessionId: 2f3f3794-64a1-4b30-b87a-cf0ddba47221
  modified: 2026-10-20T04:26:16.643Z
---

On 19-10-2026 Amit decided the account system gets reworked into a subscription model "after the fourth or fifth phase" — not before. On 20-10-2026 he confirmed: the first 5–10 user rollout uses **signed licence keys**, not cloud accounts (see [[rollout-plan-5-10-users]]).

Context found 19-10: data is per-install, not per-account (a new sign-up with the same email sees all existing settings and data); the "Forgot password?" box points to Account → Delete Account, which wipes every data category (and is disabled for guests). Recovery that worked: move accounts.json aside, sign up again.

**Invariant Amit set 20-10-2026, to carry into any account/subscription rework:** guest sign-out/sign-in must never lose History. The 5-entry guest limit is display-only; 5,000 is the storage ceiling; dictating, starring or deleting as a guest never removes older stored entries; signing back in shows everything. Fixed in PR #51 (`readAll()` in historyStore.ts, round-trip tests).

**Why:** Amit sees per-install data as both good and bad; wants to settle it once, as part of the subscription work.
**How to apply:** don't redesign accounts before then; raise these findings when that phase is planned, and keep the History invariant in whatever replaces sign-in.
