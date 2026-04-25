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

variable "alb_sg_id" {
  description = "Security group ID for the ALB"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_1_id" {
  description = "ID of public subnet 1"
  type        = string
}

variable "public_subnet_2_id" {
  description = "ID of public subnet 2"
  type        = string
}

variable "instance_1_id" {
  description = "ID of EC2 application instance 1"
  type        = string
}

variable "instance_2_id" {
  description = "ID of EC2 application instance 2"
  type        = string
}
