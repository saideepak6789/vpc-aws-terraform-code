resource "aws_vpc" "main" {
  cidr_block       = var.cidr-vpc
  instance_tenancy = "default"
  tags = {
    Name = "${var.dev}-main"
  }
}