#!/usr/bin/env bash
# validate.sh — mechanical workspace check.
#
# Reports anything obviously wrong with a Rocky workspace:
#   - Missing boot files
#   - Missing directory structure
#   - Missing index / log / sequence files
#   - Unresolved [Placeholder] strings the Assembly phase forgot to fill
#   - Captures referenced in the index that don't exist on disk (and vice versa)
#
# Read-only. Reports findings; doesn't auto-fix.
#
# Usage:
#   ./validate.sh [workspace-dir]
#
#   ./validate.sh                  # check the current directory
#   ./validate.sh ~/my-rocky       # check a specific workspace

set -uo pipefail

WS="${1:-.}"
cd "$WS"

# --- ANSI colors (fall back to plain if NO_COLOR set or not a tty) ---
if [ -t 1 ] && [ -z "${NO_COLOR:-}" ]; then
    R=$'\033[31m'; Y=$'\033[33m'; G=$'\033[32m'; B=$'\033[1m'; N=$'\033[0m'
else
    R=""; Y=""; G=""; B=""; N=""
fi

PASS=0; WARN=0; FAIL=0

pass() { printf "  ${G}✓${N} %s\n" "$1"; PASS=$((PASS+1)); }
warn() { printf "  ${Y}!${N} %s\n" "$1"; WARN=$((WARN+1)); }
fail() { printf "  ${R}✗${N} %s\n" "$1"; FAIL=$((FAIL+1)); }

echo "${B}Validating Rocky workspace:${N} $(pwd)"
echo

# --- 1. Boot files ---
echo "${B}Boot files${N}"
for f in CLAUDE.md SOUL.md USER.md AGENTS.md SCHEMAS.md MEMORY.md TOOLS.md; do
    if [ -f "$f" ]; then pass "$f"; else fail "$f — missing (Assembly phase didn't generate it)"; fi
done
echo

# --- 2. Directories ---
echo "${B}Directory structure${N}"
for d in captures/Q captures/D captures/T captures/C captures/X projects people memory; do
    if [ -d "$d" ]; then pass "$d/"; else fail "$d/ — missing (run bootstrap.sh)"; fi
done
echo

# --- 3. Index / log / sequence files ---
echo "${B}Index + log files${N}"
for f in _sequence.md _session-log.md captures/_index.md projects/_index.md people/_index.md; do
    if [ -f "$f" ]; then pass "$f"; else fail "$f — missing (run bootstrap.sh)"; fi
done
echo

# --- 4. Placeholders left over from templates ---
echo "${B}Unresolved [Placeholder] strings${N}"
# Match bracketed placeholders like [Assistant Name], [User Name], [Framework Name], [Org]
# but ignore Markdown link syntax [text](url) by requiring the bracket NOT be followed by '('
# Exclusions:
#  - templates/ and examples/ — by definition template/example files
#  - validate.md / 01–03 phase prompts — describe placeholders by design
#  - SCHEMAS.md — shows schema templates with field placeholders by design
PHRASES='\[(Assistant|User|Framework|Org|Org Name|Role|Team|Project|System|Category|Type|Type or Description|Title)( Name)?\]'
hits=$(grep -rEn "$PHRASES" --include="*.md" \
    --exclude-dir=templates --exclude-dir=examples --exclude-dir=.git \
    --exclude=validate.md --exclude=SCHEMAS.md \
    --exclude=01-discovery.md --exclude=02-architect.md --exclude=03-assembler.md \
    . 2>/dev/null | grep -v '](.*)' | head -20)
if [ -z "$hits" ]; then
    pass "no unresolved placeholders in workspace files"
else
    fail "unresolved placeholders — Assembly phase forgot these:"
    while IFS= read -r line; do printf "      %s\n" "$line"; done <<< "$hits"
fi
echo

# --- 5. Index ↔ disk consistency ---
echo "${B}Capture index ↔ disk consistency${N}"
if [ -f "captures/_index.md" ]; then
    # Pull capture IDs from the index (Q|D|T|C|X-YYYYMMDD-NNN pattern)
    indexed=$(grep -oE '[QDTCX]-[0-9]{8}-[0-9]{3}' captures/_index.md 2>/dev/null | sort -u)
    on_disk=$(find captures projects -type f -name "[QDTCX]-*.md" 2>/dev/null \
        | sed 's|.*/||; s|\.md$||' | sort -u)

    n_indexed=$([ -z "$indexed" ] && echo 0 || echo "$indexed" | wc -l | tr -d ' ')
    n_disk=$([ -z "$on_disk" ] && echo 0 || echo "$on_disk" | wc -l | tr -d ' ')

    # Indexed but missing on disk
    if [ -n "$indexed" ]; then
        missing=$(comm -23 <(echo "$indexed") <(echo "$on_disk") | head -10)
        if [ -n "$missing" ]; then
            fail "indexed but no file on disk:"
            while IFS= read -r id; do printf "      %s\n" "$id"; done <<< "$missing"
        fi
    fi

    # On disk but not in index
    if [ -n "$on_disk" ]; then
        orphan=$(comm -13 <(echo "$indexed") <(echo "$on_disk") | head -10)
        if [ -n "$orphan" ]; then
            warn "files on disk but not in captures/_index.md:"
            while IFS= read -r id; do printf "      %s\n" "$id"; done <<< "$orphan"
        fi
    fi

    if [ -z "${missing:-}" ] && [ -z "${orphan:-}" ]; then
        pass "$n_indexed captures indexed, $n_disk on disk, all reconciled"
    fi
fi
echo

# --- Summary ---
echo "${B}Summary${N}"
echo "  ${G}$PASS pass${N}   ${Y}$WARN warn${N}   ${R}$FAIL fail${N}"

if [ "$FAIL" -gt 0 ]; then
    echo
    echo "Fix the failures above, then re-run."
    exit 1
fi
if [ "$WARN" -gt 0 ]; then
    echo
    echo "Workspace is functional but has issues worth a look."
    exit 0
fi
echo
echo "Clean. You're good to go."
