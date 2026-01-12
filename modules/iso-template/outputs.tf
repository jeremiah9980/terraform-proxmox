output "iso_id" {
  value = proxmox_virtual_environment_file.iso.id
}

output "boot_vm_names" {
  value = [for v in proxmox_virtual_environment_vm.boot_vm : v.name]
}
