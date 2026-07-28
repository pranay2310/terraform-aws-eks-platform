module "vpc" {

  source = "../../modules/vpc"

  project_name = var.project_name

  environment = var.environment

  vpc_cidr = var.vpc_cidr

  availability_zones = var.availability_zones

  public_subnet_cidrs = var.public_subnet_cidrs

  private_subnet_cidrs = var.private_subnet_cidrs

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "Pranay"
  }

}

module "github_oidc" {

  source = "../../modules/iam/github-oidc"

  github_owner = "pranay2310"

  github_repository = "terraform-aws-eks-platform"

  github_branch = "main"

  tags = local.common_tags
}
