variable "datastore_disks" {
  type        = string
  description = "Storage pool for VM disks"
  default     = "local-zfs"
}

variable "create_boot_vm" {
  type        = bool
  description = "Whether to create the boot VM"
  default     = false
}

variable "vm_count" {
  type        = number
  description = "Number of VMs to create"
  default     = 1
}

variable "ci_user" {
  type        = string
  description = "Cloud-init user"
  default     = "ubuntu"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key injected via cloud-init"
  default     = ""
}
