output "kubernetes_cluster_name" {
  value = google_container_cluster.primary.name
}

output "kubernetes_cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "kubernetes_cluster_ca_certificate" {
  value = google_container_cluster.primary.master_auth[0].cluster_ca_certificate
}

/* output "kubernetes_cluster_username" {
  value = google_container_cluster.primary.master_auth[0].username
}

output "kubernetes_cluster_password" {
  value = google_container_cluster.primary.master_auth[0].password 
}*/