resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet-cidr[0]
  availability_zone = var.avail_zone1a
  tags = {
    Name = "${var.dev}-public-subnet-1a"
  }
}
resource "aws_subnet" "subnet-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet-cidr[1]
  availability_zone = var.avail_zone1a
  tags = {
    Name = "${var.dev}-private-subnet-1a"
  }
}
resource "aws_subnet" "subnet-3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet-cidr[2]
  availability_zone = var.avail_zone1b
  tags = {
    Name = "${var.dev}-public-subnet-1b"
  }
}
resource "aws_subnet" "subnet-4" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet-cidr[3]
  availability_zone = var.avail_zone1b
  tags = {
    Name = "${var.dev}-private-subnet-1b"
  }
}