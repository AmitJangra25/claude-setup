#!/bin/bash
# T3 — setup-session start check. Warns; never fixes, never blocks.
# Run by .claude/settings.json → hooks.SessionStart, so only sessions started in ~/.claude.
# Prints only the current next gate when all is well. Whatever it prints is added to the
# session's context.
cd "$(dirname "$0")/.." || exit 0

if ! out=$(./project-rules/drift.sh 2>&1); then
  echo "Session-start check: drift or secret pattern found. Read-only — nothing was changed."
  echo "$out"
fi

# The blanket rule has returned before (open test 2). A synced mirror copy would hide it
# from drift.sh, so search the copies as well as this repo's own settings files.
hits=$(grep -lE '"Bash\(rtk proxy( \*|:\*)\)"' settings.json settings.local.json \
  .claude/settings.json .claude/settings.local.json project-rules/*/.claude/*.json 2>/dev/null)
if [ -n "$hits" ]; then
  echo "Session-start check: Bash(rtk proxy *) is back in:"
  echo "$hits"
fi

# The same bypass in a live project's settings shows above only as drift. Reads only the
# two settings files of each project in the manifest — nothing else in the project.
while IFS=$'\t' read -r name root; do
  case "$name" in \#*|"") continue ;; esac
  [ -n "${root-}" ] || continue
  for rel in .claude/settings.json .claude/settings.local.json; do
    [ -f "$root/$rel" ] || continue
    grep -oE '"Bash\(rtk (proxy|git)( \*|:\*)\)"' "$root/$rel" | while read -r rule; do
      echo "Session-start check: $name $rel allows $rule — skips the ask list."
    done
  done
done < project-rules/manifest.tsv

# Documentation format check (T34). Warn-only; prints nothing when clean.
doc_out=$(./harness/doc-check.sh --quiet 2>&1)
if [ -n "$doc_out" ]; then
  echo "Session-start check: documentation format warnings. Read-only — nothing was changed."
  echo "$doc_out"
fi

# Current next gate (B67): the first paragraph under status.md's "## Next gate", printed
# every session so setup work starts from it instead of from Claude's guess.
gate=$(awk '/^## Next gate/{f=1;next} f&&/^## /{exit} f&&NF{print;exit}' harness/status.md 2>/dev/null)
if [ -n "$gate" ]; then
  echo "Session-start check: next gate (harness/status.md § Next gate): $gate"
else
  echo "Session-start check: no next gate found in harness/status.md § Next gate."
fi
exit 0
