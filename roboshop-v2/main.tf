variable "ami" {
  default = "ami-03265a0778a880afb"
}

variable "security_group" {
  default = [ "sg-038da0861b4c1788f" ]
}

variable "instance_type" {
  default = "t3.small"
}

variable "zone_id" {
  default = "Z06290253V8BVAICG1EGQ"
}

variable "components" {
  default = {
    frontend = { name = "frontend-dev"}
    catalogue = { name = "catalogue-dev"}
    mongodb = { name = "mongodb-dev"}
    user = { name = "user-dev"}
    redis = { name = "redis-dev"}
    cart = { name = "cart-dev"}
    mysql = { name = "mysql-dev"}
    shipping = { name = "shipping-dev"}
    payment = { name = "payment-dev"}
    rabbitmq = { name = "rabbitmq-dev"}
    dispatch = { name = "dispatch-dev"}
  }
}
resource "aws_instance" "instance" {
  for_each = var.components
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_group
  tags = {
    Name = lookup(each.value, "name", null )
  }
}

resource "aws_route53_record" "record" {
  for_each = var.components
  zone_id = var.zone_id
  name    = "${lookup(each.value, "name", null)}.pdevops562.online"
  type    = "A"
  ttl     = 30
  records = [lookup(lookup(aws_instance.instance,each.key, null), "private_ip", null) ]
}


output "instances" {
  value =aws_instance.instance
}

