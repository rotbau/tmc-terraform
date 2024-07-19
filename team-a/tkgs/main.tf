resource "random_integer" "ri" {
#  for_each = var.clusterlist
  min = 1000
  max = 9999
}

module "tkgs_cluster" {
  for_each = var.clusterlist
  source = "../../modules/tkgs-cluster"
  
  vmw_cloud_api_token = var.vmw_cloud_api_token
  vmw_tmc_endpoint = var.vmw_tmc_endpoint
  management_cluster_name = var.management_cluster_name
  provisioner_name = var.provisioner_name
  cluster_name = "${each.value.name_prefix}-${random_integer.ri.result}"
  cluster_group = var.cluster_group
  pod_cidr_blocks = var.pod_cidr_blocks
  service_cidr_blocks = var.service_cidr_blocks
  tkr_version = each.value.tkr_version
  cluster_ntp = var.cluster_ntp
  cluster_storageclass = var.cluster_storageclass
  cluster_storageclasses = var.cluster_storageclasses
  cluster_vm_class = each.value.cp_vm_class
  cluster_trusted_ca1 = var.cluster_trusted_ca1
  control_plane_replicas = each.value.cp_replicas
  control_plane_os_name = var.control_plane_os_name
  control_plane_os_version = var.control_plane_os_version
  control_plane_os_arch = var.control_plane_os_arch
  nodepool1_name = var.nodepool1_name
  nodepool1_description = var.nodepool1_description
  nodepool1_worker_replicas = each.value.np1_replicas
  nodepool1_worker_class = var.nodepool1_worker_class
  nodepool1_os_name = var.nodepool1_os_name
  nodepool1_os_version = var.nodepool1_os_version
  nodepool1_os_arch = var.nodepool1_os_arch
  nodepool1_label1_key = var.nodepool1_label1_key
  nodepool1_label1_value = var.nodepool1_label1_value
  nodepool1_storageclass = var.nodepool1_storageclass
  nodepool1_vm_class = each.value.np1_vm_class
  labels = merge (var.labels, {
    "type" = "${each.value.cluster_type}",
    "backup" = "${each.value.backup_enabled}",
    "owner" = "${each.value.owner}"
    })
}

#####
# Below code is for cluster based back up.  
# Uncomment time_sleep, module tmc_backup_scheldule
# Set backup label to false in clusterlist.tf to exclude cluster from clustergroup based backups
#####

#resource "time_sleep" "wait_5_mins" {
#  depends_on = [ module.tkgs_cluster ]
#  create_duration = "5m"
#}

#module "tmc_backup_schedule" {
#  for_each = var.clusterlist
#  depends_on = [time_sleep.wait_5_mins]
#  source = "../../modules/tmc-cl-backup-schedule"

#  vmw_cloud_api_token = var.vmw_cloud_api_token
#  vmw_tmc_endpoint = var.vmw_tmc_endpoint
#  management_cluster_name = var.management_cluster_name
#  provisioner_name = var.provisioner_name
#  cluster_name = module.tkgs_cluster[each.key].tkg_cluster_name
#  backup_job_name = var.backup_job_name
#  backup_scope = var.backup_scope
#  storage_location = var.storage_location
#  excluded_namespaces = var.excluded_namespaces
#}

