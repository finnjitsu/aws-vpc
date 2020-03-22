/******************************************************************************
*                                                                             *
* VPC's and subnets                                                           *
*                                                                             *
******************************************************************************/

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.stack_name}-main"
  }
}

resource "aws_subnet" "app_subnet_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.app_subnet_a_cidr
  availability_zone = "${var.region}a"
  tags = {
    Name = "${var.stack_name}-app-subnet-a"
  }
}

resource "aws_subnet" "app_subnet_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.app_subnet_b_cidr
  availability_zone = "${var.region}b"
  tags = {
    Name = "${var.stack_name}-app-subnet-b"
  }
}

resource "aws_subnet" "db_subnet_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.db_subnet_a_cidr
  availability_zone = "${var.region}a"
  tags = {
    Name = "${var.stack_name}-db-subnet-a"
  }
}

resource "aws_subnet" "db_subnet_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.db_subnet_b_cidr
  availability_zone = "${var.region}b"
  tags = {
    Name = "${var.stack_name}-db-subnet-b"
  }
}

resource "aws_subnet" "web_subnet_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.web_subnet_a_cidr
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.stack_name}-web-subnet-a"
  }
}

resource "aws_subnet" "web_subnet_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.web_subnet_b_cidr
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.stack_name}-web-subnet-b"
  }
}

/******************************************************************************
*                                                                             *
* Internet connectivity                                                       *
*                                                                             *
******************************************************************************/

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.stack_name}-main"
  }
}

resource "aws_route_table" "web" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.stack_name}-main"
  }
}

resource "aws_route" "web_default" {
  route_table_id          = aws_route_table.web.id
  destination_cidr_block  = "0.0.0.0/0"
  gateway_id              = aws_internet_gateway.main.id
}

resource "aws_route_table_association" "web_a" {
  subnet_id      = aws_subnet.web_subnet_a.id
  route_table_id = aws_route_table.web.id
}

resource "aws_route_table_association" "web_b" {
  subnet_id      = aws_subnet.web_subnet_b.id
  route_table_id = aws_route_table.web.id
}