output "vm_names" {
  description = "Names of created VMs"
  value       = [for v in proxmox_vm_qemu.vm : v.name]
}

output "vm_ids" {
  description = "VMIDs of created VMs"
  value       = [for v in proxmox_vm_qemu.vm : v.vmid]
}
