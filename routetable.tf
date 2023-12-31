#public route table routed traffic to internet gateway
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.dev}-public-rt"
  }
}

# private route table routed traffic to nat gateway
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  } 
  tags = {
    Name = "${var.dev}-private-rt"
  }
}

#public subnet association  
resource "aws_route_table_association" "pub-assoc" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "pub-assoc-1" {
  subnet_id      = aws_subnet.subnet-3.id
  route_table_id = aws_route_table.public-rt.id
}
#private subnet association
resource "aws_route_table_association" "pri-assoc" {
  subnet_id      = aws_subnet.subnet-2.id
  route_table_id = aws_route_table.private-rt.id
}
resource "aws_route_table_association" "pri-assoc-1" {
  subnet_id      = aws_subnet.subnet-4.id
  route_table_id = aws_route_table.private-rt.id
}