<#PSScriptInfo

.VERSION 1.0

.GUID bc7bf658-8037-4d51-8cb5-79c614710951
.AUTHOR Harald S. Fianbakken

.PROJECTURI https://github.com/haraldfianbakken/Azure/Runbooks

#>

#Requires -Module AzureRM.Profile
#Requires -Module AzureRM.Compute

<#
.SYNOPSIS
  Connects to Azure and stops a set of VMs.

.DESCRIPTION
  Connects to Azure and stops a set of VMs (input) using Resource manager (ARM).  

.PARAMETER AzureRunAsAccountName
  Defaults to "AzureRunAsConnection". Please set up the correct RunAsConnection under Azure. 
  Check out: https://azure.microsoft.com/en-us/documentation/articles/automation-sec-configure-azure-runas-account

#>

[OutputType([String])]
param (
    [Parameter(Mandatory=$false)] 
    [String]  $AzureRunAsAccountName = "AzureRunAsConnection",

    [Parameter(Mandatory=$true)] 
    $VirtualMachines
)


$ServicePrincipalConnection = Get-AutomationConnection -Name $AzureRunAsAccountName         
if(!$ServicePrincipalConnection) {
    throw "No SPC - Connection $AzureConnectionAssetName not found."
}
Write-Output "Logging in to Azure..."
[void](Add-AzureRmAccount -ServicePrincipal -TenantId $ServicePrincipalConnection.TenantId -ApplicationId $ServicePrincipalConnection.ApplicationId -CertificateThumbprint $ServicePrincipalConnection.CertificateThumbprint)

Write-Output "Stopping $($VirtualMachines | ConvertTo-json)"

$vms = Get-AzureRmVM;

$VirtualMachines|Foreach-object {
    $name = $_;
    $result = $vm = $vms|Where-Object{ $_.Name -eq $name}|Stop-AzureRmVM -ErrorAction Continue;
    	
	if (!$result.IsSuccessStatusCode) {
        Write-Output $_.Name + " failed to stop VM"
        Write-Error $_.Name + " failed to stop VM : $(ConvertTo-Json $result)" -ErrorAction Continue		
	}
	else {		
		Write-Output $_.Name + " has been started"
	}
}