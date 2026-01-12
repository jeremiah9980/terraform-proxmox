provider "proxmox" {
  endpoint = var.pm_api_url
  api_token = var.pm_api_token   # format: "terraform@pve!terraform-token=SECRET"
  insecure  = true
  # Optional: specify a node for some operations; most resources accept node_name
}
