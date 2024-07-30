provider "aws" {
  region = "us-west-2" # Replace with your desired region
}

data "aws_ami" "example" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"] 
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] 
}

resource "aws_launch_template" "example" {
  name = "example-launch-template"

  image_id               = data.aws_ami.example.id
  instance_type          = "t2.micro" 
  key_name               = "your-key-pair" 
  security_group_names   = ["your-security-group"] 

  network_interfaces {
    associate_public_ip_address = true
    subnet_id                   = "subnet-xxxxxxxx" # 
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "MyInstance"
    }
  }
}

resource "aws_instance" "example" {
  count             = 3
  launch_template {
    id      = aws_launch_template.example.id
    version = "$Latest"
  }
}
