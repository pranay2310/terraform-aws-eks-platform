resource "aws_iam_role_policy_attachment" "administrator" {

  role = aws_iam_role.github_actions.name

  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"

}