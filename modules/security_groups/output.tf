output "security_group_id" {
  value       = aws_security_group.security_group.id
  description = "The ID of the Jenkins/Sonarqube security group"
}

output "security_group_name" {
  value       = aws_security_group.security_group.name
  description = "The name of the Jenkins/Sonarqube security group"
}

output "security_group_arn" {
  value       = aws_security_group.security_group.arn
  description = "The ARN of the Jenkins/Sonarqube security group"
}
