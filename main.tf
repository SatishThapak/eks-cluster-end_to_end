module "networking" {
  source          = "./modules/networking"
  project_name    = var.project_name
  Environment     = var.Environment
  vpc_cidr        = var.vpc_cidr
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
}
