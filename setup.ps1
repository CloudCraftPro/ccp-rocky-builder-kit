# setup.ps1 — Windows equivalent of bootstrap.sh
#
# Scaffolds a fresh Rocky Builder Kit workspace.
#
# Usage:
#   .\setup.ps1                  # scaffolds the current directory
#   .\setup.ps1 -Workspace C:\my-rocky
#
# If PowerShell blocks the script: Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

param(
    [string]$Workspace = "."
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $Workspace)) { New-Item -ItemType Directory -Path $Workspace | Out-Null }
Set-Location $Workspace

Write-Host "Scaffolding Rocky workspace in: $($PWD.Path)"
Write-Host ""

$dirs = @(
    "captures/Q", "captures/D", "captures/T", "captures/C", "captures/X",
    "projects", "people", "memory"
)

foreach ($d in $dirs) {
    if (Test-Path $d) {
        Write-Host "  exists  $d/"
    } else {
        New-Item -ItemType Directory -Path $d -Force | Out-Null
        Write-Host "  created $d/"
    }
}

Write-Host ""

function Write-IfMissing($path, $content) {
    if (Test-Path $path) {
        Write-Host "  exists  $path"
    } else {
        Set-Content -Path $path -Value $content -Encoding UTF8
        Write-Host "  created $path"
    }
}

Write-IfMissing "_sequence.md" @"
# Sequence Counters

Tracks daily capture sequence numbers per category. Format: ``YYYY-MM-DD: Q=N D=N T=N C=N X=N``.
Reset to zero each day. Increment when creating a new capture.
"@

Write-IfMissing "_session-log.md" @"
# Session Log

Append-only log of session start/end events. Format:

``````
## YYYY-MM-DD HH:MM session-start
Boot complete. [N] open captures. [Anything notable.]

## YYYY-MM-DD HH:MM session-end
[What happened this session.]
``````
"@

Write-IfMissing "captures/_index.md" @"
# Captures Index

| ID | Type | Title | Status | Owner | Date |
|----|------|-------|--------|-------|------|

_New captures added here as they're created. Status: open / waiting / done / dropped._
"@

Write-IfMissing "projects/_index.md" @"
# Projects Index

| Project | Status | Open Items | Last Activity |
|---------|--------|------------|---------------|

_Active projects roll up here. One row per project folder under ``projects/``._
"@

Write-IfMissing "people/_index.md" @"
# People Index

| Name | Role | Org | Relationship | Last Mentioned |
|------|------|-----|--------------|----------------|

_People your assistant has met. Auto-populated as names appear in captures._
"@

Write-Host ""
Write-Host "Workspace scaffolded."
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Open this directory in Claude Code (or your AI tool)."
Write-Host "  2. Generate or copy in CLAUDE.md, SOUL.md, USER.md, AGENTS.md,"
Write-Host "     SCHEMAS.md, MEMORY.md, TOOLS.md — either from templates/ in"
Write-Host "     this kit or by running the 03-assembler.md prompt."
Write-Host "  3. See day-one-walkthrough.md for the first conversation."
