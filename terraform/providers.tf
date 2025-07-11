variable "PM_PASS" {
  description = "Senha do usuário Proxmox"
}

variable "PM_USER" {
  description = "Login do usuário Proxmox"
}

terraform {
    required_providers {
        proxmox = {
            source = "bpg/proxmox"
            version = "0.57.0"
        }
    }
}

provider proxmox {
    endpoint = "https://191.52.62.254:8006/"
    insecure = true
    username = var.PM_USER
    password = var.PM_PASS
}