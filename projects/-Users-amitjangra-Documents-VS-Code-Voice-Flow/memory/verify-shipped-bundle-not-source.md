---
name: verify-shipped-bundle-not-source
description: "Amit tests the app against the installed /Applications copy — verify the packaged artifact, not just source and green tests"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: cea89f19-1946-4312-82b0-366daaaec095
  modified: 2026-10-30T10:59:27.086Z
---


> **Now global** — `STANDARDS.md` § Evidence, not assumption. The global copy governs; this file is kept for the evidence behind the rule.
Amit validates the app by using the installed `/Applications/Voice Flow.app`,
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
(`npx @electron/asar extract "/Applications/Voice Flow.app/Contents/Resources/app.asar" <dir>`)
and grep it for a distinctive string from the change. Compare the `app.asar` mtime against
the source file mtimes. Check `codesign --verify --deep` on the installed bundle. Green
tests plus correct source is not evidence the app changed. Read `docs/known-pitfalls.md`
and `docs/manual-testing.md` before debugging by hand — they already document traps like
the `ELECTRON_RUN_AS_NODE=1` one.


**Renamed since this was written.** The app was `Voice Flow Pro` in Aug 2026 and
has been `Voice Flow` since the 19 Aug 2026 rename. The shipped name is `productName` in
`package.json` (twice: top level and the build block); the dev name `Voice Flow (dev)`
lives in `electron/appName.js` and `scripts/appFootprint.js`. The paths above are the current ones; the
evidence below is from when it was still called Pro.
