
resource "proxmox_virtual_environment_vm" "vm" {
  for_each  = var.vms
  name      = each.key
  node_name = var.node_name

  clone {
    vm_id = var.template_vmid
    full  = true
  }

  cpu { cores = 8 }
  memory { dedicated = 16384 }

  disk {
    datastore_id = var.disk_datastore
    interface    = "scsi0"
    size         = 80
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

  hostpci {
    device  = "hostpci0"
    mapping = var.gpu_mapping_name
    pcie    = true
    rombar  = true
    xvga    = false
  }
}
