# archive

Things kept because they cannot be recreated, and because `backups/` is gitignored
and therefore local to one machine.

## voice-flow-pre-rewrite-2026-09-21.bundle

Voice-Flow's complete git history **as it stood before the 2026-09-21 rewrite** —
162 commits, both branches, 2.2 MB.

The rewrite stripped `CLAUDE.md` from every commit with `git-filter-repo` 2.47.0 and
force-pushed, which made the original commits unreachable on GitHub. This bundle is
the only durable copy. The live tree's `backups/2026-09-21-voice-flow-history/` mirror
holds the same thing but is gitignored, so it dies with the machine.

**It contains the 4,647-byte `CLAUDE.md` that the rewrite removed.** That is the point
of keeping it, and it is why this repo must stay private — the same reason
`project-rules/` already holds every project's current `CLAUDE.md`.

Original tips: `ad38b97` (main) · `34ad3cd` (phase-2.75-stop-losing-words).
Rewritten tips, for comparison: `e0be479` · `6fb7c91`.

### Restoring it

```bash
git clone archive/voice-flow-pre-rewrite-2026-09-21.bundle voice-flow-original
git -C voice-flow-original log --all --oneline -- CLAUDE.md   # proves it is all there
```

To put that history back on GitHub, add the remote and force-push both branches — which
undoes the rewrite for everyone. Verified 2026-09-21: `git bundle verify` reports a
complete history, and a test clone returned all 162 commits with both original tips.

## pre-setup-originals-2026-09-18.tar.gz

The 29 files from `backups/` that existed in **no git repository at all** — 127 KB
compressed, 390 KB raw. Kept when `backups/` was deleted on 2026-09-21, because
everything else in it was recoverable and these were not.

Established by hashing all 135 backup files as git blobs and testing membership
against every commit in this repo and all eight project repos: 101 were recoverable,
34 were not, and 5 of those 34 were Claude Code's own `.claude.json.backup.*` app
state — account info and caches the app rewrites itself — deliberately not kept.

What is in it:

- **Voice-Flow's original `CLAUDE.md`, 110 KB** — the file item 5.1 cut to 29 KB. It was
  never in any git repo, because `CLAUDE.md` is gitignored in that project. This is the
  only copy of the version the evidence in `docs/working-rules.md` was extracted from.
- **The pre-cleanup permission state** — eight project `settings.json` /
  `settings.local.json` files as they stood before Phase 2, when the projects held 560
  `allow` rules. `project-rules/` only began mirroring after that cleanup, so the repo
  has no record of what was removed.
- **The original `SETUP-PLAN.md`**, from before the baseline commit `14883fa`.

Verified 2026-09-21: extracted to a temp directory and compared file by file — all 29
byte-identical to the originals, before `backups/` was removed.

```bash
tar -xzf archive/pre-setup-originals-2026-09-18.tar.gz -C /tmp   # restores under backups/
```
