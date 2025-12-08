# ServiceNow Hardware Shipping Automation

A PowerShell ETL pipeline that pulls hardware shipping details out of ServiceNow and
writes them to a OneDrive-synced CSV that feeds an Excel Online dashboard. The point:
stop typing the same shipping address into two different systems.

My first GitHub project. I built it on a ServiceNow Personal Developer Instance (PDI) to
fix something that bugged me in an old support role: every hardware request meant opening
the ticket, copying the name and address into an asset spreadsheet, then retyping the same
details into the label printer. Same data, entered twice, slow and easy to fat-finger.

## What it does

1. Extract. Connects to the ServiceNow REST API and queries `sc_req_item` for active
   hardware requests.
2. Transform. Pulls the fields that matter (requester, street, city, postal code) and
   flattens ServiceNow's reference objects into plain text.
3. Load. Writes a clean CSV into a OneDrive folder. OneDrive syncs it up, and an Excel
   Online dashboard wired through Power Query refreshes for whoever runs logistics.

A few minutes of copy-paste per ticket becomes a few seconds.

## The payoff

On a 15-person team at about 3 minutes saved per hardware request, that is roughly 3.5
hours of typing a week, or about $10k/year of time handed back at standard labour rates.
The real win is killing a boring double-entry step that invites address typos.

## Pieces

- Source: ServiceNow Personal Developer Instance
- Engine: `Build-ShippingCSV.ps1` (REST + JSON parsing)
- Transport: OneDrive, local to cloud
- Front end: Excel Online dashboard

Full docs under `/docs`.

## Where it could go

Right now it handles address extraction. Same pipeline could:
- Feed the CSV straight into Dymo or Zebra label software for one-click printing.
- Pull more asset detail: serial numbers, AD usernames, onboarding dates.
- Write back to ServiceNow to flip the ticket to Shipped once the label prints.
