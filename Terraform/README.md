# Terraform

## `terraform init`

Initializes Terraform and downloads the required dependencies, such as the providers that will be used.

Note: If you add a new provider, run `terraform init` again.

## `terraform plan`

Runs a dry run and shows which changes Terraform plans to make, if any. It does not apply those changes.

## `terraform apply`

Applies the planned changes. Terraform creates, updates, or removes resources to match the configuration. On the first run, it creates the resources that are defined in the configuration.

## Adapting the project vmware or AWS
To create real machines on vmware or AWS, I would need to use the provider and resources for that platform and add variables for machine settings, such as IP address, RAM, CPU, and disk size.
