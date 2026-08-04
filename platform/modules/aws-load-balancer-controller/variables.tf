variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where ALB will be created"
  type        = string
}

variable "service_account_role_arn" {
  description = "IRSA Role ARN for AWS Load Balancer Controller"
  type        = string
}
