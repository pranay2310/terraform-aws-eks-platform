data "aws_iam_policy_document" "eks_node_assume_role" {

  statement {

    effect = "Allow"

    principals {
      type = "Service"

      identifiers = [
        "ec2.amazonaws.com"
      ]
    }

    actions = [
      "sts:AssumeRole"
    ]
  }
}

resource "aws_iam_role" "node" {

  name               = var.node_role_name
  assume_role_policy = data.aws_iam_policy_document.eks_node_assume_role.json

  tags = var.tags
}