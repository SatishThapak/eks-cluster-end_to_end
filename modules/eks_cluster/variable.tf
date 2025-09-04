variable "project_name" {}
variable "environment" {}
variable "cluster_role_arn" {}
variable "worker_role_arn" {}
variable "subnet_ids" {
  type = list(string)
}
variable "instance_type" {
  default = "t3.medium"
}
variable "desired_size" {
  default = 2
}
variable "min_size" {
  default = 1
}
variable "max_size" {
  default = 3
}
