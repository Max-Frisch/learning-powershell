
# Create a new application object (service principal)
# In MS Azure -> EntraID -> app registrations -> new registration -> choose a Name

# Importing a file containing the sensitive login details and IDs
. "$PSScriptRoot\config.ps1"

# Define variables for resource group
$ResourceGroupName = "powershell-grp"
$Location = $Region

# Converting the application secret string into a secure string object
$SecureSecret = $AppSecret | ConvertTo-SecureString -AsPlainText -Force

# Building the login credential from the application ID and secret
$Credential = New-Object -TypeName System.Management.Automation.PSCredential `
-ArgumentList $AppId, $SecureSecret

# Connecting to Azure using the service principal's credentials(Azure RBAC role required!)
Connect-AzAccount -ServicePrincipal -Tenant $TenantID -Credential $Credential

# Disconnect-AzAccount