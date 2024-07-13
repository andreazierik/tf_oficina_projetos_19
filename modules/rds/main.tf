# criar subnet groups para utilizar no rds
resource "aws_db_subnet_group" "private-subnet-group" {
  name       = "${var.projeto}_db_subnet_group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "${var.projeto}_db_subnet_group"
  }
}

# security group rds
resource "aws_security_group" "rds-mysql-sg" {
  name   = "${var.projeto}_sg_mysql"
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.projeto}_sg_mysql"
  }
}

# regras do security group
resource "aws_security_group_rule" "ec2-to-rds" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = aws_security_group.rds-mysql-sg.id
  cidr_blocks       = ["0.0.0.0/0"] # alterar quando subir as ec2
}

resource "aws_db_instance" "rds-mysql" {
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  multi_az               = false
  identifier             = "${var.projeto}-db"
  username               = var.db_username
  password               = var.db_password
  instance_class         = var.db_instance
  db_subnet_group_name   = aws_db_subnet_group.private-subnet-group.name
  vpc_security_group_ids = [aws_security_group.rds-mysql-sg.id]
  skip_final_snapshot    = true
  allocated_storage      = 20
  storage_type           = "gp3"

  tags = {
    Name = "${var.projeto}-magento"
  }
}
