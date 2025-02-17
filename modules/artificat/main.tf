resource "google_artifact_registry_repository" "my_repo" {
  location = var.region
  project  = var.project_id
  repository_id = "my-repository"
  description   = "Docker repository"
  format        = "DOCKER"
}
