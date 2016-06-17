# Azure runbooks for automating stuff

## Start-AzureRMVms.ps1
Simple runbook to start a given set (input) of virtual machines (regardless of resource group) on behalf of user

## Stop-AzureRMVms.ps1
Simple runbook to stop a given set (input) of virtual machines (regardless of resource group) on behalf of user

## Notes

In order for this to work; you must have set up a RunAsConnection in Azure automation. See 
https://azure.microsoft.com/en-us/documentation/articles/automation-sec-configure-azure-runas-account