az aks create --resource-group your_resource_group_name `
              --name cloudskillsaks92 `
              --node-count 2 `
              --enable-addons monitoring `
              --generate-ssh-keys `
              --zones {1, 2, 3} `
              --kubernetes-version 1.19.3