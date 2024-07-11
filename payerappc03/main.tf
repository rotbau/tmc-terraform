module "tkgs_cluster" {
  source = "../modules/tkgs-cluster" 
  providers = {
    tanzu-mission-control = vmware/tanzu-mission-control
  }
}

module "tmc_backup_schedule" {
  source = "../modules/tmc-backup"
  providers = {
    tanzu-mission-control = vmware/tanzu-mission-control
  }
}