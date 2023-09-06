# To know the ami ids of the centos-*

#data "aws_ami_ids" "ami" {
#  name_regex  = "Centos-*"
#  owners      = ["973714476881"]
#
#}
//data in the local module will only copy data in the main module though we give the output.but when we give the output in the main module it will prite the output.
#output "ami" {
#  value = data.aws_ami_ids.ami
#}


# using one amiid from the above and creating the resource

data "aws_ami" "ami" {
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
  owners = ["973714476881"]
}

output "ami" {
  value = data.aws_ami.ami
}
resource "aws_instance" "instance" {
  ami = data.aws_ami.ami.id
#  use the variable  var.instance_type  from root module
  instance_type = var.instance_type
  vpc_security_group_ids = [ "sg-038da0861b4c1788f" ]
}

#receive the variable should be empty
variable "instance_type" {}