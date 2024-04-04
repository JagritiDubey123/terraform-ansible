# # # main.tf

# # provider "google" {
# #   project = "jagriti-411012"
# #    credentials = "${file("C:/Users/JAGRITI/Downloads/jagriti-411012-4c9ab7bf4591.json")}"
# #   region  = "us-central1"
# # }


# # module "vm_instances" {
# #   source     = "./modules/vm"
# #   vm_count   = 3
# #  name        = "instance"
# #       machine_type = "n1-standard-1"
# #       boot_disk = "debian-cloud/debian-10"
# #       zone         = "us-central1-a"
# #       region = "us-central1"
# #       network_name   = "default"
# #       subnet_name    = "default"

# #   # Pass other necessary configuration attributes to the module as needed
# # }
# # output "instance_names" {
# #   description = "Names of the created VM instances"
# #   value       = module.vm_instances.instance_names
# # }




# # main.tf

# provider "google" {
#   project = "jagriti-411012"
#    credentials = "${file("C:/Users/JAGRITI/Downloads/jagriti-411012-4c9ab7bf4591.json")}"
#   region  = "us-central1"
# }

# module "vm_instances" {
#   source        = "./modules/vm"
#   name = ""
#   vm_count      = 3
#   machine_type  = "n1-standard-1"
#   boot_disk     = "debian-cloud/debian-10"
#   zone          = "us-central1-a"
#   region        = "us-central1"
#   network_name  = "default"
#   subnet_name   = "default"
# }

# resource "google_compute_instance" "vm_instance" {
#   count         = module.vm_instances.vm_count
#   name          = "instance-${count.index + 1}"
#   machine_type  = module.vm_instances.machine_type
#   boot_disk {
#     initialize_params {
#       image = module.vm_instances.boot_disk
#     }
#   }
#   zone          = module.vm_instances.zone
#   network_interface {
#     network = module.vm_instances.network_name
#     subnetwork = module.vm_instances.subnet_name
#     access_config {}
#   }
# }
# locals {
#   instance_names = [for i in range(module.vm_instances.vm_count) : "instance-${i + 1}"]
# }

# output "instance_names" {
#   value = local.instance_names
# }




provider "google" {
  project     = "jagriti-411012"
  credentials = file("C:/Users/JAGRITI/Downloads/jagriti-411012-4c9ab7bf4591.json")
  region      = "us-central1"
}

module "vm_instances" {
  source        = "./modules/vm"
  vm_count      = 3
  machine_type  = "e2-medium"
  boot_disk     = "debian-cloud/debian-10"
  zone          = "europe-north1-a"
  region        = "europe-north1"
  network_name  = "default"
  subnet_name   = "default"
}

# resource "google_compute_instance" "vm_instance" {
#   count         = module.vm_instances.vm_count
#   name          = "instance-${count.index + 1}"
#   machine_type  = module.vm_instances.machine_type
#   boot_disk {
#     initialize_params {
#       image = module.vm_instances.boot_disk
#     }
#   }
#   zone          = module.vm_instances.zone
#   network_interface {
#     network = module.vm_instances.network_name
#     subnetwork = module.vm_instances.subnet_name
#     access_config {}
#   }
# }

locals {
  instance_names = [for i in range(module.vm_instances.vm_count) : "instance-${i + 1}"]
}

output "instance_names" {
  value = local.instance_names
}
