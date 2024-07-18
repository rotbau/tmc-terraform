terraform {
  required_providers {
    tanzu-mission-control = {
      source = "vmware/tanzu-mission-control"
      version = "1.4.4"
    }
  }
}

resource "tanzu-mission-control_backup_schedule" "clustergroup-scoped-full" {
  name = "clustergroup-full-daily"
  scope {
    cluster_group {
      cluster_group_name = var.cluster_group
    }
  }
  selector {
   label_selector {
    match_expression {
      key = backup
      operator = in
      values = true
    }
   }
  }

  backup_scope = "FULL_CLUSTER"
  spec {
    schedule {
      rate = "0 23 * * 1,2,3,4,5"
    }

    template {
      backup_ttl = "2592000s"
      excluded_namespaces = var.excluded_namespaces
      excluded_resources = var.excluded_resources

      storage_location = var.storage_location
    }
  }
}