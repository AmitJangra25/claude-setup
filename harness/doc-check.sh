#!/bin/bash
# T34 — documentation format check (DOCUMENTATION-STANDARD.md § Format check).
# Warn-only: never fixes, never blocks, always exits 0. Reads files; writes nothing. No AI.
# Runs from: harness/session-check.sh (with --quiet). Later, each project's commit check
# (Phases 6 and 7, in that project's own session).
#
#   harness/doc-check.sh           warnings, then the count of documents not yet in format
#   harness/doc-check.sh --quiet   warnings only; prints nothing when clean
#
# Output: "WARN <file>: <rule broken>" per problem, then "n warnings".
cd "$(dirname "$0")/.." || exit 0
quiet=0; [ "${1-}" = "--quiet" ] && quiet=1

# --- Files in the new format, checked in full. Grows as each phase finishes; remove the
#     list once every document is in format. Shape: path|header|sections in order|Next ID
#     header: full · short · task · record · none
#     sections: "##" headings, in order, separated by ";" — each matched by its start
CHECKED='
DOCUMENTATION-STANDARD.md|full|Principles;Five file types;Headers;Always loaded;IDs and progress;Naming;Structure per file;When to read and update;Allowed copies;Growth and rollover;Task file rules;Empty files;Data and security;Decisions and affected files;Moving and archiving;Format check|
DOCUMENT-MAP.md|full|Global documents;Project documents;Other project files;Not documents|
templates/handoff.md|task|Live;Resume|
templates/roadmap.md|full|Summary;Phase;Completed;Older records|yes
templates/deferred-improvements.md|full|To build;In full;Deferred;Known and accepted;Older records|yes
templates/project-map.md|full|Main folders;Entry points;Key flows;Not here;Keeping it current|
templates/new-project.md|short||
templates/roadmap-done.md|short||
templates/backlog-done.md|short||
templates/decisions.md|full|Index;Active decisions;Older records|yes
templates/decisions-old.md|short||
templates/project-claude.md|none|Commands;Hard rules;Past defects;Documents|
templates/reference-doc.md|full|Summary;Related|
templates/record.md|record||
README.md|short|What this repo is;Why it stays private;Start here|
harness/status.md|full|Current phase;In progress;Open;Blocked;Known contradictions;Decisions in force;Next gate;Older records|
harness/backlog.md|full|To build;In full;Deferred;Known and accepted;Older records|yes
harness/cross-check.md|full|Summary;Levels;Deletion;The reviewer;Recording;Claude Setup cross-check;Markers;Related|
harness/models.md|full|Summary;Model table;When to pick and switch;The 27k test;Cost rule;When a model is struggling;Helpers in plans;Related|
harness/overview.md|short|What happens in a session;What "finished" means|
PROJECTS.md|short|Projects;Not projects;Names and renames|
REPOS.md|short||
baselines/global-open-tests.md|full|Global tests;Project tests|yes
archive/README.md|short|Index|
baselines/README.md|short|Index|
'

# --- Project docs to scan for secrets: none yet. When the first is added, reuse the
#     patterns in project-rules/drift.sh (same names, same expressions) — invent none.

# Named in the documents but not built yet; not counted as dead links.
PLANNED='DECISIONS.md harness/rebuild.md'
# Lines allowed to appear in more than one checked file (DOCUMENTATION-STANDARD.md § Allowed copies).
ALLOWED_DUP=''
TASK_FILE=.claude/current-task.md
MAX_LINES=300

warn() { echo "WARN $1: $2"; }

header_fields() {
  case "$1" in
    full)   echo 'Purpose:;Audience:;Read when:;Owner:;Update rule:;Related:;Status:;Last reviewed:' ;;
    short)  echo 'Purpose:;Owner:;Update when:;Related:' ;;
    task)   echo 'Status:;Updated:;Session/branch:' ;;
    record) echo 'Purpose:;Date:;Status: record;From:' ;;
  esac
}

# Global documents named in DOCUMENT-MAP.md (first column), files only, not planned.
map_docs() {
  awk '/^## Global documents/{g=1;next} /^## /{g=0} g && /^\| `/' DOCUMENT-MAP.md |
    grep -v 'planned (T' | sed -E 's/^\| `([^`]+)`.*/\1/' | grep -v '/$'
}
known_root=" $(map_docs | tr '\n' ' ') "

checked_paths=$(echo "$CHECKED" | cut -d'|' -f1 | tr '\n' ' ')

