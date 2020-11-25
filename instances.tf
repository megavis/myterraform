variable "aws_config" {
  default = {
    region = ""
  }
}

data "aws_ami" "cis_debian_9" {
  most_recent = true

  filter {
    name   = "name"
    values = ["CIS Debian Linux 9 Benchmark*"]
  }

  owners = ["679593333241"] # CIS/Debian
}

resource "aws_instance" "demo" {
  ami           = data.aws_ami.cis_debian_9.id
  instance_type = "t2.micro"

  tags = {
    Name = "Demo-Single-Instance"
  }
}

resource "aws_instance" "demo-iteration" {
  ami           = data.aws_ami.cis_debian_9.id
  instance_type = "t2.micro"
  for_each      = { instance_a = "Inst-A" 
                    instance_b = "B" 
  }
  
  tags = {
    Name  = "DemoIstance-Iterated-${each.value}"
  }
}
