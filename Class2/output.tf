output "all" {
  value = aws_instance.web.*
}

output "ami" {
  value     = aws_instance.web.ami
  sensitive = true
}

output "az" {
  value = aws_instance.web.availability_zone
}