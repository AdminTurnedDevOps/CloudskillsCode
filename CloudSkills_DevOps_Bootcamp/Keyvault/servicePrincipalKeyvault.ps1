function servicePrinicpalKeyvault {
    [cmdletbinding()]
    param(
        [string]$name = "sp-keyvault-cloudskills",
        [string]$resourceGroup = "Dev10",
        [string]$location = "eastus2",
        [string]$subscriptionName = "Mike-Pay-As-You-Go"
    )

    try {
        $createKeyVault = az keyvault create --location $location --name $name --resource-group $resourceGroup
        $createKeyVault
    }
    catch {
        Write-Warning 'An error has occurred. Please ensure the vault created properly...'
        $PSCmdlet.ThrowTerminatingError($_)
    }

    try {
        $subscriptionID = az account show --subscription $subscriptionName | ConvertFrom-Json | select -ExpandProperty id
        az keyvault set-policy --name $name --object-id $subscriptionID --secret-permissions get list
    }
    catch {
        Write-Warning "KeyVault permissions for $name were not set..."
        $PSCmdlet.ThrowTerminatingError($_)
    }

    if ($PSCmdlet.ShouldProcess('name')) {
        try {
            $createKeyVault.Id
        }
        catch {
            Write-Warning 'KeyVault vault does not exist...'
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }
}