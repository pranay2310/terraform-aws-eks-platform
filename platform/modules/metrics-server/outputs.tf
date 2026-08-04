output "release_name" {
  description = "Metrics Server Helm release name"
  value       = helm_release.this.name
}