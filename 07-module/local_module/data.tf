# To know the ami ids of the centos-*

data "aws_ami_ids" "ami" {
  name_regex  = "Centos-*"
  owners      = ["973714476881"]

}
//data in the local module will only copy data in the main module though we give the output.but when we give the output in the main module it will prite the output.
output "ami" {
  value = data.aws_ami_ids.ami
}