data "aws_subnets" "public-subnets" {
  filter {
    name   = "tag:Name"
    values = ["Public-*"]
  }
}

output "aws_subnets" {
  value = data.aws_subnets.public-subnets[*]
}