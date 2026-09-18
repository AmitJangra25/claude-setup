#!/bin/bash
# 6.3 / D13 — keep this repo's copies of each project's CLAUDE.md from drifting.
#
#   ./project-rules/sync.sh          report drift; exit 1 if anything differs
#   ./project-rules/sync.sh --pull   copy the live files over the copies here
#
# The live file in each project is the source of truth. This repo holds a copy
# so the rules travel to another machine or account, per D13 — the projects'
# own repos do not carry them.
set -uo pipefail
cd "$(dirname "$0")" || exit 2
MANIFEST=manifest.tsv
[ -f "$MANIFEST" ] || { echo "no $MANIFEST next to this script"; exit 2; }

mode=report
[ "${1-}" = "--pull" ] && mode=pull
[ "${1-}" = "--pull" ] || [ $# -eq 0 ] || { echo "usage: $0 [--pull]"; exit 2; }

drift=0 missing=0 same=0 pulled=0
while IFS=$'\t' read -r name src; do
  case "$name" in \#*|"") continue ;; esac
  [ -n "${src-}" ] || continue
  copy="$name/CLAUDE.md"
  if [ ! -f "$src" ]; then
    printf 'MISSING SOURCE  %s\n                %s\n' "$name" "$src"; missing=$((missing+1)); continue
  fi
  if [ "$mode" = pull ]; then
    mkdir -p "$name"
    if [ -f "$copy" ] && cmp -s "$src" "$copy"; then same=$((same+1))
    else cp "$src" "$copy"; printf 'PULLED          %s\n' "$name"; pulled=$((pulled+1)); fi
  else
    if [ ! -f "$copy" ]; then printf 'NO COPY YET     %s\n' "$name"; drift=$((drift+1))
    elif cmp -s "$src" "$copy"; then same=$((same+1))
    else printf 'DRIFTED         %s  (live file differs from the copy here)\n' "$name"; drift=$((drift+1)); fi
  fi
done < "$MANIFEST"

if [ "$mode" = pull ]; then
  printf '\n%d pulled, %d already current, %d missing source\n' "$pulled" "$same" "$missing"
  [ "$missing" -gt 0 ] && exit 1 || exit 0
fi
printf '\n%d current, %d drifted, %d missing source\n' "$same" "$drift" "$missing"
[ $((drift + missing)) -gt 0 ] && exit 1 || exit 0
