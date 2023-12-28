output natgatewayid {
  value       = aws_nat_gateway.nat.id
}
output elasticip{
    value = aws_eip.one.public_ip
}

output vpcid{
  value = aws_vpc.main.id
}