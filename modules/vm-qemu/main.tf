resource "proxmox_virtual_environment_vm" "vm" {
  count     = var.vm_count
  name      = "tf-vm-${count.index}"
  node_name = var.node_name

  # Clone from an existing Proxmox VM template by name
  clone {
    vm_name = var.clone_template_name
    full    = true
  }

  agent {
    enabled = true
  }

  cpu {
    cores = 2
    type  = "host"
  }

  memory {
    dedicated = 2048
  }

  initialization {
    user_account {
      username = var.ci_user
      keys     = [var.ssh_public_key]
    }

    # Optional: DHCP on vmbr0
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disk {
    datastore_id = var.datastore_disks
    interface    = "scsi0"
    size         = 20
    file_format  = "raw"
  }

  scsi_hardware = "virtio-scsi-single"
}
