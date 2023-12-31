variable "components" {
  default = ["frontend","mongodb","catalogue"]
}

resource "aws_instance" "instance" {
  count = length(var.components)
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-038da0861b4c1788f" ]
  tags = {
   // Name = ""
    //Name = var.components[count.index]
    Name = element(var.components, count.index)
  }
}

//count is not used as it will destroy the existing resources for some like security group.

resource "aws_security_group" "allow_tls" {
  count = length(var.components)
  Name  = element(var.components, count.index)
}