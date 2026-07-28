locals {
  common_tags = {
    project     = var.project_name
    environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "Pranay"
  }
}