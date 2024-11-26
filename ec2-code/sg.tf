resource "aws_security_group" "ec2_security" {
  name        = "ec2-security-group"
  description = "Allow only specific IP and ports"

  ingress {
    description = "Allow SSH from a specific IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
  }

    tags = merge(var.tags, {
    Name = "ec2-security"  # Add your resource-specific Name tag here
  })
    
#   tags = {
#     Name        = "ec2-security-group"
#     Environment = "Testing"
#     Owner       = "Jeowanda"
#   }
}




  