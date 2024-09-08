resource "aws_instance" "app_server" {
  ami                    = "ami-0474411b350de35fb"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.generated_key.id
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.private.id]

  tags = {
    Name = var.instance_name
  }
}

resource "aws_instance" "dc_instance" {
  ami                    = "ami-0474411b350de35fb"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.generated_key.id
  subnet_id              = aws_subnet.dc_subnet.id
  vpc_security_group_ids = [aws_security_group.public.id]

  tags = {
    Name = "dc-instance"
  }
}
