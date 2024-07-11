module "tkgs_cluster" {
  source = "../modules/tkgs-cluster"
  providers = {
    tanzu-mission-control = tanzu-mission-control
  }
  vmw_cloud_api_token = []
  vmw_tmc_endpoint = []
  management_cluster_name = var.management_cluster_name
  provisioner_name = var.provisioner_name
  cluster_name = var.cluster_name
  cluster_group = var.cluster_group
  pod_cidr_blocks = var.pod_cidr_blocks
  service_cidr_blocks = var.service_cidr_blocks
  tkr_version = var.tkr_version
  cluster_ntp = var.cluster_ntp
  cluster_storageclass = var.cluster_storageclass
  cluster_storageclasses = var.cluster_storageclasses
  cluster_vm_class = var.cluster_vm_class
  cluster_trusted_ca1 = var.cluster_trusted_ca1
  control_plane_replicas = var.control_plane_replicas
  control_plane_os_name = var.control_plane_os_name
  control_plane_os_version = var.control_plane_os_version
  control_plane_os_arch = var.control_plane_os_arch
  nodepool1_name = var.nodepool1_name
  nodepool1_description = var.nodepool1_description
  nodepool1_worker_replicas = var.nodepool1_worker_replicas
  nodepool1_worker_class = var.nodepool1_worker_class
  nodepool1_os_name = var.nodepool1_os_name
  nodepool1_os_version = var.nodepool1_os_arch
  nodepool1_os_arch = var.nodepool1_os_arch
  nodepool1_label1_key = var.nodepool1_label1_key
  nodepool1_label1_value = var.nodepool1_label1_value
  nodepool1_storageclass = var.nodepool1_storageclass
  nodepool1_vm_class = var.nodepool1_vm_class
}

module "tmc_backup_schedule" {
  source = "../modules/tmc-backup"

  vmw_cloud_api_token = []
  vmw_tmc_endpoint = []
  backup_job_name = var.backup_job_name
  backup_scope = var.backup_scope
  storage_location = var.storage_location
  excluded_namespaces = var.excluded_namespaces
}