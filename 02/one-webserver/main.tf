provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "web" {
  ami                         = "ami-0d5bf08bc8017c83b"
  instance_type               = "t2.micro"
  user_data_replace_on_change = true
  vpc_security_group_ids      = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Welocome to My Web Server" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
    Name = "terraform-example-web"
  }
}
resource "aws_security_group" "instance" {
  name = var.security_group_name

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http"
  }
}

variable "security_group_name" {
    description = "security group name"
    type = string
    default = "terraform-example-instance"
}

output "public_ip" {
    description = "ec2-instance-public-ip"
    value = aws_instance.web.public_ip
}