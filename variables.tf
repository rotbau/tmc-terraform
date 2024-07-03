variable "management_cluster_name" {
  description = "TKG management cluster name in TMC"
  type        = string
}

variable "provisioner_name" {
  description = "vSphere Namespace to provison cluster to"
  type        = string
}

variable "cluster_name" {
  description = "Name of TKG cluster"
  type        = string
}

variable "cluster_group" {
  description = "TMC cluster group name"
  type        = string
}

variable "pod_cidr_blocks" {
  description = "TKS cluster pod cidr"
  type        = string
}

variable "service_cidr_blocks" {
  description = "TKS cluster services cidr"
  type        = string
}

variable "tkr_version" {
  description = "TKR cluster version"
  type        = string
}

variable "cluster_ntp" {
  description = "override default NTP per cluster"
  type        = string
}

variable "cluster_trusted_ca1" {
  description = "name of data value for trusted ca - precreated in vsphere namespace"
  type        = string
}

variable "cluster_storageclass" {
  description = "override storageclass per cluster"
  type        = string
}

variable "cluster_storageclasses" {
  description = "override available storageclasses per cluster"
  type        = string
}

variable "cluster_vm_class" {
  description = "VM size for cluster VM - nodepool can override below"
  type        = string
}

variable "control_plane_replicas" {
  description = "1 or 3"
  type        = number
}

variable "control_plane_os_name" {
  description = "ubuntu or photon"
  type        = string
}

variable "control_plane_os_version" {
  description = "3 for photon or 20.04 ubuntu"
  type        = string
}

variable "control_plane_os_arch" {
  description = "amd64 only supported value"
  type        = string
}

variable "nodepool1_name" {
  description = "name for nodepole 1"
  type        = string
}

variable "nodepool1_description" {
  description = "nodepool 1 description"
  type        = string
}

variable "nodepool1_worker_replicas" {
  description = "Number of worker nodes"
  type        = number
}

variable "nodepool1_worker_class" {
  description = "node-pool only supported value"
  type        = string
}

variable "nodepool1_os_name" {
  description = "ubuntu or photon"
  type        = string
}

variable "nodepool1_os_version" {
  description = "3 for photon or 20.04 ubuntu"
  type        = string
}

variable "nodepool1_os_arch" {
  description = "amd64 only supported value"
  type        = string
}

variable "nodepool1_label1_key" {
  description = "key1"
  type        = string
}

variable "nodepool1_label1_value" {
  description = "value1"
  type        = string
}

variable "nodepool1_storageclass" {
  description = "storageclass"
  type        = string
}

variable "nodepool1_vm_class" {
  description = "VM size for nodepool 1 nodes"
  type        = string
}

variable "vmw_cloud_api_token" {
  description = "api token for auth"
  type        = string
}