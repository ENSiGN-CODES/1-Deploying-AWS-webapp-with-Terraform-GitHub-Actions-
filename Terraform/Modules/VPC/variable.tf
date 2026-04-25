variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
  default     = "CI/CD VPC"
}

variable "region" {
  description = "AWS region"
  type        = string
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
