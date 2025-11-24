# Build-ShippingCSV.ps1
# extracts shipping data from ServiceNow and exports it to a CSV that syncs through OneDrive.

# connection info
$instance = "devinstance.service-now.com"
$user = "usernamegoeshere"
$pwd = "passwordgoeshere"

# build basic auth header
$authString = "{0}:{1}" -f $user, $pwd
$encodedAuth = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes($authString))

$headers = @{
    Authorization = "Basic $encodedAuth"
    Accept        = "application/json"
}

# API endpoint and query
$apiUrl = "https://$instance/api/now/table/sc_req_item"
$query  = "?sysparm_query=numberSTARTSWITHRITM0010"
$fields = "&sysparm_fields=number,u_city,u_street,u_postalcode,requested_for,state"
$display = "&sysparm_display_value=true"

$fullUrl = $apiUrl + $query + $fields + $display

Write-Host "Pulling data from ServiceNow..."

try {
    $resp = Invoke-RestMethod -Uri $fullUrl -Headers $headers -Method Get

    $csvRows = $resp.result | Select-Object `
        @{Name="Ticket Number"; Expression={$_.number}}, `
        @{Name="Full Name";     Expression={$_.requested_for.display_value}}, `
        @{Name="Street";        Expression={$_.u_street}}, `
        @{Name="City";          Expression={$_.u_city}}, `
        @{Name="Postal Code";   Expression={$_.u_postalcode}}, `
        @{Name="Status";        Expression={$_.state}}

    $csvPath = "C:\PathToYourFolderHere\Hardware_Shipments.csv"
    $csvRows | Export-Csv -Path $csvPath -NoTypeInformation -Encoding UTF8

    Write-Host "Exported $($csvRows.Count) rows to $csvPath"
    $csvRows | Format-Table -AutoSize

} catch {
    Write-Host "Error occurred: $($_.Exception.Message)"
}

Read-Host "Press Enter to exit"
