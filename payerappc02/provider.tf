// TMC terraform provider initialization

terraform {
  required_providers {
    tanzu-mission-control = {
      source = "vmware/tanzu-mission-control"
      version = "1.4.4"
    }
  }
}

// TMC Org configuration

provider "tanzu-mission-control" {
  endpoint            = "emergingsolutionstanzuse.tmc.cloud.vmware.com/" // Required, TMC Org URL
  vmw_cloud_api_token = var.vmw_cloud_api_token   // Required, API Token
}

//variable "SESSION_NAMESPACE" {}