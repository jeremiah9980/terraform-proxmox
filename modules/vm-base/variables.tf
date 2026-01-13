variable "vms" {
  description = "Map of VM name => configuration"
  type = map(object({
    vm_id     = number
    cores     = number
    memory_mb = number
    vlan_tag  = number
  }))
}
