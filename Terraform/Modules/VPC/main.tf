#-------------VPC----------------------#
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

#-------------Internet Gateway----------------------#
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
}

#-------------Elastic IP----------------------#
resource "aws_eip" "eip" {
  vpc = true
}

#-------------NAT Gateway----------------------#
resource "aws_nat_gateway" "az1_nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "AZ1 NAT"
  }

  depends_on = [aws_internet_gateway.igw]
}

#-------------Public Subnets-------------------#
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_subnet_1_cidr
  availability_zone = "${var.region}a"
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_subnet_2_cidr
  availability_zone = "${var.region}b"
}

#-------------Private App Subnets-------------------#
resource "aws_subnet" "private_app_subnet_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_app_subnet_1_cidr
  availability_zone = "${var.region}a"
}

resource "aws_subnet" "private_app_subnet_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_app_subnet_2_cidr
  availability_zone = "${var.region}b"
}

#-------------Private DB Subnets-------------------#
resource "aws_subnet" "private_db_subnet_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_db_subnet_1_cidr
  availability_zone = "${var.region}a"
}

resource "aws_subnet" "private_db_subnet_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_db_subnet_2_cidr
  availability_zone = "${var.region}b"
}

#-------------Route Tables----------------------#
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table" "private_app_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.az1_nat.id
  }

  tags = {
    Name = "private_app_route_table"
  }
}

resource "aws_route_table" "private_db_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.az1_nat.id
  }

  tags = {
    Name = "private_db_route_table"
  }
}

#----------------Route Table Associations-------------------#
resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_app_1" {
  subnet_id      = aws_subnet.private_app_subnet_1.id
  route_table_id = aws_route_table.private_app_route_table.id
}

resource "aws_route_table_association" "private_app_2" {
  subnet_id      = aws_subnet.private_app_subnet_2.id
  route_table_id = aws_route_table.private_app_route_table.id
}

resource "aws_route_table_association" "private_db_1" {
  subnet_id      = aws_subnet.private_db_subnet_1.id
  route_table_id = aws_route_table.private_db_route_table.id
}

resource "aws_route_table_association" "private_db_2" {
  subnet_id      = aws_subnet.private_db_subnet_2.id
  route_table_id = aws_route_table.private_db_route_table.id
}
