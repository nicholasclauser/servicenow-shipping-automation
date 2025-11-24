# Architecture Overview

This project is a lightweight ETL pipeline using:
- ServiceNow (source system)
- PowerShell (ETL engine)
- OneDrive (transport layer)
- Excel Online (visualization layer)

## Data Flow
1. Data originates in ServiceNow (`sc_req_item` table).
2. PowerShell queries relevant fields using REST API.
3. Data is transformed into a flat table.
4. Data is exported to a local CSV inside a OneDrive folder.
5. OneDrive syncs the CSV to the cloud automatically.
6. Excel Online connects to the CSV via Power Query.

## Rationale
This design avoids:
- Uploading to OneDrive via Graph API (blocked for personal tenants)
- Running an Azure Automation runbook
- Needing SharePoint Online

Instead, it uses the local OneDrive sync client as a reliable transport without API overhead.
