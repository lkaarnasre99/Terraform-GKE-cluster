provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_project_service" "apis" {
  for_each = toset([
    "container.googleapis.com",
    "cloudbuild.googleapis.com])
    # Add other APIs as needed
  ])
  
  project = var.project_id
  service = each.key
  
  disable_dependent_services = true
  disable_on_destroy        = false
}

module "gcp_kubernetes" {
  source       = "./modules/terraform-gcp-kubernetes/"
  project_id   = var.project_id
  region       = var.region
  zone         = var.zone
  cluster_name = var.cluster_name
  node_count   = var.node_count
  min_nodes    = var.min_nodes
  max_nodes    = var.max_nodes
  machine_type = var.machine_type
}

/*output "kubernetes_cluster_name" {
  value = module.gcp_kubernetes.kubernetes_cluster_name
}

output "kubernetes_cluster_endpoint" {
  value = module.gcp_kubernetes.kubernetes_cluster_endpoint
}

output "kubernetes_cluster_ca_certificate" {
  value = module.gcp_kubernetes.kubernetes_cluster_ca_certificate
}

output "kubernetes_cluster_username" {
  value = module.gcp_kubernetes.kubernetes_cluster_username
}

output "kubernetes_cluster_password" {
  value = module.gcp_kubernetes.kubernetes_cluster_password
}*/
