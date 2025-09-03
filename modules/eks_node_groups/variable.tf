variable "cluster_name" {}
variable "node_group_name" {}
variable "node_role_arn" {}
variable "subnet_ids" {
  type = list(string)
}
variable "instance_types" {
  type = list(string)
}
variable "capacity_type" {}
variable "disk_size" {
  type = number
}
variable "desired_size" {
  type = number
}
variable "max_size" {
  type = number
}
variable "min_size" {
  type = number
}
variable "max_unavailable" {
  type = number
}
variable "labels" {
  type = map(string)
}
variable "tags" {
  type = map(string)
}
variable "node_dependencies" {
  type    = list(any)
  default = []
}
