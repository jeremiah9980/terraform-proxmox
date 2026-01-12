# Proxmox target
target_node = "host1"

# Cloud-init template
template_vmid = 9000

# Storage + networking
storage_pool = "local-zfs"
bridge       = "vmbr0"

# VM defaults
vm_count       = 1
vm_name_prefix = "cg-test"
vm_cpu_cores   = 2
vm_memory_mb   = 2048
vm_disk_gb     = 40

# Networking
vlan_tag  = 10
ip_config = "ip=dhcp"

# Access
ci_user = "ubuntu"
ssh_public_keys = <<EOF
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIYOURKEY cosmicgen
EOF
