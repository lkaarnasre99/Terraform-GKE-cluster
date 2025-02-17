data "google_client_config" "default" {}
data "google_project" "project {
 project_id = var.project_id
}

resource "google_project_iam_member" "cloudbuild_kubernetes_developer" {
project = var.project_id
role = "roles/container.developer"
member = "serviceaccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
}


resource "google_container_cluster" "hello_cluster" {
  name              = var.cluster_name
  location          = var.zone
  project           = var.project_id
  release_channel {
    channel = "REGULAR"
  }
  min_master_version = var.min_master_version
  
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.hello_cluster.name
  project    = var.project_id
  node_count = var.node_count

  autoscaling {
    min_node_count = var.min_count
    max_node_count = var.max_count
  }

  node_config {
    machine_type = var.machine_type
  }
}

provider "kubernetes" {
  host                   = "https://${google_container_cluster.hello_cluster.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.hello_cluster.master_auth[0].cluster_ca_certificate)
}

resource "kubernetes_namespace" "prod" {
  metadata {
    name = "prod"
  }
}

resource "kubernetes_namespace" "dev" {
  metadata {
    name = "dev"
  }
}
