resource "proxmox_vm_qemu" "vm" {
  count       = var.vm_count
  name        = format("%s-%02d", var.vm_name_prefix, count.index + 1)
  target_node = var.target_node

  clone      = tostring(var.template_vmid)
  full_clone = true

  agent   = 1
  os_type = "cloud-init"

  cores  = 2
  memory = 2048

  ciuser  = var.ci_user
  sshkeys = var.ssh_public_key

  scsihw = "virtio-scsi-pci"

  disk {
    slot    = 0
    type    = "scsi"
    size    = "40G"
    storage = var.storage_pool
  }

  network {
    model  = "virtio"
    bridge = var.bridge
    tag    = var.vlan_tag > 0 ? var.vlan_tag : null
  }

  onboot = true
}
