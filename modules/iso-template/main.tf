# Upload ISO to datastore (content type: iso)
resource "proxmox_virtual_environment_file" "iso" {
  node_name    = var.node_name
  datastore_id = var.datastore_iso
  content_type = "iso"

  source_file {
    path = var.iso_local_path
  }

  file_name = var.iso_file_name
}

# Optional: create VMs that boot from the uploaded ISO (manual install / packer)
resource "proxmox_virtual_environment_vm" "boot_vm" {
  count     = var.create_boot_vm ? var.vm_count : 0
  name      = "tf-iso-vm-${count.index}"
  node_name = var.node_name

  cpu {
    cores = 2
    type  = "host"
  }

  memory {
    dedicated = 2048
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disk {
    datastore_id = var.datastore_disks
    interface    = "scsi0"
    size         = 25
    file_format  = "raw"
  }

  cdrom {
    enabled   = true
    file_id   = proxmox_virtual_environment_file.iso.id
    interface = "ide0"
  }

  boot_order = ["ide0", "scsi0", "net0"]

  # Cloud-init injection (works after OS is cloud-init enabled; harmless during install)
  initialization {
    user_account {
      username = var.ci_user
      keys     = var.ssh_public_key != "" ? [var.ssh_public_key] : []
    }
    ip_config {
      ipv4 { address = "dhcp" }
    }
  }
}
