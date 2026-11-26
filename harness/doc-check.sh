#!/bin/bash
# T34 — documentation format check (DOCUMENTATION-STANDARD.md § Format check).
# Warn-only: never fixes, never blocks, always exits 0. Reads files; writes nothing. No AI.
# Runs from: harness/session-check.sh (with --quiet). Later, each project's commit check
# (Phases 6 and 7, in that project's own session).
#
#   harness/doc-check.sh           full run: warnings incl. registered rules, then the count
#                                  of documents not yet in format
#   harness/doc-check.sh --quiet   session start: warnings only, no registered-rules check;
#                                  prints nothing when clean
#   harness/doc-check.sh --links-to <file>[#section]
#                                  "what links here": every backtick path and clickable link
#                                  to that file (or section) in any tracked text file
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
DOCUMENT-MAP.md|full|Global documents;Project documents;Other project files;Not documents;Local-only|
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
templates/agent.md|none|Why this exists;What you are given;How to work;Lessons;Report|
templates/skill.md|none|When to use;Steps;Example;Subject detail (optional);Self-check;Related|
templates/rule-file.md|none|Related|
templates/guide.md|full|Summary;When to use;Before you start;Common mistakes;Quick reference;Related|
templates/case-study.md|record|What happened;Why it happened;What it cost;What changed;How to spot it again|
WRITING-GUIDE.md|full|Contents;Summary;Writing style;Two levels;Rule plus case;Shapes by file kind;Agents;Skills;Rule files;Guides;Case studies;Examples;Words to use and avoid;Related|
README.md|short|What this repo is;Why it stays private;Start here|
harness/status.md|full|Current phase;In progress;Open;Blocked;Known contradictions;Decisions in force;Next gate;Older records|
harness/backlog.md|full|To build;In full;Deferred;Known and accepted;Older records|yes
harness/cross-check.md|full|Summary;Levels;Review sizes;Deletion;The reviewer;Recording;Claude Setup cross-check;Markers;Related|
skills/planning/SKILL.md|none|When to use;Steps;Example;Self-check;Related|
skills/planning/new-project.md|full|Summary;When to use;Before you start;Set the depth;Settle the minimum plan;Plan the testing;Set it up;Common mistakes;Quick reference;Related|
skills/planning/feature.md|full|Summary;When to use;Before you start;Pick the depth;Write the plan;Refactoring;Testing;Common mistakes;Quick reference;Related|
skills/planning/bug-fix.md|full|Summary;When to use;Before you start;Find the cause;Write the plan;Keep the fix inside the plan;Test the fix;Report the result;Common mistakes;Quick reference;Related|
skills/planning/documentation.md|full|Summary;When to use;Before you start;Write the plan;Write the doc;Testing;Common mistakes;Quick reference;Related|
skills/planning/setup-change.md|full|Summary;When to use;Before you start;Write the plan;Testing;Recording;Common mistakes;Quick reference;Related|
skills/planning/research-business.md|full|Contents;Summary;When to use;Before you start;Set the questions first;Plan the search;Check the answers;Write the result;Common mistakes;Quick reference;Related|
harness/models.md|full|Summary;Model table;When to pick and switch;The 27k test;Cost rule;When a model is struggling;Helpers in plans;Related|
harness/overview.md|short|What happens in a session;What "finished" means|
PROJECTS.md|short|Projects;Not projects;Names and renames|
REPOS.md|short||
baselines/global-open-tests.md|full|Global tests;Project tests|yes
archive/README.md|short|Index|
baselines/README.md|short|Index|
.claude/current-task.md|task|Live;Resume|
CLAUDE.md|none||
.claude/CLAUDE.md|none|At session start;While changing setup;Reaching into a project;Git for ~/.claude|
RTK.md|none|`rtk proxy`|
OLLAMA.md|none||
STANDARDS.md|none|Communicate;Choose the project;Run a task;Safety and approval;Quality;Documents;IDs and progress;Git;Models|
ENVIRONMENT.md|full|Contents;The two kinds of rule;1. RTK;2. Status line;3. Permissions;4. Effort on Opus 5.5;What every session loads;How numbers are measured;The project trees on this machine;Older records|
'

# --- Project docs to scan for secrets: none yet. When the first is added, reuse the
#     patterns in project-rules/drift.sh (same names, same expressions) — invent none.

