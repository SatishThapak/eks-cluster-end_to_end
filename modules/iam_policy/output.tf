# EKS Master Role Outputs
output "eks_master_role_name" {
  value       = aws_iam_role.master.name
  description = "Name of the IAM role for EKS master"
}

output "eks_master_role_arn" {
  value       = aws_iam_role.master.arn
  description = "ARN of the IAM role for EKS master"
}

# EKS Worker Role Outputs
output "eks_worker_role_name" {
  value       = aws_iam_role.worker.name
  description = "Name of the IAM role for EKS worker nodes"
}

output "eks_worker_role_arn" {
  value       = aws_iam_role.worker.arn
  description = "ARN of the IAM role for EKS worker nodes"
}

output "eks_worker_instance_profile_name" {
  value       = aws_iam_instance_profile.worker.name
  description = "Name of the IAM instance profile for EKS worker nodes"
}

output "eks_worker_instance_profile_arn" {
  value       = aws_iam_instance_profile.worker.arn
  description = "ARN of the IAM instance profile for EKS worker nodes"
}

# Autoscaler Policy Output
output "autoscaler_policy_arn" {
  value       = aws_iam_policy.autoscaler.arn
  description = "ARN of the custom autoscaler policy"
}

# Jump Host Role Outputs
output "jump_host_role_name" {
  value       = aws_iam_role.jump_host_role.name
  description = "Name of the IAM role for the jump host"
}

output "jump_host_role_arn" {
  value       = aws_iam_role.jump_host_role.arn
  description = "ARN of the IAM role for the jump host"
}

output "jump_host_instance_profile_name" {
  value       = aws_iam_instance_profile.jump_host_profile.name
  description = "Name of the IAM instance profile for the jump host"
}

output "jump_host_instance_profile_arn" {
  value       = aws_iam_instance_profile.jump_host_profile.arn
  description = "ARN of the IAM instance profile for the jump host"
}

output "jump_host_instance_profile_id" {
  value       = aws_iam_instance_profile.jump_host_profile.id
  description = "ID of the IAM instance profile for the jump host"
}
