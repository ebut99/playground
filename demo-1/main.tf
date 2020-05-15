provider "aws" {
  region = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECERT_KEY
}

resource "aws_instance" "myfirstinstance" {
  ami           = "ami-0a040c35ca945058a"
  instance_type = "t2.micro"

  tags = {
      Name = "first demo"
  }

}

