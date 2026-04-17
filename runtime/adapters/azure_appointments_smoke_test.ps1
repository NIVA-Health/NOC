param(
    [string]$BaseUrl = "https://niva-dev-api-app.azurewebsites.net",
    [string]$Username = "admin",
    [string]$TargetDate = "2026-04-17",
    [int]$Limit = 100,
    [switch]$TryServerSideDateFilters,
    [switch]$EmitJson
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Convert-SecureStringToPlainText {
    param([Security.SecureString]$SecureString)

    $bstr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecureString)
    try {
        return [Runtime.InteropServices.Marshal]::PtrToStringBSTR($bstr)
    }
    finally {
        if ($bstr -ne [IntPtr]::Zero) {
            [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($bstr)
        }
    }
}

function New-BasicAuthHeader {
    param(
        [string]$User,
        [string]$Password
    )

    $pair = "${User}:$Password"
    $bytes = [System.Text.Encoding]::ASCII.GetBytes($pair)
    $basicToken = [Convert]::ToBase64String($bytes)

    return @{ Authorization = "Basic $basicToken" }
}

function Write-Result {
    param(
        [string]$Classification,
        [string]$Message,
        [hashtable]$Details
    )

    $payload = [ordered]@{
        classification = $Classification
        message = $Message
        timestamp_utc = (Get-Date).ToUniversalTime().ToString("o")
        details = $Details
    }

    if ($EmitJson) {
        return ($payload | ConvertTo-Json -Depth 8)
    }
    else {
        Write-Host ""
        Write-Host "Classification: $Classification"
        Write-Host "Message: $Message"
        Write-Host ""
        $payload.details.GetEnumerator() | Sort-Object Name | ForEach-Object {
            Write-Host ("{0}: {1}" -f $_.Name, $_.Value)
        }

        return $payload
    }
}

function Get-ErrorBody {
    param($Exception)

    if ($Exception.Response) {
        try {
            $reader = New-Object System.IO.StreamReader($Exception.Response.GetResponseStream())
            try {
                return $reader.ReadToEnd()
            }
            finally {
                $reader.Close()
            }
        }
        catch {
            return $null
        }
    }

    return $null
}

function Test-Health {
    param([string]$Url)

    return Invoke-RestMethod -Uri "$Url/health" -Method GET
}

function Get-Appointments {
    param(
        [string]$Url,
        [hashtable]$Headers,
        [int]$Page,
        [int]$PageLimit,
        [string]$ExtraQuery
    )

    $query = "page=$Page&limit=$PageLimit"
    if ($ExtraQuery) {
        $query = "$ExtraQuery&$query"
    }

    return Invoke-RestMethod -Uri "$Url/appointments?$query" -Method GET -Headers $Headers
}

function Get-DatedRecords {
    param([object[]]$Records)

    return @(
        $Records | Where-Object {
            $_.scheduledAt
        }
    )
}

function Test-AllRecordsMatchTargetDate {
    param(
        [object[]]$Records,
        [datetime]$TargetDateValue
    )

    $dated = Get-DatedRecords -Records $Records
    if ($dated.Count -eq 0) {
        return $false
    }

    $nonMatching = @(
        $dated | Where-Object {
            (Get-Date $_.scheduledAt).Date -ne $TargetDateValue
        }
    )

    return ($nonMatching.Count -eq 0)
}

$securePassword = Read-Host "API password" -AsSecureString
$password = Convert-SecureStringToPlainText -SecureString $securePassword
$headers = New-BasicAuthHeader -User $Username -Password $password
$target = (Get-Date $TargetDate).Date

$details = [ordered]@{
    base_url = $BaseUrl
    username = $Username
    target_date = $TargetDate
    limit = $Limit
    server_side_filter_attempted = $false
    server_side_filter_worked = $false
}

try {
    $health = Test-Health -Url $BaseUrl
    $details.health_status = $health.status
}
catch {
    $details.error_body = Get-ErrorBody -Exception $_.Exception
    $details.error_message = $_.Exception.Message
    Write-Result -Classification "ENDPOINT_FAILED" -Message "Health check failed." -Details $details
    exit 1
}

$response = $null
$filterCandidates = @()

if ($TryServerSideDateFilters) {
    $details.server_side_filter_attempted = $true
    $filterCandidates = @(
        "date=$TargetDate",
        "scheduledAt=$TargetDate",
        "from=$TargetDate&to=$((Get-Date $TargetDate).AddDays(1).ToString('yyyy-MM-dd'))"
    )

    foreach ($candidate in $filterCandidates) {
        try {
            $attempt = Get-Appointments -Url $BaseUrl -Headers $headers -Page 1 -PageLimit $Limit -ExtraQuery $candidate
            $attemptData = @()
            if ($attempt -and $attempt.data) {
                $attemptData = @($attempt.data)
            }

            if ($attempt) {
                $details.last_server_side_filter_tested = $candidate
            }

            if ($attemptData.Count -gt 0) {
                if (Test-AllRecordsMatchTargetDate -Records $attemptData -TargetDateValue $target) {
                    $response = $attempt
                    $details.server_side_filter_worked = $true
                    $details.server_side_filter_used = $candidate
                    break
                }
                else {
                    $details.server_side_filter_unverified_candidate = $candidate
                    $details.server_side_filter_unverified_reason = "Returned records were not limited to the requested target date."
                }
            }
        }
        catch {
            $details.last_server_side_filter_error = $_.Exception.Message
        }
    }
}

if (-not $response) {
    try {
        $response = Get-Appointments -Url $BaseUrl -Headers $headers -Page 1 -PageLimit $Limit -ExtraQuery $null
    }
    catch {
        $details.error_body = Get-ErrorBody -Exception $_.Exception
        $details.error_message = $_.Exception.Message

        if ($_.Exception.Response -and ([int]$_.Exception.Response.StatusCode -in 401, 403)) {
            Write-Result -Classification "AUTH_FAILED" -Message "Authenticated endpoint rejected the request." -Details $details
            exit 1
        }

        Write-Result -Classification "ENDPOINT_FAILED" -Message "Appointments endpoint request failed." -Details $details
        exit 1
    }
}

$data = @()
if ($response.data) {
    $data = @($response.data)
}

$matches = @(
    $data | Where-Object {
        $_.scheduledAt -and ((Get-Date $_.scheduledAt).Date -eq $target)
    }
)

$details.total_records_returned = if ($null -ne $response.total) { $response.total } else { $data.Count }
$details.records_in_payload = $data.Count
$details.matches_for_target_date = $matches.Count
$details.filtering_mode = if ($details.server_side_filter_worked) { "server_side_plus_validation" } else { "client_side" }

if ($data.Count -gt 0) {
    $newest = $data | Where-Object { $_.scheduledAt } | Sort-Object scheduledAt -Descending | Select-Object -First 1
    $oldest = $data | Where-Object { $_.scheduledAt } | Sort-Object scheduledAt | Select-Object -First 1

    if ($newest) { $details.newest_scheduledAt = $newest.scheduledAt }
    if ($oldest) { $details.oldest_scheduledAt = $oldest.scheduledAt }
}

if ($matches.Count -gt 0) {
    $details.sample_match_ids = @($matches | Select-Object -First 5 -ExpandProperty id) -join ", "
    Write-Result -Classification "CONNECTED" -Message "Endpoint reachable, auth valid, and matching appointments found." -Details $details
    exit 0
}

Write-Result -Classification "NO_MATCHES" -Message "Endpoint reachable and auth valid, but no appointments matched the requested date." -Details $details
exit 0