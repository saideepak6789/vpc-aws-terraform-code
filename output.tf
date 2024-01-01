#outputs
output natgatewayid {
  value       = aws_nat_gateway.nat.id
}
output elasticip{
    value = aws_eip.one.public_ip
}

output vpcid{
  value = aws_vpc.main.id
}
output security{
  value= aws_security_group.allow_tls.id
}
output public_ip {
  value       = aws_instance.myapp-ec2.public_ip
}