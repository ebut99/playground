provider "aws" {
  region     = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECERT_KEY
}

data "aws_ami" "t2_ami" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-hvm*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "t2_keypair" {
  key_name   = "t2_keypair"
  public_key = var.public_key
  tags = {
    Name = "t2_keypair"
  }
}

resource "aws_instance" "myfirstinstance" {
  ami           = aws_ami.t2_ami.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.t2_keypair.id

  tags = {
    Name = "first demo"
  }

}

