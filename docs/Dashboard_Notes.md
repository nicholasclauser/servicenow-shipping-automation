# Dashboard Notes

Excel Online cannot edit CSVs directly. They always open as read-only.

This is why the project uses:
- A CSV file (raw input)
- A separate XLSX dashboard (formatted front-end)

The XLSX file loads the CSV using Power Query.

To refresh:
Data > Refresh All
