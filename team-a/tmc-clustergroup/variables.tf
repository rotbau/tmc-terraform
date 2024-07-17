// CSP Configuration

variable "vmw_cloud_api_token" {
  description = "api token for auth"
  type        = string
}

variable "vmw_tmc_endpoint" {
  description = "tmc url"
  type        = string
}

// Clustergroup to create

variable "cluster_group" {
  description = "clustergroup to enable data protection"
  type        = string
}

variable "cluster_group_description" {
  description = "clustergroup description"
  type        = string
}

variable "cluster_group_labels" {
  description = "clustergroup description"
  type        = map(string)
}

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

// Git Repo Variables

variable "git_repo_name" {
  description = "Name for CICD Gitrepo"
  type        = string
}

variable "git_repo_namespace" {
  description = "Namespace for git repo"
  type        = string
}

variable "git_url" {
  description = "Git URL"
  type        = string
}

variable "git_secret_ref" {
  description = "Registry Secret"
  type        = string
}

variable "git_sync_interval" {
  description = "Sync internval for repo"
  type        = string
}

variable "git_branch" {
  description = "Git Branch Name"
  type        = string
  default = "main"
}

// Kustomization Variables

variable "kustomization_name" {
  description = "kustomization name"
  type        = string
}

variable "kustomization_namespace" {
  description = "namespace for kustomization object"
  type        = string
}

variable "kustomization_start_path" {
  description = "start kustomization file"
  type        = string
}

variable "kustomization_prune" {
  description = "true or false"
  type        = string 
}

variable "kustomization_sync_interval" {
  description = "sync time for kustomization changes"
  type        = string
}
