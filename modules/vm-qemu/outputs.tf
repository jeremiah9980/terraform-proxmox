output "vm_names" {
  value = [for v in proxmox_virtual_environment_vm.vm : v.name]
}
