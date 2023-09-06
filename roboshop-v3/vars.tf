
variable "security_groups" {
  default = [ "sg-038da0861b4c1788f" ]
}


variable "zone_id" {
  default = "Z06290253V8BVAICG1EGQ"

}

variable "components" {
  default = {
    frontend = {
      name          = "frontend"
      instance_type = "t3.micro"
    }
    cart = {
      name          = "cart"
      instance_type = "t3.micro"
    }
  }
}