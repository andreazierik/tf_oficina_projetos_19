output "vpc-id" {
  description = "Exportando o VPC ID para utilizar em outros modulos"
  value       = data.aws_vpcs.default-vpc.ids[0]
}

output "public-subnet" {
  description = "Exportando os IDs das subnets publicas para utilizar em outros modulos"
  value       = data.aws_subnets.public-subnets.ids
}

output "private-subnet" {
  description = "Exportando os IDs das subnets privadas para utilizar em outros modulos"
  value       = data.aws_subnets.private-subnets.ids
}