# RDS Security Group
resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Security group for RDS accessible from EKS nodes"
  vpc_id      = var.vpc_id   # Use the same VPC as EKS

  tags = {
    Name = "rds-sg"
  }
}


resource "aws_security_group_rule" "ingress" {
  type              = "ingress"
  from_port         = 1433
  to_port           = 1433
  protocol          = "tcp"
  security_group_id = aws_security_group.rds_sg.id
  source_security_group_id = var.cluster_security_group_id  # EKS nodes SG
}

resource "aws_security_group_rule" "allow_all_traffic_ipv4" {
  type              = "egress"
  security_group_id = aws_security_group.rds_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
}


# DB Subnet Group
resource "aws_db_subnet_group" "subnet_group" {
  name       = "db_grp"
  subnet_ids = var.private_subnets # Use EKS private subnets

  tags = {
    Name = "db_subnet_group"
  }
}
# DB instance
resource "aws_db_instance" "rds" {
  allocated_storage    = var.allocated_storage
  storage_type         = "gp2"
  #db_name              = var.db_name
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  publicly_accessible  = false
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name = aws_db_subnet_group.subnet_group.name
}
