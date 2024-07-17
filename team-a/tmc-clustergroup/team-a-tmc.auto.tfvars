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

// Backup Job Configuration

backup_job_name = ""
backup_scope = "FULL_CLUSTER"
storage_location = "bauerbo-azure-blob"
excluded_namespaces = ["kube-system","vmware-system-tmc","default"]
