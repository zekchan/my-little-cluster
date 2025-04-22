variable "gcp_region" {
  description = "The region where resources will be created"
  type        = string
  default     = "us-central1"
}


variable "gcp_billing_account" {
  description = "The ID of the billing account to associate with the project"
  type        = string
}

variable "gcp_project_id" {
  description = "The ID of the project"
  type        = string
}

variable "gke_cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "gke_min_node_count" {
  description = "The minimum number of nodes in the GKE cluster"
  type        = number
  default     = 1
}

variable "gke_max_node_count" {
  description = "The maximum number of nodes in the GKE cluster"
  type        = number
  default     = 3
}

variable "gke_machine_type" {
  description = "The machine type for the GKE cluster"
  type        = string
  default     = "e2-medium"
}

variable "gke_disk_size_gb" {
  description = "The disk size for the GKE cluster"
  type        = number
  default     = 10
}

variable "gke_network" {
  description = "The network for the GKE cluster"
  type        = string
  default     = "k8s-network"
}
variable "gke_subnetwork" {
  description = "The subnetwork for the GKE cluster"
  type        = string
  default     = "k8s-subnetwork"
}








