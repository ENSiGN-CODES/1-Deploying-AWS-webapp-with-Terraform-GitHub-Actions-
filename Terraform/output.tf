output "alb_dns_name" {
  description = "Access your app via this URL"
  value       = module.alb.alb_dns_name
}

output "bastion_public_ip" {
  description = "Public IP to SSH into the Bastion host"
  value       = module.ec2.bastion_public_ip
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "nat_eip" {
  description = "Elastic IP of the NAT Gateway"
  value       = module.vpc.eip_public_ip
}
