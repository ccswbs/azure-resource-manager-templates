# Overview

This template creates a Ubuntu VM on Azure with [Pantheon Terminus](https://pantheon.io/docs/terminus/) installed and authorized to your account using a Pantheon machine token. 

# Usage

- Create a Pantheon [machine token](https://pantheon.io/docs/machine-tokens/)
- Create a new Azure resource deployment using the method below, passing your machine token as an argument
- Log in the the Ubuntu VM as user `wsadmin` using the password you provided

## PowerShell

```powershell
New-AzResourceGroupDeployment -Name terminus -ResourceGroupName pantheon-automation -TemplateFile .\template.json -TemplateParameterFile .\parameters.json -Mode Complete  -pantheonMachineToken [machine-token] -adminPasswordOrKey (convertto-securestring 'Pa55W0rd!' -asplaintext -force)  -Verbose
```

# Customization

See `parameters.json` and `template.json` for available parameters (such as user account name.)
