variable "cidr" {
  type = string
  description = "CIDR block for the VPC."
}

variable "region" {
  type        = string
  description = "Region where the AWS resources will live."
}