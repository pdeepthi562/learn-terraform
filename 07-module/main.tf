module "test" {
  source = "./local_module"
#  send the variable to the module
  instance_type = var.instance_type
}
//if we give output in the main module it will print.

output "test" {
  value = module.test
}
#declare the variable
variable "instance_type" {
  default = "t3.micro"
}