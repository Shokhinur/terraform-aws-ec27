variable "launch_template_name" {
  description = "The name of the launch template"
  type        = string
}

variable "image_id" {
  description = "The ID of the AMI to use"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to use"
  type        = string
}

variable "key_name" {
  description = "The key pair name to use for the instance"
  type        = string
}

variable "security_group_names" {
  description = "The security group names to associate with the instance"
  type        = list(string)
}

variable "subnet_id" {
  description = "The subnet ID to associate with the instance"
  type        = string
}

variable "instance_name" {
  description = "The name tag to apply to the instance"
  type        = string
}

variable "instance_count" {
  description = "The number of instances to launch"
  type        = number
}
