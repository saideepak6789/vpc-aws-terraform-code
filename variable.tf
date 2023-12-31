variable dev {}
variable cidr-vpc {}
variable subnet-cidr {
  description = "cidr block of Public & Private subnet"
  type = list(string)
}
variable avail_zone1a {}
variable avail_zone1b {}
