
output "vm_names" {
  value = keys(proxmox_virtual_environment_vm.vm)
}
