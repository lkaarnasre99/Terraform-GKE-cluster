data "google_client_config" "default" {}
resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  location           = var.zone
  #initial_node_count = var.node_count

  release_channel {
    channel = "REGULAR"
  }

  node_pool {
    name       = "default-pool"
    node_count = var.node_count

    node_config {
    machine_type = var.machine_type

    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append",
    ]
   }

    autoscaling {
      min_node_count = var.min_nodes
      max_node_count = var.max_nodes
    }
  }

  lifecycle {
    ignore_changes = [node_pool[0].node_count]
  }
}

provider "kubernetes" {
  host                   = google_container_cluster.primary.endpoint
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
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