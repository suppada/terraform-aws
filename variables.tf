variable "ec2_count" {
  type    = string
  default = "3"
}
variable "ami_id" {
  type    = string
  default = "ami-0fc82f4dabc05670b"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
# variable "s3_bucket" {
#   type    = string
#   default = "terraform-gitactions"
# }
variable "key_name" {
  type    = string
  default = "dev"
}
variable "instance_name" {
  type    = string
  default = "devops"
}
variable "aws_region" {
  type    = string
  default = "us-east-2"
}
variable "subnet_id" {
  type    = string
  default = "subnet-00a377e64a070a266"
}
variable "environment_tag" {
  type    = string
  default = "Dev"
}
variable "role_name" {
  type    = string
  default = "devops"
}
variable "instance_profile" {
  type    = string
  default = "cisdevops"
}
variable "role_policy" {
  type    = string
  default = "cisdevops"
}
variable "security_group_name" {
  type    = string
  default = "devops"
}
variable "owner" {
  type    = string
  default = "navik"
}
variable "project" {
  type    = string
  default = "devops"
}
variable "volume_size" {
  type    = string
  default = "30"
}
