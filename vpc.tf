resource "aws_vpc" "starvpc" {
  enable_dns_support   = true
  enable_dns_hostnames = true
  cidr_block           = "10.0.0.0/16"
  tags = {
    Name = var.default_vpc_name
  }
}


resource "aws_subnet" "main_subnet" {
  availability_zone       = var.region-az1
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.starvpc.id
  cidr_block              = "10.0.1.0/24"

  tags = {
    Name = "${var.default_vpc_name}_subnet"
  }
}
