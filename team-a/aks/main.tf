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
cluster_group = var.cluster_group
}

resource "time_sleep" "wait_5_mins" {
  depends_on = [module.aks_cluster ]
  create_duration = "5m"
}

module "tmc_backup_schedule" {
  for_each = var.clusterlist
  depends_on = [time_sleep.wait_5_mins]
  source = "../../modules/tmc-backup"

  vmw_cloud_api_token = var.vmw_cloud_api_token
  vmw_tmc_endpoint = var.vmw_tmc_endpoint
  management_cluster_name = var.management_cluster_name
  provisioner_name = var.provisioner_name
  cluster_name = module.aks_cluster[each.value].AKS_cluster_name
  backup_job_name = var.backup_job_name
  backup_scope = var.backup_scope
  storage_location = var.storage_location
  excluded_namespaces = var.excluded_namespaces
}