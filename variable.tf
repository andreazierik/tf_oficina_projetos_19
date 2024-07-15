# global
variable "projeto" {
  description = "Nome do projeto"
  type        = string
}

variable "default-vpc-name" {
  description = "VPC padrao da conta"
  type        = list(string)
}

variable "public-subnet-name" {
  description = "Subnets publics"
  type        = list(string)
}

variable "private-vpc-name" {
  description = "Subnets publics"
  type        = list(string)
}

# modulo rds
variable "db_engine" {
  description = "Engine do banco de dados"
  type        = string
}

variable "db_engine_version" {
  description = "Versao da engine"
  type        = string
}

variable "db_instance" {
  description = "Tipo da instancia pro banco de dados"
  type        = string
}

variable "db_username" {
  description = "Perfil para administrar o banco de dados"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Senha do administrador"
  type        = string
  sensitive   = true
}

# modulo ec2
variable "qtd" {
  description = "Quantidade de instancias EC2"
  type        = number
}

variable "instance_type" {
  description = "Tipo de instancia para subir as EC2"
  type        = string
}

variable "ssh_key" {
  description = "Chave SSH para conectar nas maquinas"
  type        = string
}