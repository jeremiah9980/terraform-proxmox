pm_api_url = "https://47.163.25.30:8006/api2/json"
pm_user    = "root@pam"
pm_password = "P@$$WORD"

target_node   = "host1"
template_vmid = 9000

vm_count       = 1
vm_name_prefix = "cg-test"

storage_pool = "local-zfs"
bridge        = "vmbr0"
vlan_tag      = 10

ci_user = "ubuntu"

ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB2... terraform-proxmox"
