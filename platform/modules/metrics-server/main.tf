resource "helm_release" "this" {

  name             = "metrics-server"
  repository       = "https://kubernetes-sigs.github.io/metrics-server"
  chart            = "metrics-server"

  namespace        = "kube-system"
  create_namespace = false

  atomic           = true
  cleanup_on_fail  = true
  wait             = true
  timeout          = 600

  values = [
    templatefile("${path.module}/values.yaml", {})
  ]
} 