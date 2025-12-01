output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "worker_node_group_one_sg_id" {
  value = module.eks.node_security_group_id
}



output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}

output "vpc_id" {
  description = "vpc id"
  value = module.vpc.vpc_id
}

output "private_subnets" {
  description = "private subnets"
  value = module.vpc.private_subnets
}



