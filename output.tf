output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "sg_id" {
  value = module.security_group.security_group_id
}

output "sg_name" {
  value = module.security_group.security_group_name
}

output "eks_master_role_name" {
  value = module.iam_roles.eks_master_role_name
}

output "eks_worker_role_name" {
  value = module.iam_roles.eks_worker_role_name
}

output "eks_worker_instance_profile_name" {
  value = module.iam_roles.eks_worker_instance_profile_name
}

output "jump_host_role_name" {
  value = module.iam_roles.jump_host_role_name
}

output "jump_host_instance_profile_name" {
  value = module.iam_roles.jump_host_instance_profile_name
}

output "eks_cluster_name" {
  value = module.eks_cluster.cluster_name
}

output "eks_node_group_name" {
  value = module.eks_cluster.node_group_name
}
