---
name: vthru-debugger-workflow-preferences
description: "How the user wants bug-fix/feature work handled in vthrudebugger_v1 — plan-first, ask-don't-guess, one PR per feature"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: e91f886c-4133-48d0-ba20-da6aec85c954
  modified: 2026-07-28T16:44:48.707Z
---

For UI/bug-fix work on this repo, follow this loop: understand the problem, share a written plan (issue-by-issue, with file:line references), let the user review, only then implement.

**Why:** Stated explicitly at the start of a multi-issue session ("before you start fixing it, do share with me. I will review, and then we'll move forward") and reinforced every time a new issue was added to the list — the user consistently wants to review scope/approach before code changes happen, even mid-session for a single new issue.

**How to apply:** Don't jump straight to editing files once a bug/feature is described. Research first (read the relevant components, grep for existing helpers before writing new ones — e.g. a `pathOf()` URL-shortener already existed but wasn't applied everywhere), then post a concise plan grouped by issue, then wait for a go-ahead.

When a plan detail is genuinely ambiguous (e.g., "keep tabs" could mean the top Logs/Network header tabs or the per-request Overview/Headers/Response sub-tabs), ask via a clarifying question instead of picking one silently — this user has corrected guessed interpretations more than once (e.g. reversing "inline expand" back to "keep full-screen detail, just restyle it"). If the user's own phrasing is internally contradictory, point out the contradiction explicitly rather than silently picking a side.

Each distinct feature/fix gets pushed as its **own PR on its own branch off `main`**, not stacked on an earlier unmerged PR branch — confirmed when asked to "create a new PR" for a follow-up feature (swipe-to-dismiss) while an earlier PR (panel size/URL/keyboard/transparency fixes) was still open/unmerged. When branching for a new unrelated change while another PR branch is checked out with uncommitted work, stash just the relevant file(s), branch fresh off `main`, and pop the stash there — don't carry the other PR's unmerged commits along.

Never commit or push without being asked; this user has explicitly said "do not commit" even while asking for a PR to be prepared — branch + commit + push + `gh pr create` is the expected flow once they say "send for review" or equivalent, but nothing lands on `main` directly.

Related: [[vthru-customer-app-debug-toggle]]
