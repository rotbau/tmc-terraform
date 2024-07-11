management_cluster_name = "h2o-4-24734"       // Management cluster name from TMC
provisioner_name = "payer-ns"                              // vSphere Namespace to provison cluster in

// Global Cluster Configuration

cluster_name = "payerappc03-tf"                              // TKG workload cluster name
cluster_group = "payer-apps"                          // TMC Cluster Group to place cluster
pod_cidr_blocks = "100.96.0.0/11"                      // Subnet to use for Pods per cluster
service_cidr_blocks = "100.64.0.0/13"                   // Subnet to use for service per cluster
tkr_version = "v1.28.8+vmware.1-fips.1-tkg.2"           // Version of Tanzu Kubernetes for cluster
cluster_ntp = "time1.oc.vmware.com,time2.oc.vmware.com"
cluster_storageclass = "vc01cl01-t0compute"
cluster_storageclasses = "vc01cl01-t0compute"
cluster_vm_class = "best-effort-small"
cluster_trusted_ca1 = ""

// Control Plane Configuration

control_plane_replicas = "1"
control_plane_os_name = "ubuntu"
control_plane_os_version = "22.04"
control_plane_os_arch = "amd64"

// Worker Node Pool 1 Configuration

nodepool1_name = "md-0"
nodepool1_description = "np1"
nodepool1_worker_replicas = "3"
nodepool1_worker_class = "node-pool"
nodepool1_os_name = "ubuntu"
nodepool1_os_version = "22.04"
nodepool1_os_arch = "amd64"
nodepool1_label1_key = "sample-worker-label"
nodepool1_label1_value = "value"
nodepool1_storageclass = "vc01cl01-t0compute"
nodepool1_vm_class = "best-effort-medium"

// Backup Job Configuration

backup_job_name = "payerappc03-daily"
backup_scope = "FULL_CLUSTER"
storage_location = "bauerbo-azure-blob"
excluded_namespaces = ["kube-system","vmware-system-tmc","default"]