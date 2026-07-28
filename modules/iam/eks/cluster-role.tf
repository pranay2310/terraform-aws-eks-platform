data "aws_iam_policy_document" "eks_cluster_assume_role" {

  statement {

    effect = "Allow"

    principals {
      type = "Service"

      identifiers = [
        "eks.amazonaws.com"
      ]
    }

    actions = [
      "sts:AssumeRole"
    ]
  }
}

resource "aws_iam_role" "cluster" {

  name               = var.cluster_role_name
  assume_role_policy = data.aws_iam_policy_document.eks_cluster_assume_role.json

  tags = var.tags
}