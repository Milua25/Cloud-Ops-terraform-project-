data "aws_ami" "amzlinux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]

  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}


data "template_file" "userdata" {
  template = file("./web/server.sh")
}


resource "aws_instance" "web" {
  ami                    = data.aws_ami.amzlinux.image_id
  instance_type          = var.Instance_Type
  vpc_security_group_ids = var.security_group 
  user_data              = data.template_file.userdata.rendered
  iam_instance_profile   = var.instance_profile
  subnet_id              = var.subnet_id

tags = {
    Name = var.Instance_Name
  }
}

output "private_ip" {
  value = aws_instance.web.private_ip
}

