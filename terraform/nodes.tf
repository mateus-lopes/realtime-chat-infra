resource "proxmox_virtual_environment_vm" "nodes" {
    description = "Configuração geral das VMs no Proxmox"

    for_each = var.vms

    node_name = "Server"
    name = each.value.name
    vm_id = each.value.vm_id

    clone {
        vm_id = 9000
    }

    agent {
        enabled = true
    }

    cpu {
        cores = each.value.cores
        sockets = 1
        type = "host"
    }

    memory {
        dedicated = each.value.memory
    }

    disk {
        size = each.value.disk
        interface = "scsi0"
    }

    network_device {
        bridge = "vmbr0"
        model = "virtio"
    }

    

    initialization {
        user_account {
            username = "albano"
            password = each.value.password
            keys = [file("/home/mateus-lopes/.ssh/id_ed25519.pub")]
        }

        ip_config {
            ipv4 {
                address = each.value.ip
                gateway = "191.52.62.193"
            }
        }
    }
}