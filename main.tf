provider "aws" {
  version = "2.12.0"
  region = "us-east-1"
}
 
resource "aws_instance" "helloworld" {
  ami = "ami-0817d428a6fb68645"
  instance_type = "t2.micro"
}