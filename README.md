# ServiceNow Hardware Shipping Automation

## Overview
This project automates the extraction of hardware shipping details from ServiceNow and publishes them to a cloud-synced CSV, which feeds into an Excel Online dashboard. It replaces the repetitive manual process of reading a ticket and typing address details into a label system.

The system is built using a PowerShell ETL script, a ServiceNow Personal Developer Instance, and OneDrive as a transport layer.

## What This Solves
At CTC, creating a shipping label for a single new-hire laptop required:
1. Opening the ticket.
2. Reading the address.
3. Manually typing it into the shipping app.
4. Printing and verifying.

This took several minutes per ticket and was error-prone. This automation cuts the process down to seconds and removes manual data entry entirely.

## How It Works
1. The script connects to ServiceNow via REST API.
2. It queries the `sc_req_item` table for hardware requests.
3. It extracts address fields and requester info.
4. It transforms ServiceNow reference objects into readable fields.
5. It exports the cleaned data into a CSV located inside a OneDrive-synced folder.
6. OneDrive automatically uploads the CSV to the cloud.
7. An Excel Online file (Dashboard) with a Power Query connection loads this CSV.

## Components
- ServiceNow PDI (source of truth)
- PowerShell script (ETL engine)
- OneDrive sync (transport layer)
- Excel Online dashboard (front-end)

## Script Included
The full ETL script is provided in `Build-ShippingCSV.ps1`.

## Documentation
Full documentation is available under `/docs`.

## Status
Complete and functional proof-of-concept.

## Extensibility & Future Roadmap
This framework was designed to be highly configurable. While the current implementation focuses on address extraction, the pipeline can be easily scaled to handle full-cycle asset management:

- **Automated Label Printing:** The generated CSV structure is compatible with Dymo/Zebra label software or Microsoft Word Mail Merge. A future enhancement could include a VBA macro or Python script to trigger "One-Click" printing to a dedicated shipping station.
- **Full Asset Lifecycle Tracking:** The `Select-Object` logic in the script can be expanded to pull granular details such as Device Serial Numbers, Active Directory Usernames, and Onboarding/Offboarding dates.
- **Bidirectional Sync:** The pipeline could be upgraded to *write back* to ServiceNow, automatically updating the ticket status to "Shipped" once the shipping label is generated.
