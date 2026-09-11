
# ============================================================
# Root Terraform Config
# Calls both modules: ec2_instance + ebs_volume
# ============================================================

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Launching instance from the custom image that packer built
module "ec2_instance" {
  source = "./modules/ec2_instance"

  ami_id = var.ami_id
}


# Creating extra volume
module "ebs_volume" {
  source = "./modules/ebs_volume"

  instance_id       = module.ec2_instance.instance_id
  availability_zone = module.ec2_instance.availability_zone


  depends_on = [module.ec2_instance]
}

