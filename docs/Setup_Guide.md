# Setup Guide

## Requirements 
- ServiceNow Personal Developer Instance
- PowerShell 5.1+
- OneDrive
- Excel Online

## Steps

### 1. Configure ServiceNow
1. Open PDI.
2. Add custom fields: `u_city`, `u_street`, `u_postalcode`.
3. Add them to the `sc_req_item` form layout.

### 2. Create Test Tickets
Generate REQ/RITM records with address data.

### 3. Configure OneDrive
Create a folder for the CSV.

### 4. Set Script Path and Instance
Update these two variables at the top of the script:

```powershell
$instance = "devinstance.service-now.com"
$csvPath  = "C:\Users\YourUser\OneDrive\Hardware_Shipments.csv"
```

The script stores no credentials. When you run it, it prompts for your ServiceNow login with `Get-Credential`. Nothing gets written to the script or to disk.
### 5. Run the Script
Execute the script in PowerShell.

### 6. Build Excel Dashboard
1. Create an XLSX file in Excel Online.
2. Use **Power Query** to import the CSV.
3. Build your dashboards and views.
4. Refresh to update data.

### Optional: Task Scheduler
You can automate the script to run daily or hourly using Windows Task Scheduler. The `Get-Credential` prompt is interactive, so for unattended runs swap it for a stored credential via PowerShell SecretManagement.
