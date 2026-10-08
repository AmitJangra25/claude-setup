---
name: finnode-ui-redesign-handoff
description: Where the FinNode Figma Make UI redesign stands as of 2026-10-06, and what happens next
metadata:
  type: project
---

**A second Figma Make UI pass is underway, replacing the 2026-09-03 design.** The
copy committed at `docs/Design/src/` is now stale — it has no onboarding screens and
its login is PIN-only, while the new design was rebuilt from scratch. The new one
lives at [[figma-finnode-design-repo]].

Settled with Amit across 2026-10-04 to 2026-10-06:

- **Personal / sideload only**, not Play Store. So READ_SMS stays viable and Phase 3
  proceeds as the roadmap writes it.
- **Phone login, OTP and bank-account discovery are dropped** — no server exists to
  verify them. PIN + optional biometric, PIN always the fallback.
- **Design ahead, build on schedule.** Figma draws Phase 4 screens and the Insights
  additions now; they are built when their phase arrives. Cheap to draw, expensive to
  build early.
- **"AI" means rule-based arithmetic**, never a model — forecast, saved-this-month,
  recurring-payment detection, unusual spend, payment-method split, a what-changed
  table, vendor frequency.
- Profile keeps all four fields (name, last name, email, phone) by Amit's call, though
  nothing in the app reads the email or phone.

Four prompts were written and run through Figma Make: tech spec, full UI pass, a
nine-issue fix pass, and an export button that writes `finnode-design.json` from a row
in Settings. Figma Make reported all of them implemented.

**Next:** clone the design repo to a scratch folder, read it, and report what is
actually there versus what Figma Make claimed. Then write a plan — for approval, not
to act on — for replacing `docs/Design/src/` and updating `docs/Design/README.md`.
Roadmap work (checkpoint 2d-ii-a) has not started and is untouched by any of this.
