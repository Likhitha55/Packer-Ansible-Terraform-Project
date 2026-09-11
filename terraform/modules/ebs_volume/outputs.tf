
output "volume_id" {
  description = "EBS Volume ID"
  value       = aws_ebs_volume.extra.id
}

output "volume_attachment_id" {
  description = "Volume attachment ID"
  value       = aws_volume_attachment.attach.id
}

output "device_name" {
  description = "Device name used for attachment"
  value       = var.device_name
}

