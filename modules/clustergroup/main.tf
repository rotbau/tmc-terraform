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
  endpoint            = var.vmw_tmc_endpoint // Required, TMC Org URL
  vmw_cloud_api_token = var.vmw_cloud_api_token   // Required, API Token
}

//variable "SESSION_NAMESPACE" {}

# Create Tanzu Mission Control cluster group
resource "tanzu-mission-control_cluster_group" "create_cluster_group" {
  name = var.cluster_group
  meta {
    description = "Create cluster group through terraform"
    labels = var.cluster_group_labels
  }
  lifecycle {
    ignore_changes = all
  }
}

# Create Tanzu Mission Control cluster group scope helm feature with attached set as default value.
resource "tanzu-mission-control_helm_feature" "create_cg_helm_feature" {
  depends_on = [ tanzu-mission-control_enable_data_protection.clustergroup ]
  lifecycle {
    ignore_changes = all
  }
  scope {
    cluster_group {
      name = var.cluster_group
    }
  }
  meta {
    description = "Helm enabled by Terraform"
    labels      = { "helm" : "enabled" }
  }
}

# Enable Data Protection on Clustergroup
resource "tanzu-mission-control_enable_data_protection" "clustergroup" {
  depends_on = [ tanzu-mission-control_cluster_group.create_cluster_group ]
  scope {
    cluster_group {
      cluster_group_name            = var.cluster_group
    }
  }

  spec {
    disable_restic                       = false
    enable_csi_snapshots                 = false
    enable_all_api_group_versions_backup = false

    selector {
        labelselector {
            matchexpressions {
                key      = ""
                operator = ""
                values   = []
            }
        }
    }
  }

  deletion_policy {
    delete_backups = false
    force = true
  }
}

# Create Tanzu Mission Control git repository with attached set as default value.

resource "tanzu-mission-control_git_repository" "create_cluster_group_git_repository" {
  depends_on = [ tanzu-mission-control_cluster_group.create_cluster_group ]
  name = var.git_repo_name # Required

  namespace_name = var.git_repo_namespace #Required

  scope {
    cluster_group {
      name = var.cluster_group # Required
    }
  }

  meta {
    description = "Git repository for cluster addons"
    labels      = { "type" : "addons" }
  }

  spec {
    url                = var.git_url # Required
    secret_ref         = var.git_secret_ref
    interval           = var.git_sync_interval    # Default: 5m
    git_implementation = "GO_GIT" # Default: GO_GIT
    ref {
      branch = var.git_branch
#      tag    = "testTag"
#      semver = "testSemver"
#      commit = "testCommit"
    }
  }
}

# Create Tanzu Mission Control kustomization with attached set as default value.
resource "tanzu-mission-control_kustomization" "create_cluster_group_kustomization" {
  depends_on = [tanzu-mission-control_git_repository.create_cluster_group_git_repository]
  name = var.kustomization_name # Required

  namespace_name = var.kustomization_namespace #Required

  scope {
    cluster_group {
      name = var.cluster_group # Required
    }
  }

  meta {
    description = "Cluster-addons-kustomization"
    labels      = { "type" : "addon" }
  }

  spec {
    path             = var.kustomization_start_path # Required
    prune            = var.kustomization_prune
    interval         = var.kustomization_sync_interval # Default: 5m
    target_namespace = var.kustomization_namespace
    source {
      name      = var.git_repo_name      # Required
      namespace = var.git_repo_namespace # Required
    }
  }
}