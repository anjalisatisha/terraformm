provider "aws" {
  region     = "ap-south-1"
  access_key = " "//enter access_key
  secret_key = " "//enter secret_key
}

variable "vpc_cidr" {
  default = "10.0.0.0/24"
}

variable "public_subnet_cidr" {
  default = "10.0.0.0/25"
}

variable "private_subnet_cidr" {
  default = "10.0.0.128/25"
}

data "template_file" "app_user_data" {
  template = file("http.sh")
}