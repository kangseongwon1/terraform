# Variable declarations
variable "aws_region" {
    description = "AWS region"
    type = string
    default = "us-east-2"
}

variable "vpc_cidr_block" {
    description = "VPC CIDR block"
    type = string
    default = "10.0.0.0/16"
}

variable "instance_count"{
    description = "instance number"
    type = number
    default = 2
}

variable "disable_vpn_gateway" {
    description = "VPN enable gateway"
    type = bool
    default = false
}

variable "public_subnet_cidr_blocks" {
  description = "Available cidr blocks for public subnets."
  type        = list(string)
  default     = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
    "10.0.7.0/24",
    "10.0.8.0/24",
  ]
}



variable "private_subnet_cidr_blocks" {
  description = "Available cidr blocks for private subnets."
  type        = list(string)
  default     = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24",
    "10.0.104.0/24",
    "10.0.105.0/24",
    "10.0.106.0/24",
    "10.0.107.0/24",
    "10.0.108.0/24",
  ]
}

variable "private_subnets_count" {
    description = "Private subnet count"
    type = number
    default = 2
}

variable "public_subnets_count" {
    description = "Public subnet count"
    type = number
    default = 2
}

variable "resource_tag" {
    description = "Resource_tags"
    type = map(string)
    default = {
        project     = "project-alpha",
        environment = "dev"
    }
}

variable "ec2_instance_type" {
    description = "EC2 instance type"
    type = string  
}