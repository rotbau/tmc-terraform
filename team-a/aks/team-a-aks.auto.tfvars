cluster_group = "team-a"

// Backup Job Configuration
management_cluster_name = "aks"       // Management cluster name from TMC (value for cloud is aks or eks)
provisioner_name = "aks"                 // vSphere Namespace to provison cluster in (value for cloud is aks or eks)
backup_job_name = ""
backup_scope = "FULL_CLUSTER"
storage_location = "bauerbo-azure-blob"
excluded_namespaces = ["kube-system","vmware-system-tmc","default"]