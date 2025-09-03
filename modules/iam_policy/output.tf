output "eks_cluster_policy_attachment" {
  value = aws_iam_role_policy_attachment.eks_cluster_policy
}

output "eks_service_policy_attachment" {
  value = aws_iam_role_policy_attachment.eks_service_policy
}

output "eks_vpc_controller_policy_attachment" {
  value = aws_iam_role_policy_attachment.eks_vpc_controller_policy
}

output "eks_worker_node_policy_attachment" {
  value = aws_iam_role_policy_attachment.eks_worker_node_policy
}

output "eks_cni_policy_attachment" {
  value = aws_iam_role_policy_attachment.eks_cni_policy
}

output "ecr_readonly_policy_attachment" {
  value = aws_iam_role_policy_attachment.ecr_readonly_policy
}
