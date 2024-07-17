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