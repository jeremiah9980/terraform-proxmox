############################################
# Proxmox Provider / Auth
############################################

variable "pm_api_url" {
  description = "Proxmox API endpoint, e.g. https://PROXMOX-IP:8006/api2/json"
  type        = string
}

variable "pm_user" {
  description = "Proxmox username (or API token user)"
  type        = string
}

variable "pm_password" {
  description = "Proxmox password or API token secret"
  type        = string
  sensitive   = true
}

############################################
# Proxmox Placement
############################################

variable "target_node" {
  description = "Target Proxmox node name (e.g. host1)"
  type        = string
}

############################################
# Template Clone Settings
############################################

variable "template_vmid" {
  description = "VMID of the Proxmox cloud-init template (e.g. 9000)"
  type        = number
}

############################################
# VM Configuration
############################################

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 1
}

variable "vm_name_prefix" {
  description = "Prefix for VM names"
  type        = string
  default     = "cg-vm"
}

############################################
# Storage & Network
############################################

variable "storage_pool" {
  description = "Datastore for VM disks (e.g. local-zfs, local-lvm)"
  type        = string
}

variable "bridge" {
  description = "Proxmox bridge to attach VM NICs to (e.g. vmbr0)"
  type        = string
}

variable "vlan_tag" {
  description = "Optional VLAN tag (0 = none)"
  type        = number
  default     = 0
}

############################################
# Cloud-init / Access
############################################

variable "ci_user" {
  description = "Default cloud-init username"
  type        = string
  default     = "ubuntu"
}

variable "ssh_public_key" {
  description = "SSH public key injected via cloud-init"
  type        = string
}
