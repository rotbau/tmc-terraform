module "clustergroup" {
  source = "../../modules/clustergroup"

  vmw_cloud_api_token = var.vmw_cloud_api_token
  vmw_tmc_endpoint = var.vmw_tmc_endpoint
  cluster_group = var.cluster_group
  cluster_group_description = var.cluster_group_description
  cluster_group_labels = var.cluster_group_labels
  git_repo_name = var.git_repo_name
  git_repo_namespace = var.git_repo_namespace
  git_url = var.git_url
  git_secret_ref = var.git_secret_ref
  git_sync_interval = var.git_sync_interval
  git_branch = var.git_branch
  kustomization_name = var.kustomization_name
  kustomization_namespace = var.kustomization_namespace
  kustomization_start_path = var.kustomization_start_path
  kustomization_prune = var.kustomization_prune
  kustomization_sync_interval = var.kustomization_sync_interval
}