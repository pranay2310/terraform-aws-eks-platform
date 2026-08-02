output "policy_arn" {

  description = "AWS Load Balancer Controller IAM Policy ARN"

  value = aws_iam_policy.this.arn
}