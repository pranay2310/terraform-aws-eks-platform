variable "cluster_role_name" {
  description = "EKS Cluster IAM Role Name"
  type        = string
  default     = "eks-cluster-role"
}

variable "node_role_name" {
  description = "EKS Node Group IAM Role Name"
  type        = string
  default     = "eks-node-group-role"
}

variable "tags" {
  description = "Common Tags"
  type        = map(string)

  default = {}
}