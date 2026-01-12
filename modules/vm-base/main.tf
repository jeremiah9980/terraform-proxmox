resource "proxmox_virtual_environment_vm" "vm" {
  for_each = var.vms

  name      = each.key
  node_name = var.node_name

  clone {
    vm_id = var.template_vmid
  }

  cpu {
    cores = each.value.cores
  }

  memory {
    dedicated = each.value.memory_mb
  }

  network_device {
    bridge  = var.bridge
    vlan_id = each.value.vlan_tag
  }
}
