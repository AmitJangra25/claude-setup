#!/bin/bash
# T3 (Phase 15 S2.2) — hook test. Checks the setup's guards still work.
# Reads the live repo; writes only inside its own mktemp -d folder, removed on exit.
#
#   bash harness/hook-test.sh             run all checks; exit 1 if any fails
#   bash harness/hook-test.sh --no-hook   same, but the temp clone gets no pre-commit hook,
#                                         so the secret check must FAIL (seen-to-fail run)
#   any other argument: usage error, exit 2
#
# Checks: (a) pre-commit hook present and executable; in a temp clone, a staged made-up
# secret is blocked and a clean commit passes · (b) rtk rewrites `git status` ·
# (c) session-check.sh runs to its end and exits 0.
set -uo pipefail
repo=$(cd "$(dirname "$0")/.." && pwd) || exit 2
case "$#:${1-}" in
  0:) no_hook=0 ;;
  1:--no-hook) no_hook=1 ;;
  *) echo "usage: bash harness/hook-test.sh [--no-hook]" >&2; exit 2 ;;
esac

tmp=$(mktemp -d) || exit 2
trap 'rm -rf "$tmp"' EXIT
fails=0
pass() { echo "PASS  $1"; }
fail() { echo "FAIL  $1"; fails=$((fails+1)); }

# (a1) The live hook is present and executable.
hook="$repo/.git/hooks/pre-commit"
[ -x "$hook" ] && pass "pre-commit hook present and executable" \
               || fail "pre-commit hook missing or not executable: $hook"

# (a2) In a temp clone with the live hook, a staged made-up secret is blocked.
clone="$tmp/clone"
git clone -q "$repo" "$clone" || { fail "could not clone $repo"; exit 1; }
[ "$no_hook" -eq 0 ] && cp "$hook" "$clone/.git/hooks/pre-commit"

# Made-up AWS-shaped key, built from parts so this file never holds the whole pattern.
fake="$(printf '%s%s' 'AK' 'IA')$(printf 'X%.0s' {1..16})"
printf 'made-up test value: %s\n' "$fake" > "$clone/hook-test-fake.txt"
git -C "$clone" add -f hook-test-fake.txt || fail "could not stage the made-up secret"
# Blocked only if the hook names this file; any other commit failure is a FAIL.
if out=$(git -C "$clone" commit -q -m "hook-test: made-up secret" 2>&1); then
  fail "staged made-up secret was committed (not blocked)"
elif printf '%s\n' "$out" | grep -q '^SECRET PATTERN .*hook-test-fake\.txt:'; then
  pass "staged made-up secret blocked"
else
  fail "secret commit failed for another reason: $out"
fi
git -C "$clone" rm -q --cached hook-test-fake.txt >/dev/null 2>&1
rm -f "$clone/hook-test-fake.txt"

# (a3) A clean commit passes.
echo "clean test file" > "$clone/hook-test-clean.txt"
git -C "$clone" add -f hook-test-clean.txt || fail "could not stage the clean file"
if git -C "$clone" commit -q -m "hook-test: clean" >/dev/null 2>&1; then
  pass "clean commit passes"
else
  fail "clean commit was blocked"
fi

# (b) The rtk hook rewrites git status.
out=$(rtk hook check "git status" 2>&1)
[ "$out" = "rtk git status" ] && pass "rtk rewrites git status" \
                              || fail "rtk hook check gave: $out"

# (c) session-check.sh runs on the live setup, reaches its last step and exits 0.
# It always exits 0 by design, so the last line it prints is checked too.
out=$(bash "$repo/harness/session-check.sh" 2>&1); code=$?
if [ "$code" -eq 0 ] && printf '%s\n' "$out" | grep -q '^Session-start check: next gate'; then
  pass "session-check.sh runs and exits 0"
else
  fail "session-check.sh exit $code or no next-gate line"
fi

echo "$fails failed"
[ "$fails" -eq 0 ]
