
# Importing a file containing the sensitive login details and IDs
. "$PSScriptRoot\config.ps1"

# Storage account variables:
$AccountName = "powershellstorage123123"
$AccountKind = "StorageV2"
$AccountSKU  = "Standard_LRS"

# Resource group variables:
$ResourceGroupName = "storage-grp1"
$Location = $Region

# Creating a storage account
$StorageAccount = New-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $AccountName -Location $Location -Kind $AccountKind -SkuName $AccountSKU

$StorageAccount