# Named in the documents but not built yet; not counted as dead links.
PLANNED='DECISIONS.md harness/rebuild.md'
# Lines allowed to appear in more than one checked file (DOCUMENTATION-STANDARD.md § Allowed copies).
#     The task-file template's standing line and the backlog form's table header are copied on purpose (Amit, 11-11-2026; 25-11-2026).
#     The three doc-planning lines in skills/planning/setup-change.md are copied from documentation.md (C10, Amit, 26-11-2026).
ALLOWED_DUP='After compaction or a new session: confirm the scope still applies before further action; ask again if unclear or outside scope.
| ID | Item | Why | Worth doing | Blocks current task | Priority | Size | Tokens | Status | Next action |
- **Source of truth:** where each fact comes from — code, a command'"'"'s output, a decision
  (D-number), Amit. One fact, one home; other docs point to it.
- **Fact check:** how each fact will be checked before it is written.'
TASK_FILE=.claude/current-task.md
MAX_LINES=300
# Catalog coverage: folder groups one DOCUMENT-MAP.md row may cover; every other tracked file
#     needs its own path in a row (plan § Link and sync). "*" = one folder level.
MAP_GROUPS='archive/ baselines/ projects/*/memory/ project-rules/*/'
# Registered rules: home file|key phrase (homes: plan § WP3 design). Full run only — copies
#     remain until WP6 removes them. Project descriptions have no single key phrase; not listed.
REGISTERED='STANDARDS.md|for clear, bounded work
STANDARDS.md|plan work to fit in about 250K
PROJECTS.md|never pushes, pulls, merges
PROJECTS.md|may become an npm package
README.md|start setup sessions from
DOCUMENTATION-STANDARD.md|About 80 lines at most
DOCUMENTATION-STANDARD.md|past about 300 lines
ENVIRONMENT.md|a plugin key is a silent no-op'

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

# GitHub-style anchors for a file's headings: lowercase, punctuation dropped, spaces to hyphens.
anchors() {
  awk '/^```/ { fence=!fence; next } !fence && /^#+ /' "$1" | sed -E 's/^#+ +//' |
    tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9 _-]//g; s/ /-/g'
}

