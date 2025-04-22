resource "google_container_cluster" "default" {
  name = "example-autopilot-cluster"

  location                 = var.gcp_region
  enable_autopilot         = true
  enable_l4_ilb_subsetting = true

  network    = var.gke_network
  subnetwork = var.gke_subnetwork

  ip_allocation_policy {
    stack_type                    = "IPV4"
    services_secondary_range_name = google_compute_subnetwork.subnet.secondary_ip_range[0].range_name
    cluster_secondary_range_name  = google_compute_subnetwork.subnet.secondary_ip_range[1].range_name
  }

  # Set `deletion_protection` to `true` will ensure that one cannot
  # accidentally delete this instance by use of Terraform.
  deletion_protection = false
}