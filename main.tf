module "eks" {
  source = "./eks"
  region = var.region
}

module "secrets" {
  source   = "./secrets"
  password = var.password
}

# sqlserver db
module "rds" {
  source                    = "./rds"
  vpc_id                    = module.eks.vpc_id
  private_subnets           = module.eks.private_subnets
  cluster_security_group_id = module.eks.worker_node_group_one_sg_id
  allocated_storage         = 20
  engine                    = "sqlserver-ex"
  engine_version            = "15.00.4445.1.v1"
  instance_class            = "db.t3.micro"
  username                  = "admin"
  password                  = module.secrets.db_password
}

