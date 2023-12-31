variable ins_type{

}
variable avail_zone{}
variable keyname{}

resource "aws_instance" "myapp-ec2"{
    ami = "ami-05c13eab67c5d8861"
    instance_type = var.ins_type
    subnet_id = aws_subnet.subnet-1.id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    availability_zone = var.avail_zone
    key_name = var.keyname
    user_data = <<EOF
                #!/bin/bash
                sudo yum update -y
                sudo yum install docker -y
                sudo systemctl start docker
                sudo usermod -aG docker ec2-user
                docker pull nginx
                docker run -idt -p 8080:80 nginx 
                EOF    
    tags = {
        Name = "${var.dev}-instance"
    }
}

output public_ip {
  value       = aws_instance.myapp-ec2.public_ip
}