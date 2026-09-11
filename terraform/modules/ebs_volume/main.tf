
# To create extra ebs volume

resource "aws_ebs_volume" "extra" {
  availability_zone = var.availability_zone
  size              = var.volume_size
  type              = var.volume_type
  encrypted         = true

  tags = {
    Name        = "${var.volume_name}-extra-vol"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

# Volume created, but to attach the volume to instance :
resource "aws_volume_attachment" "attach" {
  device_name = var.device_name
  volume_id   = aws_ebs_volume.extra.id
  instance_id = var.instance_id

  # To prevent destroy issues, force detach on destroy
  force_detach = true
}

