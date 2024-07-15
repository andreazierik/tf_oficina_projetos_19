# criando security group
resource "aws_security_group" "magento" {
  name   = "${var.projeto}_sg"
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.projeto}_sg"
  }
}

resource "aws_security_group_rule" "redis-ingress" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = aws_security_group.magento.id
  cidr_blocks       = ["45.230.103.46/32"]

  depends_on = [ aws_security_group.magento ]
}

resource "aws_security_group_rule" "elasticsearch-ingress" {
  type              = "ingress"
  from_port         = 9200
  to_port           = 9200
  protocol          = "tcp"
  security_group_id = aws_security_group.magento.id
  cidr_blocks       = ["45.230.103.46/32"]

  depends_on = [ aws_security_group.magento ]
}

resource "aws_security_group_rule" "http-ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.magento.id
  cidr_blocks       = ["45.230.103.46/32"]

  depends_on = [ aws_security_group.magento ]
}

resource "aws_security_group_rule" "https-ingress" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.magento.id
  cidr_blocks       = ["45.230.103.46/32"]

  depends_on = [ aws_security_group.magento ]
}

resource "aws_security_group_rule" "magento-egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.magento.id
  cidr_blocks       = ["0.0.0.0/0"]

  depends_on = [ aws_security_group.magento ]
}

# recupera informacoes da distro debian 12
data "aws_ami" "debian-12" {
  most_recent = true

  filter {
    name   = "name"
    values = ["debian-12-amd64-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["136693071363"]
}

resource "aws_instance" "web" {
  count                  = var.qtd
  ami                    = data.aws_ami.debian-12.id
  instance_type          = var.instance_type
  key_name               = var.ssh_key
  vpc_security_group_ids = [aws_security_group.magento.id]
  subnet_id              = var.public_subnet

  root_block_device {
    delete_on_termination = true
    encrypted             = true
    volume_size           = "14"
    volume_type           = "gp3"

    tags = {
      Name = "${var.projeto}-${count.index + 1}"
    }
  }

  tags = {
    Name = "${var.projeto}-${count.index + 1}"
  }
}