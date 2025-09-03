variable "cluster_name" {}
variable "master_role_arn" {}
variable "private_subnet_ids" {
  type = list(string)
}
variable "tags" {
  type = map(string)
}
variable "cluster_dependencies" {
  type    = list(any)
  default = []
}
