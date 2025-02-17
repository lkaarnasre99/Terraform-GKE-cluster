output "repository_id" {

value = google_artifact_registry_repository.my_repo.repository_id
description = "The repository ID"
} 

/*output "name" {
  value       = google_artifact_registry_repository.my_repo.name
  description = "The fully qualified repository name"
}*/

output "location" {
  value       = google_artifact_registry_repository.my_repo.location
  description = "Repository location"
}
