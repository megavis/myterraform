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

resource "aws_instance" "demo" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "Demo-Single-Instance"
  }
}

resource "aws_instance" "demo-iteration" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  for_each      = { instance_a = "Inst-A" 
                    instance_b = "B" 
  }
  
  tags = {
    Name  = "DemoIstance-Iterated-${each.value}"
  }
}
