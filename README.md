# Infrastructure Challenge

This project uses Terraform to create two local server placeholders and generate an Ansible inventory. Ansible then uses the inventory to configure the web servers.

## Clone the project

Clone the Git project into a directory of your choice, then open a terminal in the project directory.

## Dependencies and assumptions

- Git, Terraform, and Ansible must be installed.
- The installation commands below are for Linux.


## Install Terraform

### RHEL

```bash
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
```

### Ubuntu

Install the required packages:

```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
```

Add HashiCorp's GPG key:

```bash
wget -O- https://apt.releases.hashicorp.com/gpg | \
  gpg --dearmor | \
  sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
```

Check the key fingerprint and compare it with HashiCorp's official documentation:

```bash
gpg --no-default-keyring \
  --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
  --fingerprint
```

Add the HashiCorp repository and install Terraform:

```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform
```

## Run Terraform

From the project directory, enter the Terraform directory and run:

```bash
cd Terraform
terraform init
#terraform init initializes the project and downloads its providers.
terraform plan
#terraform plan shows the changes Terraform intends to make.
terraform apply
#terraform apply applies those changes and generates `Ansible/inventory.ini`.
```

## Install Ansible

### RHEL-based systems

```bash
sudo dnf install -y ansible
```

### Ubuntu

```bash
sudo apt-get update
sudo apt-get install -y ansible
```


## Run the Ansible playbook
Go to the `Ansible` directory in the root of this project and then run the playbook with the command below.

Note: If you try to run Ansible before Terraform, an error will occur because the inventory will not have been created yet.
```bash
cd Ansible
ansible-playbook -i inventory.ini playbook.yml
```



## What I would improve with more time

With more time, I would improve this project by having Ansible run all the steps. I would create a new role to run the Terraform steps from the playbook.

Another improvement would be to make the playbook output a summary of what was done, such as which version was installed and in which directory.

I would also implement the Nginx configuration test suggested in Part 3 (Troubleshooting).

## Problems encountered

- When I ran `terraform plan`, Terraform did not recognize my variable because the variable values file had the wrong name. I renamed `variables.tfvars` to `terraform.tfvars`.
- I got an error when I ran `terraform plan` after adding a resource that required a provider that had not been loaded. I ran `terraform init` again to initialize the provider before running `plan` again.

