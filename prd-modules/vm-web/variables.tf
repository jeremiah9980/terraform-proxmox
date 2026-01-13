
variable "vms" {
  type = map(object({
    vm_id     = number
    cores     = number
    memory_mb = number
  }))
}

variable "node_name" { type = string }
variable "template_vmid" { type = number }
variable "disk_datastore" { type = string }
variable "ci_datastore" { type = string }
variable "bridge" { type = string }
variable "vlan_tag" { type = number }
variable "ssh_public_key" { type = string }
