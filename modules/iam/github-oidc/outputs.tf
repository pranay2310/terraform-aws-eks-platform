output "github_actions_role_arn" {

  description = "GitHub Actions IAM Role ARN"

  value = aws_iam_role.github_actions.arn
}

output "github_actions_role_name" {

  value = aws_iam_role.github_actions.name
}

output "oidc_provider_arn" {

  value = var.create_oidc_provider ? aws_iam_openid_connect_provider.github[0].arn : "Existing Provider"
}