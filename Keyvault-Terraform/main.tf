provider "azurerm" {
  version = "<=2.36.0"

  features {}
}

resource "azurerm_key_vault" "cloudskills-keyvault" {
  name                = "cloudskills-keyvault92"
  resource_group_name = var.resourceGroupName
  location            = var.location
  sku_name            = "standard"
  tenant_id           = var.tenantID

  access_policy {
    tenant_id = var.tenantID
    object_id = var.objectID

    key_permissions = [
      "get",
      "list",
      "create",
    ]

    secret_permissions = [
      "get",
      "list",
      "set",
    ]
  }
}

resource "azurerm_key_vault_secret" "cloudskills-clientid" {
  name         = "cloudskillssupersecret"
  value        = var.supersecret
  key_vault_id = azurerm_key_vault.cloudskills-keyvault.id
}