resource "aws_instance" "hasher_server" {
  ami           = "ami-0149b2da6ceec4bb0"
  instance_type = "t2.micro"
  key_name      = "hasher"
  tags          = { Name = var.instance_name }
}

variable "instance_name" {
  description = "EC2 instance name"
}

output "ec2_public_ip" {
  value = aws_instance.hasher_server.public_ip
}

output "ec2_public_url" {
  value = aws_instance.hasher_server.public_dns
}
