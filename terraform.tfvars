pm_api_url   = "https://PROXMOX-IP:8006/api2/json"
pm_api_token = "terraform@pve!terraform-token=PASTE_TOKEN_VALUE"

node_name       = "pve1"
datastore_iso   = "local"
datastore_disks = "local-lvm"

# Cloud-init SSH key injection
ssh_public_key = "ssh-ed25519 AAAA... yourkeycomment"

# Option A (recommended): clone from an existing template
clone_template_name = "ubuntu-2204-cloudinit-template"

# Option B: upload an ISO + create a VM that boots it (manual install / packer)
# iso_local_path = "C:/ISOs/ubuntu-22.04.3-live-server-amd64.iso"
# iso_file_name  = "ubuntu-22.04.3-live-server-amd64.iso"
