variable "region" {
  type        = string
  description = "Region where the AWS resources will live."
}

variable "stack_name" {
  type = string
  description = "Friendly name for the stack."
}

variable "vpc_cidr" {
  type = string
  description = "CIDR block for the VPC."
}

variable "app_subnet_a_cidr" {
  type        = string
  description = "CIDR block for the first app tier subnet."
}

variable "app_subnet_b_cidr" {
  type        = string
  description = "CIDR block for the second app tier subnet."
}