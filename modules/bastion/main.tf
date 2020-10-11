module "iam_instance_profile" {
  source  = "scottwinkler/iip/aws"
  actions = ["logs:*", "s3:*"]
}
  
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  owners = ["099720109477"]
}

data "aws_subnet_ids" "public" {
  vpc_id = var.vpc.vpc_id

  tags = {
    Tier = "Public"
  }
}

resource "aws_instance" "bastion" {
  for_each      = data.aws_subnet_ids.public.ids
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.sg.bastion]
  subnet_id = each.value
  #subnet_id = var.vpc.aws_subnet.public[0].id
  associate_public_ip_address = true
}