

# This command prevents saving the Account credentials in the powershell context
Disable-AzContextAutosave

# Connecting the PowerShell session to Azure
Connect-AzAccount

# Connecting to Azure, specifying the tenant ID
Connect-AzAccount -TenantId xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx  # replace with real tenant ID