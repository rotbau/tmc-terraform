cluster_group = "team-a"

// Backup Job Configuration

backup_job_name = ""
backup_scope = "FULL_CLUSTER"
storage_location = "bauerbo-azure-blob"
excluded_namespaces = ["kube-system","vmware-system-tmc","default"]