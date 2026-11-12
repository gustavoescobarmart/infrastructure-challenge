resource "terraform_data" "create_resource" {
  input = {
     name = var.name[count.index]
     enviroment = var.environment
  }
  count = 2 
}
