resource "aws_eip" "my_ec2_eip" {
  instance = aws_instance.my_ec2.id
  vpc    = true
  tags = {
    Name        = "my-ec2-eip"
    Environment = "Testing"
    Owner       = "Jeowanda"
  }
}