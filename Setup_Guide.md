# Setup Guide

## Requirements
- ServiceNow Personal Developer Instance
- PowerShell 5.1+
- OneDrive
- Excel Online

## Steps

### 1. Configure ServiceNow
1. Open PDI.
2. Add custom fields: u_city, u_street, u_postalcode.
3. Add them to sc_req_item form layout.

### 2. Create Test Tickets
Generate REQ/RITM records with address data.

### 3. Configure OneDrive
Create a folder for the CSV.

### 4. Set Script Path
Update:
$csvPath = "C:\Users\YourUser\OneDrive\Hardware_Shipments.csv"

### 5. Run the Script
Execute in PowerShell.

### 6. Build Excel Dashboard
1. Create an XLSX in Excel Online.
2. Use Power Query to import the CSV.
3. Build dashboards and views.
4. Refresh to update data.

### Optional: Task Scheduler
Automate daily or hourly script execution.
