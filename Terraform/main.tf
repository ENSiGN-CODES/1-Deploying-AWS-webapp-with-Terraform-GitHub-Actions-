#---------------- VPC Module ---------------------#
module "vpc" {
  source = "./Modules/VPC"

  vpc_cidr                  = var.vpc_cidr
  vpc_name                  = var.vpc_name
  region                    = var.region
  public_subnet_1_cidr      = var.public_subnet_1_cidr
  public_subnet_2_cidr      = var.public_subnet_2_cidr
  private_app_subnet_1_cidr = var.private_app_subnet_1_cidr
  private_app_subnet_2_cidr = var.private_app_subnet_2_cidr
  private_db_subnet_1_cidr  = var.private_db_subnet_1_cidr
  private_db_subnet_2_cidr  = var.private_db_subnet_2_cidr
}

#---------------- Security Groups Module ---------------------#
module "sg" {
  source = "./Modules/SG"

  vpc_id   = module.vpc.vpc_id
  vpc_cidr = var.vpc_cidr
}

#---------------- EC2 Module ---------------------#
module "ec2" {
  source = "./Modules/EC2"

  ami                     = var.ami
  ec2_instance_type       = var.ec2_instance_type
  region                  = var.region
  key_name                = var.key_name
  public_key              = var.public_key
  bastion_sg_id           = module.sg.bastion_sg_id
  instance_sg_id          = module.sg.instance_sg_id
  public_subnet_1_id      = module.vpc.public_subnet_1_id
  private_app_subnet_1_id = module.vpc.private_app_subnet_1_id
  private_app_subnet_2_id = module.vpc.private_app_subnet_2_id
}

#---------------- ALB Module ---------------------#
module "alb" {
  source = "./Modules/ALB"

  alb_name           = var.alb_name
  target_group_name  = var.target_group_name
  alb_sg_id          = module.sg.alb_sg_id
  vpc_id             = module.vpc.vpc_id
  public_subnet_1_id = module.vpc.public_subnet_1_id
  public_subnet_2_id = module.vpc.public_subnet_2_id
  instance_1_id      = module.ec2.application_instance_1_id
  instance_2_id      = module.ec2.application_instance_2_id
}
