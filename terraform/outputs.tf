output "instance_ip_addr" {
  value = aws_instance.web.public_ip
}

output "instance_ip_addr1" {
  value = aws_instance.web1.public_ip
}
