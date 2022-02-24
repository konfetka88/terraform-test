variable "region" {
  type = string
  description = "Region to be used"
}
variable "cluster_name" {
  type = string
  description = "Cluster name used"
}
variable "cluster_version" {
  default = "1.22"
  description = "Cluster name used"
}
variable "instance_type" {
  description = "Cluster name used"
  type = string
}
variable "asg_max_size" {
  description = "Tag names used"
  type = string
}
variable "asg_min_size" {
  description = "Tag names used"
  type = string
}
variable "tags" {
  description = "Tag names used"
  type = map(any)
}