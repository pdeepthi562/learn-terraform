variable "fruit_name"{
  default= "apple"
}

output "fruit_name" {
  value = var.fruit_name
}

# list Variable
variable "fruits" {
  default = [
    "apple",
    "banana"
]
  //default =[ "apple","banana" ] //single line syntax

}

# map variable ,plain
variable "fruit_stock" {
  default = {
    apple = 100
    banana = 200

  }
}
# map variable map of maps
variable "fruit_stock_with_price" {
  default = {
    apple = {
      stock = 100
      price = 3
    }
    banana = {
      stock = 400
      price = 1
    }
  }
}

// Access the list variable ,list index start's from zero
output "fruits_first" {
  value = var.fruits[0]
}

output "fruits_two" {
  value = var.fruits[1]
}

// Access a map variable
output "fruit_stock_apple" {
  value = var.fruit_stock["apple"]
}