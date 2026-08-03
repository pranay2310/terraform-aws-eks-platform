resource "aws_eks_cluster" "this" {

  name = var.cluster_name

  role_arn = var.cluster_role_arn

  version = var.cluster_version

  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }

  vpc_config {

    subnet_ids = var.private_subnet_ids

    security_group_ids = [aws_security_group.cluster.id]

    endpoint_private_access = var.endpoint_private_access

    endpoint_public_access = var.endpoint_public_access
  }

  enabled_cluster_log_types = [

    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"

  ]

  tags = merge(

    var.tags,

    {

      Name = var.cluster_name

    }

  )

}