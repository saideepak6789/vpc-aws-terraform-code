variable dev {}
variable vpc_id {}
variable "subnet-cidr-blocks"{
	  description = "cidr block of subnet"
	  type = list(object({
		cidr_block = string,
		name = string
	  }))
  }
variable avail_zone1a {}
variable avail_zone1b {}