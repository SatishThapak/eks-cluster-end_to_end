output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the main VPC"
}


output "public_subnet_ids" {
  value       = [for subnet in aws_subnet.public : subnet.id]
  description = "List of public subnet IDs"
}

output "private_subnet_ids" {
  value       = [for subnet in aws_subnet.private : subnet.id]
  description = "List of private subnet IDs"
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.igw.id
  description = "ID of the Internet Gateway attached to the VPC"
}

output "nat_gateway_id" {
  value       = aws_nat_gateway.nat.id
  description = "ID of the NAT Gateway used for private subnet internet access"
}

output "public_route_table_id" {
  value       = aws_route_table.public.id
  description = "Route table ID for public subnets"
}

output "private_route_table_id" {
  value       = aws_route_table.private.id
  description = "Route table ID for private subnets"
}
