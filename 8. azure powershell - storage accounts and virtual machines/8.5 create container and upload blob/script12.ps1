
# Importing a file containing the sensitive login details and IDs
. "$PSScriptRoot\config.ps1"

# get storage context

$StorageAccountContext = (Get-AzStorageAccount -Name $StorageAccountName -ResourceGroupName $ResourceGroupName).Context

# Creat new storage container

New-AzStorageContainer -Name $ContainerName -Context $StorageAccountContext -Permission Blob

$BlobObject = @{
    FileLocation = "$PSScriptRoot\file.txt"
}

Set-AzStorageBlobContent -Context $StorageAccountContext -Container $ContainerName -File 