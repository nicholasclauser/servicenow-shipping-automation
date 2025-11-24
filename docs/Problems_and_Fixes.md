# Problems Encountered and Their Fixes

## 1. Custom Fields Missing
Problem: Address fields not in ServiceNow.
Fix: Added custom fields and updated form layout.

## 2. Developer Tenant Restricted
Problem: Microsoft no longer provides free M365 dev tenants.
Fix: Switched to Excel Online + OneDrive.

## 3. PowerShell Auth String Breaking
Problem: `$user:$pwd` failed.
Fix: Used "{0}:{1}" -f $user, $pwd.

## 4. Reference Objects Returning Links
Problem: `requested_for` returned object links.
Fix: Added `sysparm_display_value=true` and calculated properties.

## 5. CSV Read-Only in Excel Online
Problem: Excel Online does not treat CSV as editable.
Fix: Created separate dashboard XLSX pulling from the CSV.
