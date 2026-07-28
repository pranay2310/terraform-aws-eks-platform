output "cluster_role_arn" {

  description = "Cluster Role ARN"

  value = aws_iam_role.cluster.arn
}

output "node_role_arn" {

  description = "Node Group Role ARN"

  value = aws_iam_role.node.arn
}

output "cluster_role_name" {

  value = aws_iam_role.cluster.name
}

output "node_role_name" {

  value = aws_iam_role.node.name
}