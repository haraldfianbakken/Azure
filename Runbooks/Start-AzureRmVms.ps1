<#PSScriptInfo

.VERSION 1.0

.GUID e9d6719c-94b4-4a19-8c72-b0f2dd436c8a

.AUTHOR Harald S. Fianbakken

.PROJECTURI https://github.com/haraldfianbakken/Azure/Runbooks

#>

#Requires -Module AzureRM.Profile
#Requires -Module AzureRM.Compute

<#
.SYNOPSIS
  Connects to Azure using SPC and starts a set of VMs. 

.DESCRIPTION
  Connects to Azure and starts a set of VMS using Azure Resource manager (ARM).

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

Write-Output "Starting $($VirtualMachines | ConvertTo-json)"

$vms = Get-AzureRmVM;

$VirtualMachines|Foreach-object {
    $name = $_;
    $result = $vm = $vms|Where-Object{ $_.Name -eq $name}|Start-AzureRmVM -ErrorAction Continue;
    	
	if (!$result.IsSuccessStatusCode) {
        Write-Output $_.Name + " failed to start VM"
        Write-Error $_.Name + " failed to start VM : $(ConvertTo-Json $result)" -ErrorAction Continue		
	}
	else {		
		Write-Output $_.Name + " has been started"
	}
}