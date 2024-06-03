/*
resource "aws_instance" "app_server" {
  ami           = "ami-0d6857b844e855670"
  instance_type = "t2.micro"
  key_name      = "metnversi_windows" 

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = var.instance_name
  }
}
*/