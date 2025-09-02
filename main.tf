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
