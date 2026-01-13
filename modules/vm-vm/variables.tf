variable "vm_count" {
  type        = number
  description = "Number of VMs to create"
}

variable "vm_name_prefix" {
  type        = string
  description = "Prefix for VM names"
}

variable "target_node" {
  type        = string
  description = "Proxmox node name"
}

variable "template_vmid" {
  type        = number
  description = "VMID of cloud-init template"
}

variable "storage_pool" {
  type        = string
  description = "Storage pool for VM disks"
}

variable "bridge" {
  type        = string
  description = "Network bridge"
}

variable "vlan_tag" {
  type    = number
  default = 0
}

variable "ci_user" {
  type = string
}

variable "ssh_public_key" {
  type = string
}
