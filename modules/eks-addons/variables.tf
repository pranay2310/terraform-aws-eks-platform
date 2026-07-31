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

variable "ebs_csi_irsa_role_arn" {
  description = "IRSA Role ARN for Amazon EBS CSI Driver"
  type        = string
}