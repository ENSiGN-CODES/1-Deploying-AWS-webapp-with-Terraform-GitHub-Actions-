#-------------General-------------------#
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

#-------------VPC-------------------#
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
  default     = "CI/CD VPC"
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for public subnet 1"
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for public subnet 2"
  type        = string
}

variable "private_app_subnet_1_cidr" {
  description = "CIDR block for private app subnet 1"
  type        = string
}

variable "private_app_subnet_2_cidr" {
  description = "CIDR block for private app subnet 2"
  type        = string
}

variable "private_db_subnet_1_cidr" {
  description = "CIDR block for private DB subnet 1"
  type        = string
}

variable "private_db_subnet_2_cidr" {
  description = "CIDR block for private DB subnet 2"
  type        = string
}

#-------------EC2-------------------#
variable "ami" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "public_key" {
  description = "Public SSH key content"
  type        = string
  sensitive   = true
}

#-------------ALB-------------------#
variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
  default     = "my-application-load-balancer"
}

variable "target_group_name" {
  description = "Name of the ALB target group"
  type        = string
  default     = "my-alb-target-group"
}
