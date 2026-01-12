# Terraform Proxmox Starter Repo (Cloud-Init + ISO Upload + GitHub Actions)

This repo uses the **bpg/proxmox** Terraform provider (modern Proxmox VE API provider) and is set up for:
- ✅ Cloud-init + SSH key injection
- ✅ ISO upload to a Proxmox datastore
- ✅ Create a VM **from ISO** (for manual install) or clone from an existing template
- ✅ GitHub Actions: fmt/validate/plan on PR, and optional apply on main

## Requirements
- Terraform >= 1.5
- Proxmox VE 7/8
- API token created for `terraform@pve` with permissions including:
  - `VM.Allocate`, `VM.Clone`, `Datastore.Allocate`, `Datastore.AllocateSpace`, `Sys.Audit`

## Quick start
1) Copy vars:
```bash
cp terraform.tfvars.example terraform.tfvars
```
2) Edit `terraform.tfvars` (URL + token + node + datastore).
3) Init/plan/apply:
```bash
terraform init
terraform plan
terraform apply
```

## Notes on “template creation from ISO”
Terraform can:
- upload the ISO
- create a VM that boots the ISO
- set VM hardware + cloud-init drive

**But it cannot magically install the OS** without an unattended install mechanism.
For fully automated golden templates, use **Packer** (recommended) or do a one-time manual install,
then convert the VM to a template and Terraform can clone it going forward.
