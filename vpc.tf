resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.stack_name}-main"
  }
}

resource "aws_subnet" "app_subnet_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.app_subnet_a_cidr

  tags = {
    Name = "${var.stack_name}-app-subnet-a"
  }
}

resource "aws_subnet" "app_subnet_b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.app_subnet_b_cidr

  tags = {
    Name = "${var.stack_name}-app-subnet-b"
  }
}