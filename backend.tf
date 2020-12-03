terraform {
  backend "s3" {
    bucket         = "pact-terraform"
    region         = "us-west-2"
    key            = "ECR_SecretBatch.tfstate"
    dynamodb_table = "Terraform_State_Lock"
  }
}
