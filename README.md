# Deploy an Entire EKS + RDS Infrastructure Automatically Using Terraform

## The goal of this project: fully automate the creation of a production-ready Kubernetes environment on AWS using Terraform.

### With a single `terraform apply`, this project will:
- Create a VPC with public/private subnets  
- Deploy an EKS Cluster (Kubernetes)  
- Create two managed node groups  
- Deploy a private RDS database (SQL Server)  
- Create security groups so only EKS nodes can access the database  
- Store the database password in AWS Secrets Manager

