#-------------General-------------------#
region = "eu-south-1"

#-------------VPC-------------------#
vpc_cidr                  = "10.0.0.0/16"
vpc_name                  = "CI/CD VPC"
public_subnet_1_cidr      = "10.0.1.0/24"
public_subnet_2_cidr      = "10.0.2.0/24"
private_app_subnet_1_cidr = "10.0.3.0/24"
private_app_subnet_2_cidr = "10.0.4.0/24"
private_db_subnet_1_cidr  = "10.0.5.0/24"
private_db_subnet_2_cidr  = "10.0.6.0/24"

#-------------EC2-------------------#
ec2_instance_type = "t3.micro"
ami               = "ami-0185600d76ba787f4"  # Update for your region
key_name          = "ssh_key_aws"
# public_key is passed via GitHub Secret: TF_VAR_public_key

#-------------ALB-------------------#
alb_name          = "my-application-load-balancer"
target_group_name = "my-alb-target-group"
