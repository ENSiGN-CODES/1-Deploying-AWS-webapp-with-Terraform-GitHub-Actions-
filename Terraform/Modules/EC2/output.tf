output "bastion_public_ip" {
  description = "Public IP of the Bastion host"
  value       = aws_instance.bastion_instance.public_ip
}

output "application_instance_1_id" {
  description = "ID of application instance 1"
  value       = aws_instance.application_instance_1.id
}

output "application_instance_2_id" {
  description = "ID of application instance 2"
  value       = aws_instance.application_instance_2.id
}

output "application_instance_1_private_ip" {
  description = "Private IP of application instance 1"
  value       = aws_instance.application_instance_1.private_ip
}

output "application_instance_2_private_ip" {
  description = "Private IP of application instance 2"
  value       = aws_instance.application_instance_2.private_ip
}
