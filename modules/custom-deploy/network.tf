resource "aws_vpc" "practico-terraform-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "test-terraform-vpc"
  }
}

resource "aws_subnet" "practico-terraform-subnet" {
  vpc_id                  = aws_vpc.practico-terraform-vpc.id
  availability_zone       = var.vpc_aws_az[0]
  cidr_block              = var.private_subnet[0]
  map_public_ip_on_launch = "true"
  tags = {
    Name = "test-terraform-subnet"
  }
}

resource "aws_internet_gateway" "test-terraform-ig" {
  vpc_id = aws_vpc.practico-terraform-vpc.id
  tags = {
    Name = "test-terraform-ig"
  }
}

resource "aws_route_table" "test-terraform-rt" {
  vpc_id = aws_vpc.practico-terraform-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-terraform-ig.id
  }
  tags = {
    Name = "test-terraform-rt"
  }
}

resource "aws_route_table_association" "terraform-subnet-rt" {
  subnet_id      = aws_subnet.practico-terraform-subnet.id
  route_table_id = aws_route_table.test-terraform-rt.id
}