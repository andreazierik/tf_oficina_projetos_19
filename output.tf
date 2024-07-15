output "network-info" {
  description = "Exportando informações de rede (VPC e Subnets) do modulo de rede"
  value = {
    vpc_id         = module.data.vpc-id
    public_subnet  = module.data.public-subnet
    private_subnet = module.data.private-subnet
  }
}

output "rds-endpoint" {
  description = "Enpoint do cluster MySQL"
  value = module.rds.rds
}