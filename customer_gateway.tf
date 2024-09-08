
resource "aws_customer_gateway" "cgw" {
  bgp_asn = 65000
  ip_address = "xxxxx"
  type    = "ipsec.1"
  tags = {
    Name = "cgw"
  }

}

