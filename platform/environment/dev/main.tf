module "aws_load_balancer_controller" {

  source = "../../modules/aws-load-balancer-controller"

  cluster_name = data.aws_eks_cluster.this.name

  region = var.aws_region

  vpc_id = data.aws_eks_cluster.this.vpc_config[0].vpc_id

  service_account_role_arn = "arn:aws:iam::376903139238:role/dev-aws-load-balancer-controller-irsa"

}

module "metrics_server" {

  source = "../../modules/metrics-server"

}

module "argocd" {

  source = "../../modules/argocd"

}
