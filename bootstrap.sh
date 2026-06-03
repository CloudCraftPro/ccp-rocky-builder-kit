#!/usr/bin/env bash
# bootstrap.sh — scaffold a fresh Rocky Builder Kit workspace.
#
# Creates the directory structure and the empty index/log/sequence files
# the framework expects, so you don't have to do it by hand. Idempotent —
# safe to re-run; will skip anything that already exists.
#
# Usage:
#   ./bootstrap.sh [workspace-dir]
#
# Examples:
#   ./bootstrap.sh                  # scaffolds the current directory
#   ./bootstrap.sh ~/my-rocky       # scaffolds the given directory

set -euo pipefail

WS="${1:-.}"
mkdir -p "$WS"
cd "$WS"

echo "Scaffolding Rocky workspace in: $(pwd)"
echo

# --- Directories ---
DIRS=(
    "captures/Q"            # Questions
    "captures/D"            # Decisions
    "captures/T"            # Tasks
    "captures/C"            # Commitments
    "captures/X"            # Context
    "projects"
    "people"
    "memory"
)

for d in "${DIRS[@]}"; do
    if [ -d "$d" ]; then
        echo "  exists  $d/"
    else
        mkdir -p "$d"
        echo "  created $d/"
    fi
done

echo

# --- Index / log / sequence files ---
write_if_missing() {
    local path="$1"
    local content="$2"
    if [ -e "$path" ]; then
        echo "  exists  $path"
    else
        printf "%s\n" "$content" > "$path"
        echo "  created $path"
    fi
}

write_if_missing "_sequence.md" "# Sequence Counters

Tracks daily capture sequence numbers per category. Format: \`YYYY-MM-DD: Q=N D=N T=N C=N X=N\`.
Reset to zero each day. Increment when creating a new capture.
"

write_if_missing "_session-log.md" "# Session Log

Append-only log of session start/end events. Format:

\`\`\`
## YYYY-MM-DD HH:MM session-start
Boot complete. [N] open captures. [Anything notable.]

## YYYY-MM-DD HH:MM session-end
[What happened this session.]
\`\`\`
"

write_if_missing "captures/_index.md" "# Captures Index

| ID | Type | Title | Status | Owner | Date |
|----|------|-------|--------|-------|------|

_New captures added here as they're created. Status: open / waiting / done / dropped._
"

write_if_missing "projects/_index.md" "# Projects Index

| Project | Status | Open Items | Last Activity |
|---------|--------|------------|---------------|

_Active projects roll up here. One row per project folder under \`projects/\`._
"

write_if_missing "people/_index.md" "# People Index

| Name | Role | Org | Relationship | Last Mentioned |
|------|------|-----|--------------|----------------|

_People your assistant has met. Auto-populated as names appear in captures._
"

echo
echo "Workspace scaffolded."
echo
echo "Next steps:"
echo "  1. Open this directory in Claude Code (or your AI tool)."
echo "  2. Generate or copy in CLAUDE.md, SOUL.md, USER.md, AGENTS.md,"
echo "     SCHEMAS.md, MEMORY.md, TOOLS.md — either from the templates/ in"
echo "     this kit or by running the 03-assembler.md prompt."
echo "  3. See day-one-walkthrough.md for the first conversation."
