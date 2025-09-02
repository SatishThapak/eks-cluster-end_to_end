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
