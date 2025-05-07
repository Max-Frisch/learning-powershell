
# Importing a file containing the sensitive login details and IDs
. "$PSScriptRoot\config.ps1"

# Storage account variables:
$AccountKind = "StorageV2"
$AccountSKU  = "Standard_LRS"

# Resource group variables:
$Location = $Region

if (-not (Get-AzResourceGroup -Name $ResourceGroupName -ErrorAction SilentlyContinue)) {
    New-AzResourceGroup -Name $ResourceGroupName -Location $Location
}

# Creating a storage account
$StorageAccount = New-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $StorageAccountName -Location $Location -Kind $AccountKind -SkuName $AccountSKU -AllowBlobPublicAccess $true

$StorageAccount
