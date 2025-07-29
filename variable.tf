variable "vpc_name" {}
variable "cidr_block" {

}
variable "public_subnets" {}
variable "private_subnets" {}
variable "env" {}
variable "availability_zone" {}
variable "environment" {
  default     = "dev"
  description = "Environment name"
}

variable "project_name" {
  description = "Name of the project"
}
