output "database_name" {
  description = "RDS Database Name"
  value = aws_db_instance.rds.db_name
}

output "rds_db_endpoint" {
  description = "RDS Database Endpoint"
  value = aws_db_instance.rds.endpoint
}
