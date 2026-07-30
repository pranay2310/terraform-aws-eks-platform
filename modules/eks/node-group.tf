resource "aws_eks_node_group" "this" {

  for_each = var.managed_node_groups

  cluster_name = aws_eks_cluster.this.name

  node_group_name = each.key

  node_role_arn = var.node_role_arn

  subnet_ids = var.private_subnet_ids

  capacity_type = each.value.capacity_type

  instance_types = each.value.instance_types

  scaling_config {

    desired_size = each.value.desired_size

    min_size = each.value.min_size

    max_size = each.value.max_size

  }

  update_config {

    max_unavailable = 1

  }

  labels = each.value.labels

  dynamic "taint" {

    for_each = each.value.taints

    content {

      key = taint.value.key

      value = taint.value.value

      effect = taint.value.effect

    }

  }

  tags = merge(

    var.tags,

    {

      Name = each.key

    }

  )

  depends_on = [
    aws_eks_cluster.this
  ]

}