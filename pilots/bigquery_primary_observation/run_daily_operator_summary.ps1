param(
    [string]$ProjectId = "",
    [string]$Dataset = "",
    [string]$Table = "",
    [string]$DateField = "",
    [string]$TargetDate = (Get-Date).ToString("yyyy-MM-dd")
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$pilotRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$workflowScript = Join-Path $pilotRoot "run_observation_workflow.ps1"
$resultFile = Join-Path $pilotRoot "last_observation_result.json"

if (-not (Test-Path $workflowScript)) {
    throw "Required workflow script not found: $workflowScript"
}

Write-Host ""
Write-Host "=== BigQuery Daily Operator Summary ==="
Write-Host "Target date: $TargetDate"
Write-Host ""

$workflowParams = @{
    ProjectId = $ProjectId
    Dataset   = $Dataset
    Table     = $Table
    DateField = $DateField
    TargetDate = $TargetDate
}

& $workflowScript @workflowParams

if (-not (Test-Path $resultFile)) {
    throw "Expected result file was not created: $resultFile"
}

$result = Get-Content $resultFile -Raw | ConvertFrom-Json

$class = $null
if ($null -ne $result.verified_result) {
    if ($result.verified_result.PSObject.Properties.Name -contains "classification") {
        $class = $result.verified_result.classification
    }
}

Write-Host ""
Write-Host "=== Operator Summary ==="
Write-Host "Status: $class"
Write-Host "Operator interpretation: BigQuery scaffold exists, but final source configuration is still pending."
Write-Host "Recommended action: Wait for final table readiness, then configure the smoke test and validate all core states."
Write-Host ""
Write-Host "=== End Operator Summary ==="
Write-Host ""