  # VPC
  # resource "aws_vpc" "region" {
  #   cidr_block = var.cidr_region

  #   tags = tomap({
  #     name = "VPC Region"
  #   })
  # }

  # # Internet Gateway
  # resource "aws_internet_gateway" "region" {
  #   vpc_id = aws_vpc.region.id
  # }

  # # Route
  # resource "aws_route" "ohio-internet_access" {
  #   route_table_id         = aws_vpc.region.main_route_table_id
  #   destination_cidr_block = "0.0.0.0/0"
  #   gateway_id             = aws_internet_gateway.region.id
  # }

  # # Subnet 1
  # resource "aws_subnet" "region-az1" {
  #   vpc_id                  = aws_vpc.region.id
  #   cidr_block              = var.subnet_region_az1
  #   map_public_ip_on_launch = false
  #   availability_zone       = var.region_az
  # }


resource "aws_security_group" "rds_sg" {
  name        = "RDS Security Group"
  description = "RDS PostgreeSQL Security Group"
  # vpn_id      = aws_vpc.region.id

  tags = {
    Name = "tf_RDS_SG"
  }

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    #security_groups = ["${aws_security_group.web_sg.id}"]
    #security_groups = []
    cidr_blocks = [
    #  aws_vpc.region.cidr_block,
      "10.0.0.0/16",
      "168.232.12.186/32"
     ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}