# "What links here" for one file, or one file#section. Reads every tracked text file.
# Backtick paths are read from the repo root (also `~/.claude/...`); with a section, only
# "`file` § *Section*" matches. Clickable links are resolved from their own file's folder.
# Known limit: a § given only as a number ("§ 1") matches a section only if it is numbered so.
links_to() {
  t=${1%%#*}; a=""; [ "$t" != "$1" ] && a=${1#*#}
  t=${t#./}; t=${t#\~/.claude/}; t=${t#"$HOME"/.claude/}
  git ls-files -z -- . ':!:*.gz' ':!:*.bundle' | xargs -0 awk -v t="$t" -v a="$a" '
    function anch(s) { s=tolower(s); gsub(/[^a-z0-9 _-]/, "", s); gsub(/ /, "-", s); return s }
    function norm(p,   n, i, k, part, out) {
      n=split(p, part, "/"); k=0
      for (i=1; i<=n; i++) {
        if (part[i]=="" || part[i]==".") continue
        if (part[i]=="..") { if (k>0) k--; continue }
        out[++k]=part[i] }
      p=""; for (i=1; i<=k; i++) p=p (i>1 ? "/" : "") out[i]; return p }
    FNR==1 { fence=0; dir=FILENAME; if (dir ~ /\//) sub(/\/[^\/]*$/, "", dir); else dir="" }
    /^```/ { fence=!fence }
    { s=$0
      while (match(s, /`[^`]+`/)) {
        p=substr(s, RSTART+1, RLENGTH-2); s=substr(s, RSTART+RLENGTH)
        sub(/^~\/\.claude\//, "", p)
        if (p!=t) continue
        if (a=="") { print FILENAME ":" FNR ": `" p "`"; continue }
        r=s; if (!sub(/^ § /, "", r)) continue
        if (match(r, /^[0-9.]* ?\*[^*]+\*/)) { sec=substr(r, RSTART, RLENGTH); sub(/^[^*]*\*/, "", sec); sub(/\*$/, "", sec) }
        else { match(r, /^[^ ,;)]+/); sec=substr(r, RSTART, RLENGTH) }
        x=anch(sec); if (x!="" && (x==a || index(a, x "-")==1)) print FILENAME ":" FNR ": `" p "` § " sec }
      if (fence) next
      s=$0; gsub(/`[^`]*`/, "", s)
      while (match(s, /\]\([^) \t]+\)/)) {
        l=substr(s, RSTART+2, RLENGTH-3); s=substr(s, RSTART+RLENGTH)
        if (l ~ /^(https?|mailto):/) continue
        p=l; sec=""; i=index(l, "#"); if (i) { p=substr(l, 1, i-1); sec=substr(l, i+1) }
        full=(p=="") ? FILENAME : norm((dir=="" ? "" : dir "/") p)
        if (full!=t) continue
        if (a!="" && sec!=a) continue
        print FILENAME ":" FNR ": (" l ")" } }'
}
if [ "${1-}" = "--links-to" ]; then
  [ -n "${2-}" ] || { echo "usage: harness/doc-check.sh --links-to <file>[#section]"; exit 0; }
  hits=$(links_to "$2")
  [ -n "$hits" ] && echo "$hits"
  echo "$(printf '%s' "$hits" | grep -c .) links to $2"
  exit 0
fi

# First-cell paths of the DOCUMENT-MAP.md rows in § Global documents and § Not documents.
map_entries() {
  awk '/^## (Global documents|Not documents)/{g=1;next} /^## /{g=0} g && /^\|/' DOCUMENT-MAP.md |
    cut -d'|' -f2 | grep -oE '`[^`]+`' | tr -d '`'
}

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

  # Clickable links: relative to this file; an anchor must match a heading in the target.
  # Website links, inline code and code blocks are skipped (link model: D53).
  awk '/^```/ { fence=!fence; next } !fence' "$f" | sed -E 's/`[^`]*`//g' |
    grep -oE '\]\([^)[:space:]]+\)' | sed -E 's/^\]\(//; s/\)$//' | sort -u | while read -r l; do
    case "$l" in http://*|https://*|mailto:*) continue ;; esac
    p=${l%%#*}; t=$(dirname "$f")/$p; [ -n "$p" ] || t=$f
    if [ ! -e "$t" ]; then echo "WARN $f: dead link: $l"
    elif [ "$p" != "$l" ] && ! { [ -f "$t" ] && anchors "$t" | grep -qxF -- "${l#*#}"; }; then
      echo "WARN $f: link to missing section: $l"
    fi
  done

  # Size.
  lines=$(wc -l < "$f" | tr -d ' ')
  [ "$lines" -gt "$MAX_LINES" ] && warn "$f" "$lines lines, over $MAX_LINES — propose a rollover"

  # Empty sections: a heading with nothing under it before the next heading of the same
  # or higher level must say "None yet".
  awk '
    function lvl(s) { match(s, /^#+/); return RLENGTH }
    /^```/ { fence=!fence; open=0; next }
    fence { next }
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

# Catalog coverage: every tracked file has a map row, by its own path or by a MAP_GROUPS row.
entries=$(map_entries 2>/dev/null)
if [ -z "$entries" ]; then
  warn DOCUMENT-MAP.md "no map entries found (file missing or headings renamed) — catalog coverage not checked"
else git -c core.quotepath=off ls-files | awk -v groups="$MAP_GROUPS" '
  NR==FNR { have[$0]=1; next }
  $0 in have { next }
  { n=split(groups, g, " ")
    for (i=1; i<=n; i++) if (g[i] in have) { re="^" g[i]; gsub(/\*/, "[^/]+", re); if ($0 ~ re) next }
    print "WARN DOCUMENT-MAP.md: no row for tracked file: " $0 }' <(echo "$entries") -
fi

# Registered rules (full run only): the key phrase is in its home and nowhere else. Not
# scanned: history and records (baselines/ except the live list and index, archive/,
# SETUP-PLAN.md), the plan, this script, other projects' files and memory.
if [ "$quiet" = 0 ]; then
  scan=$( { git -c core.quotepath=off ls-files | grep -vE '^(archive|baselines|project-rules|projects)/' |
      grep -vxE 'SETUP-PLAN\.md|harness/doc-structure-plan\.md|harness/doc-check\.sh'
    echo baselines/global-open-tests.md; echo baselines/README.md
    git -c core.quotepath=off ls-files projects/-Users-amitjangra--claude/memory/; } )
  while IFS='|' read -r home phrase; do
    grep -qiF -- "$phrase" "$home" || warn "$home" "registered phrase missing from its home: $phrase"
    echo "$scan" | tr '\n' '\0' | xargs -0 grep -liF -- "$phrase" | while read -r f; do
      [ "$f" = "$home" ] || warn "$f" "copy of a registered rule (home $home): $phrase"
    done
  done <<EOF
$REGISTERED
EOF
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
