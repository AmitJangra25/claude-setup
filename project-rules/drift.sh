#!/bin/bash
# 6.3 / D13 — report where this repo's copies of each project's rules and
# permissions have drifted from the live files.
#
# READ-ONLY. This script never writes. Copying is ./sync.sh --pull, which is a
# separate file on purpose: a reporter that cannot write can be granted safely.
#
#   ./project-rules/drift.sh    report drift and scan for secrets; exit 1 if
#                               anything differs or a secret pattern is found
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

# Secret-pattern scan (audit C7, 01-11-2026). Searches every file git could commit
# from this repo — tracked, staged, or new and not ignored — for the token shapes
# below. Prints file:line and the pattern name only, never the matching text.
# Not every secret format is caught. Binary files (the archive bundle and tarballs)
# cannot be searched as text; they are counted as not scanned.
cd "$(git rev-parse --show-toplevel)" || exit 2
files=()
while IFS= read -r -d '' f; do
  [ -f "$f" ] && files+=("$f")
done < <(git ls-files -z --cached --others --exclude-standard)

names=(sk-key stripe-live github-token github-pat aws-key google-key private-key
       slack-token jwt auth-header key-assignment)
res=('sk-[A-Za-z0-9_-]{20,}'
     'sk_live_[A-Za-z0-9]{10,}'
     'gh[po]_[A-Za-z0-9]{20,}'
     'github_pat_[A-Za-z0-9_]{20,}'
     'AKIA[0-9A-Z]{16}'
     'AIza[0-9A-Za-z_-]{30,}'
     '-----BEGIN [A-Z ]*PRIVATE KEY'
     'xox[a-z]-[A-Za-z0-9-]{10,}'
     'eyJ[A-Za-z0-9_-]{10,}\.eyJ'
     '(Bearer|Basic) [A-Za-z0-9._~+/=-]{16,}'
     "(api_key|apikey|secret|token|password)[\"']?[[:space:]]*[:=][[:space:]]*[\"']?[A-Za-z0-9/+_.-]{12,}")
hits=0 text=0
if [ ${#files[@]} -gt 0 ]; then
  text=$(( $(grep -lI '' -- "${files[@]}" | wc -l) ))
  for i in "${!res[@]}"; do
    flags=-nHIE
    [ "${names[$i]}" = key-assignment ] && flags=-nHIiE
    while IFS= read -r loc; do
      printf 'SECRET PATTERN  %s  %s\n' "$loc" "${names[$i]}"
      hits=$((hits+1))
    done < <(grep "$flags" -e "${res[$i]}" -- "${files[@]}" | cut -d: -f1-2)
  done
fi
printf 'secret scan: %d text files, %d matches, %d not scanned as text\n' \
  "$text" "$hits" $(( ${#files[@]} - text ))

[ $((drift + missing + stale + hits)) -gt 0 ] && exit 1 || exit 0
