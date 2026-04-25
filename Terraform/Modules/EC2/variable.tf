variable "ami" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "public_key" {
  description = "Public SSH key content"
  type        = string
}

variable "bastion_sg_id" {
  description = "Security group ID for the Bastion host"
  type        = string
}

variable "instance_sg_id" {
  description = "Security group ID for application instances"
  type        = string
}

variable "public_subnet_1_id" {
  description = "ID of public subnet 1 (for bastion)"
  type        = string
}

variable "private_app_subnet_1_id" {
  description = "ID of private app subnet 1"
  type        = string
}

variable "private_app_subnet_2_id" {
  description = "ID of private app subnet 2"
  type        = string
}
