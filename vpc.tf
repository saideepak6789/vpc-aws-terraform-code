resource "aws_vpc" "my-vpc" {
  cidr_block       = var.cidr-vpc
  instance_tenancy = "default"
  tags = {
    Name = "${var.dev}-main"
  }
}