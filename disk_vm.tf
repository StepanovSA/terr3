resource "yandex_compute_disk" "disk" {
    count = var.count_yandex_compute_disk
    name = "virtualdisk-${count.index + 1}" 
    size = var.size_yandex_compute_disk
    type = var.type_yandex_compute_disk
    zone = var.zone_yandex_compute_disk
}


resource "yandex_compute_instance" "storage" {
    depends_on = [yandex_compute_instance.VM-fore_each]
    platform_id = var.platform_id 
    name = var.name_yandex_compute_instance
  
  resources {
    cores         = var.disk_resources.disk_vm_cores
    memory        = var.disk_resources.disk_vm_memory
    core_fraction = var.disk_resources.disk_vm_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = var.size_yandex_compute_instance
    }
  }
  scheduling_policy {
    preemptible = var.scheduling_policy
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_nat
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    serial-port-enable = var.metadata.serial-port-enable
    ssh-keys           = "ubuntu:${local.ssh_key}"
  } 
 
  dynamic "secondary_disk"  {
    for_each =  yandex_compute_disk.disk
    content {
      disk_id = secondary_disk.value.id
    }
  }
}
