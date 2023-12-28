variable subnet1-cidr {}
variable subnet2-cidr {}
variable subnet3-cidr {}
variable subnet4-cidr {}
variable avail_zone1a {}
variable avail_zone1b {}

resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet1-cidr
  availability_zone = var.avail_zone1a
  tags = {
    Name = "${var.dev}-public-subnet-1a"
  }
}
resource "aws_subnet" "subnet-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet2-cidr
  availability_zone = var.avail_zone1a
  tags = {
    Name = "${var.dev}-private-subnet-1a"
  }
}
resource "aws_subnet" "subnet-3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet3-cidr
  availability_zone = var.avail_zone1b
  tags = {
    Name = "${var.dev}-public-subnet-1b"
  }
}
resource "aws_subnet" "subnet-4" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet4-cidr
  availability_zone = var.avail_zone1b
  tags = {
    Name = "${var.dev}-private-subnet-1b"
  }
}