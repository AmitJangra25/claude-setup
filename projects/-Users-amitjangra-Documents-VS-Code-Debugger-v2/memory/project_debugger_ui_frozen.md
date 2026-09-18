---
name: project-debugger-ui-frozen
description: "Debugger overlay UI is frozen — keep the existing look exactly, no visual/styling/layout changes"
metadata: 
  node_type: memory
  type: project
  modified: 2026-08-03T05:59:55.624Z
  originSessionId: c15c9e24-546d-4d9c-ac53-00931497bd43
---

On 2026-08-03 the user shared a screenshot of the running Debugger overlay (Network tab) and said the current UI is what they want kept: "no UI changes."

Confirmed current design, from the screenshot:
- Tabs top-left (`Logs` / `Network`), active tab a light translucent grey; toolbar top-right (expand arrows, trash).
- Network rows: `HH:MM:SS.mmm` timestamp, method colour-coded (GET blue, POST green, red when the response carries an `error`), path, right-side chevron that expands the row.
- Expanded row: `STATUS CODE` / `METHOD` / `DURATION (ms)` label-value pairs with orange values, then error text, then a JSON tree — orange keys, `▶` disclosure triangles for nested objects, `{}` for collapsed ones.
- Whole surface translucent black, Courier throughout, hairline separators between rows.

**Why:** The overlay's look is already what the QA team uses and recognises; restyling it would be churn with no benefit and would make QA screenshots inconsistent with past ones.

**How to apply:** Treat styling, colours, fonts, spacing, and layout in the overlay as fixed. Work on it is behavioural/structural only — porting missing components ([[project-debugger-repo-fresh-start]]), decoupling imports, capture wiring — and any component written to replace a missing import must reproduce this exact appearance. Related: [[feedback-debugger-overlay-intentional]].
