output "public-subnet-1a"{
    value =aws_subnet.subnet-1.id
}
output "private-subnet-1a"{
    value = aws_subnet.subnet-2.id
}
output "public-subnet-1b"{
    value =aws_subnet.subnet-3.id
}
output "private-subnet-1b"{
    value = aws_subnet.subnet-4.id
}