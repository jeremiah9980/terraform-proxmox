resource "proxmox_virtual_environment_vm" "vm-clone" {
  count = var.vm_count
  name  = format("%s-%02d", var.vm_name_prefix, count.index + 1)
  node_name = var.target_node

  clone {
    vm_id = var.template_vmid
  }

  agent {
    enabled = true
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  initialization {
    user_account {
      username = var.ci_user
      keys     = [var.ssh_public_key]
    }
  }

  disk {
    datastore_id = var.storage_pool
    interface    = "scsi0"
    size         = 40
  }

  network_device {
    bridge = var.bridge
    vlan_id = var.vlan_tag > 0 ? var.vlan_tag : null
  }

  operating_system {
    type = "l26"
  }
}
