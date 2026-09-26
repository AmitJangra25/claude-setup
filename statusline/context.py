#!/usr/bin/env python3
"""Claude Code status line: shows live context size read from the session transcript.

Reads the tail of transcript_path, finds the most recent assistant `usage`
block, and reports input + cache_creation + cache_read = current context.
No estimation.
"""
import json, os, sys

# Thresholds set by Amit on 2026-09-26, lowered from the calibrated defaults
# because he wants the warning before the point he'd act, not at it:
#   220K - first warning; he restarts somewhere around 300-400K
#   300K - act at the next task boundary
#   450K - too deep to /clear safely mid-task, so /compact instead
# Measured against 50 real sessions / 12,623 turns (2026-09-15), for reference:
#   floor at session start ..... 33K-86K (typical ~48K)
#   growth ..................... ~1,200 tokens per turn
#   median session peak ........ 251K      max observed ..... 588K
# So 220K now fires on roughly half of all sessions, by intent - the old 250K
# almost never did. The number itself is always shown (grey); it costs nothing
# to glance at, and nothing in tokens: the status line never enters context.
QUIET, WARN, HIGH = 220_000, 300_000, 450_000
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
