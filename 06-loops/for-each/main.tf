variable "components" {
  default = {
    catalogue = { name = "catalogue_sg" }
    mongodb = { name = "mongodb_sg" }
  }
}

resource "aws_security_group" "allow_tls" {
  for_each = var.components
  Name = lookup(var.components,each.value["name"], null)

  //count = length(var.components)
 // Name  = element(var.components, count.index)
}