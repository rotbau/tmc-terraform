module "aks_cluster" {
  source = "../modules/aks-cluster"

vmw_cloud_api_token = var.vmw_cloud_api_token
vmw_tmc_endpoint = var.vmw_tmc_endpoint
credential_name = ""
azure_subscription_id = ""
resource_group =   ""
aks_clustername = ""
location = ""
k8s_version = "" 
node_count = ""
vm_size = ""
}