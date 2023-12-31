resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet-cidr-blocks[0].cidr_block
  availability_zone = var.avail_zone1a
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.dev}-${var.subnet-cidr-blocks[0].name}"
  }
}
resource "aws_subnet" "subnet-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet-cidr-blocks[1].cidr_block
  availability_zone = var.avail_zone1a
  tags = {
    Name = "${var.dev}-${var.subnet-cidr-blocks[1].name}"
  }
}
resource "aws_subnet" "subnet-3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet-cidr-blocks[2].cidr_block
  availability_zone = var.avail_zone1b
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.dev}-${var.subnet-cidr-blocks[2].name}"
  }
}
resource "aws_subnet" "subnet-4" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet-cidr-blocks[3].cidr_block
  availability_zone = var.avail_zone1b
  tags = {
    Name = "${var.dev}-${var.subnet-cidr-blocks[3].name}"
  }
}