

# Create an EC2 Instance with the Security Group
resource "aws_instance" "my_ec2_instance" {
  # ami           = "ami-0866a3c8686eaeeba" # Replace with a valid AMI ID
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = "my-first-key-pair"

  # Attach the security group to the instance
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  #   #Associate instance witha specific subnet
  subnet_id = data.aws_subnet.subnet_01.id

  # Configure the root volume to be 20 GB with type gp3
  root_block_device {
    volume_size = 30   # Set the root volume size to 20 GB
    volume_type = "gp3"   # Set volume type to gp3
    
  }
  #   # Use user_data to run a script that installs Apache
  #   #   user_data = <<-EOF
  #   #               #!/bin/bash
  #   #               sudo apt-get update -y
  #   #               sudo apt-get install -y apache2
  #   #               sudo systemctl start apache2
  #   #               sudo systemctl enable apache2
  #   #               EOF 
  tags = {
    Name             = "apache-web"
    "owner"          = "EK TECH SOFTEARE SOLUTION"
    "environment"    = "dev"
    "project"        = "del"
    "created_by"     = "Terraform"
    "cloud_provider" = "aws"
  }
}

