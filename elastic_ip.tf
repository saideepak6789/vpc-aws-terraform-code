resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.one.id
  subnet_id     = aws_subnet.subnet-1.id

  tags = {
    Name = "${var.dev}-NAT-gateway"
  }
}  
resource "aws_eip" "one" {
  domain                    = "vpc"
}