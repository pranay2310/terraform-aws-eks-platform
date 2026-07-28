terraform {
  backend "s3" {
    bucket         = "pranay-dev-terraform-state-001"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-aws-eks-platform-dev-tf-lock"
    encrypt        = true
  }
}