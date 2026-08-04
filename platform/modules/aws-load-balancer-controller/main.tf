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
    file(var.values_file)
  ]
}