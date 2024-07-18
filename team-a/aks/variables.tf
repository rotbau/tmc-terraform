variable "vmw_cloud_api_token" {
  description = "api token for auth"
  type        = string
}

variable "vmw_tmc_endpoint" {
  description = "tmc url"
  type        = string
}

variable "credential_name" {
  description = "tmc aks credential name"
  type        = string
}

variable "azure_subscription_id" {
  description = "azure subscription id"
  type        = string
}

variable "cluster_group" {
  description = "TMC clustergroup to add cluster to"
  type        = string
}

variable "labels" {
  description = "labels for clusters"
  type        = list(string)
  
}

#variable "resource_group" {
#  description = "azure resource group for cluster"
#  type        = string
#}

#variable "aks_clustername" {
#  description = "aks cluster name"
#  type        = string
#}

#variable "location" {
#  description = "cluster location"
#  type        = string
#}

#variable "k8s_version" {
#  description = "k8s version"
#  type        = string
#}

#variable "node_count" {
#  description = "node count"
#  type        = number
#}

#variable "vm_size" {
#  description = "az vm size"
#  type        = string
#}

// TMC Backup Schedule Variables

variable "backup_job_name" {
  description = "Name for Job"
  type        = string
}

variable "backup_scope" {
  description = "Cluster level"
  type        = string
}

variable "storage_location" {
  description = "Storage Target in TMC for Backups"
  type        = string
}

variable "excluded_namespaces" {
  description = "Namespace to skip on backup"
  type        = list(string)
}

variable "management_cluster_name" {
  description = "TKG management cluster name in TMC (cloud is aks or eks)"
  type        = string
}

variable "provisioner_name" {
  description = "vSphere Namespace to provison cluster to(cloud is aks or eks)"
  type        = string
}