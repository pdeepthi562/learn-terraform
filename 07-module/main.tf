module "test" {
  source = "./local_module"
}

//if we give output in the main module it will print.

output "test" {
  value = module.test
}