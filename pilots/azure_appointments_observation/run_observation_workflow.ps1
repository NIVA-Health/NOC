param(
    [string]$BaseUrl = "https://niva-dev-api-app.azurewebsites.net",
    [string]$Username = "admin",
    [string]$Password,
    [string]$TargetDate = "2026-04-17",
    [int]$Limit = 100,
    [switch]$TryServerSideDateFilters,
    [string]$SmokeTestPath = ".\runtime\adapters\azure_appointments_smoke_test.ps1",
    [string]$OutputPath = ".\pilots\azure_appointments_observation\last_observation_result.json"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (-not (Test-Path $SmokeTestPath)) {
    throw "Smoke test script not found at path: $SmokeTestPath"
}

Write-Host "Running Azure appointments observation workflow..."
Write-Host "Target date: $TargetDate"
Write-Host "Smoke test path: $SmokeTestPath"

if ($PSBoundParameters.ContainsKey("Password")) {
    Write-Host "API password: $('*' * [Math]::Max($Password.Length, 1))"
}

$smokeParams = @{
    BaseUrl    = $BaseUrl
    Username   = $Username
    TargetDate = $TargetDate
    Limit      = $Limit
    EmitJson   = $true
}

if ($PSBoundParameters.ContainsKey("Password")) {
    $smokeParams.Password = $Password
}

if ($TryServerSideDateFilters) {
    $smokeParams.TryServerSideDateFilters = $true
}

try {
    $raw = & $SmokeTestPath @smokeParams
    $result = $raw | ConvertFrom-Json
}
catch {
    throw "Observation workflow failed before classification could be completed. $($_.Exception.Message)"
}

$classification = $result.classification
$details = $null

if ($result.PSObject.Properties.Name -contains "details") {
    $details = $result.details
}

function Get-DetailValue {
    param(
        [object]$DetailsObject,
        [string]$PropertyName
    )

    if ($null -eq $DetailsObject) {
        return $null
    }

    if ($DetailsObject.PSObject.Properties.Name -contains $PropertyName) {
        return $DetailsObject.$PropertyName
    }

    return $null
}

$totalRecordsReturned      = Get-DetailValue -DetailsObject $details -PropertyName "total_records_returned"
$recordsInPayload          = Get-DetailValue -DetailsObject $details -PropertyName "records_in_payload"
$matchCount                = Get-DetailValue -DetailsObject $details -PropertyName "matches_for_target_date"
$filteringMode             = Get-DetailValue -DetailsObject $details -PropertyName "filtering_mode"
$oldestScheduledAt         = Get-DetailValue -DetailsObject $details -PropertyName "oldest_scheduledAt"
$newestScheduledAt         = Get-DetailValue -DetailsObject $details -PropertyName "newest_scheduledAt"
$serverSideFilterAttempted = Get-DetailValue -DetailsObject $details -PropertyName "server_side_filter_attempted"
$serverSideFilterWorked    = Get-DetailValue -DetailsObject $details -PropertyName "server_side_filter_worked"

$operationalMeaning = switch ($classification) {
    "ENDPOINT_FAILED" { "system issue" }
    "AUTH_FAILED"     { "access issue" }
    "NO_MATCHES"      { "normal no-result condition" }
    "CONNECTED"       { "successful retrieval" }
    default           { "unclassified result" }
}

$escalationRequired = $classification -in @("ENDPOINT_FAILED", "AUTH_FAILED")

$executiveTldr = switch ($classification) {
    "ENDPOINT_FAILED" { "The appointment source could not be reached, so this should be treated as a system issue rather than a normal no-result condition." }
    "AUTH_FAILED"     { "The appointment source responded, but the request was not authorized. This should be treated as an access or configuration issue." }
    "NO_MATCHES"      { "The appointment source was reachable and authentication worked, but no appointments matched the requested date. This is a normal no-result condition." }
    "CONNECTED"       { "The appointment source was reachable, authentication worked, and matching appointment records were found for the requested date." }
    default           { "The workflow completed with an unclassified result that should be reviewed before use." }
}

$payload = [ordered]@{
    output_class     = "Observation"
    workflow_name    = "Azure Appointments Observation Pilot"
    generated_at_utc = (Get-Date).ToUniversalTime().ToString("o")
    executive_tldr   = $executiveTldr

    verified_result = [ordered]@{
        classification         = $classification
        source_reachable       = ($classification -ne "ENDPOINT_FAILED")
        auth_valid             = ($classification -ne "AUTH_FAILED" -and $classification -ne "ENDPOINT_FAILED")
        requested_date         = $TargetDate
        total_records_returned = $totalRecordsReturned
        records_in_payload     = $recordsInPayload
        match_count            = $matchCount
        filtering_mode         = $filteringMode
        oldest_scheduledAt     = $oldestScheduledAt
        newest_scheduledAt     = $newestScheduledAt
    }

    operational_meaning = $operationalMeaning

    escalation_note = if ($escalationRequired) {
        [ordered]@{
            escalation_required = $true
            issue_type          = $operationalMeaning
            next_review         = if ($classification -eq "AUTH_FAILED") {
                "Review credentials and configuration."
            } else {
                "Review endpoint availability and service health."
            }
        }
    } else {
        [ordered]@{
            escalation_required = $false
        }
    }

    audit_notes = [ordered]@{
        endpoint_family              = "/health and /appointments"
        filtering_mode               = $filteringMode
        target_date                  = $TargetDate
        server_side_filter_attempted = $serverSideFilterAttempted
        server_side_filter_worked    = $serverSideFilterWorked
        observation_only             = $true
        source_script                = $SmokeTestPath
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
Write-Host "Operational meaning: $operationalMeaning"
Write-Host "Output written to: $OutputPath"

$json