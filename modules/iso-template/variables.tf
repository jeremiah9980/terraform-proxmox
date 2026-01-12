variable "node_name" { type = string }
variable "datastore_iso" { type = string }
variable "datastore_disks" { type = string, default = "local-lvm" }

variable "iso_local_path" { type = string }
variable "iso_file_name"  { type = string }

variable "create_boot_vm" { type = bool, default = false }
variable "vm_count" { type = number, default = 1 }

variable "ci_user" { type = string, default = "ubuntu" }
variable "ssh_public_key" { type = string, default = "" }
