###ssh-ключ по пути ~/.ssh/id_ed25519.pub
locals {
  ssh_key = file("~/.ssh/id_ed25519.pub")
}

###for ansible.tf

locals {
  
    webservers = yandex_compute_instance.VM-count.*
    databases = yandex_compute_instance.VM-fore_each
    storage = yandex_compute_instance.storage.* 
}
