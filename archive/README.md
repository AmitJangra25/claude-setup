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
