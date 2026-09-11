
variable "instance_id" {
  description = "EC2 Instance ID to attach the volume to"
  type        = string
}

variable "availability_zone" {
  description = "AZ of the instance (volume must be in same AZ)"
  type        = string
}

variable "volume_size" {
  description = "Size of the extra volume in GB"
  type        = number
  default     = 10
}

variable "volume_type" {
  description = "EBS volume type"
  type        = string
  default     = "gp3"
}

variable "device_name" {
  description = "Device name for attachment"
  type        = string
  default     = "/dev/xvdf"
}

variable "volume_name" {
  description = "Name tag prefix for the volume"
  type        = string
  default     = "custom-image-instance"
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}

