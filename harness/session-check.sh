#!/bin/bash
# T3 — setup-session start check. Warns; never fixes, never blocks.
# Run by .claude/settings.json → hooks.SessionStart, so only sessions started in ~/.claude.
# Prints nothing when all is well. Whatever it prints is added to the session's context.
cd "$(dirname "$0")/.." || exit 0

if ! out=$(./project-rules/drift.sh 2>&1); then
  echo "Session-start check: mirror drift found. Read-only — nothing was changed."
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
exit 0
