resource "aws_iam_policy" "this" {

  name        = "${var.cluster_name}-aws-load-balancer-controller"
  description = "IAM Policy for AWS Load Balancer Controller"

  policy = file("${path.module}/iam-policy.json")

  tags = {
    ManagedBy = "Terraform"
  }
}