# Create a Security Group
resource "aws_security_group" "ec2_sg" {
  name        = "ec2_security_group"
  description = "Allow ssh and http"
  vpc_id      = data.aws_vpc.vpc.id

  # Inbound rule for SSH
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows SSH from any IP (adjust for security)
  }

  # Inbound rule for HTTP
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows HTTP from any IP
  }

  # Outbound rule to allow all traffic (default)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # -1 allows all protocols
    cidr_blocks = ["0.0.0.0/0"] # Allows outbound to any IP
  }

  tags = {
    Name             = "ec2_security_group"
    "owner"          = "EK TECH SOFTEARE SOLUTION"
    "environment"    = "dev"
    "project"        = "del"
    "created_by"     = "Terraform"
    "cloud_provider" = "aws"
  }
}