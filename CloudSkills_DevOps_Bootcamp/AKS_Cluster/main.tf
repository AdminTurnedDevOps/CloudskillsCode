provider azurerm {
  version = "2.0.0"
  features {}
}

module "env" {
  source = "./TFSTATE_Storage_Account"
}

resource "azurerm_kubernetes_cluster" "CloudSkillsAKS" {
  name                = "cloudskillsaks"
  location            = "${module.env.location}"
  resource_group_name = "${module.env.resourceGroup}"
  dns_prefix          = concat([azurerm_kubernetes_cluster.CloudSkillsAKS.name, "-prefix"])

  default_node_pool {
    
  }
}
