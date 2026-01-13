resource "proxmox_virtual_environment_vm" "web" {
  count = var.vm_count

  name = format("web-%02d", count.index + 1)

  node_name = var.target_node

  clone {
    vm_id = var.template_vmid
  }

  cpu { cores = 2 }
  memory { dedicated = 2048 }

  network_device {
    bridge  = var.bridge
    vlan_id = 10
  }
}
