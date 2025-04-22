# Create VPC network
resource "google_compute_network" "vpc" {
  name                    = var.gke_network
  project                 = var.gcp_project_id
  auto_create_subnetworks = false
}

# Create subnet
resource "google_compute_subnetwork" "subnet" {
  name          = var.gke_subnetwork
  project       = var.gcp_project_id
  region        = var.gcp_region
  network       = google_compute_network.vpc.id
  ip_cidr_range = "10.0.0.0/16"

  secondary_ip_range {
    range_name    = "pod-range"
    ip_cidr_range = "10.0.1.0/24"
  }

  secondary_ip_range {
    range_name    = "service-range"
    ip_cidr_range = "10.0.2.0/24"
  }
} 