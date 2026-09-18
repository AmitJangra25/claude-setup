---
name: verify-shipped-bundle-not-source
description: "Amit tests Voice Flow Pro against the installed /Applications copy — verify the packaged artifact, not just source and green tests"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: cea89f19-1946-4312-82b0-366daaaec095
  modified: 2026-08-12T13:34:49.293Z
---

Amit validates Voice Flow Pro by using the installed `/Applications/Voice Flow Pro.app`,
not by reading source or trusting `npm test`. When he reports a fix didn't work, he is
reporting on the packaged artifact.

**Why:** on 2026-08-12 he pushed back with "are you sure you have fixed and have you
regenerated the application?" A passing suite and correct source said nothing about what
was actually in the bundle. Three of the real defects that session were invisible from
source alone: a tray icon absent from the electron-builder `files` array, an unsigned
bundle whose identity changed each install (so macOS silently dropped Microphone and
Accessibility), and a prompt rule added to the wrong pipeline stage that unit tests could
not catch because they fed the stage pre-split input.

**How to apply:** before claiming a fix reached him, extract the installed bundle
(`npx @electron/asar extract "/Applications/Voice Flow Pro.app/Contents/Resources/app.asar" <dir>`)
and grep it for a distinctive string from the change. Compare the `app.asar` mtime against
the source file mtimes. Check `codesign --verify --deep` on the installed bundle. Green
tests plus correct source is not evidence the app changed. Read TESTING.md before
debugging by hand — it already documents traps like the `ELECTRON_RUN_AS_NODE=1` one.
