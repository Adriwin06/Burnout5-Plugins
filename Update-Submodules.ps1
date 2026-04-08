[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

$repoRoot = & git -C $PSScriptRoot rev-parse --show-toplevel 2>$null
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($repoRoot)) {
    throw "Unable to determine the repository root from '$PSScriptRoot'."
}

$repoRoot = $repoRoot.Trim()

Write-Host "Syncing submodule URLs..."
& git -C $repoRoot submodule sync --recursive
if ($LASTEXITCODE -ne 0) {
    throw "Failed to sync submodule URLs."
}

Write-Host "Updating submodules to the latest tracked remote commits..."
& git -C $repoRoot submodule update --init --remote --recursive
if ($LASTEXITCODE -ne 0) {
    throw "Failed to update one or more submodules."
}

Write-Host "Submodule update complete."
