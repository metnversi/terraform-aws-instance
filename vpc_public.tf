resource "aws_vpc" "dc" {
  cidr_block = "192.168.0.0/16"

  tags = {
    Name = "DC"
  }
}

resource "aws_subnet" "dc_subnet" {
  vpc_id     = aws_vpc.dc.id
  cidr_block = "192.168.1.0/24"

  tags = {
    Name = "dc-subnet"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.dc.id

  tags = {
    Name = "public"
  }
}




resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.dc_subnet.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "public" {
  vpc_id = aws_vpc.dc.id

  tags = {
    Name = "public"
  }
}

resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["171.241.9.17/32"]
  security_group_id = aws_security_group.public.id
}

resource "aws_security_group_rule" "allow_icmpv4" {
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}
