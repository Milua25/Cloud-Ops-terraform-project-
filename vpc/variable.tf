variable "aws_region" {
  description = "aws_vpc_region"
  type = string
}

variable "availability_zone_public" {
  description = "public_az"
  type = string
}
variable "availability_zone_private" {
  description = "private_az"
  type = string
}

variable "vpc_cidr" {
  description = "metadata_VPC"
  default     = "10.0.0.0/16"
}

variable "Public_subnets_cidr" {
  default = "10.0.101.0/24"
}

variable "Private_subnets_cidr" {
  default = "10.0.1.0/24"
}
