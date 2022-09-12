variable "aws_region" {
  default = "us-east-2"
}

variable "aws_profile" {
  description = "The profile in your aws-creds file to authenticate as"
  default = "556086542069_AWS-Profile"
}

variable "aws_availability_zone" {
  default = "us-east-2a"
}

variable "vpc-cidr" {
  default = "10.0.0.0/16"
  description = "VPC CIDR BLOCK"
  type = string
}

variable "Public_Subnet_1" {
  default = "10.0.0.0/24"
  description = "Public_Subnet_1"
  type = string
}

variable "Private_Subnet_1" {
  default = "10.0.2.0/24"
  description = "Private_Subnet_1"
  type = string
}

variable "ssh-location" {
  default = "<YOUR IP ADDRESS>"
  description = "IP Address to allow access from"
  type = string
}

variable "jump_instance_type" {
  type = string
  default = "t2.micro"
}

variable "db_instance_type" {
  type = string
  default = "r5.large"
}

variable "db_instance_count" {
  type = number
  default = 3
}

variable "key_name" {
  default = "TEST"
  type = string
}

variable "ssh_username" {
  default = "centos"
  type = string
}

variable "ssh_key_path" {
  description = "The full path to the keyfile that corresponds to the aws_key_name"
  default = "/Users/someuser/.ssh/terraform-key.pem"
}

variable "aws_key_name" {
  description = "The name of the AWS key to use"
  default = "terraform-key"
}