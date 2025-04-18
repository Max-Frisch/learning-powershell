
# Importing a file containing the sensitive login details and IDs
. "$PSScriptRoot\config.ps1"

# Define a variable for the intented Location to create RSGs and resources in
$Location = $Region

# Just for practice, this function creates resource groups following a given naming scheme or 
# scope, f.e. "powershell-grp1", "powershell-grp2" etc
function New-ResourceGroups {
    param(
        [string]$NamingScheme,
        [int]$NumberOfGroups
    )
    for ($i = 1; $i -le $NumberOfGroups; $i++) {
        $FullName = "$NamingScheme-grp$i"
        $NewRG = New-AzResourceGroup -Name $FullName -Location $Location
        Write-Host "Created Resource Group: $($NewRg.ResourceGroupName)"
        Write-Host "Provisioning State: $($NewRg.ProvisioningState)"
        Write-Host ""
    }
}
New-ResourceGroups -NamingScheme "storage" -NumberOfGroups 1

# Create a list of selected/specific resource group objects
$SpecificResourceGroups = Get-AzResourceGroup | Where-Object {$_.ResourceGroupName -like "powershell*"}

# Deleting all prior selected or filtered resource groups
foreach ($Group in $SpecificResourceGroups) {
    Remove-AzResourceGroup -Name $Group.ResourceGroupName -Force
}

Get-AzResourceGroup

# Saving ALL resourcegroups in this Subscription into an object of resourcegroups
$AllResourceGroups = Get-AzResourceGroup

# To not accidentally delete all existing resourcegroups(!), we define a variable to define 
# the "scope" of resourcegroups, as in the naming convention used for the resourcegroups while 
# practicing. F.e. "powershell-grp1", "powershell-grp2", "virtualmachines-grp1" etc.
# The variable will be set to "powershell*" or "virtualmachines*" to match all related
# It will also print the "skipped over" and not deleted resource groups.
# This does not reflect naming conventions and practices in the real world and is just for practice!!
$ResourceGroupScope = "powershell*"

# Looping over ALL resource groups($AllResourceGroups), removing only the ones matching our "scope" and printing out the remaining resource groups, not deleted.
foreach ($Group in $AllResourceGroups) {
    if ($Group.ResourceGroupName -like $ResourceGroupScope+"*") {
        Write-Host "Removing Resource Group: $($Group.ResourceGroupName).."
        Remove-AzResourceGroup -Name $Group.ResourceGroupName -Force
    } else {
        Write-Host "Skipping: $($Group.ResourceGroupname)"
    }
}