# Environment
variable "Environment"{
  type = string
}

# Stack name
variable "project_name" {
  type = string
}

# VPC CIDR
variable "vpc_cidr" {
  type    = string
}

variable "private_subnets" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}
