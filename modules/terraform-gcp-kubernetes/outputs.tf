output "kubernetes_cluster_name" {
  value = google_container_cluster.hello_cluster.name
}

output "kubernetes_cluster_endpoint" {
  value = google_container_cluster.hello_cluster.endpoint
}

output "kubernetes_cluster_ca_certificate" {
  value = google_container_cluster.hello_cluster.master_auth[0].cluster_ca_certificate
}

/* output "kubernetes_cluster_username" {
  value = google_container_cluster.hello_cluster.master_auth[0].username
}

output "kubernetes_cluster_password" {
  value = google_container_cluster.hello_cluster.master_auth[0].password 
}*/