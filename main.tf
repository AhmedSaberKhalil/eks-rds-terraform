module "eks" {
  source = "./eks"
  region = var.region
}

module "secrets" {
  source   = "./secrets"
  password = var.password
}

module "rds" {
  source                    = "./rds"
  vpc_id                    = module.eks.vpc_id
  private_subnets           = module.eks.private_subnets
  cluster_security_group_id = module.eks.cluster_security_group_id
  allocated_storage         = 20
  db_name                   = "mydatabase"
  engine                    = "mysql"
  engine_version            = "8.0"
  instance_class            = "db.t3.micro"
  username                  = "admin"
  password                  = module.secrets.db_password
}
