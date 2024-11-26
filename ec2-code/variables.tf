variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "key_name" {
  type    = string
  default = "aws-testing-keyPair"
}

variable "tags" {
  description = "Common tags for resources"
  type        = map(string)
  default     = {
    Environment = "Testing"
    Owner       = "Jeowanda"
  }
}
variable "resource_type" {
  type = string
}