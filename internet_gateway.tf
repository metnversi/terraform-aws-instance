resource "aws_internet_gateway" "dc_igw" {
  vpc_id = aws_vpc.dc.id

  tags = {
    Name = "dc-igw"
  }
}
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.dc_igw.id
}





