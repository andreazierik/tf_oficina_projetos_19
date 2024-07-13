# recuperar vpc-id
data "aws_vpcs" "default-vpc" {
  filter {
    name   = "tag:Name"
    values = var.default-vpc-name
  }
}

# recuperar subnets publicas
data "aws_subnets" "public-subnets" {
  filter {
    name   = "tag:Name"
    values = var.public-subnet-name
  }
}

# recuperar subnets privadas
data "aws_subnets" "private-subnets" {
  filter {
    name   = "tag:Name"
    values = var.private-vpc-name
  }
}