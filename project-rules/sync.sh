#!/bin/bash
# 6.3 / D13 — keep this repo's copies of each project's rules and permissions
# from drifting.
#
#   ./project-rules/sync.sh --pull   copy the live files over the copies here
#   ./project-rules/drift.sh         report drift, read-only; exit 1 if any differs
#
# --pull is required. Reporting moved to drift.sh, which has no write path, so
# that a read-only drift check can be granted without also granting the copy.
#
# The live file in each project is the source of truth. This repo holds a copy
# so those files survive a new machine or account, per D13. Whether a project also
# tracks them in its own repo varies — the August 2026 keep-them-out preference
# reversed on 2026-09-20; see README.md. Either way the copy here travels.
#
# Files mirrored per project, each skipped if the project does not have it:
#     CLAUDE.md · .claude/settings.json · .claude/settings.local.json
#
# Skills are deliberately NOT mirrored: they were judged to travel in the project's
# own repo, so a copy here would be a second copy of a tracked file - the drift this
# script exists to prevent. Not verified per project; see README.md.
set -uo pipefail
cd "$(dirname "$0")" || exit 2
MANIFEST=manifest.tsv
[ -f "$MANIFEST" ] || { echo "no $MANIFEST next to this script"; exit 2; }

TRACKED=("CLAUDE.md" ".claude/settings.json" ".claude/settings.local.json")

[ "${1-}" = "--pull" ] && [ $# -eq 1 ] || { echo "usage: $0 --pull   (to report instead, use ./drift.sh)"; exit 2; }

missing=0 same=0 pulled=0 stale=0
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
    mkdir -p "$(dirname "$copy")"
    if [ -f "$copy" ] && cmp -s "$src" "$copy"; then same=$((same+1))
    else cp "$src" "$copy"; printf 'PULLED          %-22s %s\n' "$name" "$rel"; pulled=$((pulled+1)); fi
  done
  if [ "$found" -eq 0 ]; then
    printf 'MISSING SOURCE  %-22s none of the tracked files exist under\n                %s\n' "$name" "$root"
    missing=$((missing+1))
  fi
done < "$MANIFEST"

printf '\n%d pulled, %d already current, %d stale copies, %d projects with nothing to mirror\n' \
  "$pulled" "$same" "$stale" "$missing"
[ $((missing + stale)) -gt 0 ] && exit 1 || exit 0
