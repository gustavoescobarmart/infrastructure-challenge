
resource "terraform_data" "create_resource" {
  input = {
     name = var.name[count.index]
     enviroment = var.environment
  }
  count = 2 
}

resource "local_file" "create_inventory" {
  filename = "../Ansible/inventory.ini"
  content = "[webservers]\n${join("\n", [ for i in terraform_data.create_resource : format("%s ansible_connection=local", i.input.name)])}"
}
output "result" {
  description = "apply result"
  value = "Inventory created with the servers:\n${join("\n", [ for i in terraform_data.create_resource : i.input.name])}"
}