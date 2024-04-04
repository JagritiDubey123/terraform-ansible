# modules/vm/main.tf

resource "google_compute_instance" "vm_instance" {
  count         = var.vm_count
    name = "instance-${count.index + 1}"
  machine_type = var.machine_type
  zone         = var.zone
  # boot_disk = var.boot_disk
  # Add other configuration attributes as needed
  boot_disk {
    initialize_params {
      image = var.boot_disk
    }
    }
    network_interface {
    network = var.network_name
    subnetwork = var.subnet_name
    access_config {}
  }
}
output "vm_count" {
  value = var.vm_count
}

# output "instance_names" {
#   description = "Names of the created VM instances"
#   value       = [google_compute_instance.vm_instance[*].name]
# }
# output "vm_count" {
#   description = "Number of VM instances to create"
#   value       = var.vm_count
# }

# output "machine_type" {
#   description = "Machine type for the VM instances"
#   value       = var.machine_type
# }

# output "boot_disk" {
#   description = "Boot disk for the VM instances"
#   value       = var.boot_disk
# }

# output "zone" {
#   description = "Zone for the VM instances"
#   value       = var.zone
# }

# output "network_name" {
#   description = "Network name for the VM instances"
#   value       = var.network_name
# }

# output "subnet_name" {
#   description = "Subnet name for the VM instances"
#   value       = var.subnet_name
# }



# # modules/vm/main.tf

