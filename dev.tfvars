management_cluster_name = "h2o-humana"       // Management cluster name from TMC
provisioner_name = "app02-ns"                              // vSphere Namespace to provison cluster in

// Global Cluster Configuration

cluster_name = "tkgc0giri"                              // TKG workload cluster name
cluster_group = "humana-default"                          // TMC Cluster Group to place cluster
pod_cidr_blocks = "100.96.0.0/11"                      // Subnet to use for Pods per cluster
service_cidr_blocks = "100.64.0.0/13"                   // Subnet to use for service per cluster
tkr_version = "v1.26.5+vmware.2-fips.1-tkg.1"           // Version of Tanzu Kubernetes for cluster
cluster_ntp = "time1.oc.vmware.com, time2.oc.vmware.com"
cluster_storageclass = "vc01cl01-t0compute"
cluster_storageclasses = "vc01cl01-t0compute"
cluster_vm_class = "best-effort-small"
cluster_trusted_ca1 = "harbor-ca"

// Control Plane Configuration

control_plane_replicas = "1"
control_plane_os_name = "ubuntu"
control_plane_os_version = "20.04"
control_plane_os_arch = "amd64"

// Worker Node Pool 1 Configuration

nodepool1_name = "md-0"
nodepool1_description = "np1"
nodepool1_worker_replicas = "2"
nodepool1_worker_class = "node-pool"
nodepool1_os_name = "ubuntu"
nodepool1_os_version = "20.04"
nodepool1_os_arch = "amd64"
nodepool1_label1_key = "sample-worker-label"
nodepool1_label1_value = "value"
nodepool1_storageclass = "vc01cl01-t0compute"
nodepool1_vm_class = "best-effort-medium"