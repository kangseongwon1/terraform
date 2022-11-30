output "public_ip" {
    description = "ec2-instance-public-ip"
    value = aws_instance.web.public_ip
}