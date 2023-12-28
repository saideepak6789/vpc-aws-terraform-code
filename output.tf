output natgatewayid {
  value       = aws_nat_gateway.nat.id
}
output elasticip{
    value = aws_eip.one.publicip
}

output vpcid{
  value = aws_vpc.main.id
}