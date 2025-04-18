
# Importing a file containing the sensitive login details and IDs
. "$PSScriptRoot\config.ps1"


# Converting the application secret string into a secure string object
$SecureSecret = $AppSecret | ConvertTo-SecureString -AsPlainText -Force

# Building the login credential from the application ID and secret
$Credential = New-Object -TypeName System.Management.Automation.PSCredential `
-ArgumentList $AppId, $SecureSecret

# Connecting to Azure using the service principal's credentials(Azure RBAC role required!)
# In Azure IAM of the intended scope, a role assignment as to be added for the service principal
Connect-AzAccount -ServicePrincipal -Tenant $TenantID -Credential $Credential