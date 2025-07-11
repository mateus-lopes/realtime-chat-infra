variable "vms" {
  description = "Mapa de VMs"
  type = map(object({
    vm_id = number
    name = string
    memory = number
    cores = number
    disk = number
    ip = string
    password = string
  }))
  default = {
    controlplane = {
      vm_id  = 102
      name   = "ControlPlane"
      memory = 4096
      cores  = 2
      disk   = 20
      ip     = "191.52.62.220/26"
      password = "mateusl22"
    },
    workernode1 = {
      vm_id  = 103
      name   = "WorkerNode1"
      memory = 3072
      cores  = 2
      disk   = 20
      ip     = "191.52.62.221/26"
      password = "mateusl22"
    },
    workernode2 = {
      vm_id  = 104
      name   = "WorkerNode2"
      memory = 3072
      cores  = 2
      disk   = 20
      ip     = "191.52.62.222/26"
      password = "mateusl22"
    }
  }
}
