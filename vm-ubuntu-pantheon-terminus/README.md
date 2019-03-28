

New-AzResourceGroupDeployment -Name terminus -ResourceGroupName pantheon-automation -TemplateFile .\template.json -TemplateParameterFile .\parameters.json -Mode Complete

# Prerequisites

- Install-Module Az
- Install-Module AzureRM
- Install-Module Az.Account

Before running deploy.ps1, you may find it convenient to authenticate with Azure by running 
`Connect-AzureAccount` (requires the Az.Account module to be installed and enabled, 
run `Install-Module Az.Account` as Administrator and then `Import-Module Az.Account`.)

