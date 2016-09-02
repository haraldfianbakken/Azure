# A list of URL's for simplifying configuration /networking towards Azure - for On-prem / Hybrid solutions 

Useful for opening firewalls and allowing proxy bypasses. Feel free to add more and add a pull request when new URL's are discovered.

## Azure services and urls

Site    | Description
--------|------------
*.windowsazure.com  |   Generic, all subservices
*.remoteapp.windwsazure.com | Remoteapp

*.azure.com | Generic
*.*.core.windows.net | (storage access, queuest, blobs, tables, can filter on *.blob.core.windows.net, *.table.core..., *.queue..., *.file...).
*.servicebus.windows.net    | Servicebus - Needed for e.g. RemoteApp
*.servicebus.net    | ServiceBus - needed for RemoteApp

*.cloudapp.net  | Cloud services
*.azurewebsites.net | Web sites
*.database.windows.net  | SQL 
*.trafficmanager.net    | Traffic manager
*.azure-automation.net  | Azure automation - If using DSC pull configuration with on-prem, whitelist this

ods.opinsights.azure.com | Operation insights, monitoring agent, log analytics
ods.systemcenteradvisor.com | Log anlytics


login.microsoftonline.com   | Login for Azure AD / various applications
login.windows.net   | Login for various 

## Office 365 and other apps

Site    | Description
--------|------------
app.powerbi.com | Office 365 apps
outlook.office365.com | Office 365 apps
yammer.com  | Yammer
tasks.office.com    | Tasks planner
*.sharepoint.com    | Sharepoint online
protection.office.com   | Security and complience
sway.com    | sway
portal.office.com   | generic for office, store etc.

** For more about configuring O365, check https://support.office.com/en-gb/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2?ui=en-US&rs=en-GB&ad=GB **