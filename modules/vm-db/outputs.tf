
output "vm_ids" {
  value = { for k, v in proxmox_virtual_environment_vm.vm : k => v.vm_id }
}
