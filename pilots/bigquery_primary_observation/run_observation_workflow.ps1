param(
    [string]$ProjectId = "",
    [string]$Dataset = "",
    [string]$Table = "",
    [string]$DateField = "",
    [string]$TargetDate = (Get-Date).ToString("yyyy-MM-dd"),
    [int]$Limit = 100,
    [string]$SmokeTestPath = ".\runtime\adapters\bigquery_primary_smoke_test.ps1",
    [string]$OutputPath = ".\pilots\bigquery_primary_observation\last_observation_result.json"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (-not (Test-Path $SmokeTestPath)) {
    throw "Smoke test script not found at path: $SmokeTestPath"
}

Write-Host "Running BigQuery observation workflow..."
Write-Host "Target date: $TargetDate"
Write-Host "Smoke test path: $SmokeTestPath"

$smokeParams = @{
    ProjectId = $ProjectId
    Dataset   = $Dataset
    Table     = $Table
    DateField = $DateField
    TargetDate = $TargetDate
    Limit     = $Limit
    EmitJson  = $true
}

try {
    $raw = & $SmokeTestPath @smokeParams
    $result = $raw | ConvertFrom-Json
}
catch {
    throw "Observation workflow failed before classification could be completed. $($_.Exception.Message)"
}

$classification = $result.classification

$payload = [ordered]@{
    output_class     = "Observation"
    workflow_name    = "BigQuery Primary Observation Pilot"
    generated_at_utc = (Get-Date).ToUniversalTime().ToString("o")
    executive_tldr   = "BigQuery observation scaffold is in place but not yet configured against the final source table."
    verified_result  = [ordered]@{
        classification = $classification
        requested_date = $TargetDate
        project_id     = $ProjectId
        dataset        = $Dataset
        table          = $Table
        date_field     = $DateField
    }
    operational_meaning = "scaffold only"
    escalation_note = [ordered]@{
        escalation_required = $false
    }
    audit_notes = [ordered]@{
        observation_only = $true
        source_script    = $SmokeTestPath
    }
    adapter_payload = $result
}

$json = $payload | ConvertTo-Json -Depth 10

$outputDirectory = Split-Path -Parent $OutputPath
if ($outputDirectory -and -not (Test-Path $outputDirectory)) {
    New-Item -ItemType Directory -Path $outputDirectory -Force | Out-Null
}

Set-Content -Path $OutputPath -Value $json -Encoding UTF8

Write-Host ""
Write-Host "Observation workflow completed."
Write-Host "Classification: $classification"
Write-Host "Output written to: $OutputPath"

$json