---
name: feedback-debugger-overlay-intentional
description: "In the DebugProvider overlay component, existing code choices are intentional — don't propose removing/refactoring them unprompted"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 14343bd1-cf58-4f10-a951-9f1e7b7ae72d
  modified: 2026-08-02T05:44:51.343Z
---

When reviewing `DebugProvider` (the in-app debug overlay with FAB, draggable panel, logs/network tabs, custom logger/networkLogger event emitters), the user confirmed "everything is there for a reason" after I flagged some rough edges (in-place `.sort()` mutation, loose `any[]` typing, unbounded log arrays, absolute-positioned copy button).

**Why:** The design choices in this file are deliberate, not oversights — the user is extending it, not looking for cleanup.

**How to apply:** Don't re-raise those specific points as problems, and default to additive changes (new features/tabs/buttons) rather than refactors unless the user explicitly asks for a fix or cleanup in this file.
