output "aks_cluster_name" {
  value = tanzu-mission-control_akscluster.AKS_cluster.instances[0].spec.agent_name
}

output "kubeConfig" {
  value = tanzu-mission-control_akscluster.AKS_cluster.kubeconfig
}