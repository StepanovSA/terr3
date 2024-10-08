resource "local_file" "inventory_cfg" {
  content = templatefile("${path.module}/inventory.tftpl", { webservers = yandex_compute_instance.VM-count.* , databases = yandex_compute_instance.VM-fore_each , storage = yandex_compute_instance.storage.* })
  filename = "${abspath(path.module)}/inventory.cfg"
}
