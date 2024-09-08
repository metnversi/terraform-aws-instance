resource "aws_vpc" "main" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.10.1.0/24"

  tags = {
    Name = "my-subnet"
  }
}

resource "aws_route_table" "rtable" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "my-route-table"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.rtable.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_vpn_gateway.pgw.id
}




resource "aws_route_table_association" "rtable_assoc" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rtable.id
}

resource "aws_security_group" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private"
  }
}

resource "aws_security_group_rule" "allow_icmp" {
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private.id
}


