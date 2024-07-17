resource "random_integer" "ri" {
#  for_each = var.clusterlist
  min = 1000
  max = 9999
}

module "aks_cluster" {
  for_each = var.clusterlist
  source = "../../modules/aks-cluster"

vmw_cloud_api_token = var.vmw_cloud_api_token
vmw_tmc_endpoint = var.vmw_tmc_endpoint
credential_name = var.credential_name
azure_subscription_id = var.azure_subscription_id
resource_group = each.value.resource_group
aks_clustername = "${each.value.name_prefix}-${random_integer.ri.result}"
location = each.value.location
k8s_version = each.value.k8s_version
node_count = each.value.node_count
vm_size = each.value.vm_size
}