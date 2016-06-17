# Azure runbooks for automating stuff

## Start-AzureRMVms.ps1
Simple runbook to start a given set (input) of virtual machines (regardless of resource group) using the Service Princial user.

## Stop-AzureRMVms.ps1
Simple runbook to stop a given set (input) of virtual machines (regardless of resource group) using the Service Princial user.

## Notes

In order for this to work; you must have set up a RunAsConnection in Azure automation. See 
https://azure.microsoft.com/en-us/documentation/articles/automation-sec-configure-azure-runas-account

NB: Remember if you're using RBAC to grant this Service princal user; that it will be added to the subscription with a Contributor role by default and you might want to restrict it's access!

