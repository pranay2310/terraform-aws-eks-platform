variable "github_owner" {
  description = "GitHub organization or username"
  type        = string
}

variable "github_repository" {
  description = "GitHub repository name"
  type        = string
}

variable "github_branch" {
  description = "GitHub branch allowed to assume role"
  type        = string
  default     = "main"
}

variable "role_name" {
  description = "IAM Role Name"
  type        = string
  default     = "github-actions-terraform-role"
}

variable "create_oidc_provider" {
  description = "Create GitHub OIDC Provider"
  type        = bool
  default     = true
}

variable "tags" {
  type    = map(string)
  default = {}
}