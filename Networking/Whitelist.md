# On-Prem / Azure hybrid solutions - Url whitelisting and overview

On-prem solutions and hybrid solutions working together with Azure can be a hazzle, especially if you don't have control over the network or configurations in place. 
In order to make network configurations easier / and allow for easier overview for what to configure I'm gathering a set of urls here that can be used to configuring firewalls / bypass local proxies. 

Feel free to add more and add a pull request when you see URL's and services missing.

## Azure services and urls

Site    | Description
--------|------------
*.windowsazure.com  |   Allow for all services running under the windowsazure domain. E.g manage, remoteapp etc
*.remoteapp.windwsazure.com | Azure Remote App
*.azure.com | Generic
*.core.windows.net | (generic storage access; includes: queues, blobs, tables)
*.blob.core.windows.net | Specific for blob storage
*.table.core.windows.net    | Specific for table storage
*.queue.core.windows.net    | Specific for queues (storage)
*.servicebus.windows.net    | Servicebus - Needed for e.g. RemoteApp
*.servicebus.net    | ServiceBus - needed for RemoteApp
*.cloudapp.net  | Cloud services
*.azurewebsites.net | Web sites
*.azure-api.net    | API management
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


For more about configuring O365 check : https://support.office.com/en-gb/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2?ui=en-US&rs=en-GB&ad=GB 