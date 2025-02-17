/*provider "google" {
  project = var.project_id
  region  = var.region
}*/

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
    }
  }
}

resource "google_project_service" "apis" { 

  for_each = toset(["container.googleapis.com","cloudbuild.googleapis.com"])

  disable_dependent_services = true
  disable_on_destroy = false
  project = var.project_id
  service = each.key


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
  min_master_version = var.min_master_version
}


module "gcp_artifact_repo" {
   source = "./modules/artificat/"
   project_id = var.project_id
   region    = var.region
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
