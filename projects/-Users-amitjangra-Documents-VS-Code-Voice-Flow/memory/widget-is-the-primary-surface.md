---
name: widget-is-the-primary-surface
description: "The floating widget is Voice Flow's primary surface (11-10-2026); Compose is secondary but kept working; test dictation changes in the widget first"
metadata:
  node_type: memory
  type: project
  originSessionId: 8b0b7a3d-6fb6-457d-a137-36ebe49da902
  modified: 2026-10-11T10:45:44.962Z
---

Amit uses Voice Flow mainly through the floating widget/icon, not Compose — now and
in the future. Standing requirement since 11-10-2026:

- Widget dictation must always work reliably. Widget errors, refusals, status, copy
  and paste behaviour are high priority.
- A widget-only problem that affects normal dictation is a real product bug, not a
  cosmetic one.
- Compose and its Dictate mode stay and keep working, but are secondary and lower
  priority. Never remove them.
- Vault, Chat, mobile and translation stay paused or later.

**Why:** On 11-10-2026 the item 22 installed-app test first failed silently in the
widget — `WidgetDock.tsx` never renders `errorMessage`, so every early exit looks
like nothing happened (backlog: "The widget hides why a dictation stopped"). Amit
then stated the widget is how the product is actually used.

**How to apply:** when testing a dictation change, hand-test the widget first and
say so; Compose checks come second. Rank widget bugs above Compose bugs when
setting priority. Extends [[dictation-is-the-primary-product]]; see also
[[verify-shipped-bundle-not-source]].
