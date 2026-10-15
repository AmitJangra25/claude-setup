---
name: dictation-is-the-primary-product
description: Product priority since 11-10-2026 — dictation and offline speech-to-text first; Chat and Vault paused
metadata:
  node_type: memory
  type: project
  originSessionId: 285f6562-f2de-4128-8a10-93759fa2b216
  modified: 2026-10-11T09:20:12.041Z
---

Voice Flow's primary product is dictation and audio-to-text. Dictation reliability
and offline speech-to-text come first. Chat and Vault are paused; no new work on
them until dictation and offline mode are complete.

**Why:** Amit's decision on 11-10-2026, recorded in `docs/roadmap.md` under
"Decided 11-10-2026 — dictation first, Chat and Vault paused" (PR #4; Chat added
after). Order: Phase 2.75 →
2.9 (if needed) → 3 Offline → 4 Sharing → 5 Transforms → Vault Tests 25-28.
Mobile and translation stay on the later list, unscheduled.

**How to apply:** paused means no new work, not removal — never unhook, delete or
hide Chat or Vault code. Chat means Compose's Local mode with its saved
conversations and attachments; its bugs (e.g. the chat model picker) wait too. Replaces the old "Recorder page becomes
chat" note, which the Compose rename and this decision both overtook. See
[[report-findings-dont-chase-them]].
