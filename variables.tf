###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  default     = "b1gr9jc87b7932t58r8n"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1gd4iu9i673fhlkf5lf"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vm_family" { 
  type        = string
  default     = "ubuntu-2004-lts"
  description = "ОС"
}
variable "platform_id" { 
  type        = string
  default     = "standard-v2"
  description = "Политика планирования"
}

variable "sec_name" {
  type = string
  default = "example_dynamic"
}

variable "metadata" {
  type = map(string)
  default = {serial-port-enable = "1"  }
}

variable "vm_nat" {
  type = bool
  default = true
}

variable "scheduling_policy" {
  type = bool
  default = true
}

### var для for_each-vm.tf

variable "for_each-par-VM" {

type = list(object(
  { 
  cores = number
  name = string
  memory=number
  core_fraction=number
  size=optional(number)
  type=string 
   },
  
)) 

  default = [
{
  name = "main",
  cores= 2 ,
  memory=2,
  core_fraction=5,
  size= 10,
  type= "network-ssd"
},
{
  name = "replica"
  cores= 2 
  memory= 1
  core_fraction=5
  size= 5
  type= "network-hdd"
},]
  
}


### var для count-vm.tf

variable "web_resources" {
  type = map(string)
  default = {web_vm_cores="2",web_vm_memory="1",web_vm_core_fraction="5"}
}

variable "yandex_compute_instance_VM_count" {
  type = number
  default = 2
}

### var for disk_vm.tf

variable "disk_resources" {
  type = map(string)
  default = {disk_vm_cores="2",disk_vm_memory="1",disk_vm_core_fraction="5"}
}

variable "size_yandex_compute_disk" {
  type = number
  default = 1
}

variable "type_yandex_compute_disk" {
  type = string
  default = "network-hdd"
}

variable "zone_yandex_compute_disk" {
  type = string
  default = "ru-central1-a"
}

variable "count_yandex_compute_disk" {
  type = number
  default = 3
}

variable "name_yandex_compute_instance" {
  type = string
  default = "storage"
}

variable "size_yandex_compute_instance" {
  type = number
  default = 10
  
}

