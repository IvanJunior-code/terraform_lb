##################### Variables #####################
variable "region" {
  default = "us-east-1"
}

variable "access_key" {
}

variable "instance_type" {
  default = "t3.small"
}

variable "ami" {
  default = ["ami-01c146ce0993b7884", "ami-0f9b57fe51681be3f"] #Ubuntu-2023-10-27T15-45 e Nginx 1.20.2 on ubuntu 18.04
}

variable "key_name" {
  default = "us-east-1_work"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zone" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "sg_name" {
  default = "sg_terraform"
}
##################### ######### #####################