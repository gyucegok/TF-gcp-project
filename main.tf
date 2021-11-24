
resource "google_project_service" "project" {
  project = google_project.iamproject.name
  count = length(var.gcp_service_list)  
  service = var.gcp_service_list[count.index]

  disable_dependent_services = true
}

resource "google_compute_network" "default" {
  name                    = var.network_name
  project                 = google_project.iamproject.name
  auto_create_subnetworks = false
}

data "google_client_config" "current" {
}

output "network" {
  value = google_compute_network.default.name
}

