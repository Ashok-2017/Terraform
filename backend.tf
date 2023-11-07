terraform {
  backend "s3" {
   bucket        = "ashok_test"
    key           = "api_gateway/ashok/terraform.tfstate"
    role_arn      = "arn:aws:iam:::role/devops"
    session_name  = "devops_test"
    region        = "us-east-1"
    profile       = "infra"
  }
}
    
