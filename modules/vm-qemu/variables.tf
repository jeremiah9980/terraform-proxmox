############################################
# Required Inputs
############################################

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
}

variable "vm_name_prefix" {
  description = "Prefix for VM names"
  type        = string
}

variable "target_node" {
  description = "Target Proxmox node"
  type        = string
}

variable "template_vmid" {
  description = "VMID of cloud-init template"
  type        = number
}

############################################
# Storage & Network
############################################

variable "storage_pool" {
  description = "Storage pool for VM disks"
  type        = string
}

variable "bridge" {
  description = "Network bridge"
  type        = string
}

variable "vlan_tag" {
  description = "Optional VLAN tag"
  type        = number
  default     = 0
}

############################################
# Cloud-init
############################################

variable "ci_user" {
  description = "Cloud-init username"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key"
  type        = string
}
