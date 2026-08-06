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

module "eks_iam" {

  source = "../../modules/iam/eks"

  cluster_role_name = "dev-eks-cluster-role"

  node_role_name = "dev-eks-node-group-role"

  tags = {
    Environment = "dev"
    Terraform   = "true"
    Project     = "terraform-aws-eks-platform"
  }
}

module "eks" {

  source = "../../modules/eks"

  cluster_name = "dev-eks"

  cluster_version = "1.33"

  vpc_id = module.vpc.vpc_id

  private_subnet_ids = module.vpc.private_subnet_ids

  cluster_role_arn = module.eks_iam.cluster_role_arn

  node_role_arn = module.eks_iam.node_role_arn

  managed_node_groups = {

    system = {

      desired_size = 2

      min_size = 2

      max_size = 3

      instance_types = [

        "t3.medium"

      ]

      capacity_type = "ON_DEMAND"

      labels = {

        role = "system"

      }

      taints = []

    }

    applications = {

      desired_size = 2

      min_size = 1

      max_size = 5

      instance_types = [

        "t3.medium"

      ]

      capacity_type = "SPOT"

      labels = {

        role = "application"

      }

      taints = []

    }

  }

  endpoint_private_access = true

  endpoint_public_access = true

  tags = {

    Environment = "dev"

    Project = "terraform-aws-eks-platform"

    Terraform = "true"

  }
  depends_on = [
    module.eks_iam
  ]

}


module "ebs_csi_irsa" {

  source = "../../modules/irsa"

  cluster_name = module.eks.cluster_name

  oidc_provider_arn = module.eks.oidc_provider_arn

  oidc_provider_url = module.eks.oidc_provider_url

  namespace = "kube-system"

  service_account_name = "ebs-csi-controller-sa"

  role_name = "dev-eks-ebs-csi-irsa"

  policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  ]

  tags = local.common_tags
}


module "alb_controller_irsa" {

  source = "../../modules/irsa"

  cluster_name = module.eks.cluster_name

  oidc_provider_arn = module.eks.oidc_provider_arn

  oidc_provider_url = module.eks.oidc_provider_url

  namespace = "kube-system"

  service_account_name = "aws-load-balancer-controller"

  role_name = "dev-aws-load-balancer-controller-irsa"

  policy_arns = [
    module.alb_controller_iam.policy_arn
  ]

  tags = local.common_tags
}


module "alb_controller_iam" {

  source = "../../modules/aws-load-balancer-controller"

  cluster_name = module.eks.cluster_name
}


module "eks_addons" {
  source = "../../modules/eks-addons"

  cluster_name    = module.eks.cluster_name
  cluster_version = "1.33"

  ebs_csi_irsa_role_arn = module.ebs_csi_irsa.role_arn

  tags = {
    Environment = "dev"
    Project     = "terraform-aws-eks-platform"
    Terraform   = "true"
  }

  depends_on = [
    module.eks
  ]
}

module "ecr" {

  source = "../../modules/ecr"

  repository_name = "fastapi-gitops-demo"

  tags = local.common_tags
}