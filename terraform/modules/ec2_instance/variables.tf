variable "ami_id" {
  description = "AMI ID created by Packer"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.medium"
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
  default = "test-key"
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance in"
  type        = string
  default = "subnet-06bf89b32d5720a0d"
}

variable "vpc_id" {
  description = "VPC ID for security group"
  type        = string
  default = "vpc-0ab97bcd9f7ee3269"
}

variable "instance_name" {
  description = "Name tag for the instance"
  type        = string
  default     = "instance-from-custom-image"
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}

variable "root_volume_size" {
  description = "Root volume size in GB"
  type        = number
  default     = 20
}

variable "allowed_ssh_cidrs" {
  description = "CIDR blocks allowed for SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allowed_tcp_cidrs" {
  description = "CIDR blocks allowed for TCP"
  type        = list(string)
  default     = ["15.248.4.116/32"]
}

variable "ssh_private_key_path" {
  description = "Path to SSH private key"
  type        = string
  default     = "~/Downloads/test-key.pem"  
}

variable "ssh_user_name" {
  description = "SSH username"
  type        = string
  default     = "ec2_user"  
}

