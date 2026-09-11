resource "aws_security_group" "instance_sg" {
  name        = "${var.instance_name}-sg"
  description = "Security group for ${var.instance_name}"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidrs
  }

  ingress {
    description = "Jenkins"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = var.allowed_tcp_cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.instance_name}-sg"
  }
}

resource "aws_instance" "instance-from-custom-image" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = "gp3"
  }

  tags = {
    Name        = var.instance_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}


resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../../../ansible/inventory.ini"

  content = <<-EOF
    [instance-from-custom-image]
    ${aws_instance.instance-from-custom-image.public_ip} ansible_user=${var.ssh_user_name} ansible_ssh_private_key_file =${var.ssh_private_key_path}

    [all:vars]
    ansible_ssh_common_args='-o StrictHostKeyChecking=no'
  EOF

  depends_on = [
    aws_instance.instance-from-custom-image,
  ]
}




