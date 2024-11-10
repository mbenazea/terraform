

data "aws_subnet" "subnet_01" {
  filter {
    name   = "tag:Name"
    values = ["default-01"]
  }
}

data "aws_vpc" "vpc" {
  default = true

}
# Data source to fetch the latest Ubuntu 22.04 LTS AMI with gp3 storage
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical's AWS account ID for Ubuntu AMIs

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }


  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}
# # Data soucce fo the vpc, using the default VPc lebled.
# data "aws_vpc" "vpc" {
#   filter {
#     name   = "tag:Name"
#     values = ["default"] 
#   }
# }