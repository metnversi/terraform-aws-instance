resource "aws_vpn_connection" "vpn_connection" {
  customer_gateway_id = aws_customer_gateway.cgw.id
  vpn_gateway_id      = aws_vpn_gateway.pgw.id
  type                = "ipsec.1"
  static_routes_only  = true
  tags = {
    Name = "aws to dc"
  }

  provisioner "local-exec" {
    command = <<EOT
      aws ec2 get-vpn-connection-device-sample-configuration \
        --vpn-connection-id ${self.id} \
        --vpn-connection-device-type "Cisco" \
        --internet-key-exchange-version "ikev1" \
        --output text > vpn_configuration.txt
    EOT
  }

}

resource "aws_vpn_connection_route" "remote_route" {
  vpn_connection_id      = aws_vpn_connection.vpn_connection.id
  destination_cidr_block = "10.10.0.0/16"
}

resource "aws_vpn_connection_route" "local_route" {
  vpn_connection_id      = aws_vpn_connection.vpn_connection.id
  destination_cidr_block = "192.168.0.0/16"
}

