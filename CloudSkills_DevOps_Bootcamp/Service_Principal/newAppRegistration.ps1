function newAppRegsitration {
    
    param(
        [string]$name = "cloudskills",
        [string]$keyvaultName = "sp-keyvault-cloudskills"
    )
    
    # Create App Registration
    az ad app create --display-name $name
    
    # Retrieve the Client ID for KeyVault
    $clientID = az ad app list --display-name $name --query "[].{SyncRoot:appId}" | ConvertFrom-Json | Select -ExpandProperty SyncRoot
    
    $clientSecret = az ad app credential reset --id $clientID.SyncRoot | ConvertFrom-Json | select -ExpandProperty password
    $clientSecret
    
    az keyvault secret set --vault-name $keyvaultName --name "AKSClientID" --value $clientID.SyncRoot
    az keyvault secret set --vault-name $keyvaultName --name "AKSClientSecret" --value $clientSecret
    }