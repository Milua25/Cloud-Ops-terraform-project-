variable "region" {
  description = "Determine your region"
  type        = string
}

variable "profile" {
  description = "Give your profile name"
  type        = string
}

variable "availability_zone_public" {
  description = "Give an availability zone for public az"
}

variable "availability_zone_private" {
  description = "Give an availability zone for private az"
}

variable "aws_s3_bucket" {
  description = "give bucket a name"
}

variable "account_1_id" {
  description = "enter account_1's Id"
}
 
variable "ACCESS_KEY_ID_1" {
  description = "Provide your key as an environmental variable"
  type        = string
}

variable "ACCESS_KEY_ID_2" {
  description = "Provide your key as an environmental variable"
  type        = string
}

variable "SECRET_ACCESS_KEY_2" {
  description = "Provide your key as an environmental variable"
  type        = string
}
variable "SECRET_ACCESS_KEY_1" {
  description = "Provide your key as an environmental variable"
  type        = string
}
