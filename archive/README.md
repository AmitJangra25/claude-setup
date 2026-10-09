# archive

Things kept because they cannot be recreated, and because `backups/` is gitignored
and therefore local to one machine.
Sections are ordered by whether git can recover the content: items git cannot
recover first, then the recoverable ones (Amit's decision, 09-10-2026).

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

## global-settings-pre-setup-2026-09-15.tar.gz

The global `settings.json` as it stood on 2026-09-15, three days before this repo
existed — two files, 1 KB.

`settings.json.bak` (17:06) and `settings.json.bak.20260915-194038` (19:40) sat
loose at the top level until 2026-10-03. Neither is in git: checked by filename
across every commit, and by content hash as a git blob. The baseline commit
`14883fa` captured `settings.json` as it stood on **2026-09-18**, which is a later
and much larger file — so these two are the only record of the state before the
permission work began. `pre-setup-originals-2026-09-18.tar.gz` covers the
*project* settings of that era but not the global one.

Like the bundle and the pre-setup tarball, and unlike the three `PHASE2` files,
this one is **not** recoverable from git.

```bash
tar -xzf archive/global-settings-pre-setup-2026-09-15.tar.gz -C /tmp
```

## PHASE2-REMOVALS.md · PHASE2C-REMOVALS.md · PHASE2C-REMOVALS.json

**Unlike the three above, these are recoverable from git.** They are tracked, and any
version comes back with `git show <sha>:archive/PHASE2-REMOVALS.md`. They are kept here
for readability rather than durability: they are the working lists from Phase 2, closed
2026-09-18, and until 2026-09-27 they sat at the top level among the files you actually
read.

`PHASE2-REMOVALS.md` is the 144-row approval list — project, file, group and reason for
every permission rule removed in Phase 2a and 2b. The two `PHASE2C` files are the Group B
leftovers from Phase 2c, in prose and as JSON.

Moved 2026-09-27, filenames unchanged, content byte-identical — same git blob hashes
before and after. `SETUP-PLAN.md` § *PHASE 2* points at the new path.
