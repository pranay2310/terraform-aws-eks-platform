module "aws_load_balancer_controller" {

  source = "../../modules/aws-load-balancer-controller"

  values_file = "../../helm/aws-load-balancer-controller/values.yaml"
}