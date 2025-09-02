
resource "tls_private_key" "jump_host_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "jump_host_key" {
  key_name   = "jump_host-key"
  public_key = tls_private_key.jump_host_key.public_key_openssh

  tags = {
    Name        = "jump_host_key"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "local_file" "private_key" {
  filename        = "${path.module}/jump_host_key.pem"
  content         = tls_private_key.jump_host_key.private_key_pem
  file_permission = "0400"
}

resource "aws_instance" "jump_host" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.jump_host_key.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  iam_instance_profile        = var.instance_profile_id
  associate_public_ip_address = true

  root_block_device {
    volume_size = 30
  }

 user_data = templatefile("${path.module}/install_tools.sh", {})

  tags = {
    Name        = var.instance_name
    Environment = var.environment
    Project     = var.project_name
  }
}
