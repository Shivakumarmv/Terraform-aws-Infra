variable "cidr" {
  description = "The CIDR block for the vpc"
  default     = "10.0.0.0/16"
}
variable "subnet1_cidr" {
  description = "The CIDR block for public subnet1"
  type        = string
  default     = "10.0.1.0/24"
}
variable "subnet2_cidr" {
  description = "The CIDR block for public subnet2"
  type        = string
  default     = "10.0.2.0/24"
}
variable "subnet3_cidr" {
  description = "The CIDR block for private subnet3"
  type        = string
  default     = "10.0.3.0/24"
}

variable "ami_id" {
  description = "image_id for instance"
  type        = string
}

variable "instance_type" {
  description = "instance type"
  type        = string
}

variable "subnet_id" {
  description = "subnet_id for loadbalancer"
  type        = map(string)
}

variable "availability_zones" {
  description = "this is amamzon availability_zones"
  default     = ["us-east-1a", "us-east-1b"]
}


