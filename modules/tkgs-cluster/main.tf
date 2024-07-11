data "tanzu-mission-control_cluster_class" "tkc-cc" {
  name                    = var.cluster_name
  management_cluster_name = var.management_cluster_name
  provisioner_name        = var.provisioner_name
}

locals {
  tkgs_cluster_variables = {
    "controlPlaneCertificateRotation" : {
      "activate" : true,
      "daysBefore" : 30
    },
    "defaultStorageClass" : var.cluster_storageclasses,
    "defaultVolumeSnapshotClass" : "",
    "nodePoolLabels" : [

    ],
//    "nodePoolVolumes" : [
//      {
//        "capacity" : {
//          "storage" : "20G"
//        },
//        "mountPath" : "/var/lib/containerd",
//        "name" : "containerd",
//       "storageClass" : var.cluster_storageclasses
//      },
//      {
//        "capacity" : {
//          "storage" : "20G"
//        },
//        "mountPath" : "/var/lib/kubelet",
//        "name" : "kubelet",
//        "storageClass" : var.cluster_storageclasses
//      }
//    ],
    "ntp" : var.cluster_ntp
    "storageClass" : var.cluster_storageclasses,
    "storageClasses" : [
      "${var.cluster_storageclasses}"
    ],
    "vmClass" : var.cluster_vm_class
    "trust" : {
         "additionalTrustedCAs" : [
              {
                  "name" : var.cluster_trusted_ca1
              },
          ]
       }
  }

  tkgs_nodepool1_overrides = {
    "storageClass" : var.nodepool1_storageclass,
    "vmClass" : var.nodepool1_vm_class
  }
}

resource "tanzu-mission-control_tanzu_kubernetes_cluster" "tkgs_cluster" {
  name                    = var.cluster_name
  management_cluster_name = var.management_cluster_name
  provisioner_name        = var.provisioner_name

  spec {
    cluster_group_name = var.cluster_group

    topology {
      version           = var.tkr_version
      cluster_class     = "tanzukubernetescluster"
      cluster_variables = jsonencode(local.tkgs_cluster_variables)

      control_plane {
        replicas = var.control_plane_replicas

        os_image {
            name    = var.control_plane_os_name
            version = var.control_plane_os_version
            arch    = var.control_plane_os_arch
        }
      }

      nodepool {
        name        = var.nodepool1_name
        description = var.nodepool1_description

        spec {
          worker_class = var.nodepool1_worker_class
          replicas     = var.nodepool1_worker_replicas
          overrides    = jsonencode(local.tkgs_nodepool1_overrides)

          os_image {
            name    = var.nodepool1_os_name
            version = var.nodepool1_os_version
            arch    = var.nodepool1_os_arch
          }
        }
      }

      network {
        pod_cidr_blocks = [
          var.pod_cidr_blocks,
        ]
        service_cidr_blocks = [
          var.service_cidr_blocks,
        ]
        service_domain = "cluster.local"
      }
    }
  }

  timeout_policy {
    timeout             = 60
    wait_for_kubeconfig = true
    fail_on_timeout     = true
  }    
}