// Tanzu Mission Control Cluster Type: Tanzu Kubernetes Grid Service workload.
// Operations supported : Read, Create, Update & Delete (except nodepools)

# Create Tanzu Mission Control Tanzu Kubernetes Grid Service workload cluster entry
resource "tanzu-mission-control_cluster" "create_tkgs_workload" {
  management_cluster_name = var.management_cluster_name
  provisioner_name        = var.provisioner_name
  name                    = var.cluster_name

  meta {
    labels = { "key" : "test" }
  }

  spec {
    cluster_group = var.cluster_group // Default: default
    tkg_service_vsphere {
      settings {
        network {
          pods {
            cidr_blocks = [
              var.pods_cidr_blocks, // Required
            ]
          }
          services {
            cidr_blocks = [
              var.services_cidr_blocks, // Required
            ]
          }
        }
        storage {
          classes = [
            "${var.storage_classes}",
          ]
          default_class = "${var.default_storage_class}"
        }
      }

      distribution {
        version = "${var.tkr_version}" // Required
      }

      topology {
        control_plane {
          class             = "${var.control_plane_vm_class}"         // Required
          storage_class     = "${var.control_plane_storage_class}" // Required
          high_availability = "${var.control_plane_ha}"             // Default: false
//          volumes {
//            capacity          = volume-capacity
//            mount_path        = "<mount-path>"
//            name              = "<volume-name>"
//            pvc_storage_class = "<storage-class>"
//          }
        }
        node_pools {
          spec {
            worker_node_count = "${var.np1_worker_count}" // Required
            cloud_label = {
              "${var.np1_cloud_label_key}" : "${var.np1_cloud_label_value}"
            }
            node_label = {
              "${var.np1_node_label_key}" : "${var.np1_node_label_value}"
            }
            tkg_service_vsphere {
              class          = "${var.np1_worker_vm_class}"         // Required
              storage_class  = "${var.np1_worker_storage_class}"    // Required
              failure_domain = "${var.np1_worker_failure_domain}"
//             volumes {
//               capacity          = volume-capacity
//               mount_path        = "<mount-path>"
//               name              = "<volume-name>"
//                pvc_storage_class = "<storage-class>"
//             }
            }
          }
          info {
            name = "${var.np1_name}" // Required
          }
        }
      }
    }
  }
}