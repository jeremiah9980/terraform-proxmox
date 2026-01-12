############################################
# main.tf — CLEAN TEMPLATE-CLONE ONLY
############################################

module "web" {
  source = "./modules/vm-web"

  vm_count     = 2
  target_node  = var.target_node
  template_vmid = var.template_vmid
  bridge       = var.bridge
}

module "db" {
  source = "./modules/vm-db"
  vm_count = 1
}

module "gpu" {
  source = "./modules/vm-gpu"
  vm_count = 1
}
module "vm_from_template" {
  source = "./modules/vm-qemu"

  providers = {
    proxmox = proxmox
  }

  # VM count / naming
  vm_count       = var.vm_count
  vm_name_prefix = var.vm_name_prefix

  # Proxmox placement
  target_node   = var.target_node
  template_vmid = var.template_vmid

  # Storage + network
  storage_pool = var.storage_pool
  bridge        = var.bridge
  vlan_tag      = var.vlan_tag

  # Cloud-init
  ci_user        = var.ci_user
  ssh_public_key = var.ssh_public_key
}
