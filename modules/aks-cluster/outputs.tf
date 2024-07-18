output "aks_cluster_name" {
  value = tanzu-mission-control_akscluster.instances[0].attributes.spec[0].agent_name
}

output "kubeConfig" {
  value = tanzu-mission-control_akscluster.AKS_cluster.kubeconfig
}