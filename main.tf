module "vpc" {
  source          = "./modules/networking"
  cidr_block      = var.cidr_block
  vpc_name        = var.vpc_name
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  project_name    = var.project_name
  environment     = var.environment
  aws_security_group = var.aws_security_group
}

