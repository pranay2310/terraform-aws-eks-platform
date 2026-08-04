resource "helm_release" "this" {

  name             = "aws-load-balancer-controller"
  repository       = "https://aws.github.io/eks-charts"
  chart            = "aws-load-balancer-controller"

  namespace        = "kube-system"
  create_namespace = false

  atomic          = true
  cleanup_on_fail = true
  wait            = true
  timeout         = 600

  values = [
    templatefile("${path.module}/values.yaml", {
      cluster_name = var.cluster_name
      region       = var.region
      vpc_id       = var.vpc_id
      role_arn     = var.service_account_role_arn
    })
  ]
}