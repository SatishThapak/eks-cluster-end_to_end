resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = var.master_role_arn

  vpc_config {
    subnet_ids              = var.private_subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  tags = var.tags
}
