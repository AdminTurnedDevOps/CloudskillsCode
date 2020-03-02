variable "Name" {
    type = string
    description = "Name of AKS cluster"
}

variable "resourceGroup" {
    type = string
    description = "Resource Group name"
}

variable "storageAccountName" {
    type = string
    description = "Storage Account name"
}

variable "containerName" {
    type = string
    description = "Container name"
}