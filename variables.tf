variable "vermah-ami-id" {
  type = string
  description = "this is sydney aws region ami id"
  #default = "ami-0a25a306450a2cba3"
}

variable "vm-name" {
  type = string
  description = "my aws vm name"
}

variable "vm-size" {
  type = string
}

variable "ec2-key-name" {
  type = string
}

variable "private-key-algo" {
  type = string
}

variable "key-size" {
  type = string
}

variable "my-vpc-id" {
  type = string
}

variable "my-sec-group-name" {
  type = string
}