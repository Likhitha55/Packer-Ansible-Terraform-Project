
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

# Shld pass from terminal
variable "ami_id" {
  description = "AMI ID built by Packer"
  type        = string
}

variable "instance_type" {
  type    = string
  default = "t2.medium"
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
  default     = "test-key"
}

variable "subnet_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "instance_name" {
  type    = string
  default = "custom-image-instance"
}

variable "root_volume_size" {
  type    = number
  default = 20
}

variable "extra_volume_size" {
  description = "Size of the extra EBS volume in GB"
  type        = number
  default     = 10
}

variable "allowed_ssh_cidrs" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

# Triggering pipeline