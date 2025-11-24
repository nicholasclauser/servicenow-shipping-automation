# Development Journey

This project was not built in a straight line. Several obstacles were encountered:

## Missing ServiceNow Fields
The default PDI did not contain the required address fields. Custom fields had to be created:
- u_street
- u_city
- u_postalcode

## Microsoft 365 Developer Tenant Blocked
Microsoft changed eligibility in 2024. The project pivoted from SharePoint to Excel Online + OneDrive.

## Basic Auth String Syntax Errors
PowerShell misinterpreted `$user:$pwd` due to the colon. Solution was format operator:
"{0}:{1}" -f $user, $pwd

## Reference Field Issues
ServiceNow returns objects like:
requested_for: { link: "...", value: "..." }

Using `sysparm_display_value=true` fixed this.

## Excel Online CSV Limitations
Excel Online cannot treat a CSV as a live dashboard; it opens CSVs in read-only mode. The fix:
- CSV is the raw data
- A separate XLSX dashboard imports the CSV
