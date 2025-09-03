variable "cidr_block" {}
variable "vpc_name" {}
variable "public_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
}
variable "private_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
}
variable "project_name" {}
variable "environment" {}
