provider "aws" {
  region = var.region
}

locals {
  user_data_variables = {
    aws_ecr_url = var.aws_ecr_url
    aws_repository_name = var.aws_repository_name

    region = var.region
  }
}

module "web_server_cluster" {
  source = "github.com/JorgeCarmine/tf-module-ec2-docker-cluster?ref=v0.0.1"

  cluster_name = "tacos-stage"
  db_remote_state_bucket = "jc-terraform-states"
  db_remote_state_key = "tacos/terraform.tfstate"

	instance_type = "t2.micro"
	min_size = 2
	max_size = 2

	user_data = "user-data.sh"
  user_data_variables = local.user_data_variables
}

