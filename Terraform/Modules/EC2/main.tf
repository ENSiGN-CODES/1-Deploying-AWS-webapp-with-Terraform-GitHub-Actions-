#-------------SSH Key Pair-------------------#
resource "aws_key_pair" "ssh_key" {
  key_name   = var.key_name
  public_key = var.public_key
}

#-------------Bastion Host-------------------#
resource "aws_instance" "bastion_instance" {
  ami                         = var.ami
  instance_type               = var.ec2_instance_type
  availability_zone           = "${var.region}a"
  vpc_security_group_ids      = [var.bastion_sg_id]
  key_name                    = aws_key_pair.ssh_key.key_name
  subnet_id                   = var.public_subnet_1_id
  associate_public_ip_address = true

  tags = {
    Name = "Bastion"
  }
}

#-------------Application Instance 1-------------------#
resource "aws_instance" "application_instance_1" {
  ami                    = var.ami
  instance_type          = var.ec2_instance_type
  availability_zone      = "${var.region}a"
  vpc_security_group_ids = [var.instance_sg_id]
  key_name               = aws_key_pair.ssh_key.key_name
  subnet_id              = var.private_app_subnet_1_id

  tags = {
    Name = "application_instance_1"
  }
}

#-------------Application Instance 2-------------------#
resource "aws_instance" "application_instance_2" {
  ami                    = var.ami
  instance_type          = var.ec2_instance_type
  availability_zone      = "${var.region}b"
  vpc_security_group_ids = [var.instance_sg_id]
  key_name               = aws_key_pair.ssh_key.key_name
  subnet_id              = var.private_app_subnet_2_id

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Hello World from $(hostname -f)<br> This is The 2nd EC2 Instance</h1>" > /var/www/html/index.html
    EOF

  tags = {
    Name = "application_instance_2"
  }
}
