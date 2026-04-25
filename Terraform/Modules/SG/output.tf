output "alb_sg_id" {
  description = "ID of the ALB security group"
  value       = aws_security_group.ALBSG.id
}

output "bastion_sg_id" {
  description = "ID of the Bastion security group"
  value       = aws_security_group.BastionSG.id
}

output "instance_sg_id" {
  description = "ID of the EC2 instance security group"
  value       = aws_security_group.InstanceSG.id
}

output "rds_sg_id" {
  description = "ID of the RDS security group"
  value       = aws_security_group.RDSSG.id
}

output "elasticache_sg_id" {
  description = "ID of the ElastiCache security group"
  value       = aws_security_group.ElastiCacheSG.id
}
