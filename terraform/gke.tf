resource "google_container_cluster" "cluster" {
  name = var.gke_cluster_name

  location                 = var.gcp_region
  enable_l4_ilb_subsetting = true

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  ip_allocation_policy {
    stack_type                    = "IPV4"
    services_secondary_range_name = google_compute_subnetwork.subnet.secondary_ip_range[0].range_name
    cluster_secondary_range_name  = google_compute_subnetwork.subnet.secondary_ip_range[1].range_name
  }
  # Node pool configuration
  initial_node_count = 1
  node_config {
    machine_type = "e2-standard-4"
    disk_type    = "pd-balanced"
    disk_size_gb = 100
  }
  # Set `deletion_protection` to `true` will ensure that one cannot
  # accidentally delete this instance by use of Terraform.
  deletion_protection = false
}

output "cluster_name" {
  value = google_container_cluster.cluster.name
}

output "cluster_location" {
  value = google_container_cluster.cluster.location
}

output "cluster_endpoint" {
  value = google_container_cluster.cluster.endpoint
}

output "cluster_master_version" {
  value = google_container_cluster.cluster.master_version
}

output "cluster_node_version" {
  value = google_container_cluster.cluster.node_version
}

