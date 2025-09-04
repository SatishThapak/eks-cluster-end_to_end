output "eks_master_role_name" {
  value = aws_iam_role.eks_master.name
}

output "eks_master_role_arn" {
  value = aws_iam_role.eks_master.arn
}
output "eks_worker_role_arn" {
  value = aws_iam_role.eks_worker.arn
}


output "eks_worker_role_name" {
  value = aws_iam_role.eks_worker.name
}

output "eks_worker_instance_profile_name" {
  value = aws_iam_instance_profile.eks_worker_profile.name
}

output "eks_worker_instance_profile_id" {
  value = aws_iam_instance_profile.eks_worker_profile.id
}

output "cluster_autoscaler_policy_arn" {
  value = aws_iam_policy.cluster_autoscaler.arn
}

output "jump_host_role_name" {
  value = aws_iam_role.jump_host.name
}

output "jump_host_instance_profile_name" {
  value = aws_iam_instance_profile.jump_host_profile.name
}

output "jump_host_instance_profile_id" {
  value = aws_iam_instance_profile.jump_host_profile.id
}
