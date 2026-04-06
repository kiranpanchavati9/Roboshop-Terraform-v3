variable "image" {
  default = "ubuntu-22-04-x64"
  type = string
}

variable "region" {
  default = "nyc3"
  type = string
}

variable "size" {
  default = "s-1vcpu-1gb"
  type = string
}

variable "protocol" {
  default = "tcp"
  type = string
}

variable "port_range" {
  default = "1-65535"
  type = string
}

variable "source_address" {
  default = ["0.0.0.0/0", "::/0"]
  type = list(string)
}

variable "destination_addresses" {
  default =  ["0.0.0.0/0", "::/0"]
  type = list(string)
}

variable "components" {
  default = {
    frontend = ""
    mongodb = ""
    mysql = ""
    rabbitmq = ""
    redis = ""
    catalogue = ""
    cart = ""
    #user = ""
    shipping = ""
    payment = ""
  }
}