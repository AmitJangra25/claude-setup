# VT — Vthru customer app

## Commands

- Start Metro: `yarn start`
- Run: `yarn android` / `yarn ios` (staging) · `yarn android:dev` / `yarn ios:dev` (dev)
- Lint, related files only: `yarn eslint <files>`
- Test, related area only: `yarn jest <path>`
- Branch level check, no fetch: `git rev-list --left-right --count HEAD...@{u}`

## Hard rules

- Nothing Claude-related goes to the team remote. `CLAUDE.md`, `PROJECT-MAP.md` and `.claude/`
  stay hidden through `.git/info/exclude`. Never edit the shared `.gitignore`.
- Claude never pushes, pulls, fetches, resets to the remote, merges, rebases, tags, or opens
  a merge request. The owner pushes and opens merge requests; a collaborator merges.
- Never run `pod*`, `yarn install`, `npm install`, `build-aab*`, `build-apk*`, `codepush:*`,
  `*:production`, `fastlane`, `scripts/release.sh`, `scripts/create-tag.sh`, or anything
  that signs, uploads or publishes.
- Never read, print or stage `.env*`, `.npmrc`, keystores, certificates, Google service
  files, `sentry.properties`, or personal data.
- Never put personal data in logs, Sentry or the debugger. Team review bar:
  `prompts/inline.md`.
- Bug fix order:
  1. Read this file.
  2. Use `PROJECT-MAP.md` only to find the area.
  3. Open only the files needed.
  4. Never automatically read the roadmap, backlog, decisions, tests or unrelated folders.
  5. Check `development` is level with `origin/development` without fetching.
  6. If behind, stop and ask the owner to pull.
  7. Work on a new local branch.
  8. Run only the related `yarn eslint <files>` and `yarn jest <path>`.
  9. Stop for the owner's review.
- Guard 1: update `PROJECT-MAP.md` in the same task, not the same commit.
- Guard 2: after the owner pulls, run `git diff --name-status <recorded-commit>..HEAD`
  (commit recorded in `PROJECT-MAP.md`) and refresh the map if files were added, moved
  or deleted.

## Past defects

None yet

## Documents

- `PROJECT-MAP.md` — which folder holds what; read before searching code
- `.claude/current-task.md` — the task in progress
- `.claude/ROADMAP.md` — phases and tasks
- `.claude/BACKLOG.md` — found work not yet planned
- `.claude/DECISIONS.md` — decisions in force
