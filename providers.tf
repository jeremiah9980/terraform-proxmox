terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.93.0"
    }
  }
}

provider "proxmox" {
  endpoint = "https://47.163.25.30:8006/api2/json"
  insecure = true

  username = var.pm_user
  password = var.pm_password
}