run_checks() {
while IFS='|' read -r f htype sections needs_id; do
  [ -n "$f" ] || continue
  if [ ! -f "$f" ]; then warn "$f" "listed for checking but missing"; continue; fi
  is_template=0; case "$f" in templates/*) is_template=1 ;; esac

  # Header: fields present, in order, within the first 15 lines.
  if [ "$htype" = none ]; then
    head -5 "$f" | grep -q '^Purpose:' && warn "$f" "always-loaded file has a header"
  else
    prev=0; IFS=';'
    for field in $(header_fields "$htype"); do
      n=$(head -15 "$f" | grep -n -m1 -F -- "$field" | cut -d: -f1)
      if [ -z "$n" ]; then warn "$f" "header field missing: $field"
      elif [ "$n" -lt "$prev" ]; then warn "$f" "header field out of order: $field"
      else prev=$n; fi
    done
    unset IFS
  fi

  # Sections: each expected "## " heading present, in order.
  if [ -n "$sections" ]; then
    prev=0; IFS=';'
    for s in $sections; do
      n=$(grep -n -m1 -F -- "## $s" "$f" | grep -E '^[0-9]+:## ' | cut -d: -f1)
      if [ -z "$n" ]; then warn "$f" "section missing: ## $s"
      elif [ "$n" -lt "$prev" ]; then warn "$f" "section out of order: ## $s"
      else prev=$n; fi
    done
    unset IFS
  fi

  # Next ID on list files; its value a valid ID (placeholder allowed in templates).
  if [ "$needs_id" = yes ]; then
    v=$(grep -m1 '^Next ID:' "$f" | sed 's/^Next ID:[[:space:]]*//')
    if [ -z "$v" ]; then warn "$f" "Next ID missing"
    elif ! echo "$v" | grep -qE '^(T|B|D|TC)([1-9][0-9]*|<n>)$'; then warn "$f" "Next ID not a valid ID: $v"; fi
  fi

  # IDs: first cell of rows in tables whose first column is "ID". Templates only for now —
  # the standard's ID table defines the IDs rather than using them.
  [ "$is_template" = 1 ] && awk -v tpl=$is_template '
    /^\|/ { split($0, c, "|"); cell=c[2]; gsub(/^[ \t]+|[ \t]+$/, "", cell)
            if (!intable) { intable=1; idtable=(cell=="ID"); hdr=1; next }
            if (hdr) { hdr=0; next }
            if (idtable && cell != "") {
              if (cell ~ /^(T[1-9][0-9]*(\.[1-9][0-9]*)?|B[1-9][0-9]*|D[1-9][0-9]*|TC[1-9][0-9]*)$/) next
              if (tpl && cell ~ /[<#]/) next
              print cell } next }
    { intable=0 }' "$f" | while read -r bad; do echo "WARN $f: not a valid ID: $bad"; done

  # Dead links: backticked paths into this repo's folders, or root documents the map names.
  grep -oE '`[^` ]+`' "$f" | tr -d '`' | sort -u | while read -r p; do
    case "$p" in *'<'*|*'*'*|*'#'*) continue ;; esac
    case " $PLANNED " in *" $p "*) continue ;; esac
    case "$p" in
      harness/*|templates/*|baselines/*|archive/*|project-rules/*|skills/*|.claude/*) ;;
      *) case "$known_root" in *" $p "*) ;; *) continue ;; esac ;;
    esac
    [ -e "$p" ] || echo "WARN $f: dead link: $p"
  done

  # Size.
  lines=$(wc -l < "$f" | tr -d ' ')
  [ "$lines" -gt "$MAX_LINES" ] && warn "$f" "$lines lines, over $MAX_LINES — propose a rollover"

  # Empty sections: a heading with nothing under it before the next heading of the same
  # or higher level must say "None yet".
  awk '
    function lvl(s) { match(s, /^#+/); return RLENGTH }
    /^#+ / { if (open && lvl($0) <= open) print name; open=lvl($0); name=$0; next }
    /[^[:space:]]/ { open=0 }
    END { if (open) print name }' "$f" | while read -r h; do echo "WARN $f: empty section without None yet: $h"; done
done <<EOF
$CHECKED
EOF

# Duplicate facts: the same line of 40+ characters in two checked files. Header lines,
# table rules, code-fence lines and allowed copies are skipped.
dups=$(for f in $checked_paths; do
  [ -f "$f" ] && grep -vE '^(Purpose|Audience|Read when|Owner|Update rule|Update when|Related|Status|Last reviewed|Next ID|Date|From|Updated|Session/branch):|^[|: -]+$|^```' "$f" |
    awk -v f="$f" 'length($0) >= 40 { print f "\t" $0 }' | sort -u
done | awk -F'\t' '{ n[$2]++; w[$2]=w[$2] " " $1 } END { for (l in n) if (n[l] > 1) print w[l] "\t" l }')
if [ -n "$dups" ]; then
  while IFS=$'\t' read -r where line; do
    case "$ALLOWED_DUP" in *"$line"*) continue ;; esac
    warn "${where# }" "same line in more than one file: ${line:0:60}…"
  done <<EOF
$dups
EOF
fi

# Task file must be ignored by git.
if [ -f "$TASK_FILE" ] && ! git check-ignore -q "$TASK_FILE"; then
  warn "$TASK_FILE" "task file is not ignored by git"
fi
}

out=$(run_checks)
if [ -n "$out" ]; then
  echo "$out"
  echo "$(echo "$out" | grep -c '^WARN ') warnings"
fi

# Documents the map names that are not yet in the new format: one line, never per file.
if [ "$quiet" = 0 ]; then
  old=0
  for p in $(map_docs); do
    [ -f "$p" ] || continue
    case " $checked_paths " in *" $p "*) continue ;; esac
    old=$((old+1))
  done
  echo "$old files not yet in the new format"
fi
exit 0
