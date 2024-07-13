module "data" {
  source = "./modules/data_value"

  default-vpc-name   = var.default-vpc-name
  public-subnet-name = var.public-subnet-name
  private-vpc-name   = var.private-vpc-name
}

module "rds" {
  source = "./modules/rds"

  # global
  projeto         = var.projeto
  vpc_id          = module.data.vpc-id
  private_subnets = module.data.private-subnet

  # rds
  db_engine         = var.db_engine
  db_engine_version = var.db_engine_version
  db_instance       = var.db_instance
  db_username       = var.db_username
  db_password       = var.db_password

  depends_on = [module.data]
}