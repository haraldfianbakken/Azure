# On-Prem / Azure hybrid solutions - Url whitelisting and overview

On-prem solutions and hybrid solutions working together with Azure can be a hazzle, especially if you don't have control over the network or configurations in place. 
In order to make it easier to configure and make your On-Prem work well together with Azure it's helpfult to know what to allow in your firewall rules or bypass in your proxies. I'm gathering here a set of urls here that can be used for such configuration. 

Feel free to add more and add a pull request when you see URL's and services missing.

## Azure services and urls

URL    | Description | Ip addresses
--------|-------------|------------------
*.windowsazure.com  |   Allow for all services running under the windowsazure domain. |
*.remoteapp.windowsazure.com | Azure Remote App |
marketplace.windowsazure.com | Azure marketplace |
status.windowsazure.com | Status and health  |
*.azure.com | Generic - Allow all services for *.azure.com |
*.cloudapp.azure.com    | Cloud apps |
portal.azure.com  | Azure portal |
datamarket.azure.com | Data market |
resources.azure.com | Resource explorer |
ods.opinsights.azure.com | Operation insights, monitoring agent, log analytics |
*.core.windows.net | (generic storage access; would include: queues, blobs, tables, files) |
*.blob.core.windows.net | Specific for blob storage |
*.table.core.windows.net    | Specific for table storage |
*.queue.core.windows.net    | Specific for queues (storage) |
*.servicebus.windows.net    | Servicebus - Needed for e.g. custom solutions, RemoteApp ++|
*.servicebus.net    | ServiceBus - needed for e.g. custom solutions, RemoteApp ++ |
*.cloudapp.net  | Cloud services |
*.azurewebsites.net | Web sites |
*.azure-api.net    | API management |
*.database.windows.net  | SQL  |
*.trafficmanager.net    | Traffic manager |
*.azure-automation.net  | Azure automation - If using DSC pull configuration with on-prem, whitelist this |
ods.systemcenteradvisor.com | Log anlytics | 
login.microsoftonline.com   | Login for Azure AD / various applications |
login.windows.net   | Login for various |


## Office 365 and other apps

URL    | Description
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
