module "aks_cluster" {
  source = "../modules/aks-cluster"

vmw_cloud_api_token = var.vmw_cloud_api_token
vmw_tmc_endpoint = var.vmw_tmc_endpoint
credential_name = var.credential_name
azure_subscription_id = var.azure_subscription_id
resource_group =   var.resource_group
aks_clustername = var.aks_clustername
location = var.location
k8s_version = var.k8s_version
node_count = var.node_count
vm_size = var.vm_size
}