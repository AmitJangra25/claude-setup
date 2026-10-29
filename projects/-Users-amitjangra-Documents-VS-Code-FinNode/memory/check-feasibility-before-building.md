---
name: check-feasibility-before-building
description: "Before building a feature, measure on real data whether it can meet the owner's goal; any number showing a miss goes to the owner before building on."
metadata:
  node_type: memory
  type: feedback
  originSessionId: 60552c09-8fc0-4d12-b9a7-45ebb98b889c
  modified: 2026-10-29T08:17:44.469Z
---

Before planning or building a feature, check with real data (counts only, privacy rules apply) whether it can actually deliver what the owner wants, and show the number. If a measurement made while building shows the plan will miss the goal, stop and show it to the owner at once. Never record it as a side note and carry on.

**Why:** On 29-10-2026 FinNode step 3 (categories from SMS) was built, gated and phone-tested, but sorted only 8 of 142 payments. That figure was known at piece 1 and only written in the handoff. The owner judged it a total fail ("these things should have been discussed 1st day"), lost about 350K tokens, and lost trust in working with Claude. The real limit (an SMS does not say what was bought) was never checked at the app-planning stage.

**How to apply:** For every plan, state the owner's success measure in their terms ("about 90% of payments sorted"), state how it will be checked on real data before building, and name the expected result. Treat a measurement below the goal as a stop-and-ask point, not a note. Applies to all projects, not only FinNode. Related: [[always-recommend-an-option]].
