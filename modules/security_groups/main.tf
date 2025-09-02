resource "aws_security_group" "security_group" {
  name        = "jenkins-sonarqube-sg"
  description = "Allowing Jenkins, Sonarqube, SSH Access"
  vpc_id      = var.vpc_id

  ingress = [
    for port in [22, 80, 8080, 9000, 9090, 3306] : {
      description      = "Allow TCP traffic on port ${port}"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      self             = false
      security_groups  = []
      prefix_list_ids  = []
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-sg"
    Environment = var.environment
    Project     = var.project_name
  }
}
