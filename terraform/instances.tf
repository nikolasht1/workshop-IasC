data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "workshop" {
  key_name   = "workshop"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = aws_key_pair.workshop.key_name

  vpc_security_group_ids = [
    aws_security_group.web_server_sg.id
  ]

  tags = {
    Name = "web"
  }
}

resource "aws_instance" "web1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = aws_key_pair.workshop.key_name

  vpc_security_group_ids = [
    aws_security_group.web_server_sg.id
  ]

  tags = {
    Name = "web1"
  }
}
