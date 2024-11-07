output "ec2-instance-id" {
  value = aws_instance.test-terraform-web.id
}

output "ec2-instance-dns" {
  value = aws_instance.test-terraform-web.public_dns
}