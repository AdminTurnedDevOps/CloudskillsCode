function servicePrinicpalKeyvault {
    [cmdletbinding()]
    param(
        [string]$name = "sp-keyvault-cloudskills",
        [string]$resourceGroup = "Dev10",
        [string]$location = "eastus2"
    )

    az keyvault create --location $location --name $name --resource-group $resourceGroup
}