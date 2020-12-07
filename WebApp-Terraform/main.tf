provider "azurerm" {
  version = "2.28.0"
  features {}
}

resource "azurerm_app_service_plan" "cloudskillswebapp-plan" {
    name = "cloudskillswebapp-plan"
    location = var.location
    resource_group_name = var.RG

    sku {
        tier = "Standard"
        size = "S1"
    }
}

resource "azurerm_app_service" "cloudskillswebapp" {
    name = var.name
    location = var.location
    resource_group_name = var.RG
    app_service_plan_id = azurerm_app_service_plan.cloudskillswebapp-plan.id
}