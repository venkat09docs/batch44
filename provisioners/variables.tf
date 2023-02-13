variable "region"{
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "cidr_block" {
  default = "0.0.0.0/0"
}

variable "egress_port" {
  default = 0
}

# list type variable
variable "sg_ports" {
  default = [22,80,443,8080]
  type = list
}

# map type variable
variable "custom_tags"{
  default = {
    Name = "webserver"
    Env = "Development"
    Owner = "Rnstech"
  }
}

variable "environments"{
  default = ["Dev", "Staging", "Prod"]
}

output "webserver_public_ip-1" {
    value = aws_instance.webserver.public_ip
}
