resource "aws_vpn_gateway" "pgw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "pgw"
  }
}

resource "aws_vpn_gateway_attachment" "pgw_attachment" {
  vpc_id         = aws_vpc.main.id
  vpn_gateway_id = aws_vpn_gateway.pgw.id
}
