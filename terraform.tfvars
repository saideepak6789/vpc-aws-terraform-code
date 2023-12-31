dev = "development"
cidr-vpc = "10.0.0.0/16"
subnet-cidr-blocks= [
		{cidr_block= "10.0.0.0/24", name = "public-subnet-1a" },
		{cidr_block= "10.0.1.0/24", name = "private-subnet-1a" },
		{cidr_block= "10.0.2.0/24", name = "public-subnet-1b" },
        {cidr_block= "10.0.3.0/24", name = "private-subnet-1b"}
	]
avail_zone1a = "us-east-1a"
avail_zone1b = "us-east-1b"
myipaddress = ["122.164.168.230/32"]
keyname= "sai13-11-2023"
ins_type="t2.micro"
avail_zone= "us-east-1a"