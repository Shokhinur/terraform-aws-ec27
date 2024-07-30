provider "aws" {
  region = "us-east-2" 
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

module "ec2" {
  source               = "./modules"
  launch_template_name = "example-launch-template"
  image_id             = data.aws_ami.example.id
  instance_type        = "t2.micro" 
  key_name             = "your-key-pair" 
  security_group_names = ["your-security-group"] 
  subnet_id            = "subnet-xxxxxxxx"
  instance_name        = "MyInstance"
  instance_count       = 3
}
