output "rds" {
  description = "Enpoint do cluster MySQL"
  value = aws_db_instance.rds-mysql.endpoint
}