// TMC terraform provider initialization

terraform {
  required_providers {
    tanzu-mission-control = {
      source = "vmware/tanzu-mission-control"
      version = "1.4.4"
      alias = "vmware_tmc"
    }
  }
}

// TMC Org configuration

provider "tanzu-mission-control" {
  endpoint            = var.vmw_tmc_endpoint // Required, TMC Org URL
  vmw_cloud_api_token = var.vmw_cloud_api_token   // Required, API Token
}

module "tkgs_cluster" {
  source = "../modules/tkgs-cluster" 
  providers = {
    tanzu-mission-control = tanzu-mission-control.vmware_tmc
  }
}

module "tmc_backup_schedule" {
  source = "../modules/tmc-backup"
  providers = {
    tanzu-mission-control = tanzu-mission-control.vmware_tmc
  }
}