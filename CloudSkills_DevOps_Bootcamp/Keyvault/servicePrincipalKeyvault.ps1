function servicePrinicpalKeyvault {
    [cmdletbinding()]
    param(
        [string]$name = "sp-keyvault-cloudskills",
        [string]$resourceGroup = "Dev10",
        [string]$location = "eastus2"
    )

    $createKeyVault = az keyvault create --location $location --name $name --resource-group $resourceGroup
    $createKeyVault
    $createKeyVault.Id
}