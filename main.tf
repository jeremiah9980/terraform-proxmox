locals {
  use_clone = length(trim(var.clone_template_name)) > 0
  use_iso   = length(trim(var.iso_local_path)) > 0 && length(trim(var.iso_file_name)) > 0
}

# Upload ISO if provided
module "iso_upload" {
  source = "./modules/iso-template"
  count  = local.use_iso ? 1 : 0

  node_name     = var.node_name
  datastore_iso = var.datastore_iso

  iso_local_path = var.iso_local_path
  iso_file_name  = var.iso_file_name
}

# VM(s) from template clone (best practice)
module "vm_from_template" {
  source = "./modules/vm-qemu"
  count  = local.use_clone ? 1 : 0

  vm_count          = var.vm_count
  node_name         = var.node_name
  datastore_disks   = var.datastore_disks
  clone_template_name = var.clone_template_name

  ci_user        = var.ci_user
  ssh_public_key = var.ssh_public_key
}

# VM(s) that boot from ISO (for initial install / packer)
module "vm_from_iso" {
  source = "./modules/iso-template"
  count  = local.use_iso ? 1 : 0

  node_name       = var.node_name
  datastore_iso   = var.datastore_iso
  datastore_disks = var.datastore_disks

  create_boot_vm  = true
  vm_count        = var.vm_count

  ci_user         = var.ci_user
  ssh_public_key  = var.ssh_public_key

  iso_local_path  = var.iso_local_path
  iso_file_name   = var.iso_file_name
}
