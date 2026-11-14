# FinNode — project instructions

Offline-first personal Android finance tracker for Indian users. Kotlin + Jetpack Compose, single module, package-by-feature. Solo build.

**Read [docs/ROADMAP.md](docs/ROADMAP.md) before starting work** — it says which phase is
active and what its success criteria are. Full reference docs are indexed in
[README.md](README.md). Phase history lives in the roadmap, not here.

## Commands

```bash
export JAVA_HOME=/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home

./gradlew assembleDebug
./gradlew testDebugUnitTest          # JVM unit tests — no device needed
./gradlew connectedDebugAndroidTest  # instrumented + Compose UI tests — finnode_api36 only:
                                     # it deletes the attached device's transactions
./gradlew lint
./scripts/audit.sh                   # the hard rules a compiler cannot check
```

Toolchain lives outside the defaults: JDK 17 at
`/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home`, Android SDK at
`/opt/homebrew/share/android-commandlinetools`. `JAVA_HOME` must be exported before any
`./gradlew` invocation. Java 17 is required by AGP 9.4.0. Booting `finnode_api36` and the
rest of the setup is in [docs/SETUP.md](docs/SETUP.md).

### Before any change is called done

Not once per checkpoint — once per change. The checkpoint gate is days wide, and a single
fix needs its own.

```bash
export JAVA_HOME=/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home
./gradlew testDebugUnitTest lint assembleDebug assembleRelease
./scripts/audit.sh
```

- All four Gradle tasks green, and **zero lint errors** (warnings are tolerated — see
  [docs/SETUP.md](docs/SETUP.md)).
- `./scripts/audit.sh` passes. It is the mechanical form of the hard rules below — the two
  money-math greps plus the `Double`, dynamic-colour, KAPT and bare-`.dp` checks. It has a
  ratchet on bare `.dp`: that number may go down, never up.
- **If a screen now reads or writes a transaction, add it to `CrossScreenPropagationTest`.**
  That suite *is* the list of surfaces the live-data contract covers, and the one defect 2a
  shipped was on the single surface missing from it.
- **If it touches UI or data, walk it on device.** Not the Preview panel, not a passing
  test. Every phase of this project has hidden defects that compiled clean.
  `adb shell am start -n com.finnode.debug/com.finnode.ui.gallery.GalleryActivity` shows
  every component and all four states in both themes.

## Hard rules

- **Money is `Long` in paise.** Never `Double` for an amount — not in entities, DTOs, ViewModels, or test fixtures.
- **No network dependencies in v1.** No Retrofit/OkHttp, no cloud SDKs, no Firebase. Bank SMS never leaves the device.
- **KSP, never KAPT.**
- **Room 2.8.x** — do not upgrade to the 3.0 alpha.
- **AGP 9 compiles Kotlin itself.** Never add `org.jetbrains.kotlin.android` — it is a
  hard build error, not a redundancy. The Compose compiler plugin is still needed.
- **compileSdk 37, targetSdk 36.** Current AndroidX refuses compileSdk below 37; targetSdk
  stays 36 by product decision. Don't "fix" the mismatch.
- **Every Room schema version bump needs a migration test.** `@AutoMigration` from version 1; commit the exported schema JSON.
- **No hardcoded colors or spacing outside `ui/theme/`.** Spacing uses 4dp grid multiples,
  with one recorded exception: the 14dp list-row padding used on every row in the design.
- **All user-facing strings in `strings.xml`.**
- **Semantic colors** (credit/debit/refund/warning) are hardcoded and exempt from *all*
  theming — a debit must never read as a credit. They were exempt from dynamic theming;
  dynamic theming is now gone entirely, and they stay fixed regardless.
