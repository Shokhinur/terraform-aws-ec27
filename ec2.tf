resource "aws_launch_template" "example" {
  name = var.launch_template_name

  image_id               = var.image_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  security_group_names   = var.security_group_names

  network_interfaces {
    associate_public_ip_address = true
    subnet_id                   = var.subnet_id
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = var.instance_name
    }
  }
}

resource "aws_instance" "example" {
  count             = var.instance_count
  launch_template {
    id      = aws_launch_template.example.id
    version = "$Latest"
  }
}
