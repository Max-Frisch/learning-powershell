
# Retrieve and print a list of locations, the left column "Location" is what we use
Get-AzLocation | Select-Object Location, DisplayName

# Create a new resource group within the connected Subscription
# The two important attributes are the resource group's name and it's location
$ResourceGroupName = "powershell-grp"
$Location = "southeastasia"

New-AzResourceGroup -Name $ResourceGroupName -Location $Location

# List all resoure groups (under this subscription)
Get-AzResourceGroup

# List a specific resource group
get-azresourceGroup -Name $ResourceGroupName

# List all resources in a specific resource group (Nothing returned if no resources yet)
Get-AzResource -ResourceGroupName $ResourceGroupName

# Delete the resourcegroup including <ALL> it's resources (great for quick tear down!)
Remove-AzResourceGroup -Name $ResourceGroupName

# Delete the resourcegroup including <ALL> it's resources with the -Force flag, skipping confirmation prompt
Remove-AzResourceGroup -Name $ResourceGroupName -Force