- **`docs/Design/src/` is the visual source of truth**, with two exceptions where specified
  and tested behaviour wins: money formatting (`MoneyFormatter` — always 2 decimals, U+2212,
  never the mockups' `₹680` and ASCII hyphen) and the 48dp minimum touch target.
- **Nothing sensitive in logs.** Timber's release tree drops below WARN.
- **`core/parser` stays pure JVM** — no Android imports, so its SMS corpus tests run on the JVM.
- **Manual transactions get a random hash, parsed ones a deterministic digest.** Never
  unify these — a shared formula makes two identical manual entries collide on the UNIQUE
  index and the second silently fails. See `core/db/TransactionHasher`.
- **Direction lives in `TransactionType`, never in the sign of `amountMinor`.** Stored
  amounts are always positive; `MoneyFormatter.formatSigned` applies the sign at render, and
  `MoneyMath.signedMinor` takes the magnitude rather than trusting it.
- **A background job verifies nothing by existing.** WorkManager's delay is elapsed-realtime,
  so moving the device clock forward does *not* fire a pending sweep, and forcing a periodic
  job that already ran in its period is refused outright. The recipe that does work — fresh
  install with the clock just before 9, then wait — is in
  [docs/archive/roadmap-to-13-11-2026.md](docs/archive/roadmap-to-13-11-2026.md#verifying-the-sweep--a-wall-clock-jump-is-not-enough) under 2c-ii. A sweep that was never seen to
  run is a sweep that does not run.
- **Only `core/domain/MoneyMath` derives a figure from transactions.** No ViewModel sums,
  nets, balances or compares amounts itself. `MoneyMath` is pure JVM so every figure the user
  sees is unit-tested rather than eyeballed. Checkpoint 3 found six copies of `signedMinor`
  and 2a found four more, including `AmountText` — a rendering helper does not look like
  arithmetic, which is exactly why it survived the first sweep.
- **Nothing holds a snapshot of database state.** Room `Flow` → repository → `StateFlow` →
  `collectAsStateWithLifecycle()`, unbroken. A list copied into a `var`, a value read once in
  `init`, or a stray `.first()` on a read path is a second source of truth and severs live
  updates silently. A snapshot is not wrong when it is taken — it is wrong later, which is
  why the rule is absolute rather than "be careful".
- **A screen that *displays* a row observes it; a form that *edits* one reads it once.** The
  repository offers both — `observeById` and `getById` — and picking the wrong one is a
  defect in either direction. A read surface on `getById` goes stale the moment anything
  writes; a form on `observeById` overwrites what the user is halfway through typing. This
  cost checkpoint 2a a real bug: transaction detail was on `getById`, harmlessly, until it
  grew an Edit button.
- **A write confirms itself from its `Result`, never from the tap.** Success raises the top
  toast; refusal states its reason on the field that caused it.
- **A refusal is an outcome, not a failure.** An action the app declines on purpose — deleting
  an account that still has transactions — is not a `Result.failure`; nothing went wrong.
  `core/data/CatalogOutcome` is the shape: `Result` answers "did the write reach the
  database", the outcome answers "should it have happened", and the refusal carries the number
  the guard actually decided on so the message cannot disagree with it.
- **A guard that protects a reference counts soft-deleted rows.** Every *read* surface hides
  `isDeleted` rows, and every *guard* must not: a soft-deleted transaction is one Undo away
  from being live, so it is still a live reference. Getting this backwards lets an account be
  deleted and an Undo restore a row pointing at nothing — silently, because the ledger renders
  an unresolved row as a blank subtitle. See `core/db/dao/TransactionDao.countForAccount`.
- **`isArchived` is observed on a form; the editable fields are read once.** Not an exception
  to the rule above it — the rule protects the user's draft, and nothing on the form edits
  `isArchived`. Read once, an archive button still reads "Un-archive" immediately after
  un-archiving, and the second tap does nothing at all.
- **A control that silently does nothing is a defect, not a safeguard.** Prefer making an
  action wait for the state it needs over disabling it and dropping the input. An affordance
  whose destination does not exist yet is not on screen yet. This one cost Phase 1b a week:
  the Add sheet disabled its own Save button for the first few hundred milliseconds of every
  open, so a tap in that window vanished, and both "failing tests" were that one bug.
- **Empty is not the same as not-yet-loaded.** Any state read from Room or DataStore carries
  a loading flag, or the UI confidently asserts something false about the user's own data.

### How to work on this project

`~/.claude/STANDARDS.md` governs — **Evidence, not assumption** · **Fix the cause, not the
symptom** · **Build the smallest thing that does the job** · **Stay on the task you were
given**. Read them there. This section records only what they have cost *here*.

- A defect that cannot be fixed now goes in [docs/BACKLOG.md](docs/BACKLOG.md) with what was
  **observed**, not guessed — and so does anything serious noticed while working. But writing
  it down is itself a change, so it happens **only when the approved plan for the task
  included that recording**. If the plan did not, say what you found in a line or two and ask
  before writing it anywhere: backlog, roadmap, memory, `CLAUDE.md` or any other doc. Either
  way, carry on with the task you were given — except if evidence shows the task will miss
  its success measure. In that case, stop, show me the number, and wait. An unrequested fix
  costs a review, a device pass, and a fresh chance to break something that already worked.
- Building ahead of the phase needs a reason recorded at the time. `DiaryDao`, `ReminderDao`
  and `last4Digits` are the precedent — each wrote down why a form with nothing behind it
  throws the user's input away.
- Feature scope is [docs/BACKLOG.md](docs/BACKLOG.md). Ask *is this required to use the app
  daily?* If the answer is no, it waits for the phase that owns it.

### Private data, design reference and permissions

- **The SMS corpora live in `private/`, which never enters git** — `sms-corpus.jsonl` (151
  real messages, 3a's) and `sms-corpus-2.jsonl` (775 from the owner's phone, GO 2), both
  cleaned. No real account or card digit goes into a committed file; tests use invented ones.
  Raw bank SMS and statements live in `private/` only; a test that needs the corpus needs an
  anonymised copy committed on purpose, which is Phase 3's decision to make, not a
  convenience to take.
- **Claude never reads `private/`** — not with Read, Grep or any shell command, and not SMS
  text from logs either: counts and crash lines only. `.claude/settings.json` denies the
  Read tool and the common readers in every rtk spelling; a script or a recursive grep from
  a parent folder is not covered, so the rule is the rule, not the fence.
- **`docs/Design/src/` is the final visual reference** since the 2026-09-03 redesign — read
  for layout, spacing, colour and copy, **never ported line-by-line**. The consequences that
  bite are in [docs/DESIGN_SYSTEM.md](docs/DESIGN_SYSTEM.md) and
  [docs/TECH_STACK.md](docs/TECH_STACK.md).
- **The app declares two permissions.** `POST_NOTIFICATIONS`, requested from the Reminders
  screen, and `READ_SMS`, requested from the SMS inbox only after its disclosure is accepted
  — telephony is marked optional. The notification listener stays undeclared until a phase
  builds its disclosure: declaring a sensitive permission before the feature exists is what
  gets a Play Store submission rejected. **The disclosure text must stay true to the code**:
  it promises only bank messages are kept, which is why a message from a phone number is
  skipped and never stored (`SmsParser`, `Kind.PERSONAL`).

### Use what already exists

Check here before writing something new — most of it is one import away.

If the project has `PROJECT-MAP.md`, read it before searching code; when you add, move,
rename or delete files, update it in the same commit, following the guards at its top.

- **`core/notification/ReminderNotifier`** — the only thing that builds, posts or cancels a
  notification. `ReminderRepository` cancels through it whenever a reminder is settled or
  deleted, so no caller has to remember to.
- **`ui/theme/`** — `FinNodeTheme.colors` (`FinNodeColors` carries the neutrals M3 has no
  slot for: `elevated`, `nav`, `subtle`, the `paper*` family; the M3 scheme is mapped from
  the same values so stock and hand-built components cannot drift). `FinNodeType` — twelve
  named roles, so **never set `fontSize` in a screen**. `Spacing`, `Sizes`, `Radii` in
  `Dimens.kt` — never a bare `.dp` outside `ui/theme/`. `FinNodeIcons` — the design's
  stroked 1.8-weight glyphs; add to this set rather than reaching for a Material Symbol, or
  two icon weights end up in the same row.
- **`ui/components/`** — scaffolds, containers, list rows, chips, buttons, amount text,
  toggle, keypad, sheet, toast, charts, dialogs.
- **`ScreenState` + `ScreenStateHost`** — a sealed interface, so loading, ready, error and
  permission-denied all have to be answered. The design supplies only *empty*, and an
  unloaded list rendering as "you have nothing" is exactly what cost Phase 1b.
- **`core/domain/MoneyMath`** — every derived figure. **`core/format/`** — `MoneyFormatter`,
  `DateFormatter`, `CategoryEmoji`. Nothing formats money inline in a Composable.
- **Chrome is decided in one place, the nav host** — status-bar icon colour from
  `FinNodeTheme.colors.isLight` (never `isSystemInDarkTheme()`), and full-screen overlays
  inside a tab report themselves via `onOverlayChange`. See
  [docs/DESIGN_SYSTEM.md](docs/DESIGN_SYSTEM.md).
- **`app/src/debug/`** — the two debug-only surfaces, neither compiled into release:
  `ui/gallery/GalleryActivity` (every component, all four states, both themes) and
  `debug/SeedActivity` + `DemoDataSeeder` (1,168 transactions over 18 months, fixed random
  seed so two runs agree, and a clear that removes only its own rows). Launch them with
  `adb shell am start -n com.finnode.debug/com.finnode.debug.SeedActivity`. Being declared only
  in the debug manifest *is* the guarantee they cannot fire on a real install — verified by
  checking the release APK's dex and manifest, not by asserting it.
- **`core/debug/Measure.phase`** — the timing used for 2d-i's baseline, debug-only and
  `BuildConfig.DEBUG`-guarded. 2d-ii-a must re-measure through the same helper, or it is
  comparing two methods and calling the difference Paging.
- **Instrumented tests share the app's real encrypted database**, which survives between
  runs. Any test asserting on a count, an empty state, or a node that must be unique resets
  first — `TransactionRepository.deleteAll()` in `@Before`, and cleanup goes in `@After`
  where a failure cannot skip it. A suite that only passes on a fresh install will fail the
  first time someone clicks through the app by hand.
- **So `connectedDebugAndroidTest` deletes every transaction on whichever device `adb` is
  pointed at.** Run it on the `finnode_api36` emulator only. Never on a phone holding data
  you use — from Phase 5 that is your own, and the debug build's `.debug` application id is
  no protection, because that is the build you will be using it in.

## Past defects

Every defect this project has shipped got past a compiler and a green test suite first —
four in Phase 0, five in 1b, three and two in 1c, one in 2a, all hiding behind the
assumption that a build means a working app.

The hard rules above that name a cost — 1b's Save button, checkpoint 3's six copies of
`signedMinor`, 2a's `getById` on transaction detail — are those defects, each with the rule
that stops it returning. Step 3 of Phase 3 (built before its goal was measured) is in
[docs/archive/claude-setup-fix-note-29-10-2026.md](docs/archive/claude-setup-fix-note-29-10-2026.md).

## Documents

- [docs/ROADMAP.md](docs/ROADMAP.md) — phases, tasks and progress; **where the work stands now** (this file keeps no status).
- [docs/BACKLOG.md](docs/BACKLOG.md) — found work not yet planned, and what is deliberately not in v1.
- [docs/DECISIONS.md](docs/DECISIONS.md) — decisions in force, D1 onwards; product decisions stay in [docs/SPEC.md](docs/SPEC.md) § 1–2.
- [docs/archive/](docs/archive/) — dated records: the roadmap and backlog before 13-11-2026, phase history, word for word.
- `.claude/current-task.md` — the task in progress (git-ignored).
- [README.md](README.md) — index of the reference docs.
- [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) — MVVM + Repository. One ViewModel per screen, `StateFlow` for state, `Channel` for one-shot events. Repositories return `Flow`; Compose collects with `collectAsStateWithLifecycle()`. Hilt for all DI. Errors as `Result`/sealed classes — no exceptions across layer boundaries.
