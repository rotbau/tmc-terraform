//Cluster List to Build

variable "clusterlist" {
  description = "List of clusters to create"
  type = map(any)

  default = {
    dev-cluster = {
      name_prefix = "teama-dev"
      tkr_version = "v1.28.8+vmware.1-fips.1-tkg.2"
      cp_replicas = 1
      cp_vm_class = "best-effort-small"      
      np1_replicas = 2
      np1_vm_class = "best-effort-medium"
    }
    stage-cluster = {
      name_prefix = "teama-stage"
      tkr_version = "v1.28.8+vmware.1-fips.1-tkg.2"
      cp_replicas = 1
      cp_vm_class = "best-effort-small"      
      np1_replicas = 2
      np1_vm_class = "best-effort-medium"
    }
    prod-cluster = {
      name_prefix = "teama-prod"
      tkr_version = "v1.28.8+vmware.1-fips.1-tkg.2"
      cp_replicas = 1
      cp_vm_class = "best-effort-small"      
      np1_replicas = 2
      np1_vm_class = "best-effort-medium"
    }
  }
}