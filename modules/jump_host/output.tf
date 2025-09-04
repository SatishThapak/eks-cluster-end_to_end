output "instance_id" {
  value = aws_instance.jump_host.id
}

output "public_ip" {
  value = aws_instance.jump_host.public_ip
}

output "availability_zone" {
  value = aws_instance.jump_host.availability_zone
}
