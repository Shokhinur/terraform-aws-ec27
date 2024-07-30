output "instance_ids" {
  description = "The IDs of the created instances"
  value       = aws_instance.example[*].id
}
