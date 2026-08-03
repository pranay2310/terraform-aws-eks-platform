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


output "cluster_policy_attachment" {
  value = aws_iam_role_policy_attachment.cluster_policy.id
}

output "node_policy_attachments" {
  value = [
    aws_iam_role_policy_attachment.worker_node.id,
    aws_iam_role_policy_attachment.ecr_readonly.id,
    aws_iam_role_policy_attachment.cni.id
  ]
}

output "node_policy_attachment_dependency" {

  value = [

    aws_iam_role_policy_attachment.worker_node.id,

    aws_iam_role_policy_attachment.ecr_readonly.id,

    aws_iam_role_policy_attachment.cni.id

  ]

}