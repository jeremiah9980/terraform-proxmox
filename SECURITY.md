# GitHub Actions Secrets

Add these repository secrets:

- PM_API_URL: https://PROXMOX-IP:8006/api2/json
- PM_API_TOKEN: terraform@pve!terraform-token=TOKEN_VALUE
- PM_NODE_NAME: pve1
- PM_DATASTORE_ISO: local
- PM_DATASTORE_DISKS: local-lvm
- SSH_PUBLIC_KEY: ssh-ed25519 AAAA...
- CLONE_TEMPLATE_NAME: ubuntu-2204-cloudinit-template

## Recommended
- Use a dedicated Proxmox token with `--privsep 1`
- Scope ACLs to specific paths (/vms, /storage/<name>) when possible
