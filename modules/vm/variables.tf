# modules/vm/variables.tf

variable "startup_script_path" {
  description = "Path to the startup script"
}

variable "vm_count" {
  description = "The number of VM instances to create."
  type        = number
}

variable "machine_type" {
  description = "The machine type of the VM instance."
  type        = string
}

variable "zone" {
  description = "The zone of the VM instance."
  type        = string
}
variable "region" {
  description = "The zone of the VM instance."
  type        = string
}
variable "boot_disk" {
    type = string
    description = "The region of the VM instance"
}
variable "network_name" {
  type = string
  description = "The name of the network to which the VM instance will be attached."
}

variable "subnet_name" {
   type = string
  description = "The name of the subnet to which the VM instance will be attached."
}
