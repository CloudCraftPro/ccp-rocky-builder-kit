# validate.ps1 — Windows equivalent of validate.sh
#
# Mechanical workspace check. Reports findings; doesn't auto-fix.
#
# Usage:
#   .\validate.ps1
#   .\validate.ps1 -Workspace C:\my-rocky

param(
    [string]$Workspace = "."
)

$ErrorActionPreference = "Continue"
Set-Location $Workspace

$script:Pass = 0
$script:Warn = 0
$script:Fail = 0

function Pass($msg) { Write-Host "  ✓ $msg" -ForegroundColor Green; $script:Pass++ }
function Warn($msg) { Write-Host "  ! $msg" -ForegroundColor Yellow; $script:Warn++ }
function Fail($msg) { Write-Host "  ✗ $msg" -ForegroundColor Red; $script:Fail++ }

Write-Host "Validating Rocky workspace: $($PWD.Path)" -ForegroundColor White
Write-Host ""

# --- 1. Boot files ---
Write-Host "Boot files" -ForegroundColor White
foreach ($f in @("CLAUDE.md","SOUL.md","USER.md","AGENTS.md","SCHEMAS.md","MEMORY.md","TOOLS.md")) {
    if (Test-Path $f) { Pass $f } else { Fail "$f — missing (Assembly phase didn't generate it)" }
}
Write-Host ""

# --- 2. Directories ---
Write-Host "Directory structure" -ForegroundColor White
foreach ($d in @("captures/Q","captures/D","captures/T","captures/C","captures/X","projects","people","memory")) {
    if (Test-Path $d -PathType Container) { Pass "$d/" } else { Fail "$d/ — missing (run setup.ps1)" }
}
Write-Host ""

# --- 3. Index + log files ---
Write-Host "Index + log files" -ForegroundColor White
foreach ($f in @("_sequence.md","_session-log.md","captures/_index.md","projects/_index.md","people/_index.md")) {
    if (Test-Path $f) { Pass $f } else { Fail "$f — missing (run setup.ps1)" }
}
Write-Host ""

# --- 4. Unresolved [Placeholder] strings ---
Write-Host "Unresolved [Placeholder] strings" -ForegroundColor White
$pattern = '\[(Assistant|User|Framework|Org|Org Name|Role|Team|Project|System|Category|Type|Type or Description|Title)( Name)?\]'
$skipDirs = @("templates","examples",".git")
$skipFiles = @("validate.md","SCHEMAS.md","01-discovery.md","02-architect.md","03-assembler.md")
$mdFiles = Get-ChildItem -Recurse -Filter *.md | Where-Object {
    $rel = Resolve-Path $_.FullName -Relative
    $parts = $rel -split '[\\/]'
    -not ($parts | Where-Object { $skipDirs -contains $_ }) -and
    -not ($skipFiles -contains $_.Name)
}
$hits = @()
foreach ($file in $mdFiles) {
    $matches = Select-String -Path $file.FullName -Pattern $pattern -AllMatches |
        Where-Object { $_.Line -notmatch '\]\([^)]+\)' }
    if ($matches) { $hits += $matches | Select-Object -First 5 }
}
if ($hits.Count -eq 0) {
    Pass "no unresolved placeholders in workspace files"
} else {
    Fail "unresolved placeholders — Assembly phase forgot these:"
    $hits | ForEach-Object {
        Write-Host ("      " + $_.RelativePath((Get-Location).Path) + ":" + $_.LineNumber + ":" + $_.Line.Trim())
    }
}
Write-Host ""

# --- 5. Index ↔ disk consistency ---
Write-Host "Capture index ↔ disk consistency" -ForegroundColor White
if (Test-Path "captures/_index.md") {
    $indexed = @()
    Select-String -Path "captures/_index.md" -Pattern '[QDTCX]-\d{8}-\d{3}' -AllMatches |
        ForEach-Object { $_.Matches | ForEach-Object { $indexed += $_.Value } }
    $indexed = $indexed | Sort-Object -Unique

    $onDisk = Get-ChildItem -Recurse -Path "captures","projects" -Filter "[QDTCX]-*.md" -ErrorAction SilentlyContinue |
        ForEach-Object { $_.BaseName } | Sort-Object -Unique

    $missing = $indexed | Where-Object { $onDisk -notcontains $_ } | Select-Object -First 10
    $orphan  = $onDisk  | Where-Object { $indexed -notcontains $_ } | Select-Object -First 10

    if ($missing) {
        Fail "indexed but no file on disk:"
        $missing | ForEach-Object { Write-Host "      $_" }
    }
    if ($orphan) {
        Warn "files on disk but not in captures/_index.md:"
        $orphan | ForEach-Object { Write-Host "      $_" }
    }
    if (-not $missing -and -not $orphan) {
        Pass "$($indexed.Count) captures indexed, $($onDisk.Count) on disk, all reconciled"
    }
}
Write-Host ""

# --- Summary ---
Write-Host "Summary" -ForegroundColor White
Write-Host "  $($script:Pass) pass   $($script:Warn) warn   $($script:Fail) fail"

if ($script:Fail -gt 0) { Write-Host ""; Write-Host "Fix the failures above, then re-run."; exit 1 }
if ($script:Warn -gt 0) { Write-Host ""; Write-Host "Workspace is functional but has issues worth a look."; exit 0 }
Write-Host ""; Write-Host "Clean. You're good to go."
