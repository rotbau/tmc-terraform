terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}
resource "tanzu-mission-control_akscluster" "demo_AKS_cluster" {
  credential_name = var.credential_name
  subscription_id = var.azure_subscription_id
  resource_group  = var.resource_group
  name            = var.aks_clustername
  meta {
    description = "aks test cluster"
    labels      = { "key1" : "value1" }
  }
  spec {
    config {
      location           = var.location
      kubernetes_version = var.k8s_version
      network_config {
        dns_prefix = "dns-tf-test"
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