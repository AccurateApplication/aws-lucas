resource "aws_instance" "web" {
  ami           = "ami-0baa9e2e64f3c00db" # RHEL SSD x86
  instance_type = "t3.micro"              # Free tier

  network_interface {
    # Gets placed in AZ of interface
    network_interface_id = aws_network_interface.net-if.id
    device_index         = 0
  }

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

output "public_ip_ec2" {
  value = aws_instance.web.public_ip
}

output "public_dns_ec2" {
  value = aws_instance.web.public_dns
}
