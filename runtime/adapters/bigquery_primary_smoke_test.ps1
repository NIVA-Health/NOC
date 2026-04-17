param(
    [string]$ProjectId = "",
    [string]$Dataset = "",
    [string]$Table = "",
    [string]$DateField = "",
    [string]$TargetDate = (Get-Date).ToString("yyyy-MM-dd"),
    [int]$Limit = 100,
    [switch]$EmitJson
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$result = [ordered]@{
    classification = "UNCONFIGURED"
    message = "BigQuery smoke test scaffold created, but source details are not configured yet."
    timestamp_utc = (Get-Date).ToUniversalTime().ToString("o")
    details = [ordered]@{
        project_id = $ProjectId
        dataset = $Dataset
        table = $Table
        date_field = $DateField
        target_date = $TargetDate
        limit = $Limit
        server_side_filter_attempted = $false
        server_side_filter_worked = $false
        filtering_mode = $null
    }
}

if ($EmitJson) {
    $result | ConvertTo-Json -Depth 10
} else {
    Write-Host ""
    Write-Host "BigQuery Primary Smoke Test"
    Write-Host "Classification: $($result.classification)"
    Write-Host "Message: $($result.message)"
    Write-Host ""
    $result
}