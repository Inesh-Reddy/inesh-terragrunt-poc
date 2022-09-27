# Indicate what region to deploy the resources into
 generate "provider" {
   path = "provider.tf"
   if_exists = "overwrite_terragrunt"
   contents = <<EOF
 provider "aws" {
   region = "us-east-1"  
 }
 EOF
 }
/*
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "inception-terragrunt-test-poc"    
    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-west-1"
    encrypt        = true
    dynamodb_table = "my-lock-table-1"
  }
}
*/

generate "remote_state" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "sentinel-test32"
    workspaces {
      name = "repoB"
    }
  }
}
EOF
}

