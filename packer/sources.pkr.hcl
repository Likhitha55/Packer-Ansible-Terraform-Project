packer{
    required_plugins {
        amazon = {
            version = ">= 1.2.0"
            source = "github.com/hashicorp/amazon"
        }
        ansible = {
            version = ">= 1.1.0"
            source  = "github.com/hashicorp/ansible"
        }
    } 
}

# local{
#     timestamp = regex_replace(timestamp(), "[- TZ:]", "")
# }

source "amazon-ebs" "my-custom-image" {
   region = "us-east-1"
   ami_name      = "${var.ami_name}-{{timestamp}}"
   instance_type = "t2.medium"
   ssh_username = "ec2-user"
#    ami_name = "packer-demo-ami-${local.timestamp}"

    metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"   
    http_put_response_hop_limit = 1
    }
 
    source_ami_filter{
     filters = {
        name = "al2023-ami-2023.*-x86_64"
        root-device-type    = "ebs"
    }
    most_recent = true
    owners = ["amazon"]

   } 

   tags = {                                           
    Name = var.ami_name
   }
}










