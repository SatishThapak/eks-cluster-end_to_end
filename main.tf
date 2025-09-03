module "vpc" {
  source          = "./modules/networking"
  cidr_block      = var.cidr_block
  vpc_name        = var.vpc_name
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  project_name    = var.project_name
  environment     = var.environment
}

module "security_group" {
  source       = "./modules/security_groups"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
  environment  = var.environment
}

module "aws_iam_policy" {
  source       = "./modules/iam_policy"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
  environment  = var.environment
  iam_role     = var.iam_role
}

module "aws_jump_host" {
  source                = "./modules/jump_host"
  project_name          = var.project_name
  instance_name         = var.instance_name
  instance_type         = var.instance_type
  environment           = var.environment
  ami_id                = var.ami_id
  region                = var.region
  subnet_id             = module.vpc.public_subnet_ids[0]
  iam_role              = module.aws_iam_policy.jump_host_role_name
  security_group_id     = module.security_group.security_group_id
  instance_profile_name = module.aws_iam_policy.jump_host_instance_profile_name
  instance_profile_id   = module.aws_iam_policy.jump_host_instance_profile_id
}

module "eks_cluster" {
  source              = "./modules/eks_cluster"
  cluster_name        = var.cluster_name
  master_role_arn     = aws_iam_role.eks_master.arn
  private_subnet_ids  = module.vpc.private_subnet_ids
  tags                = var.local

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy,
    aws_iam_role_policy_attachment.eks_service_policy,
    aws_iam_role_policy_attachment.eks_vpc_controller_policy
  ]
}

module "eks_node_group" {
  source           = "./modules/eks_node_groups"
  cluster_name     = module.eks_cluster.cluster_name
  node_group_name  = "project-node-group"
  node_role_arn    = module.aws_iam_policy.eks_master_role_arn
  subnet_ids       = module.network.private_subnet_ids
  instance_types   = ["t3.medium"]
  capacity_type    = "ON_DEMAND"
  disk_size        = 20
  desired_size     = 2
  max_size         = 4
  min_size         = 1
  max_unavailable  = 1
  labels           = { env = "dev" }
  tags             = {
    Name        = "project-node-group"
    Environment = var.environment
    Project     = var.project_name
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_node_policy,
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.ecr_readonly_policy
  ]
}