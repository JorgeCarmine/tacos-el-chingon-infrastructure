/*
output "container_vars" {
  value = module.web_server_cluster.container_vars
  description = "Variables de script sh"
}
*/

output "aws_ecr_url" {
    value = var.aws_ecr_url
}

output "aws_repository_name" {
    value = var.aws_repository_name
}

output "user_data_variables" {
  value = local.user_data_variables
}
