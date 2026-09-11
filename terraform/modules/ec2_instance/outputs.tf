
output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.instance-from-custom-image.id
}

output "public_ip" {
  description = "Public IP of the instance"
  value       = aws_instance.instance-from-custom-image.public_ip
}

# output "private_ip" {
#   description = "Private IP of the instance"
#   value       = aws_instance.instance-from-custom-image.private_ip
# }

output "availability_zone" {
  description = "AZ where the instance was launched"
  value       = aws_instance.instance-from-custom-image.availability_zone
}

# output "security_group_id" {
#   description = "Security group ID"
#   value       = aws_security_group.instance_sg.id
# }

