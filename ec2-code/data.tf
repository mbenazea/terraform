#Fetch an Amazon AMI
data "aws_ami" "Amazon_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # AWS account ID for Amazon Linux
}

data "aws_subnet" "default_subnet" {
  filter {
    name   = "tag:Name"
    values = ["default-01"]
  }
  vpc_id = data.aws_vpc.vpc.id
}

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["default"]  # Replace with your actual VPC name
  }
}
