resource "aws_instance" "web" {
  ami           = "ami-0baa9e2e64f3c00db" # RHEL SSD x86
  instance_type = "t3.micro"              # Free tier

  network_interface {
    network_interface_id = aws_network_interface.net-if.id
    device_index         = 0
  }
  # subnet_id   = aws_subnet.main_subnet.id # not required if have interface inside vpc?

  tags = {
    Name = "basic_ec2"
  }
}

resource "aws_network_interface" "net-if" {
  subnet_id   = aws_subnet.main_subnet.id
  private_ips = ["10.0.1.10"]

  tags = {
    Name = "${var.default_vpc_name}_IF"
  }
}
