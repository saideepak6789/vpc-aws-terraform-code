# public subnets - 1a
resource "aws_subnet" "subnet-1" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet-cidr-blocks[0].cidr_block
  availability_zone = var.avail_zone1a
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.dev}-${var.subnet-cidr-blocks[0].name}"
  }
}
#private subnets - 1a
resource "aws_subnet" "subnet-2" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet-cidr-blocks[1].cidr_block
  availability_zone = var.avail_zone1a
  tags = {
    Name = "${var.dev}-${var.subnet-cidr-blocks[1].name}"
  }
}
#public subnets - 1b
resource "aws_subnet" "subnet-3" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet-cidr-blocks[2].cidr_block
  availability_zone = var.avail_zone1b
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.dev}-${var.subnet-cidr-blocks[2].name}"
  }
}
#private subnets - 1b
resource "aws_subnet" "subnet-4" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet-cidr-blocks[3].cidr_block
  availability_zone = var.avail_zone1b
  tags = {
    Name = "${var.dev}-${var.subnet-cidr-blocks[3].name}"
  }
}

#internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.dev}-Internet-gateway"
  }
}

#elastic Ip 
resource "aws_eip" "one" {
  domain  = "vpc"
  
  tags = {
    Name = "${var.dev}-elastic-ip"
  }
}
# Nat gateway attaching to elastic ip 
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.one.id
  subnet_id     = aws_subnet.subnet-1.id

  tags = {
    Name = "${var.dev}-NAT-gateway"
  }
} 

#public route table routed traffic to internet gateway
resource "aws_route_table" "public-rt" {
  vpc_id = var.vpc_id
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
  vpc_id = var.vpc_id
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