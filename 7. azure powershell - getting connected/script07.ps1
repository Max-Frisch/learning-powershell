
# Importing a file containing the sensitive login details and IDs
. "$PSScriptRoot\config.ps1"

# This command prevents saving the Account credentials in the powershell context
Disable-AzContextAutosave

# Connecting the PowerShell session to Azure
#Connect-AzAccount

# Connecting to Azure, specifying the tenant ID
Connect-AzAccount -TenantId $TenantID