resource "aws_security_group" "allow_tls_iterator" {
  name        = "allow_tls_iterator"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-1234"

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port                 # Setea una variable temporalmente para este elemento
    content {
      description = "TLS from VPC"
      from_port   = port.value      # Se invoca por medio de la variable temporal
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls_iterator"
  }
}