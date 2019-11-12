Creates a CNAME record in an Azure DNS Zone.

# How to use this template

Link to this template from your project's resource manager template file, passing the name and value as parameters.
If no zone is specified, uoguelph.dev is assumed.

For example, to create the record:

| Name                   | Type  | Value                 |
|------------------------|-------|-----------------------|
| testalias.uoguelph.dev | CNAME | testcname.example.com |

Link to the template like so:

```
    {
      "type": "Microsoft.Resources/deployments",
      "apiVersion": "2018-05-01",
      "name": "linkedTemplate",
      "resourceGroup": "ug-ccs-wds-dns-rg",
      "properties": {
        "mode": "Incremental",
        "templateLink": {
          "uri": "https://raw.githubusercontent.com/ccswbs/azure-resource-manager-templates/master/dns-cname-uoguelphdev/template.json"
        },
        "parameters": {
          "name": {"value": "testalias"},
          "value": {"value": "testcname.example.com"},
          "zone": {"value": "uoguelph.dev"}
        }
      }
    }
```
