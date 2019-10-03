resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.subnet_cidr}"

  tags = {
    Name = "Main"
  }
}

output "vpc_id"{
  value="${aws_vpc.main.id}"
}

output "subnet_id"{
  value="${aws_subnet.main.id}"
}

resource "aws_security_group" "allow_httpd" {
  name        = "allow_httpd"
  description = "Allow TLS inbound traffic"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = # add your IP address here
  }

  tags = {
    Name = "allow_all"
  }
}