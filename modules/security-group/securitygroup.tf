resource "aws_security_group" "allow_1433" {
  name        = "allow_tls_1433"
  description = "Allow TLS_1433 inbound traffic"
  vpc_id      = var.vpc-id

  ingress {
    description      = "TLS from VPC"
    from_port        = 1433
    to_port          = 1433
    protocol         = "tcp"
    cidr_blocks      = [var.cidr_blocks]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls_1433"
  }
}