variable "cluster_name" {
  description = "Eks Cluster Name"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version"
  type        = string
}

variable "tags" {
  description = "Commmon Tags"
  type        = map(string)
  default     = {}
}