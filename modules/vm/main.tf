# modules/vm/main.tf

resource "google_compute_instance" "vm_instance" {
  count         = var.vm_count
    name = "instance-${count.index + 1}"
  machine_type = var.machine_type
  zone         = var.zone
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

