variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "oidc_provider_arn" {
  description = "OIDC Provider ARN"
  type        = string
}

variable "oidc_provider_url" {
  description = "OIDC Provider URL"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace"
  type        = string
}

variable "service_account_name" {
  description = "Service Account Name"
  type        = string
}

variable "role_name" {
  description = "IAM Role Name"
  type        = string
}

variable "policy_arns" {
  description = "IAM policies attached to the role"
  type        = list(string)
}

variable "tags" {
  type    = map(string)
  default = {}
}

