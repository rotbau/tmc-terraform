// Global Variables

variable "vmw_cloud_api_token" {
  description = "api token for auth"
  type        = string
}

variable "vmw_tmc_endpoint" {
  description = "tmc url"
  type        = string
}

// TMC Backup Schedule

variable "cluster_group" {
  description = "Name of TMC clustergroup"
  type        = string
}
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

variable "excluded_resources" {
  description = "resources to skip on backup"
  type        = list(string)
}