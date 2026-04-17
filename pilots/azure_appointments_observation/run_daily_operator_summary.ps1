param(
    [Parameter(Mandatory = $false)]
    [string]$TargetDate = (Get-Date).ToString("yyyy-MM-dd"),

    [Parameter(Mandatory = $false)]
    [string]$BaseUrl,

    [Parameter(Mandatory = $false)]
    [string]$Username,

    [Parameter(Mandatory = $false)]
    [string]$Password
)

$ErrorActionPreference = "Stop"

$pilotRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$workflowScript = Join-Path $pilotRoot "run_observation_workflow.ps1"
$resultFile = Join-Path $pilotRoot "last_observation_result.json"

if (-not (Test-Path $workflowScript)) {
    throw "Required workflow script not found: $workflowScript"
}

Write-Host ""
Write-Host "=== Azure Appointments Daily Operator Summary ==="
Write-Host "Target date: $TargetDate"
Write-Host ""

$workflowParams = @{
    TargetDate = $TargetDate
}

if ($PSBoundParameters.ContainsKey("BaseUrl")) {
    $workflowParams["BaseUrl"] = $BaseUrl
}
if ($PSBoundParameters.ContainsKey("Username")) {
    $workflowParams["Username"] = $Username
}
if ($PSBoundParameters.ContainsKey("Password")) {
    $workflowParams["Password"] = $Password
}

& $workflowScript @workflowParams

if (-not (Test-Path $resultFile)) {
    throw "Expected result file was not created: $resultFile"
}

$result = Get-Content $resultFile -Raw | ConvertFrom-Json

$class = $null
$matchingCount = $null
$totalReturned = $null
$workflowMessage = $null

if ($null -ne $result.verified_result) {
    $class = $result.verified_result.classification
    $matchingCount = $result.verified_result.match_count
    $totalReturned = $result.verified_result.total_records_returned
}

if ((-not $class) -and $null -ne $result.adapter_payload) {
    $class = $result.adapter_payload.classification
}

if ($null -ne $result.adapter_payload -and $null -ne $result.adapter_payload.message) {
    $workflowMessage = $result.adapter_payload.message
}

Write-Host ""
Write-Host "=== Operator Summary ==="

switch ($class) {
    "CONNECTED" {
        Write-Host "Status: CONNECTED"
        if ($null -ne $matchingCount) {
            Write-Host "Matching appointments: $matchingCount"
        }
        if ($null -ne $totalReturned) {
            Write-Host "Total records returned: $totalReturned"
        }
        Write-Host "Operator interpretation: Connection succeeded and matching appointments were found."
        Write-Host "Recommended action: No immediate action required."
    }

    "NO_MATCHES" {
        Write-Host "Status: NO_MATCHES"
        if ($null -ne $matchingCount) {
            Write-Host "Matching appointments: $matchingCount"
        }
        if ($null -ne $totalReturned) {
            Write-Host "Total records returned: $totalReturned"
        }
        Write-Host "Operator interpretation: Connection succeeded, but no matching appointments were found for the target date."
        Write-Host "Recommended action: No immediate action required. This is a normal no-result condition."
    }

    "AUTH_FAILED" {
        Write-Host "Status: AUTH_FAILED"
        Write-Host "Operator interpretation: Authentication failed."
        Write-Host "Recommended action: Verify credentials, secret configuration, or account access."
    }

    "ENDPOINT_FAILED" {
        Write-Host "Status: ENDPOINT_FAILED"
        Write-Host "Operator interpretation: Endpoint or connectivity failure."
        Write-Host "Recommended action: Verify base URL, route, or source availability."
    }

    default {
        Write-Host "Status: $class"
        Write-Host "Operator interpretation: Unrecognized classification returned by the workflow."
        Write-Host "Recommended action: Review workflow output and classification logic."
    }
}

if ($workflowMessage) {
    Write-Host ""
    Write-Host "Workflow message: $workflowMessage"
}

Write-Host ""
Write-Host "=== End Operator Summary ==="
Write-Host ""