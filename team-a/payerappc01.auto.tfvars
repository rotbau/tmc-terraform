######
### Set additional cluster configuration in clusterlist.tf file
######

// TMC Cluster Group Configuration

cluster_group = "team-a"
cluster_group_description = "team-a application cluster group"
cluster_group_labels = {
    app = "teama"
    type = "app"
}
git_repo_name = "flux-addons-repo"
git_repo_namespace = "tanzu-continuousdelivery-resources"
git_url = "https://github.com/rotbau/tmc-terraform.git"
git_secret_ref = ""
git_sync_interval = "5m"
git_branch = "main"
kustomization_name = "cluster-addons"
kustomization_namespace = "tanzu-continuousdelivery-resources"
kustomization_start_path = "/addons/base/start/"
kustomization_prune = "true"
kustomization_sync_interval = "5m0s"

// Supervisor Configuration

management_cluster_name = "h2o-4-24734"       // Management cluster name from TMC
provisioner_name = "teama-ns"                              // vSphere Namespace to provison cluster in


// Global Cluster Configuration

pod_cidr_blocks = "100.96.0.0/11"                      // Subnet to use for Pods per cluster
service_cidr_blocks = "100.64.0.0/13"                   // Subnet to use for service per cluster
cluster_ntp = "time1.oc.vmware.com,time2.oc.vmware.com"
cluster_storageclass = "vc01cl01-t0compute"
cluster_storageclasses = "vc01cl01-t0compute"
cluster_trusted_ca1 = ""

// Control Plane Configuration

control_plane_os_name = "ubuntu"
control_plane_os_version = "22.04"
control_plane_os_arch = "amd64"

// Worker Node Pool 1 Configuration

nodepool1_name = "md-0"
nodepool1_description = "np1"
nodepool1_worker_class = "node-pool"
nodepool1_os_name = "ubuntu"
nodepool1_os_version = "22.04"
nodepool1_os_arch = "amd64"
nodepool1_label1_key = "sample-worker-label"
nodepool1_label1_value = "value"
nodepool1_storageclass = "vc01cl01-t0compute"

// Backup Job Configuration

backup_job_name = ""
backup_scope = "FULL_CLUSTER"
storage_location = "bauerbo-azure-blob"
excluded_namespaces = ["kube-system","vmware-system-tmc","default"]
