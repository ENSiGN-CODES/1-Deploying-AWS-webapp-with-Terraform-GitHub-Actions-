output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.my_vpc.id
}

output "public_subnet_1_id" {
  description = "ID of public subnet 1"
  value       = aws_subnet.public_subnet_1.id
}

output "public_subnet_2_id" {
  description = "ID of public subnet 2"
  value       = aws_subnet.public_subnet_2.id
}

output "private_app_subnet_1_id" {
  description = "ID of private app subnet 1"
  value       = aws_subnet.private_app_subnet_1.id
}

output "private_app_subnet_2_id" {
  description = "ID of private app subnet 2"
  value       = aws_subnet.private_app_subnet_2.id
}

output "private_db_subnet_1_id" {
  description = "ID of private DB subnet 1"
  value       = aws_subnet.private_db_subnet_1.id
}

output "private_db_subnet_2_id" {
  description = "ID of private DB subnet 2"
  value       = aws_subnet.private_db_subnet_2.id
}

output "eip_public_ip" {
  description = "Public IP of the Elastic IP"
  value       = aws_eip.eip.public_ip
}
