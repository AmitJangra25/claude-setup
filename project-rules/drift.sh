#!/bin/bash
# 6.3 / D13 — report where this repo's copies of each project's rules and
# permissions have drifted from the live files.
#
# READ-ONLY. This script never writes. Copying is ./sync.sh --pull, which is a
# separate file on purpose: a reporter that cannot write can be granted safely.
#
#   ./project-rules/drift.sh    report drift; exit 1 if anything differs
#   ./project-rules/sync.sh --pull   copy the live files over the copies here
#
# The live file in each project is the source of truth. This repo holds a copy
# so those files survive a new machine or account. Whether a project also tracks
# them in its own repo varies — see README.md. Either way the copy here travels.
#
# Files mirrored per project, each skipped if the project does not have it:
#     CLAUDE.md · .claude/settings.json · .claude/settings.local.json
#
# Skills are deliberately NOT mirrored — see README.md.
set -uo pipefail
cd "$(dirname "$0")" || exit 2
MANIFEST=manifest.tsv
[ -f "$MANIFEST" ] || { echo "no $MANIFEST next to this script"; exit 2; }

TRACKED=("CLAUDE.md" ".claude/settings.json" ".claude/settings.local.json")

[ $# -eq 0 ] || { echo "usage: $0   (no arguments; to copy, use ./sync.sh --pull)"; exit 2; }

drift=0 missing=0 same=0 stale=0
while IFS=$'\t' read -r name root; do
  case "$name" in \#*|"") continue ;; esac
  [ -n "${root-}" ] || continue
  found=0
  for rel in "${TRACKED[@]}"; do
    src="$root/$rel"
    copy="$name/$rel"
    if [ ! -f "$src" ]; then
      # source absent: only a problem if we are holding a copy of something gone
      if [ -f "$copy" ]; then
        printf 'STALE COPY      %-22s %s  (source no longer exists)\n' "$name" "$rel"
        stale=$((stale+1))
      fi
      continue
    fi
    found=$((found+1))
    if [ ! -f "$copy" ]; then printf 'NO COPY YET     %-22s %s\n' "$name" "$rel"; drift=$((drift+1))
    elif cmp -s "$src" "$copy"; then same=$((same+1))
    else printf 'DRIFTED         %-22s %s\n' "$name" "$rel"; drift=$((drift+1)); fi
  done
  if [ "$found" -eq 0 ]; then
    printf 'MISSING SOURCE  %-22s none of the tracked files exist under\n                %s\n' "$name" "$root"
    missing=$((missing+1))
  fi
done < "$MANIFEST"

printf '\n%d current, %d drifted, %d stale copies, %d projects with nothing to mirror\n' \
  "$same" "$drift" "$stale" "$missing"
[ $((drift + missing + stale)) -gt 0 ] && exit 1 || exit 0
