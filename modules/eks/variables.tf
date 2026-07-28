variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes Version"
  type        = string
  default     = "1.33"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private Subnet IDs"
  type        = list(string)
}

variable "cluster_role_arn" {
  description = "IAM Role ARN for EKS Cluster"
  type        = string
}

variable "node_role_arn" {
  description = "IAM Role ARN for Worker Nodes"
  type        = string
}

variable "endpoint_private_access" {
  type    = bool
  default = true
}

variable "endpoint_public_access" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "managed_node_groups" {

  description = "Managed EKS Node Groups"

  type = map(object({

    desired_size = number

    min_size = number

    max_size = number

    instance_types = list(string)

    capacity_type = string

    labels = map(string)

    taints = list(object({

      key = string

      value = string

      effect = string

    }))

  }))
}

