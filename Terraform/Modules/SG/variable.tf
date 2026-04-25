variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC (used for RDS and ElastiCache SG rules)"
  type        = string
}
