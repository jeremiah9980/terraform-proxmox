variable "pm_api_url" {
  description = "Example: https://PROXMOX-IP:8006/api2/json"
  type        = string
}

variable "pm_api_token" {
  description = "Format: terraform@pve!terraform-token=TOKEN_VALUE"
  type        = string
  sensitive   = true
}

variable "node_name" {
  description = "Target Proxmox node name (as shown in the UI)"
  type        = string
  default     = "pve1"
}

variable "datastore_iso" {
  description = "Datastore for ISOs (often: local)"
  type        = string
  default     = "local"
}

variable "datastore_disks" {
  description = "Datastore for VM disks (often: local-lvm)"
  type        = string
  default     = "local-lvm"
}

variable "vm_count" {
  type    = number
  default = 1
}

# Cloud-init / SSH
variable "ssh_public_key" {
  description = "SSH public key that will be injected via cloud-init"
  type        = string
}

variable "ci_user" {
  description = "Default cloud-init username"
  type        = string
  default     = "ubuntu"
}

# Option A: Clone from template (recommended after you have a golden template)
variable "clone_template_name" {
  description = "If set, we will clone from this existing Proxmox VM template name."
  type        = string
  default     = ""
}

# Option B: Boot from ISO (one-time manual install or packer-driven)
variable "iso_local_path" {
  description = "Path on the machine running Terraform to the ISO file to upload (optional)."
  type        = string
  default     = ""
}

variable "iso_file_name" {
  description = "Filename to store in the ISO datastore (e.g., ubuntu-22.04.3-live-server-amd64.iso)"
  type        = string
  default     = ""
}
