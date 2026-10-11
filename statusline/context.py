#!/usr/bin/env python3
"""Claude Code status line: shows live context size read from the session transcript.

Reads the tail of transcript_path, finds the most recent assistant `usage`
block, and reports input + cache_creation + cache_read = current context.
No estimation.
"""
import json, os, sys

# Thresholds set by Amit on 11-10-2026, lowered from 250K/400K/550K to save
# tokens: a session past 250K costs more per turn and uses more of the usage
# limit, so the nudge to clear at a task boundary now comes sooner (150K was
# judged too early):
#   200K - first warning
#   300K - act at the next task boundary
#   400K - too deep to /clear safely mid-task, so /compact instead
# Measured against 50 real sessions / 12,623 turns (2026-09-15), for reference:
#   floor at session start ..... 33K-86K (typical ~48K)
#   growth ..................... ~1,200 tokens per turn
#   median session peak ........ 251K      max observed ..... 588K
# History: 250K/400K/600K originally; lowered to 220K/300K/450K on 2026-09-26 to
# fire on roughly half of sessions; raised to 250K/400K/550K on 2026-09-30 because
# against a 1M window 220K fired while ~94% of it was still free; lowered to the
# values above on 11-10-2026.
# The warning is about clearing at a TASK BOUNDARY (measured: 45-54% saved) rather
# than mid-task (~3%) - it is not about running out of room. The number itself is
# always shown (grey); it costs nothing to glance at, and nothing in tokens: the
# status line never enters context.
QUIET, WARN, HIGH = 200_000, 300_000, 400_000
TAIL = 400_000  # bytes of transcript to scan from the end


def ctx_from_transcript(path):
    try:
        size = os.path.getsize(path)
        with open(path, "rb") as fh:
            if size > TAIL:
                fh.seek(size - TAIL)
                fh.readline()  # discard partial line
            lines = fh.read().decode("utf-8", "replace").splitlines()
    except OSError:
        return None
    for line in reversed(lines):
        try:
            u = (json.loads(line).get("message") or {}).get("usage") or {}
        except (ValueError, AttributeError):
            continue
        if u:
            return (u.get("input_tokens", 0)
                    + u.get("cache_creation_input_tokens", 0)
                    + u.get("cache_read_input_tokens", 0))
    return None


def main():
    try:
        d = json.load(sys.stdin)
    except ValueError:
        return
    cwd = d.get("workspace", {}).get("current_dir") or d.get("cwd") or ""
    name = os.path.basename(cwd.rstrip("/")) or "~"
    model = (d.get("model") or {}).get("display_name", "")

    parts = [f"\033[36m{name}\033[0m"]
    if model:
        parts.append(f"\033[90m{model}\033[0m")

    ctx = ctx_from_transcript(d.get("transcript_path", ""))
    if ctx is not None:
        k = ctx / 1000
        if ctx < QUIET:
            parts.append(f"\033[90mctx {k:.0f}K\033[0m")
        elif ctx < WARN:
            parts.append(f"\033[33mctx {k:.0f}K\033[0m")
        elif ctx < HIGH:
            parts.append(f"\033[31mctx {k:.0f}K \033[0m\033[90m· /clear at next task\033[0m")
        else:
            parts.append(f"\033[1;31mctx {k:.0f}K \033[0m\033[90m· /compact if mid-task\033[0m")

    print("  ".join(parts))


main()
