//Cluster List to Build

variable "clusterlist" {
  description = "List of clusters to create"
  type = map(any)

  default = {
    dev-cluster = {
      name_prefix = "teama-aks-dev"
      location = "westus2"
      resource_group = "bauerbo"
      k8s_version = "1.28.9"
      node_count = 1
      vm_size = "Standard_DS3_v2"
      backup_enabled  = "false"
      cluster_type    = "aks"
      owner           = "teama"
    }
    stage-cluster = {
      name_prefix = "teama-aks-stage"
      location = "southcentralus"
      resource_group = "bauerbo"      
      k8s_version = "1.28.9"
      node_count = 1
      vm_size = "Standard_DS3_v2"
      backup_enabled  = "true"
      cluster_type    = "aks"
      owner           = "teama" 
    }
    prod-cluster = {
      name_prefix = "teama-aks-prod"
      location = "eastus2"
      resource_group = "bauerbo"      
      k8s_version = "1.28.9"
      node_count = 1
      vm_size = "Standard_DS3_v2"
      backup_enabled  = "true"
      cluster_type    = "aks"
      owner           = "teama"
    }
  }
}