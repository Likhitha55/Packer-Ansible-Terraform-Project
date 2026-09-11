variable "ami_name" {
  type        = string
  description = "Name prefix for the output AMI"
  default     = "my-custom-image"
}

variable "ssh_username" {
  type        = string
  description = "SSH username for the base AMI"
  default     = "ec2-user"
}



