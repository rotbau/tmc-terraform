// TMC terraform provider initialization

terraform {
  required_providers {
    tanzu-mission-control = {
      source = "vmware/tanzu-mission-control"
      version = "1.4.4"
    }
  }
}

//variable "SESSION_NAMESPACE" {}

resource "tanzu-mission-control_akscluster" "AKS_cluster" {
  credential_name = var.credential_name
  subscription_id = var.azure_subscription_id
  resource_group  = var.resource_group
  name            = var.aks_clustername
  meta {
    description = "aks test cluster"
    labels      = { "key1" : "value1" }
  }
  wait_for_kubeconfig = true
  spec {
    cluster_group = var.cluster_group
    config {
      location = var.location
      kubernetes_version = var.k8s_version
      network_config {
        dns_prefix = var.aks_clustername
      }
      storage_config {
        enable_disk_csi_driver = true
        enable_file_csi_driver = false
      }
    }
    nodepool {
      name = "systemnp"
      spec {
        count   = var.node_count
        mode    = "SYSTEM"
        vm_size = var.vm_size
      }
    }
  }
}

