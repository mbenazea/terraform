
resource "aws_instance" "my_ec2" {
  ami                    = data.aws_ami.Amazon_ami.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ec2_security.id]
  subnet_id              = data.aws_subnet.default_subnet.id
  
  
  # tags = merge(var.tags, {
  #   Name = format("%s-%s-${var.resource_type}", var.tags["environment"], var.tags["Project"])
  # })



  tags = merge(var.tags, {
    Name = "ec2"  # Add your resource-specific Name tag here
  })

  # tags = {
  #   Name        = "Ec2"
  #   Environment = "Testing"
  #   Owner       = "Jeowanda"
  # }
}

