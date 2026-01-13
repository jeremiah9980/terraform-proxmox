
resource "proxmox_virtual_environment_vm" "vm" {
  for_each  = var.vms
  name      = each.key
  node_name = var.node_name

  clone {
    vm_id = var.template_vmid
    full  = true
  }

  cpu { cores = each.value.cores }
  memory { dedicated = each.value.memory_mb }

  disk {
    datastore_id = var.disk_datastore
    interface    = "scsi0"
    size         = 40
  }

  initialization {
    datastore_id = var.ci_datastore
    user_account {
      username = "ubuntu"
      keys     = [trimspace(var.ssh_public_key)]
    }
  }

  network_device {
    bridge  = var.bridge
    vlan_id = var.vlan_tag
  }
}
