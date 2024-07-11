//Global
cluster_group = "payer-apps"
cluster_group_description = "payer application cluster group"
cluster_group_labels = {
    app = "payer"
    type = "app"
}
git_repo_name = "flux-addons-repo"
git_repo_namespace = "tanzu-continuousdelivery-resources"
git_url = "https://github.com/rotbau/hcp-tmctf.git"
git_secret_ref = ""
git_sync_interval = "5m"
git_branch = "main"
kustomization_name = "cluster-addons"
kustomization_namespace = "tanzu-continuousdelivery-resources"
kustomization_start_path = "/addons/base/start/"
kustomization_prune = "true"
kustomization_sync_interval = "5m0s"