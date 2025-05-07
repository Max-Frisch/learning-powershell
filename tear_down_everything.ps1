
# Saving ALL resourcegroups in this Subscription into an object of resourcegroups
$AllResourceGroups = Get-AzResourceGroup

# Looping over ALL resource groups($AllResourceGroups), removing the RSGs and all created 
# resources inside them. Basically a complete clean-up to cut down costs!
# As this Azure tenant is used for learning and practice, no "production"-resources are touched
foreach ($Group in $AllResourceGroups) {
        Write-Host "Removing Resource Group: $($Group.ResourceGroupName).."
        Remove-AzResourceGroup -Name $Group.ResourceGroupName -Force
}

# Check if all resource groups and resources have been deleted, or not!
if (! $(Get-AzResourceGroup) -or ! $(Get-AzResource)) {
    Write-Host -ForegroundColor Green "All resource groups including all resources are deleted."
} else {
    Write-Host -ForegroundColor Red "Some resource groups or resources have not been deleted! Check manually!!"
}


Disconnect-AzAccount
Disconnect-MgGraph

$context = Get-AzContext -ErrorAction SilentlyContinue
if ($context){
    Disconnect-AzAccount
}

Clear-AzContext

Get-AzContext
Get-MgContext